FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		build-essential \
		cmake \
		git \
		wget \
		libatlas-base-dev \
		libboost-all-dev \
		libgflags-dev \
		libgoogle-glog-dev \
		libhdf5-serial-dev \
		libleveldb-dev \
		liblmdb-dev \
		libopencv-dev \
		libprotobuf-dev \
		libsnappy-dev \
		protobuf-compiler \
		python-dev \
		python-numpy \
		python-pip \
		python-setuptools \
		python-scipy; \
	rm -rf /var/lib/apt/lists/*;

ENV CAFFE_ROOT=/opt/caffe
WORKDIR $CAFFE_ROOT

ENV CLONE_TAG=1.0

RUN set -eux; \
	git clone https://github.com/NVIDIA/nccl.git; \
	cd nccl; \
	make -j install; \
	cd ..; \
	rm -rf nccl; \
	git clone -b ${CLONE_TAG} --depth 1 https://github.com/BVLC/caffe.git .; \
	mkdir build; \
	cd build; \
	cmake -DUSE_CUDNN=1 -DUSE_NCCL=1 ..; \
	make all -j"$(nproc)"; \
	make test; \
	#make runtest; \
	make pycaffe; \
	make install; \
	cd ..; \
	protoc src/caffe/proto/caffe.proto --cpp_out=.; \
	mkdir include/caffe/proto; \
	cp src/caffe/proto/caffe.pb.h include/caffe/proto/;

ENV PYCAFFE_ROOT $CAFFE_ROOT/python
ENV PYTHONPATH $PYCAFFE_ROOT:$PYTHONPATH
ENV PATH $CAFFE_ROOT/build/tools:$PYCAFFE_ROOT:$PATH
RUN set -eux; \
	echo "$CAFFE_ROOT/build/lib" >> /etc/ld.so.conf.d/caffe.conf; \
	ldconfig;

WORKDIR /workspace
COPY ./ .

CMD ["/bin/bash"]
