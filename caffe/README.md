## Build Docker Image
```bash
docker build -t caffe-ex . -f docker/gpu/Dockerfile
docker image ls
```

## Run Docker Container
```bash
docker run -it caffe-ex
```

## Run Caffe Classifier Example
```bash
# Inside docker container:
cd /workspace/build
./caffe-classifier deploy.prototxt bvlc_reference_caffenet.caffemodel imagenet_mean.binaryproto labels.txt hotdog.jpg
```
