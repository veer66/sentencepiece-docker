FROM nvidia/cuda:11.0-devel
ENV TZ=Asia/Bangkok
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y python3-dev python3-pip git cmake build-essential pkg-config libgoogle-perftools-dev
RUN git clone https://github.com/google/sentencepiece.git
RUN cd sentencepiece && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j $(nproc) && \
    make install && \
    ldconfig -v