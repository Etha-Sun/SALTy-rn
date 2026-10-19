从r8独立新增一个loaded-pre标量目标，直接引用真实调用前标签下的w[0]，不读取后态ghost快照。没有新增执行性内存读取或合同；实际loader与原RTE/泛化义务保留。源guard通过；none展开仅用于核对heap，不是证明结果。
