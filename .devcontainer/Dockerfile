FROM mcr.microsoft.com/devcontainers/base:jammy

# 安装 Hugo Extended
RUN curl -L https://github.com/gohugoio/hugo/releases/latest/download/hugo_extended_0.121.1_Linux-64bit.tar.gz \
    | tar -xz -C /usr/local/bin hugo

# 安装依赖工具
RUN apt-get update && apt-get install -y git

# 安装 Node.js 和 PostCSS 相关依赖
RUN npm install -g postcss postcss-cli autoprefixer

# 设置工作目录
WORKDIR /workspace
