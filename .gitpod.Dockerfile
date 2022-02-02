FROM gitpod/workspace-full

RUN sudo apt-get update -qq && \
    sudo apt-get install -qq -y \
    libboost-all-dev \
    ccache

RUN cd /tmp && \
    wget https://developer.download.nvidia.com/compute/cuda/11.0.3/local_installers/cuda_11.0.3_450.51.06_linux.run && \
    sudo sh cuda_11.0.3_450.51.06_linux.run --silent --toolkit && \
    rm cuda_11.0.3_450.51.06_linux.run && \
    echo "PATH=\$PATH:/usr/local/cuda-11.0/bin" >> $HOME/.bashrc

RUN pip install absl-py h5py pillow cupy chainer
