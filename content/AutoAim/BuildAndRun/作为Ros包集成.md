---
title: "运行已有Ros包"
weight: 3
type: "docs"
toc: true
---

## 拉取最新的ROS仓库
- 作为完整项目
```sh
git clone https://github.com//alliance-algorithm/alliance_ros_auto_aim -b ros2-$ROS_DISTRO --single-branch --recursive {/path/to/ws/pkgs}
```

- 作为子仓库
```sh
git submodule add https://github.com//alliance-algorithm/alliance_ros_auto_aim -b ros2-$ROS_DISTRO {/path/to/ws/pkgs} 
```
```sh
git submodule update --init --single-branch --recursive
```
## 集成到其他ros包中
以`ROS2-humble`为例子

在需要使用`ROS包`的`Package.xml`中添加
```xml
  <depend>alliance_ros_auto_aim</depend>
```

在需要使用`ROS包`的`CMakeLists.txt`中添加
```CMake
  ament_target_dependencies(<your project>
  alliance_ros_auto_aim
  )
```
