FROM gitpod/workspace-full:latest
USER ROOT
RUN sudo npm install -g tldr
RUN sudo python3 -m pip install -r requirements.txt
RUN sudo add-apt-repository ppa:bitcoin/bitcoin \
    && sudo apt-get update \
    && sudo apt-get install bitcoind \
    && python3 -m pip install -r requirements.txt
