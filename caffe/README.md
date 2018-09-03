## Install NVIDIA Container Runtime

This allows docker to access the NVIDIA GPUs on your system.
[Follow the guide here](https://devblogs.nvidia.com/gpu-containers-runtime/).


## Build Docker Image
```bash
docker build -t caffe-ex-gpu . -f docker/gpu/Dockerfile    # for CUDA GPU
# or...
docker build -t caffe-ex-cpu . -f docker/cpu/Dockerfile    # for CPU only
```

## Run Docker Container
```bash
docker run --rm --runtime=nvidia -it caffe-ex-gpu    # for CUDA GPU
# or...
docker run -it caffe-ex-cpu                          # for CPU only
```

## Run Caffe Classifier Example
```bash
# Inside docker container:
cd /workspace/build
./caffe-classifier deploy.prototxt bvlc_reference_caffenet.caffemodel imagenet_mean.binaryproto labels.txt hotdog.jpg
```
