FROM ubuntu:22.04

RUN apt-get update && \
  apt-get install -y \
  zsh git wget curl vim&&\ 
  rm -rf /var/lib/apt/lists/*



RUN wget https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh -O zsh-install.sh && \
  chmod +x ./zsh-install.sh && ./zsh-install.sh && \
  sed -i 's/REPO=${REPO:-ohmyzsh\/ohmyzsh}/REPO=${REPO:-mirrors\/oh-my-zsh}/' ./zsh-install.sh && \
  sed -i 's/REMOTE=${REMOTE:-https:\/\/github.com\/${REPO}.git}/REMOTE=${REMOTE:-https:\/\/gitee.com\/${REPO}.git}/' ./zsh-install.sh && \
  sed -i 's/ZSH_THEME=\"[a-z0-9\-]*\"/ZSH_THEME="af-magic"/g' ~/.zshrc && \
  sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc  && \
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
  rm ./zsh-install.sh 

SHELL [ "/bin/zsh" ,"-c"]

RUN mkdir -p /data/app &&\
  cd /data/app &&\
  git clone https://github.com/creationix/nvm.git nvm &&\
  chmod +x /data/app/nvm/nvm.sh &&\
  source /data/app/nvm/nvm.sh &&\
  echo "source /data/app/nvm/nvm.sh" >> ~/.zshrc &&\
  nvm install node &&\
  npm install -g hexo-cli 
  npm install -g hexo-symbols-count-time

  
RUN chsh root -s /bin/zsh