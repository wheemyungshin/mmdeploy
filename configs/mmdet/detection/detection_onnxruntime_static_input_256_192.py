_base_ = ['../_base_/base_static.py', '../../_base_/backends/onnxruntime.py']

onnx_config = dict(output_names=['dets', 'labels'], input_shape=[256, 192])