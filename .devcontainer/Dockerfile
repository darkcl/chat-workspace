FROM nvidia/cuda:11.8.0-devel-ubuntu22.04

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  git \
  curl \
  vim \
  lsb-release \
  fish \
  software-properties-common \
  && add-apt-repository ppa:deadsnakes/ppa \
  && apt install -y python3.10 \
  && rm -rf /var/lib/apt/lists/*

RUN chsh -s /usr/bin/fish root

RUN mkdir ~/.ssh && ln -s /run/secrets/host_ssh_key ~/.ssh/id_rsa

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10 \
  && python3.10 -m pip install numpy --pre torch --force-reinstall --index-url https://download.pytorch.org/whl/nightly/cu118

COPY config.fish /root/.config/fish/config.fish
RUN ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog