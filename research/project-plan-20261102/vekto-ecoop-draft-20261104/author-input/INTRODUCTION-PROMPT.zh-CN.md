# Introduction：作者原始 prompt 与后续反馈

保存于 2026-11-04。下面的“原文”直接保留作者在本对话中的表达，包括语音转写、待核查表述和占位符；这些文字是写作要求，不是已经核实的研究结论。助手的归纳单独存放在 `INTRODUCTION-RESET-CONTEXT.zh-CN.md`，不得混作作者原话。

## 一、原始九段写作 prompt

第一段像keagan一样，讲述硬件优化整体概念，说这个是一个越来越受关注的主题，agent在写kernel方面表现的越来越好（kernelbench等等很多技术）

第二段，把视角拉回我们要解决的问题 SIMD vector in modern CPUs，然后简单描述一下simd上的不同架构非常不同，且说明rvv这个比较新，是这个非常上升的kernel，收获越来越多的关注。且这些simd指令，都有对应的c intrinsic解释，人们完全可以用C代码中间添加一些高并行的运算，编译器就会翻译成高性能的指令，可以在C层面编码，为人类的编码创造了很多便利（不需要直接写assembly代码）

第三段，这也为agent创造了很好的平台，可以将其在代码优化中的expertise，辅以一些intrinsic解释以及硬件编程技巧，应用到simd code的优化中，比如salty rn，autocomp等等，但是，agent写的代码可能频频发生reward hack（比如kernel bench之前汇报的一些reward hack问题），我们还需要验证其正确性。现有工作在验证上已经做出了很多努力（引用很多文章）但他们都没有形式化验证转写后的等价性。对于end-to-end的跨架构的kernel验证还没有人做（这上面很多说法都不大恰当，你需要自行替换为学术感强的描述）

第四段，构建跨isa的kernel的共享语义模型基于我们处理的代码层面不同可以有很多种路径：比如在编译后的assembly层面，sail/islaris 等等工作，通过specification language详细定义了isa中的很多操作，详细到很多exception的处理；也可以使用某种IR将simd code进行翻译，将intrinsic重新用ir定义，然后再在IR层面建立对应于语义模型，建立对应内存模型，定义正确性以及等价性（找找有什么工作嘛？这个我不是很清楚）也可以在C层面，得益于 C intrinsic 的支持，尝试对intrinsic做C解释，然后将simd 验证问题转化为C 程序的验证问题

第五段，在本工作中，由于我们关注的是functional correctness（找找有啥更确切的定义嘛？就是说我们不关心很多意外情况），在assembly层面建立等价性对于我们的验证目标过于底层，需要haddle很多exception的处理，并且sail对于rvv这样的vla架构构建了另一套isa model，验证vla 与fixed-length相关kernel仍需连接两个模型，处理复杂的对应关系。为了使我们整体的框架更加简洁，让intrinsic semantic能够更直接地连接到我们相信的东西，更容易被审计，我们在C层面完成了simd的验证，

第六段，我们提出了\tool，一种跨isa语义等价性验证框架。我们对四种框架的intrinsic建立可复用code shim（c 语义)，使用QCP（引用一下）验证两个C program的等价性。对于两个kernel，我们会首先retrieve到对应code shim，然后建立简洁的spec，将output的等价性，定义为语义等价性。qcp会基于此建立verification condition，验证xxxx（这个可能需要搜一下qcp具体是怎么做的）。在证明中，我们将impl，spec，和proof严格分离，直接导入原有C intrinsic 实现。让agent要么完成相关proof的生成，要么能否找到确切反例，证伪验证的性质，并提出建议的修改方案。

第七段，在这个框架中，给定需要验证等价性的两个kernel，人类专家只需要，1.审核等价性spec的定义（一般只有几十行）2. 审核验证反馈。对于不等价的验证，审核反例，如果不是真实场景中会出现的，是虚假反例（不在我们预期的限制范围内），则需要加强相关spec，将其排除，若不是，则需要作出不严重干扰性能的相关修复。然后重新验证。

第八段，基于该等价性框架，我们认为有三类有价值的下游任务。1.kernel优化后的语义等价性验证，对于同一isa，或者跨isa的kernel甚至program改写，验证其语义等价性，从而能够减少agent在基于test的优化任务上的reward hacking，语义一致性。 2. 跨isa的新kernel翻译，avx/neon，一直以来，由于其所在系统（x86/arm）的巨大影响力，高性能的cpu代码一直收到广泛关注，其中kernel功能完备，且受到持续的维护和完善，而rvv/hvx，则是较为新型的系统，所支持的kernel功能受限，使用人类专家重写同样面临较大的工程压力。而在该语义等价性框架之下，将已有的成熟系统中的kernel，有形式化保证地翻译到新语言，大大减少了相关的审计与人工effort压力 3. 对已有同功能kernel的等价性验证与debugging。在不同系统中，有许多功能一致的kernel，我们的系统不仅可以验证kernel是否符合某种安全性质或者功能性质，也可以直接对两个同功能的kernel，类似于差分测试一样（可以引用McKeeman，symdiff，差分测试这个词的用法我不确定），检测是否存在misalignment，并给出确切反例，xxxx（需要还有一句，类似于帮助人类更好维护系统之类的，但是肯定不是这么说，就是一个套话，你得想想了）。

