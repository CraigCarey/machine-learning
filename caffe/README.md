## Build Docker Image
```bash
docker build -t caffe-ex-gpu . -f docker/gpu/Dockerfile   # for CUDA GPU
# or...
docker build -t caffe-ex-cpu . -f docker/cpu/Dockerfile   # for CPU only
```

## Run Docker Container
```bash
docker run -it caffe-ex-gpu/cpu
```

## Run Caffe Classifier Example
```bash
# Inside docker container:
cd /workspace/build
./caffe-classifier deploy.prototxt bvlc_reference_caffenet.caffemodel imagenet_mean.binaryproto labels.txt hotdog.jpg
```
