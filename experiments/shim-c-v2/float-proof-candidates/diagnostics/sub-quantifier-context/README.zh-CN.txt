这是 SMT 上下文诊断，不是完整程序证明或 verified 入库依据。
基线是 frontend-campaign/f32-vsub（manifest 7301c0d21d18806d9ca77a1e5ebd4d187cdc161392d9a6908a8740b936df00fe）。
冻结模型是 model-front，lock SHA 948d1814c32545317f4340fff3b464743f94587510fbf954e080ba405f52ddc4。
只把原 lemma 改 check lemma，保留同一命题自身的证明义务，避免自动向其他 VC 加入量词假设；给2lane prefix invariant加名字以定点选择。
实际新前端/z3,cvc5/30秒结果：建立和保持2/2通过，保持CVC5 11.7秒。正式完整候选采用有真实body的ghost checker，沿用v2覆盖检查，不依赖这个诊断patch。
WP打印中prefix helper postcondition已经包含目标forall；超时表示当前证明搜索未完成，不是kernel反例。
