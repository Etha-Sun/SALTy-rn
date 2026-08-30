"use strict";

(() => {
  const API_URL = "/api/elementwise";
  const VIEWS = ["overview", "programs", "intrinsics", "audit"];
  const CORE_ARTIFACTS = ["manifest", "external_condition", "models", "spec", "cross_phase_audit"];
  const ARTIFACT_LABELS = [
    ["manifest", "ProgramManifest"],
    ["external_condition", "ExternalCondition"],
    ["models", "Models"],
    ["spec", "Spec"],
    ["cross_phase_audit", "CrossPhaseAudit"],
    ["counterexample", "Counterexample"],
    ["proof_task", "ProofTask"],
    ["result", "Lean Result"],
  ];
  const ROADMAP_FAMILIES = [
    {
      id: "elementwise",
      label: "Elementwise and conversion",
      description: "Independent logical coordinates, including scalar broadcasts and typed conversions.",
      capabilityGap: "Current compiler family; grouped complex layout remains deferred.",
    },
    {
      id: "reduction-window",
      label: "Reductions and pooling",
      description: "Programs that combine several input coordinates into sums, maxima, or indexed windows.",
      capabilityGap: "Reusable reduction/window models and order-sensitive observations.",
    },
    {
      id: "convolution",
      label: "Convolution and channel transforms",
      description: "Spatial kernels with neighborhoods, channel movement, or indirect input views.",
      capabilityGap: "Reusable stencil/gather layouts plus nested-loop and memory models.",
    },
    {
      id: "matrix",
      label: "Matrix kernels",
      description: "GEMM, IGEMM, and sparse matrix programs with ordered accumulation and packed weights.",
      capabilityGap: "Matrix layouts, accumulation-order semantics, indirect pointers, and parameter contracts.",
    },
    {
      id: "packing-permutation",
      label: "Packing and permutation",
      description: "Programs whose main effect is a reusable data-layout transformation.",
      capabilityGap: "Permutation/packing views and multidimensional observations.",
    },
  ];

  const state = {
    payload: null,
    programs: [],
    capabilities: [],
    corpus: null,
    programView: "current",
    programQuery: "",
    programStatus: "all",
    programPage: 1,
    programPageSize: 20,
    expandedPrograms: new Set(),
    intrinsicQuery: "",
    intrinsicArchitecture: "all",
    intrinsicStatus: "all",
    intrinsicPage: 1,
    intrinsicPageSize: 25,
  };

  const elements = {
    tabs: Array.from(document.querySelectorAll("[role=tab][data-view]")),
    panels: Array.from(document.querySelectorAll("[data-view-panel]")),
    counts: document.querySelector("#elementwise-counts"),
    message: document.querySelector("#elementwise-message"),
    summary: document.querySelector("#elementwise-summary"),
    corpusOverview: document.querySelector("#corpus-overview"),
    openCorpus: document.querySelector("#open-corpus-button"),
    valueClaim: document.querySelector("#value-claim-summary"),
    intrinsicClaim: document.querySelector("#intrinsic-claim-summary"),
    deferred: document.querySelector("#deferred-summary"),
    programCounts: document.querySelector("#programs-counts"),
    programBody: document.querySelector("#elementwise-body"),
    programSearch: document.querySelector("#program-search"),
    programStatus: document.querySelector("#program-status-filter"),
    programPageSize: document.querySelector("#program-page-size"),
    programPagination: document.querySelector("#program-pagination"),
    programViewTabs: Array.from(document.querySelectorAll("[role=tab][data-program-view]")),
    programViewPanels: Array.from(document.querySelectorAll("[data-program-view-panel]")),
    corpusProgramCounts: document.querySelector("#corpus-program-counts"),
    corpusFamilyList: document.querySelector("#corpus-family-list"),
    intrinsicCounts: document.querySelector("#intrinsic-counts"),
    intrinsicSummary: document.querySelector("#intrinsic-summary"),
    capabilityBody: document.querySelector("#elementwise-capability-body"),
    intrinsicSearch: document.querySelector("#intrinsic-search"),
    intrinsicArchitecture: document.querySelector("#intrinsic-architecture-filter"),
    intrinsicStatus: document.querySelector("#intrinsic-status-filter"),
    intrinsicPageSize: document.querySelector("#intrinsic-page-size"),
    intrinsicPagination: document.querySelector("#intrinsic-pagination"),
    refresh: document.querySelector("#refresh-button"),
  };

  function clear(node) {
    while (node?.firstChild) node.removeChild(node.firstChild);
  }

  function text(tag, value, className) {
    const node = document.createElement(tag);
    node.textContent = String(value);
    if (className) node.className = className;
    return node;
  }

  function slug(value) {
    return String(value || "unknown").toLocaleLowerCase().replace(/[^a-z0-9]+/g, "-").replace(/^-|-$/g, "");
  }

  function roadmapFamilyId(programId, elementwiseIds) {
    if (elementwiseIds.has(programId) || programId.endsWith("-vclamp")) return "elementwise";
    if (programId.includes("packw") || programId.includes("transpose")) return "packing-permutation";
    if (programId.includes("gemm") || programId.includes("igemm") || programId.includes("spmm")) return "matrix";
    if (programId.includes("conv")) return "convolution";
    if (programId.includes("pool") || programId.includes("rsum") || programId.includes("rdsum") || programId.includes("raddstore")) return "reduction-window";
    return "unclassified";
  }

  function buildCorpusRoadmap(payload, programs) {
    if (!payload || payload.schema_version !== 2 || !Array.isArray(payload.kernel_files)) return null;
    const statusByProgram = new Map(programs.map((program) => [program.program_id, program.status]));
    const elementwiseIds = new Set(statusByProgram.keys());
    const grouped = new Map(ROADMAP_FAMILIES.map((family) => [family.id, []]));
    for (const raw of payload.kernel_files) {
      const programId = typeof raw?.program_id === "string" ? raw.program_id : "";
      if (!programId) continue;
      const familyId = roadmapFamilyId(programId, elementwiseIds);
      if (!grouped.has(familyId)) return null;
      const artifactManaged = statusByProgram.has(programId);
      const paired = raw.target_present === true && (familyId !== "elementwise" || artifactManaged);
      const status = statusByProgram.has(programId)
        ? statusByProgram.get(programId)
        : paired ? "family-not-implemented" : "target-unavailable";
      grouped.get(familyId).push({
        program_id: programId,
        source_path: typeof raw.source_path === "string" ? raw.source_path : "",
        target_path: typeof raw.target_path === "string" ? raw.target_path : null,
        target_state: paired ? "present" : "unavailable",
        status,
        status_source: artifactManaged ? "elementwise-artifact-graph" : paired ? "planning-only" : "source-target-inventory",
      });
    }
    const families = ROADMAP_FAMILIES.map((definition) => {
      const familyPrograms = grouped.get(definition.id).sort((left, right) => left.program_id.localeCompare(right.program_id));
      return {
        ...definition,
        capability_gap: definition.capabilityGap,
        current: definition.id === "elementwise",
        program_count: familyPrograms.length,
        paired_count: familyPrograms.filter((program) => program.target_state === "present").length,
        programs: familyPrograms,
      };
    });
    return {
      source_programs: families.reduce((total, family) => total + family.program_count, 0),
      nonempty_pairs: families.reduce((total, family) => total + family.paired_count, 0),
      family_count: families.length,
      families,
    };
  }

  function statusChip(value, tone) {
    const chip = text("span", value, `result-chip ${tone || `result-${slug(value)}`}`);
    return chip;
  }

  function setView(view, focus = false) {
    const selected = VIEWS.includes(view) ? view : "overview";
    for (const tab of elements.tabs) {
      const active = tab.dataset.view === selected;
      tab.setAttribute("aria-selected", String(active));
      tab.tabIndex = active ? 0 : -1;
      if (active && focus) tab.focus();
    }
    for (const panel of elements.panels) panel.hidden = panel.dataset.viewPanel !== selected;
    if (window.location.hash !== `#${selected}`) window.history.replaceState(null, "", `#${selected}`);
  }

  function initializeNavigation() {
    for (const tab of elements.tabs) {
      tab.addEventListener("click", () => setView(tab.dataset.view));
      tab.addEventListener("keydown", (event) => {
        const index = elements.tabs.indexOf(tab);
        let next = null;
        if (event.key === "ArrowRight") next = (index + 1) % elements.tabs.length;
        if (event.key === "ArrowLeft") next = (index - 1 + elements.tabs.length) % elements.tabs.length;
        if (event.key === "Home") next = 0;
        if (event.key === "End") next = elements.tabs.length - 1;
        if (next === null) return;
        event.preventDefault();
        setView(elements.tabs[next].dataset.view, true);
      });
    }
    const requested = window.location.hash.slice(1);
    setView(VIEWS.includes(requested) ? requested : "overview");
  }

  function summaryCard(value, label, tone, detail) {
    const card = document.createElement("article");
    card.className = `outcome-card tone-${tone}`;
    card.append(text("strong", value), text("span", label));
    if (detail) card.append(text("small", detail));
    return card;
  }

  function setProgramView(view, focus = false) {
    const selected = view === "corpus" ? "corpus" : "current";
    state.programView = selected;
    for (const tab of elements.programViewTabs) {
      const active = tab.dataset.programView === selected;
      tab.setAttribute("aria-selected", String(active));
      tab.tabIndex = active ? 0 : -1;
      if (active && focus) tab.focus();
    }
    for (const panel of elements.programViewPanels) {
      panel.hidden = panel.dataset.programViewPanel !== selected;
    }
    renderPrograms();
  }

  function initializeProgramNavigation() {
    for (const tab of elements.programViewTabs) {
      tab.addEventListener("click", () => setProgramView(tab.dataset.programView));
      tab.addEventListener("keydown", (event) => {
        if (!['ArrowLeft', 'ArrowRight'].includes(event.key)) return;
        event.preventDefault();
        setProgramView(tab.dataset.programView === "current" ? "corpus" : "current", true);
      });
    }
    setProgramView("current");
  }

  function roadmapStatus(program) {
    if (program.status === "family-not-implemented") {
      return { label: "Family TODO", tone: "result-family-todo" };
    }
    if (program.status === "target-unavailable") {
      return { label: "Target unavailable", tone: "result-target-unavailable" };
    }
    return { label: program.status || "unknown", tone: undefined };
  }

  function renderCorpusOverview() {
    clear(elements.corpusOverview);
    const corpus = state.corpus;
    if (!corpus || !Array.isArray(corpus.families)) {
      elements.corpusOverview.append(text("p", "Full-corpus planning inventory is unavailable.", "empty-state"));
      return;
    }

    const metrics = document.createElement("div");
    metrics.className = "corpus-metrics";
    metrics.append(
      summaryCard(corpus.source_programs ?? 0, "Neon source programs", "scope"),
      summaryCard(corpus.nonempty_pairs ?? 0, "nonempty Neon/RVV pairs", "verified"),
      summaryCard(corpus.family_count ?? 0, "reusable model families", "deferred"),
      summaryCard(
        corpus.families.filter((family) => family.current).length,
        "family implemented today",
        "scope",
      ),
    );
    elements.corpusOverview.append(metrics);

    const familyStrip = document.createElement("div");
    familyStrip.className = "family-strip";
    for (const family of corpus.families) {
      const card = document.createElement("article");
      card.className = `family-summary-card${family.current ? " current-family" : ""}`;
      card.append(
        text("span", family.current ? "Current" : "TODO", "family-stage"),
        text("strong", family.label || family.id),
        text("small", `${family.program_count || 0} source programs · ${family.paired_count || 0} pairs`),
      );
      familyStrip.append(card);
    }
    elements.corpusOverview.append(familyStrip);
  }

  function inspectCurrentProgram(programId) {
    state.programQuery = programId;
    elements.programSearch.value = programId;
    state.programPage = 1;
    state.expandedPrograms.add(programId);
    renderPrograms();
    setProgramView("current");
  }

  function corpusProgram(programId) {
    for (const family of state.corpus?.families || []) {
      const program = (family.programs || []).find((item) => item.program_id === programId);
      if (program) return program;
    }
    return null;
  }

  function renderCorpusRoadmap() {
    clear(elements.corpusFamilyList);
    const corpus = state.corpus;
    if (!corpus || !Array.isArray(corpus.families)) {
      elements.corpusProgramCounts.textContent = "Unavailable";
      elements.corpusFamilyList.append(text("p", "Full-corpus planning inventory is unavailable.", "empty-state"));
      return;
    }
    elements.corpusProgramCounts.textContent = `${corpus.source_programs} sources · ${corpus.nonempty_pairs} nonempty pairs`;

    for (const family of corpus.families) {
      const disclosure = document.createElement("details");
      disclosure.className = `corpus-family${family.current ? " current-family" : ""}`;
      disclosure.open = Boolean(family.current);
      const summary = document.createElement("summary");
      const summaryText = document.createElement("span");
      summaryText.className = "family-summary-text";
      summaryText.append(
        text("strong", family.label || family.id),
        text("small", family.description || "No family description recorded."),
      );
      const summaryMeta = document.createElement("span");
      summaryMeta.className = "family-summary-meta";
      summaryMeta.append(
        statusChip(family.current ? "Current family" : "Family TODO", family.current ? "result-defined" : "result-family-todo"),
        text("span", `${family.program_count || 0} sources · ${family.paired_count || 0} pairs`, "family-count"),
      );
      summary.append(summaryText, summaryMeta);
      disclosure.append(summary);

      const body = document.createElement("div");
      body.className = "family-body";
      const gap = document.createElement("p");
      gap.className = "family-gap";
      gap.append(text("strong", family.current ? "Current boundary: " : "Required reusable capability: "));
      gap.append(document.createTextNode(family.capability_gap || "Not recorded."));
      body.append(gap);

      const programs = document.createElement("ul");
      programs.className = "family-program-grid";
      for (const program of family.programs || []) {
        const item = document.createElement("li");
        const heading = document.createElement("div");
        heading.className = "family-program-heading";
        const status = roadmapStatus(program);
        heading.append(text("strong", program.program_id || "unknown"), statusChip(status.label, status.tone));
        item.append(heading);
        item.append(text("small", program.target_state === "present" ? "Neon/RVV pair present" : `RVV target ${program.target_state}`, "secondary-cell"));
        item.append(text("code", program.source_path || "source path unavailable", "family-source-path"));
        if (program.status_source === "elementwise-artifact-graph") {
          const action = text("button", "Inspect current result", "text-button");
          action.type = "button";
          action.addEventListener("click", () => inspectCurrentProgram(program.program_id));
          item.append(action);
        }
        programs.append(item);
      }
      body.append(programs);
      disclosure.append(body);
      elements.corpusFamilyList.append(disclosure);
    }
  }

  function renderOverview() {
    clear(elements.summary);
    clear(elements.deferred);
    clear(elements.intrinsicSummary);
    renderCorpusOverview();
    const data = state.payload?.summary || {};
    const statusCounts = data.status_counts || {};
    const scalar = data.scalar_layout_scope ?? 0;
    const discovered = data.discovered_elementwise ?? state.programs.length;
    const verified = statusCounts["verified(value)"] ?? 0;
    const counterexamples = statusCounts.counterexample ?? 0;
    const blocked = statusCounts["external-condition-missing"] ?? 0;
    const deferredCount = data.grouped_layout_deferred ?? 0;
    const reviewedPrograms = data.independently_reviewed_programs ?? 0;

    elements.counts.textContent = `${scalar} scalar-layout · ${discovered} discovered`;
    elements.message.textContent = "Program states are derived from CorpusReport and verified parent hashes; Legacy case lists do not participate.";
    elements.summary.append(
      summaryCard(scalar, "scalar-layout target", "scope", `${reviewedPrograms}/${scalar} outcomes independently reviewed`),
      summaryCard(verified, "verified(value)", "verified", "Lean-checked direct value claims"),
      summaryCard(counterexamples, "checked counterexample", "counterexample", "False under the bound value model"),
      summaryCard(blocked, "external condition missing", "blocked", "No caller condition is fabricated"),
      summaryCard(deferredCount, "grouped layout deferred", "deferred", "Outside the scalar-layout target"),
    );

    elements.valueClaim.textContent = `${verified}/${scalar} scalar programs currently have verified(value) results; counterexamples and missing conditions remain explicit outcomes.`;
    const used = data.used_intrinsic_variants ?? 0;
    const reviewed = data.reviewed_used_intrinsic_variants ?? 0;
    elements.intrinsicClaim.textContent = `${reviewed}/${used} used exact definitions are independently reviewed in the pure-value scope. This is not complete ISA correspondence.`;

    const deferredPrograms = state.programs.filter((program) => program.layout !== "scalar-lane");
    if (deferredPrograms.length === 0) {
      elements.deferred.append(text("p", "No grouped-layout program is currently deferred.", "empty-state"));
    } else {
      for (const program of deferredPrograms) {
        const content = document.createElement("div");
        content.append(text("strong", program.program_id || "unknown"));
        content.append(text("span", `${program.layout || "unknown layout"} · ${program.schedule || "unknown schedule"}`));
        content.append(text("p", program.detail || "No detail recorded."));
        const action = text("button", "Inspect program", "text-button");
        action.type = "button";
        action.addEventListener("click", () => {
          state.programQuery = program.program_id;
          elements.programSearch.value = program.program_id;
          state.programPage = 1;
          state.expandedPrograms.add(program.program_id);
          renderPrograms();
          setView("programs", true);
        });
        content.append(action);
        elements.deferred.append(content);
      }
    }

    elements.intrinsicSummary.append(
      summaryCard(data.registry_intrinsic_variants ?? 0, "exact registry variants", "scope"),
      summaryCard(`${data.primary_source_audited_intrinsic_variants ?? 0}/${data.registry_intrinsic_variants ?? 0}`, "source audited", "verified"),
      summaryCard(`${data.reviewed_registry_intrinsic_variants ?? 0}/${data.registry_intrinsic_variants ?? 0}`, "registry variants reviewed", "verified"),
      summaryCard(`${data.reviewed_used_intrinsic_variants ?? 0}/${used}`, "used variants reviewed", "verified"),
      summaryCard(`${data.lean_checked_used_intrinsic_variants ?? 0}/${used}`, "used variants Lean checked", "verified"),
      summaryCard(data.conditioned_intrinsic_variants ?? 0, "architecture-conditioned", "deferred"),
    );
  }

  function programDependencies(programId) {
    return state.capabilities.filter((capability) => Array.isArray(capability.programs) && capability.programs.includes(programId));
  }

  function programSearchText(program) {
    const dependencies = programDependencies(program.program_id).map((item) => `${item.spelling} ${item.id}`).join(" ");
    return [program.program_id, program.status, program.status_layer, program.layout, program.schedule, program.detail, dependencies].join(" ").toLocaleLowerCase();
  }

  function blockerLabel(program) {
    if (program.status === "verified(value)") return "No value-layer blocker";
    if (program.status === "counterexample") return "Lean-checked semantic counterexample";
    if (program.status === "external-condition-missing") return "Caller / initializer condition is not established";
    if (program.status === "layout-unrecognized") return "Reusable grouped layout is not implemented";
    if (program.status === "stale-artifact") return "Artifact closure is stale";
    if (program.status === "proof-ready") return "Frozen proof task awaits proof";
    return program.detail || "See expanded audit detail";
  }

  function terminalBranch(program) {
    if (program.artifacts?.counterexample) return "counterexample branch";
    if (program.artifacts?.proof_task || program.artifacts?.result) return "proof / result branch";
    return "stopped before proof delegation";
  }

  function appendDefinitionList(root, entries) {
    const list = document.createElement("dl");
    list.className = "detail-list";
    for (const [label, value] of entries) {
      list.append(text("dt", label), text("dd", value ?? "not recorded"));
    }
    root.append(list);
  }

  function renderCounterexample(root, counterexample) {
    if (!counterexample) return;
    const section = document.createElement("section");
    section.className = "detail-section counterexample-panel";
    section.append(text("h3", "Checked witness"));
    appendDefinitionList(section, [
      ["Claim", counterexample.claim || "unknown"],
      ["Parameters", JSON.stringify(counterexample.parameters || {})],
      ["Inputs", JSON.stringify(counterexample.inputs || [])],
      ["Outputs", `${counterexample.left_output} / ${counterexample.right_output}`],
    ]);
    root.append(section);
  }

  function renderProgramDetail(program, dependencies) {
    const panel = document.createElement("div");
    panel.className = "program-detail-panel";
    const inventory = corpusProgram(program.program_id);

    const sources = document.createElement("section");
    sources.className = "detail-section";
    sources.append(text("h3", "Sources and identity"));
    appendDefinitionList(sources, [
      ["Neon C", inventory?.source_path],
      ["RVV C", inventory?.target_path || "target unavailable"],
      ["Outcome authority", "elementwise content-addressed artifact graph"],
      ["Program review", program.program_review_sha256 || "pending / not applicable"],
    ]);
    panel.append(sources);

    const audits = document.createElement("section");
    audits.className = "detail-section";
    audits.append(text("h3", "Contract and audit"));
    appendDefinitionList(audits, [
      ["Entry contract", program.contract],
      ["Input condition", `${program.input_condition?.status || "unknown"} · ${program.input_condition?.scope || "unknown scope"}`],
      ["Cross-phase audit", `${program.cross_phase?.status || "unknown"} · ${program.cross_phase?.trial_count || 0} trials`],
      ["Independent outcome review", program.independently_reviewed ? `approved ${program.reviewed_outcome || "recorded outcome"}` : "pending"],
    ]);
    panel.append(audits);

    const artifacts = document.createElement("section");
    artifacts.className = "detail-section detail-wide";
    artifacts.append(text("h3", "Content-addressed chain"));
    const artifactList = document.createElement("ol");
    artifactList.className = "full-artifact-chain";
    for (const [key, label] of ARTIFACT_LABELS) {
      const present = Boolean(program.artifacts?.[key]);
      const item = document.createElement("li");
      item.className = present ? "artifact-present" : "artifact-absent";
      item.append(text("strong", label), text("small", present ? "bound" : "not on this branch"));
      artifactList.append(item);
    }
    artifacts.append(artifactList);
    panel.append(artifacts);

    const dependencySection = document.createElement("section");
    dependencySection.className = "detail-section detail-wide";
    dependencySection.append(text("h3", `Exact intrinsic dependencies · ${dependencies.length}`));
    if (dependencies.length === 0) {
      dependencySection.append(text("p", "No typed capability closure exists yet.", "empty-state"));
    } else {
      const list = document.createElement("ul");
      list.className = "dependency-chip-list";
      for (const capability of dependencies) list.append(text("li", `${capability.architecture}:${capability.spelling}`));
      dependencySection.append(list);
    }
    panel.append(dependencySection);
    renderCounterexample(panel, program.counterexample);
    return panel;
  }

  function createProgramRows(program, absoluteIndex) {
    const dependencies = programDependencies(program.program_id);
    const open = state.expandedPrograms.has(program.program_id);
    const detailId = `program-detail-${absoluteIndex}`;
    const row = document.createElement("tr");
    if (program.stale) row.className = "stale-row";

    const nameCell = document.createElement("td");
    const toggle = text("button", program.program_id || "unknown", "program-toggle");
    toggle.type = "button";
    toggle.dataset.programToggle = program.program_id;
    toggle.setAttribute("aria-expanded", String(open));
    toggle.setAttribute("aria-controls", detailId);
    nameCell.append(toggle, text("small", `${program.layout || "unknown"} · ${program.schedule || "unknown"}`, "secondary-cell"));
    row.append(nameCell);

    const statusCell = document.createElement("td");
    statusCell.append(statusChip(program.status || "unknown"));
    if (program.independently_reviewed) statusCell.append(text("small", "Outcome independently reviewed", "review-note"));
    row.append(statusCell);

    const blockerCell = document.createElement("td");
    blockerCell.append(text("strong", blockerLabel(program)));
    blockerCell.append(text("small", program.detail || "", "secondary-cell"));
    row.append(blockerCell);

    const progressCell = document.createElement("td");
    const complete = CORE_ARTIFACTS.filter((key) => program.artifacts?.[key]).length;
    progressCell.append(text("strong", `${complete}/${CORE_ARTIFACTS.length} core artifacts`));
    progressCell.append(text("small", terminalBranch(program), "secondary-cell"));
    row.append(progressCell);

    const claimCell = document.createElement("td");
    claimCell.append(text("strong", `Value: ${program.claim?.value || "not-checked"}`));
    claimCell.append(text("small", "C · ISA · binary: not established", "secondary-cell"));
    row.append(claimCell);

    const detailRow = document.createElement("tr");
    detailRow.id = detailId;
    detailRow.className = "program-detail-row";
    detailRow.hidden = !open;
    const detailCell = document.createElement("td");
    detailCell.colSpan = 5;
    detailCell.append(renderProgramDetail(program, dependencies));
    detailRow.append(detailCell);
    return [row, detailRow];
  }

  function renderPagination(root, page, pageCount, total, start, end, kind) {
    clear(root);
    const previous = text("button", "Previous");
    previous.type = "button";
    previous.disabled = page <= 1;
    previous.dataset.elementwisePage = kind;
    previous.dataset.pageAction = "previous";
    const summary = text("span", total ? `${start}-${end} of ${total} · Page ${page} of ${pageCount}` : "No matching rows", "page-summary");
    const next = text("button", "Next");
    next.type = "button";
    next.disabled = page >= pageCount;
    next.dataset.elementwisePage = kind;
    next.dataset.pageAction = "next";
    root.append(previous, summary, next);
  }

  function renderPrograms() {
    clear(elements.programBody);
    const query = state.programQuery.trim().toLocaleLowerCase();
    const matches = state.programs.filter((program) => {
      const statusMatches = state.programStatus === "all" || program.status === state.programStatus;
      return statusMatches && (!query || programSearchText(program).includes(query));
    });
    const pageCount = Math.max(1, Math.ceil(matches.length / state.programPageSize));
    state.programPage = Math.min(Math.max(1, state.programPage), pageCount);
    const start = (state.programPage - 1) * state.programPageSize;
    const visible = matches.slice(start, start + state.programPageSize);
    if (visible.length === 0) {
      const row = document.createElement("tr");
      const cell = text("td", "No programs match the current filters.", "muted");
      cell.colSpan = 5;
      row.append(cell);
      elements.programBody.append(row);
    } else {
      visible.forEach((program, index) => elements.programBody.append(...createProgramRows(program, start + index)));
    }
    elements.programCounts.textContent = state.programView === "corpus" && state.corpus
      ? `${state.corpus.source_programs} source corpus`
      : matches.length === state.programs.length
        ? `${state.programs.length} discovered`
        : `${matches.length} of ${state.programs.length}`;
    renderPagination(elements.programPagination, state.programPage, pageCount, matches.length, matches.length ? start + 1 : 0, Math.min(start + state.programPageSize, matches.length), "programs");
  }

  function populateProgramStatuses() {
    const selected = state.programStatus;
    while (elements.programStatus.options.length > 1) elements.programStatus.remove(1);
    const statuses = [...new Set(state.programs.map((program) => program.status))].sort();
    for (const status of statuses) {
      const option = document.createElement("option");
      option.value = status;
      option.textContent = status;
      elements.programStatus.append(option);
    }
    elements.programStatus.value = statuses.includes(selected) ? selected : "all";
    state.programStatus = elements.programStatus.value;
  }

  function intrinsicSearchText(capability) {
    return [capability.id, capability.architecture, capability.spelling, capability.function_type, capability.semantic_symbol, capability.review_family, ...(capability.architecture_conditions || []), ...(capability.programs || [])].join(" ").toLocaleLowerCase();
  }

  function intrinsicStatusMatches(capability) {
    if (state.intrinsicStatus === "used") return capability.used;
    if (state.intrinsicStatus === "reviewed") return capability.independently_reviewed;
    if (state.intrinsicStatus === "pending-review") return !capability.independently_reviewed;
    if (state.intrinsicStatus === "conditioned") return (capability.architecture_conditions || []).length > 0;
    return true;
  }

  function renderCapabilityRow(capability) {
    const row = document.createElement("tr");
    const identity = document.createElement("td");
    identity.append(text("strong", capability.spelling || "unknown"));
    identity.append(text("span", capability.architecture || "unknown", "architecture-label"));
    identity.append(text("code", capability.function_type || "unknown signature", "secondary-cell"));
    identity.append(text("code", capability.id || "missing exact identity", "intrinsic-id"));
    row.append(identity);

    const definition = document.createElement("td");
    definition.append(statusChip(capability.defined ? "Defined" : "Missing", capability.defined ? "result-defined" : "result-missing"));
    definition.append(text("small", capability.semantic_symbol || capability.role || "No semantic symbol", "secondary-cell"));
    row.append(definition);

    const review = document.createElement("td");
    review.append(statusChip(capability.lean_checked ? "Lean checked" : "Lean pending", capability.lean_checked ? "result-verified-value" : "result-pending"));
    review.append(statusChip(capability.independently_reviewed ? "Reviewed" : "Review pending", capability.independently_reviewed ? "result-reviewed" : "result-pending"));
    if (capability.review_sha256) review.append(text("code", String(capability.review_sha256).slice(0, 16), "secondary-cell"));
    row.append(review);

    const scope = document.createElement("td");
    scope.append(text("strong", capability.claim_scope || "scope not recorded"));
    scope.append(text("small", capability.review_family || "No review family", "secondary-cell"));
    const conditions = capability.architecture_conditions || [];
    scope.append(text("small", conditions.length ? conditions.join(", ") : "No extra architecture condition", "secondary-cell"));
    row.append(scope);

    const dependency = document.createElement("td");
    const programs = capability.programs || [];
    if (programs.length === 0) {
      dependency.append(text("span", "Unused by current 19", "muted"));
    } else {
      const details = document.createElement("details");
      details.className = "dependency-disclosure";
      details.append(text("summary", `${programs.length} dependent program${programs.length === 1 ? "" : "s"}`));
      const list = document.createElement("ul");
      list.className = "dependency-chip-list";
      for (const program of programs) list.append(text("li", program));
      details.append(list);
      dependency.append(details);
    }
    row.append(dependency);
    return row;
  }

  function renderIntrinsics() {
    clear(elements.capabilityBody);
    const query = state.intrinsicQuery.trim().toLocaleLowerCase();
    const matches = state.capabilities.filter((capability) => {
      const architectureMatches = state.intrinsicArchitecture === "all" || capability.architecture === state.intrinsicArchitecture;
      return architectureMatches && intrinsicStatusMatches(capability) && (!query || intrinsicSearchText(capability).includes(query));
    });
    const pageCount = Math.max(1, Math.ceil(matches.length / state.intrinsicPageSize));
    state.intrinsicPage = Math.min(Math.max(1, state.intrinsicPage), pageCount);
    const start = (state.intrinsicPage - 1) * state.intrinsicPageSize;
    const visible = matches.slice(start, start + state.intrinsicPageSize);
    if (visible.length === 0) {
      const row = document.createElement("tr");
      const cell = text("td", "No exact intrinsic variants match the current filters.", "muted");
      cell.colSpan = 5;
      row.append(cell);
      elements.capabilityBody.append(row);
    } else {
      for (const capability of visible) elements.capabilityBody.append(renderCapabilityRow(capability));
    }
    elements.intrinsicCounts.textContent = matches.length === state.capabilities.length ? `${state.capabilities.length} exact variants` : `${matches.length} of ${state.capabilities.length}`;
    renderPagination(elements.intrinsicPagination, state.intrinsicPage, pageCount, matches.length, matches.length ? start + 1 : 0, Math.min(start + state.intrinsicPageSize, matches.length), "intrinsics");
  }

  function renderUnavailable(payload) {
    clear(elements.summary);
    clear(elements.programBody);
    clear(elements.capabilityBody);
    clear(elements.deferred);
    clear(elements.intrinsicSummary);
    clear(elements.corpusOverview);
    clear(elements.corpusFamilyList);
    elements.counts.textContent = "No generated report";
    elements.message.textContent = payload?.message || "Elementwise artifact graph is unavailable.";
    elements.programCounts.textContent = "Unavailable";
    elements.intrinsicCounts.textContent = "Unavailable";
    elements.corpusProgramCounts.textContent = "Unavailable";
    elements.valueClaim.textContent = "No value result is available.";
    elements.intrinsicClaim.textContent = "No exact intrinsic review projection is available.";
  }

  function render(payload, corpusPayload = null) {
    if (!payload || payload.schema_version !== 3 || payload.available !== true) {
      state.payload = null;
      state.programs = [];
      state.capabilities = [];
      state.corpus = null;
      renderUnavailable(payload);
      return;
    }
    state.payload = payload;
    state.programs = Array.isArray(payload.programs) ? payload.programs : [];
    state.capabilities = Array.isArray(payload.capabilities) ? payload.capabilities : [];
    state.corpus = buildCorpusRoadmap(corpusPayload, state.programs);
    populateProgramStatuses();
    renderOverview();
    renderPrograms();
    renderCorpusRoadmap();
    renderIntrinsics();
  }

  async function fetchJson(url) {
    const response = await fetch(url, { cache: "no-store", headers: { Accept: "application/json" } });
    if (!response.ok) throw new Error(`HTTP ${response.status}`);
    return response.json();
  }

  async function load() {
    try {
      const [graphResult, corpusResult] = await Promise.allSettled([
        fetchJson(API_URL),
        fetchJson("/api/state"),
      ]);
      if (graphResult.status !== "fulfilled") throw graphResult.reason;
      render(graphResult.value, corpusResult.status === "fulfilled" ? corpusResult.value : null);
    } catch (_error) {
      renderUnavailable({ message: "Could not read the elementwise artifact graph." });
    }
  }

  elements.programSearch.addEventListener("input", (event) => {
    state.programQuery = event.target.value;
    state.programPage = 1;
    renderPrograms();
  });
  elements.programStatus.addEventListener("change", (event) => {
    state.programStatus = event.target.value;
    state.programPage = 1;
    renderPrograms();
  });
  elements.programPageSize.addEventListener("change", (event) => {
    state.programPageSize = Number(event.target.value) || 20;
    state.programPage = 1;
    renderPrograms();
  });
  elements.intrinsicSearch.addEventListener("input", (event) => {
    state.intrinsicQuery = event.target.value;
    state.intrinsicPage = 1;
    renderIntrinsics();
  });
  elements.intrinsicArchitecture.addEventListener("change", (event) => {
    state.intrinsicArchitecture = event.target.value;
    state.intrinsicPage = 1;
    renderIntrinsics();
  });
  elements.intrinsicStatus.addEventListener("change", (event) => {
    state.intrinsicStatus = event.target.value;
    state.intrinsicPage = 1;
    renderIntrinsics();
  });
  elements.intrinsicPageSize.addEventListener("change", (event) => {
    state.intrinsicPageSize = Number(event.target.value) || 25;
    state.intrinsicPage = 1;
    renderIntrinsics();
  });
  elements.programBody.addEventListener("click", (event) => {
    const button = event.target.closest("button[data-program-toggle]");
    if (!button) return;
    const programId = button.dataset.programToggle;
    if (state.expandedPrograms.has(programId)) state.expandedPrograms.delete(programId);
    else state.expandedPrograms.add(programId);
    renderPrograms();
    document.querySelector(`[data-program-toggle="${CSS.escape(programId)}"]`)?.focus();
  });
  document.addEventListener("click", (event) => {
    const button = event.target.closest("button[data-elementwise-page]");
    if (!button || button.disabled) return;
    const delta = button.dataset.pageAction === "next" ? 1 : -1;
    if (button.dataset.elementwisePage === "programs") {
      state.programPage += delta;
      renderPrograms();
      document.querySelector("#programs-title")?.scrollIntoView({ block: "start" });
    } else if (button.dataset.elementwisePage === "intrinsics") {
      state.intrinsicPage += delta;
      renderIntrinsics();
      document.querySelector("#intrinsics-title")?.scrollIntoView({ block: "start" });
    }
  });
  elements.refresh?.addEventListener("click", load);
  elements.openCorpus?.addEventListener("click", () => {
    setView("programs");
    setProgramView("corpus", true);
  });

  initializeNavigation();
  initializeProgramNavigation();
  load();
})();
