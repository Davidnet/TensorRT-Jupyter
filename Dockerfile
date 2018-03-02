FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
WORKDIR /opt/
RUN apt-get update \
    && apt-get install -y \
    curl \
    wget \
    vim  \
    && rm -rf /var/lib/apt/lists/*
COPY Anaconda3-5.0.1-Linux-x86_64.sh Anaconda3.sh
RUN bash Anaconda3.sh -b -p /opt/anaconda3
ENV PATH="/opt/anaconda3/bin:$PATH"
RUN conda create -y --name py35 anaconda python=3.5
COPY TensorRT-3.0.4.Ubuntu-16.04.3.x86_64.cuda-9.0.cudnn7.0.tar.gz .
RUN tar -xzvf TensorRT-3.0.4.Ubuntu-16.04.3.x86_64.cuda-9.0.cudnn7.0.tar.gz
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/TensorRT-3.0.4/lib" 
ENV CUDA_INSTALL_DIR=/usr/local/cuda
ENV CUDNN_INSTALL_DIR=/usr/local/cuda
COPY [ "installation.sh", "setup.py",  "./"]
RUN /bin/bash -c "/opt/installation.sh"
WORKDIR /opt/
EXPOSE 8888
CMD ["bash"]
#CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
