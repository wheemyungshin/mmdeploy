wget https://github.com/open-mmlab/mmdeploy/releases/download/v0.7.0/mmdeploy-0.7.0-linux-x86_64-onnxruntime1.8.1.tar.gz
tar -zxvf mmdeploy-0.7.0-linux-x86_64-onnxruntime1.8.1.tar.gz
cd mmdeploy-0.7.0-linux-x86_64-onnxruntime1.8.1
../miniconda3/envs/conda_env_mmpose_deploy/bin/pip install dist/mmdeploy-0.7.0-py3-none-linux_x86_64.whl
../miniconda3/envs/conda_env_mmpose_deploy/bin/pip install sdk/python/mmdeploy_python-0.7.0-cp38-none-linux_x86_64.whl
cd ..
# install inference engine: ONNX Runtime
../miniconda3/envs/conda_env_mmpose_deploy/bin/pip install onnxruntime==1.8.1
wget https://github.com/microsoft/onnxruntime/releases/download/v1.8.1/onnxruntime-linux-x64-1.8.1.tgz
tar -zxvf onnxruntime-linux-x64-1.8.1.tgz
export ONNXRUNTIME_DIR=$(pwd)/onnxruntime-linux-x64-1.8.1
export LD_LIBRARY_PATH=$ONNXRUNTIME_DIR/lib:$LD_LIBRARY_PATH
