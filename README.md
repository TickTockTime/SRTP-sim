# SRTP-sim
[SRTP] quadrotor formation sim

## 变量

| 变量名 | 含义                              |
| ------ | --------------------------------- |
| $v_0$  | 四旋翼编队的速度                  |
| $V_i$  | 第$i$架四旋翼在机体坐标系中的速度 |
|        |                                   |
|        |                                   |
|        |                                   |
|        |                                   |
|        |                                   |
|        |                                   |
|        |                                   |



## 自适应的编队控制算法

### 领航机编队的控制

我们首先研究两架领航机的控制律，因为这两架领航机的运动不受跟随机的影响，我们可以独立地考虑领航机系统的控制。

- **Setp1**首先通过领航机1在导航坐标系下的速度来确定飞行编队的整体速度$v_0$，即$v_0 = {^E_B}RV_1$
- **Step2**     利用一致性算法控制领航机2的偏航角$\psi_2$和领航机1保持一致

## 测试
