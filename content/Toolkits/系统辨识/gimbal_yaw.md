---
title: "云台辨识：全方向Yaw"
weight: 2
type: "docs"
toc: false
---

## 描述
$\dot\theta$ 是云台yaw轴速度\
$\mu$ 是控制力矩或电流

云台建模为 
$$\ddot\theta = -\frac{B}{J} \dot\theta + \frac{1}{J}\mu$$

对应传递函数为 
$$\dot\theta(s) = \frac{b \mu(s)}{s - a}$$

辨识参数 $a \ b$

---

初始化后会在~/alliance/identify 中创建一个文件夹，名字为当前时间戳，如果没有路径则会报错

## 定义

```Cpp
class GimbalYaw
{
    GimbalYaw(
        const double                                    time_step,
        const double                                    control_torque_max,
        ExcitationSignal                                signal_type,
        std::function<const double(void)>               GetVelocity,
        std::function<void(const double)>               SetTorque,
        std::optional<double>                           firction = std::nullopt
    );
    

    IdentifierState update(); 
}
```
## 构造函数
```Cpp
GimbalYaw(
    const double                                    time_step,
    const double                                    control_torque_max,
    ExcitationSignal                                signal_type,
    std::function<const double(void)>               GetVelocity,
    std::function<void(const double)>               SetTorque,
    std::optional<double>                           firction = std::nullopt
);
```
### params
| Name | Desc|
| --- | --- |
|`time_step` | 每次迭代的时间差|
|`control_torque_max` | 你希望的辨识激励最大值 `exp: A -> ASin(t)`|
|`siganl_type` | 激励信号类型 |
|`GetVelocity` | 获取当前速度的方法 |
|`SetTorque` | 设置云台力矩的方法 |
|`firction` | 系统的摩檫力，输出会自动补偿这个力 |