简易版第八段（这一段写在注释里面），基于该等价性框架，我们进行kernel优化后的语义等价性验证，跨isa的语义等价的kernel翻译 以及 检验不同isa框架下同一功能kernel的一致性与bug finding。在salty-rn的基础上，我们修复并验证了35对基于neon kernel翻译而成的新rvvkernel，平均比手工的rvv kernel提速xxx倍。此外，我们从avx这个相对成熟的系统中，将x个其独有的kernel翻译到了rvv与hexagon这样的新系统中。并且我们

第九段，我们在多个isa以及多种任务上测试了我们的框架。在salty-rn的基础上，我们修复并验证了35对基于neon kernel翻译而成的新rvv kernel，平均比手工的rvv kernel提速xxx倍。我们从avx这个相对成熟的系统中，将x个其独有的kernel翻译到了rvv与hexagon这样的新系统中，并验证了其语义等价性。我们通过检验一致性的方式，发现了XNNpack中xx个kernel实现不一致的情况，并将相关内容汇报。更一般的，我们加速并验证了应用级simd程序，softmax，相比人工的rvv程序实现了xx倍的加速。

这是我写的introduction，你需要先做相关的文献调研，看看我之前的写作指导，参考你之前的markdown，另外，我附上了一个可能有用的pdf，这个是之前做byte machine时写的technical report，放到这里只是让你尝试学习一下其中部分对于pl论文的表述方式，不要照搬内容。先做文献调研，核查我这九段里哪些说法不准确，再按之前的写作要求给我一版英文introduction，实验结果没做出来的先留占位，不要写成已经完成。

然后你如果比较有自信，可以按照我之前给你说的要求继续做一下motivated exmaple部分，甚至是更多的论文部分的写作，你需要使用latex，请你使用ecoop模板 https://2027.ecoop.org/track/ecoop-2027-technical-papers 对于，需要找我讨论的地方你直接问我，我建议你有一个红色\todo 标记，将中间那些占位符，不确定的，没有结果的都用红色todo标记出来

## 二、后续直接反馈（原文，按顺序）

### Abstract

先不写abstract

### 篇幅

intro怎么写了两页

### 审阅呈现

你把你写的每段的中文版放着，然后一段你写的翻译，一段是我原本怎么写的

### 对逐工具介绍的批评

我靠你这会写论文吗？KernelBench 将生成的 GPU kernel 与参考张量计算进行比较；Autocomp 则结合硬件知识以及正确性和性能反馈，搜索更快的加速器程序 谁论文这么写啊，你自己找点相关论文参考一下，先把类似的给改了，你自己反思问题，我给你审核。可以参考一下我的论文topoverus的introduction

### 当前重写要求

为啥是软件，我们做gpu kernel和cpu kernel属于高性能数值软件吗？不应该是硬件啥的吗？另外第一段中需要提到过去需要大量human effort

另外你看看keagan 怎么写的，我说把视角拉回我们要解决的问题 SIMD vector in modern CPUs。不是让你直接说 我们关注 CPU 向量扩展上的 SIMD kernel，需要一个引入。

第二段怎么就直接提agent了，你写的和我的意思根本就没有对齐啊。我前面的几段还是想要follow keagan那一套的，并且，
我觉得你这一版本有点差，能否现在去保存一下我的prompt到一个文件，关于introduction的，然后压缩自己的上下文，重新加载相关的论文写作skill，以及我的写作要求，然后重写，压缩的时候记得吸收一下我一些经验，我允许你写的稍微长一点，压缩的时候可以不考虑页数限制，但是语言能否follow我的叙述逻辑同样也要符合论文写作的凝练有信息量啊

## 三、参考材料位置

- SALTyRN：`/home/ycsun/.codex/attachments/39b59f74-916b-4d47-ac27-398c92d20fc0/SaltyRN.pdf`，Introduction。
- TopoVerus：`/home/ycsun/.codex/attachments/25bac345-008a-4adb-966f-5959f7fa404a/TopoVerus.pdf`，Introduction。
- 旧技术报告：`/home/ycsun/.codex/attachments/3f84d457-c81f-4276-8ba5-a62d703d46b6/report.pdf`。只能参考表述，不能转用其完成数或 total correctness。
- 写作 skill：`/home/ycsun/.codex/skills/vekto-paper-writing/SKILL.md`。
- Humanizer：`/home/ycsun/.codex/skills/humanizer/SKILL.md`。

