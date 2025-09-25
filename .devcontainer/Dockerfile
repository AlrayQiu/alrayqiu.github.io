# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/base:ubuntu-24.04

# 安装 Hugo Extended 和 Node.js（使用官方脚本）
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    unzip \
    gnupg \
    golang\
    ca-certificates \
    build-essential \
    libglib2.0-dev \
    libssl-dev \
    libffi-dev \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && curl -s https://api.github.com/repos/gohugoio/hugo/releases/latest \
    | grep "browser_download_url.*hugo_extended.*Linux-64bit.tar.gz" \
    | cut -d '"' -f 4 \
    | wget -i - -O hugo.tar.gz \
    && tar -xzf hugo.tar.gz \
    && mv hugo /usr/local/bin/hugo \
    && rm hugo.tar.gz


# 切换到非 root 用户
USER vscode
WORKDIR /workspace

RUN sudo npm install --save-dev autoprefixer \
    && sudo npm install --save-dev postcss-cli \
    && sudo npm install -D postcss


RUN git config --global user.email "1780284652@qq.com" \
    && git config --global user.name "alray"

