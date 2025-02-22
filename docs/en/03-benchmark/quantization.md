# Quantization test result

Currently mmdeploy support ncnn quantization

## Quantize with ncnn

### mmcls

|                                                            model                                                             |   dataset   | fp32 top-1 (%) | int8 top-1 (%) |
| :--------------------------------------------------------------------------------------------------------------------------: | :---------: | :------------: | :------------: |
|       [ResNet-18](https://github.com/open-mmlab/mmclassification/blob/master/configs/resnet/resnet18_8xb16_cifar10.py)       |   Cifar10   |     94.82      |     94.83      |
| [ResNeXt-32x4d-50](https://github.com/open-mmlab/mmclassification/blob/master/configs/resnext/resnext50-32x4d_8xb32_in1k.py) | ImageNet-1k |     77.90      |    78.20\*     |
|  [MobileNet V2](https://github.com/open-mmlab/mmclassification/blob/master/configs/mobilenet_v2/mobilenet-v2_8xb32_in1k.py)  | ImageNet-1k |     71.86      |    71.43\*     |
|       [HRNet-W18\*](https://github.com/open-mmlab/mmclassification/blob/master/configs/hrnet/hrnet-w18_4xb32_in1k.py)        | ImageNet-1k |     76.75      |    76.25\*     |

Note:

- Because of the large amount of imagenet-1k data and ncnn has not released Vulkan int8 version, only part of the test set (4000/50000) is used.
- The accuracy will vary after quantization, and it is normal for the classification model to increase by less than 1%.

### OCR detection

|                                                            model                                                             |  dataset  | fp32 hmean |   int8 hmean   |
| :--------------------------------------------------------------------------------------------------------------------------: | :-------: | :--------: | :------------: |
|      [PANet](https://github.com/open-mmlab/mmocr/blob/main/configs/textdet/panet/panet_r18_fpem_ffm_600e_icdar2015.py)       | ICDAR2015 |   0.795    | 0.792 @thr=0.9 |
| [TextSnake](https://github.com/open-mmlab/mmocr/blob/main/configs/textdet/textsnake/textsnake_r50_fpn_unet_1200e_ctw1500.py) |  CTW1500  |   0.817    |     0.818      |

Note:  [mmocr](https://github.com/open-mmlab/mmocr)  Uses 'shapely' to compute IoU, which results in a slight difference in accuracy

### Pose detection

|                                                                      model                                                                       | dataset  | fp32 AP | int8 AP |
| :----------------------------------------------------------------------------------------------------------------------------------------------: | :------: | :-----: | :-----: |
| [Hourglass](https://github.com/open-mmlab/mmpose/blob/master/configs/body/2d_kpt_sview_rgb_img/topdown_heatmap/coco/hourglass52_coco_256x256.py) | COCO2017 |  0.726  |  0.713  |

Note: MMPose models are tested with `flip_test` explicitly set to `False` in model configs.
