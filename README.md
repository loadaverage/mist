#### Mist Browser (https://github.com/ethereum/mist) in Docker container. This image uses X11 socket.

> run a container
```
   docker run --rm \
     -v ~/Downloads/mist:/home/mist/Downloads \
     -v ~/.ethereum:/home/mist/.ethereum \
     -v ~/.config/Ethereum\ Wallet:/home/mist/.config/Ethereum\ Wallet \
     -v ~/.themes:/home/mist/.themes:ro \
     -v ~/.fonts:/home/mist/.fonts:ro \
     -v ~/.icons:/home/mist/.icons:ro \
     -v ~/.gtkrc-2.0:/home/mist/.gtkrc-2.0:ro \
     -v /usr/share/themes:/usr/share/themes:ro \
     -v /usr/share/fonts:/usr/share/fonts:ro \
     -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY loadaverage/mist
```
