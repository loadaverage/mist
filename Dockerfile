# version: 0.0.1
# author: VS <github@roundside.com>
# description: Dockerized Mist - Ethereum Wallet (https://github.com/ethereum/mist)
#
# run a container
#
#   docker run --rm \
#     -v ~/Downloads/mist:/home/mist/Downloads \
#     -v ~/.config/Ethereum\ Wallet:/home/mist/.config/Ethereum\ Wallet \
#     -v ~/.themes:/home/mist/.themes:ro \
#     -v ~/.fonts:/home/mist/.fonts:ro \
#     -v ~/.icons:/home/mist/.icons:ro \
#     -v ~/.gtkrc-2.0:/home/mist/.gtkrc-2.0:ro \
#     -v /usr/share/themes:/usr/share/themes:ro \
#     -v /usr/share/fonts:/usr/share/fonts:ro \
#     -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY mist

FROM debian:stretch
RUN apt-get update && apt-get upgrade -yqq && \
    apt-get install libgtk2.0-0 \
    libxtst6 \
    libxss1 \
    libgconf-2-4 \
    libnss3 \
    libasound2 \
    wget \
    ca-certificates \
    unzip --no-install-recommends -yqq && \
    useradd -m -s /bin/bash mist && \
    su mist -c "cd && wget --quiet "https://github.com/ethereum/mist/releases/download/v0.8.9/Ethereum-Wallet-linux64-0-8-9.zip" -O temp.zip && \
    unzip temp.zip && rm temp.zip"
USER mist
WORKDIR /home/mist/linux-unpacked
CMD ["./ethereumwallet"]
