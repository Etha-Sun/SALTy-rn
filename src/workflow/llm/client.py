"""
Multi-provider LLM client (modeled after autocomp).

Supports: Google (Gemini/Vertex AI), OpenAI, Anthropic, Together AI,
AWS Bedrock, and vLLM.

Usage:
    from workflow.llm_client import LLMClient

    client = LLMClient("gemini-2.0-flash-001")              # auto-detects gcp
    client = LLMClient("gpt-4o", provider="openai")          # explicit provider
    client = LLMClient.from_model_string("openai::gpt-4o")   # provider::model

    response = client.chat("Translate this code...")
    responses = client.chat_async(["prompt1", "prompt2"])
"""

import asyncio
import logging
import os
import random
import re
import threading

log = logging.getLogger("pipeline")

# ---------------------------------------------------------------------------
# LLM provider imports (lazy)
# ---------------------------------------------------------------------------
try:
    from google import genai
    from google.genai import types as genai_types
except ImportError:
    genai = None  # type: ignore
    genai_types = None  # type: ignore

try:
    from openai import OpenAI, AsyncOpenAI
except ImportError:
    OpenAI = None  # type: ignore
    AsyncOpenAI = None  # type: ignore

try:
    import anthropic
except ImportError:
    anthropic = None  # type: ignore

try:
    from together import AsyncTogether
except ImportError:
    AsyncTogether = None  # type: ignore

try:
    import boto3
except ImportError:
    boto3 = None  # type: ignore

# ---------------------------------------------------------------------------
# API key management (env vars first, then keys.py fallback)
# ---------------------------------------------------------------------------

try:
    from . import keys
except ImportError:
    keys = None


def _get_key(env_var: str, default: str | None = None) -> str | None:
    """Get an API key from environment variable, falling back to keys.py."""
    value = os.environ.get(env_var)
    if value:
        return value
    if keys and hasattr(keys, env_var):
        file_value = getattr(keys, env_var)
        if file_value is not None:
            return file_value
    return default


# Keys explicitly set by user (env var or keys.py)
_EXPLICIT_KEYS = {
    "OPENAI_API_KEY": _get_key("OPENAI_API_KEY"),
    "ANTHROPIC_API_KEY": _get_key("ANTHROPIC_API_KEY"),
    "TOGETHER_API_KEY": _get_key("TOGETHER_API_KEY"),
    "GOOGLE_API_KEY": _get_key("GOOGLE_API_KEY"),
    "GOOGLE_CLOUD_PROJECT": _get_key("GOOGLE_CLOUD_PROJECT"),
    "GOOGLE_CLOUD_LOCATION": _get_key("GOOGLE_CLOUD_LOCATION"),
    "AWS_ACCESS_KEY_ID": _get_key("AWS_ACCESS_KEY_ID"),
    "AWS_SECRET_ACCESS_KEY": _get_key("AWS_SECRET_ACCESS_KEY"),
    "AWS_REGION": _get_key("AWS_REGION"),
}

# Full keys dict (no defaults — must be explicitly set)
_KEYS = dict(_EXPLICIT_KEYS)

_available_keys = [k for k, v in _EXPLICIT_KEYS.items() if v]
if _available_keys:
    log.info("API keys available: %s", ", ".join(_available_keys))

# ---------------------------------------------------------------------------
# Provider detection
# ---------------------------------------------------------------------------

def _detect_provider(model: str) -> str:
    """Auto-detect provider from model name."""
    if "gpt" in model and "gpt-oss" not in model:
        return "openai"
    if re.match(r"o\d", model):
        return "openai"
    if "claude" in model:
        return "anthropic"
    if "gemini" in model:
        return "gcp"
    raise ValueError(
        f"Cannot auto-detect provider for model '{model}'. "
        "Use 'provider::model' format, e.g. 'openai::gpt-4o' or 'gcp::gemini-2.0-flash-001'."
    )

# ---------------------------------------------------------------------------
# LLM Client
# ---------------------------------------------------------------------------

class LLMClient:
    """Unified LLM client supporting multiple providers.

    Usage:
        client = LLMClient("gemini-2.0-flash-001")           # auto-detects gcp
        client = LLMClient("gpt-4o", provider="openai")      # explicit provider
        client = LLMClient.from_model_string("openai::gpt-4o")  # provider::model format

        response = client.chat("Translate this code...")
    """

    def __init__(self, model: str, provider: str | None = None):
        self.model = model
        self.provider = provider or _detect_provider(model)
        self._client = None
        self._async_client = None
        self._loop = asyncio.new_event_loop()
        # Drive the loop in its own daemon thread so one shared client is safe to
        # call from multiple worker threads (batch --jobs). Callers submit via
        # run_coroutine_threadsafe; using run_until_complete from two threads on
        # the same loop raises "This event loop is already running".
        self._loop_thread = threading.Thread(
            target=self._loop.run_forever, name="llm-eventloop", daemon=True)
        self._loop_thread.start()

        self._init_client()

    @classmethod
    def from_model_string(cls, model_with_provider: str) -> "LLMClient":
        """Parse 'provider::model' format, e.g. 'openai::gpt-4o'."""
        if "::" in model_with_provider:
            provider, model = model_with_provider.split("::", 1)
        else:
            provider = None
            model = model_with_provider
        return cls(model, provider)

    def _init_client(self):
        """Initialize the appropriate SDK client for the configured provider."""
        if self.provider == "openai":
            if OpenAI is None:
                raise ImportError("pip install openai")
            key = _KEYS["OPENAI_API_KEY"] or "EMPTY"
            self._client = OpenAI(api_key=key)
            self._async_client = AsyncOpenAI(api_key=key)

        elif self.provider == "gcp":
            if genai is None:
                raise ImportError("pip install google-genai")
            api_key = _KEYS["GOOGLE_API_KEY"]
            project = _KEYS["GOOGLE_CLOUD_PROJECT"]
            location = _KEYS["GOOGLE_CLOUD_LOCATION"]
            if api_key and not project:
                self._client = genai.Client(api_key=api_key)
            else:
                self._client = genai.Client(
                    vertexai=True, project=project, location=location
                )
            self._async_client = self._client  # genai uses client.aio

        elif self.provider == "anthropic":
            if anthropic is None:
                raise ImportError("pip install anthropic")
            key = _KEYS["ANTHROPIC_API_KEY"] or "EMPTY"
            self._async_client = anthropic.AsyncAnthropic(api_key=key)

        elif self.provider == "aws":
            if "claude" in self.model or "anthropic" in self.model:
                if anthropic is None:
                    raise ImportError("pip install anthropic")
                self._async_client = anthropic.AsyncAnthropicBedrock(
                    aws_access_key=_KEYS["AWS_ACCESS_KEY_ID"],
                    aws_secret_key=_KEYS["AWS_SECRET_ACCESS_KEY"],
                    aws_region=_KEYS["AWS_REGION"],
                )
            else:
                if boto3 is None:
                    raise ImportError("pip install boto3")
                self._client = boto3.client(
                    "bedrock-runtime",
                    region_name=_KEYS["AWS_REGION"],
                    aws_access_key_id=_KEYS["AWS_ACCESS_KEY_ID"],
                    aws_secret_access_key=_KEYS["AWS_SECRET_ACCESS_KEY"],
                )

        elif self.provider == "together":
            if AsyncTogether is None:
                raise ImportError("pip install together")
            self._async_client = AsyncTogether(api_key=_KEYS["TOGETHER_API_KEY"])

        elif self.provider.startswith("vllm"):
            if OpenAI is None:
                raise ImportError("pip install openai")
            if "@" in self.provider:
                base_url = self.provider.split("@", 1)[1]
            else:
                base_url = os.environ.get("VLLM_API_BASE", "http://localhost:8000/v1")
            self._client = OpenAI(api_key="EMPTY", base_url=base_url)
            self._async_client = AsyncOpenAI(api_key="EMPTY", base_url=base_url)
            self.provider = "vllm"

        else:
            raise ValueError(f"Unknown provider: {self.provider}")

        log.info("LLM client ready: provider=%s  model=%s", self.provider, self.model)

    @property
    def supports_tools(self) -> bool:
        """Whether this provider supports tool calling."""
        return self.provider == "gcp"

    # ---- public API ---------------------------------------------------------

    def chat(
        self,
        prompt: str,
        system: str | None = None,
        temperature: float = 0.1,
        max_tokens: int = 8192,
        thinking: str | None = None,
    ) -> str:
        """Send a single prompt and return the text response.

        Args:
            prompt: The user message.
            system: Optional system instruction (reference docs, persona, etc.).
            temperature: Sampling temperature.
            max_tokens: Max response length.
            thinking: Thinking level for Gemini 3.x ("low", "medium", "high").
                      Note: Gemini recommends temperature=1.0 when thinking is on.
        """
        return self._run_async(
            self._achat(prompt, system=system, temperature=temperature,
                        max_tokens=max_tokens, thinking=thinking)
        )

    def chat_async(
        self,
        prompts: list[str],
        system: str | None = None,
        temperature: float = 0.1,
        max_tokens: int = 8192,
        max_concurrent: int = 5,
        thinking: str | None = None,
    ) -> list[str]:
        """Send multiple prompts concurrently, return list of responses."""
        return self._run_async(
            self._achat_batch(prompts, system, temperature, max_tokens,
                              max_concurrent, thinking)
        )

    def chat_with_tools(
        self,
        prompt: str,
        tools: dict[str, callable],
        system: str | None = None,
        temperature: float = 0.1,
        max_tokens: int = 8192,
        thinking: str | None = None,
        max_tool_rounds: int = 10,
    ) -> str:
        """Send a prompt with tool calling. The model can invoke tools as needed.

        Currently supports Gemini only. Other providers will be added later.

        Args:
            prompt: The user message.
            tools: Dict of {tool_name: callable}. Each callable should accept
                   keyword arguments and return a string or dict result.
            system: Optional system instruction.
            temperature: Sampling temperature.
            max_tokens: Max response length.
            thinking: Gemini thinking level.
            max_tool_rounds: Max number of tool-call round trips.
        """
        if self.provider != "gcp":
            raise NotImplementedError(
                f"chat_with_tools not yet implemented for provider '{self.provider}'. "
                "Use chat() instead."
            )
        return self._run_async(
            self._achat_with_tools(
                prompt, tools, system, temperature, max_tokens, thinking, max_tool_rounds
            )
        )

    # ---- async internals ----------------------------------------------------

    def _run_async(self, coro):
        # Submit to the loop running in its own thread and block for the result;
        # safe to call concurrently from many threads (batch --jobs).
        return asyncio.run_coroutine_threadsafe(coro, self._loop).result()

    async def _achat(self, prompt: str, system: str | None, temperature: float,
                     max_tokens: int, thinking: str | None) -> str:
        """Single async chat call with retries."""
        max_retries = 8
        for attempt in range(max_retries):
            try:
                return await self._provider_call(prompt, system, temperature,
                                                 max_tokens, thinking)
            except Exception as e:
                err = str(e)
                if "temperature" in err and "not supported" in err:
                    log.info("Model %s doesn't support temperature, retrying without", self.model)
                    temperature = None
                    continue
                wait = 2 ** attempt + random.uniform(0, 1)
                log.warning("LLM error (attempt %d/%d): %s — retrying in %.1fs",
                            attempt + 1, max_retries, e, wait)
                await asyncio.sleep(wait)
        raise RuntimeError(f"LLM call failed after {max_retries} retries")

    async def _achat_batch(self, prompts, system, temperature, max_tokens,
                           max_concurrent, thinking):
        sem = asyncio.Semaphore(max_concurrent)
        async def _limited(p):
            async with sem:
                return await self._achat(p, system, temperature, max_tokens, thinking)
        return await asyncio.gather(*[_limited(p) for p in prompts])

    async def _provider_call(
        self,
        prompt: str,
        system: str | None,
        temperature: float | None,
        max_tokens: int,
        thinking: str | None = None,
    ) -> str:
        """Dispatch to the right provider SDK."""
        if self.provider == "gcp":
            config_kwargs = {}
            if thinking:
                # Gemini recommends temperature=1.0 with thinking enabled
                config_kwargs["temperature"] = 1.0
                config_kwargs["thinking_config"] = genai_types.ThinkingConfig(
                    thinking_level=thinking,
                )
                log.info("Thinking enabled: level=%s (temperature forced to 1.0)", thinking)
            else:
                config_kwargs["temperature"] = temperature
            config = genai_types.GenerateContentConfig(**config_kwargs)
            if system:
                config.system_instruction = system
            resp = await self._client.aio.models.generate_content(
                model=self.model, contents=prompt, config=config,
            )
            return resp.text

        elif self.provider in ("openai", "vllm"):
            messages = []
            if system:
                messages.append({"role": "system", "content": system})
            messages.append({"role": "user", "content": prompt})
            kwargs = dict(model=self.model, messages=messages, max_tokens=max_tokens)
            if temperature is not None:
                kwargs["temperature"] = temperature
            resp = await self._async_client.chat.completions.create(**kwargs)
            return resp.choices[0].message.content

        elif self.provider == "anthropic":
            messages = [{"role": "user", "content": prompt}]
            kwargs = dict(model=self.model, messages=messages, max_tokens=max_tokens)
            if system:
                kwargs["system"] = system
            if temperature is not None:
                kwargs["temperature"] = temperature
            resp = await self._async_client.messages.create(**kwargs)
            return resp.content[0].text

        elif self.provider == "aws":
            if self._async_client is not None:
                # Anthropic on Bedrock
                messages = [{"role": "user", "content": prompt}]
                kwargs = dict(model=self.model, messages=messages, max_tokens=max_tokens)
                if system:
                    kwargs["system"] = system
                if temperature is not None:
                    kwargs["temperature"] = temperature
                resp = await self._async_client.messages.create(**kwargs)
                return resp.content[0].text
            else:
                # Generic Bedrock Converse (boto3, sync wrapped in thread)
                inference_config = {"maxTokens": max_tokens}
                if temperature is not None:
                    inference_config["temperature"] = temperature
                converse_kwargs = dict(
                    modelId=self.model,
                    messages=[{"role": "user", "content": [{"text": prompt}]}],
                    inferenceConfig=inference_config,
                )
                if system:
                    converse_kwargs["system"] = [{"text": system}]
                resp = await asyncio.to_thread(
                    self._client.converse, **converse_kwargs
                )
                return resp["output"]["message"]["content"][0]["text"]

        elif self.provider == "together":
            messages = []
            if system:
                messages.append({"role": "system", "content": system})
            messages.append({"role": "user", "content": prompt})
            kwargs = dict(model=self.model, messages=messages, max_tokens=max_tokens)
            if temperature is not None:
                kwargs["temperature"] = temperature
            resp = await self._async_client.chat.completions.create(**kwargs)
            content = resp.choices[0].message.content
            if "</think>" in content:
                content = content.split("</think>")[-1].strip()
            return content

        raise ValueError(f"Unhandled provider: {self.provider}")

    async def _achat_with_tools(
        self,
        prompt: str,
        tools: dict[str, callable],
        system: str | None,
        temperature: float | None,
        max_tokens: int,
        thinking: str | None,
        max_tool_rounds: int,
    ) -> str:
        """Gemini tool-calling loop: send prompt, execute tool calls, repeat."""
        # Build function declarations from tool dict
        declarations = []
        for name, fn in tools.items():
            # Extract schema from function's _tool_schema attribute if present,
            # otherwise use a generic string-input schema
            schema = getattr(fn, '_tool_schema', {
                'type': 'object',
                'properties': {
                    'query': {
                        'type': 'string',
                        'description': 'The search query',
                    }
                },
                'required': ['query'],
            })
            declarations.append(genai_types.FunctionDeclaration(
                name=name,
                description=getattr(fn, '_tool_description', f'Call {name}'),
                parameters_json_schema=schema,
            ))

        gemini_tools = [genai_types.Tool(function_declarations=declarations)]

        # Build config
        config_kwargs = {"tools": gemini_tools}
        if thinking:
            config_kwargs["temperature"] = 1.0
            config_kwargs["thinking_config"] = genai_types.ThinkingConfig(
                thinking_level=thinking,
            )
        else:
            if temperature is not None:
                config_kwargs["temperature"] = temperature
        if system:
            config_kwargs["system_instruction"] = system

        config = genai_types.GenerateContentConfig(**config_kwargs)

        # Build initial contents
        contents = [
            genai_types.Content(
                role='user',
                parts=[genai_types.Part.from_text(text=prompt)],
            )
        ]

        # Tool-calling loop
        for round_num in range(max_tool_rounds):
            resp = await self._client.aio.models.generate_content(
                model=self.model, contents=contents, config=config,
            )

            # If no function calls, we're done
            if not resp.function_calls:
                return resp.text

            # Append model's response to conversation
            model_content = resp.candidates[0].content
            contents.append(model_content)

            # Execute each tool call
            fn_response_parts = []
            for fc in resp.function_calls:
                log.info("Tool call [round %d]: %s(%s)", round_num + 1, fc.name, fc.args)
                fn = tools.get(fc.name)
                if fn is None:
                    result = {"error": f"Unknown tool: {fc.name}"}
                else:
                    try:
                        result = fn(**fc.args)
                        if isinstance(result, str):
                            result = {"result": result}
                    except Exception as e:
                        log.warning("Tool %s failed: %s", fc.name, e)
                        result = {"error": str(e)}

                fn_response_parts.append(
                    genai_types.Part.from_function_response(
                        name=fc.name,
                        response=result,
                    )
                )

            # Send tool results back
            contents.append(
                genai_types.Content(role='tool', parts=fn_response_parts)
            )

        # If we exhausted rounds, return whatever we have
        log.warning("Hit max tool rounds (%d), returning last response", max_tool_rounds)
        resp = await self._client.aio.models.generate_content(
            model=self.model, contents=contents, config=config,
        )
        return resp.text