## 四、此前八条写作要求（从已保存 skill 恢复）


1. **沿用论文已有术语，不随意换词或造标签。** 方法、baseline、指标和操作保持一致。不要用新造的连字符短语包装解释，例如 `verifier-only RL ablation`、`better-constrained diagnostic context`；直接写 baseline 名称，说明建立了哪些事实、这些事实起什么作用。正规的技术术语和惯用连字符可以保留。
2. **概念在使用的位置就要能读懂。** 读者应能确定术语指什么、具体是什么意思。不能仅因为前面定义过，就省略必要的联系。优先解释实际操作：拆分什么、匹配什么、统计什么、优化什么。
3. **不用破折号压缩逻辑。** 不用 em dash、en dash、带空格的连字符或 LaTeX `---` 连接正文分句，即使参考写作样例用了也不例外。必要时拆成两个完整句子，明确主语、条件及逻辑关系。数学减号、数值范围、代码和规范术语保留。
4. **清晰优先于简短。** 必要的重复、定义、例子和适用范围都可以保留。不要强行把所有句子缩短，也不要用分号、修饰语堆叠或缩写标签替代原来的歧义。**不规定每段只能有一个 claim，也不规定每段最多几句话。**
5. **形成连贯的科学论证。** 面向“懂这个领域、但第一次接触本研究”的读者，交代问题、相关限制、设计选择及证据。不要为不同组件临时编造不同动机，也不要夸大前人局限来制造对比。Related Work 按有意义的差异及其后果组织。
6. **结论强度必须匹配证据。** 区分测量结果、案例观察、候选解释和已经证实的因果关系。重点检查 `because`、`therefore`、`thus`、`primarily due to`。总体提升不能写成所有数据集都提升；小数据集的百分比敏感，也不能解释某个方法具体为什么失败。已经成立的结果同样不必机械弱化。
7. **结果要解释科学含义，失败要解释具体机制。** 不只罗列分数，也不追加重复结果的口号。说明比较带来的实际结论、条件或限制。解释失败时指出具体任务、操作、条件或代码，不能用 `scope mismatch` 这类抽象标签代替分析。例子、执行状态和数值必须有来源，不能编造。
8. **只修改授权范围，保留技术内容。** 局部修改前阅读必要上下文；保留 LaTeX 命令、引用键、label、公式、数值和代码。技术不一致单独报告，不能当成润色悄悄改掉。分析或规划请求不授权修改论文；润色也不授权新增实验、承诺未来研究或删除实质主张。


## 五、段末、人工信任、最终稿时态和引用写法的新反馈（原文）

我隐隐的感觉你每一段的最后一句话都有点突兀，关于assumption，我觉得这个事情是我们相信了human。不是我们计划通过，这里我们写的是论文的最终稿，所以你需要就是我们通过，

我觉得这一句不需要 A migration between them must account for different loop structures, tail handling, and instruction behavior. 
另外我不想要文章中看到很多练字词做成的词

第一段是不是也不必要说 Recent work has begun to automate parts of this process with language-model agents that generate and optimize kernels using hardware knowledge and execution feedback ([KernelBench](https://proceedings.mlr.press/v267/ouyang25a.html), [Autocomp](https://arxiv.org/abs/2505.18574v3)). 

我们后面再提也行，第一段就是说明这个任务难，

我不大清楚这个，我感觉这一二段的，有些地方转折还是很突然。你突然说他们，突然他们的 migration 怎么怎么着，然后呢说 RVA 又怎么怎么着。主要是你应该先 motivate the RVA 的影响力，然后再说 migration 他们有这个很多的挑战。我不大清楚 keagan的文章是怎么做的，但是我建议你看一下，然后并告诉我他们的逻辑链大概是什么样的。

However, these changes can alter program behavior on inputs that the available tests do not exercise. Reports of reward hacking in kernel-generation benchmarks further demonstrate that an optimization objective can be satisfied by exploiting weaknesses in its evaluation ([KernelBench evaluation report](https://scalingintelligence.stanford.edu/blogs/kernelbenchv01/)). 这里 这里我想说的就是你说这个哈，可能会导致改变这些在就是 test 没有测试到的地方，然后发生 reward hacking。然后你这里引一下就可以了，不需要再说 report 什么什么东西，然后说啥的。就是你这一点一下，大家一看这个主题就知道了，然后你后面说 existing work 怎么着。
