#!/bin/bash
source /opt/anaconda3/bin/activate py35
pip install /opt/TensorRT-3.0.4/python/tensorrt-3.0.4-cp35-cp35m-linux_x86_64.whl
pip install /opt/TensorRT-3.0.4/uff/uff-0.2.0-py2.py3-none-any.whl
mv -f setup.py /opt/anaconda3/envs/py35/lib/python3.5/site-packages/tensorrt/examples/custom_layers/tensorrtplugins

