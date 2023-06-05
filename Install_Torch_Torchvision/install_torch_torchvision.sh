MAINPATH=$(pwd)

MAINPATH_TORCH=${MAINPATH}/Torch

mkdir ${MAINPATH_TORCH}
cd ${MAINPATH_TORCH}

# Get the torch packages
wget https://developer.download.nvidia.com/compute/redist/jp/v50/pytorch/torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl

sudo apt-get install -y python3-pip libopenblas-base libopenmpi-dev libomp-dev

yes | pip3 install Cython numpy torch-1.12.0a0+2c916ef.nv22.3-cp38-cp38-linux_aarch64.whl

# ---------------------------------------------------------
# TorchVision

TORCH_VISION_DIR_NAME="torchvision"
MAINPATH_TORCH_VISION=${MAINPATH_TORCH}/${TORCH_VISION_DIR_NAME}
TORCH_VISION_VERSION="0.13.0"

# Install the dependencies libraries of TorchVision
sudo apt-get install -y libjpeg-dev zlib1g-dev libpython3-dev libavcodec-dev libavformat-dev libswscale-dev

git clone --branch v${TORCH_VISION_VERSION} https://github.com/pytorch/vision ${TORCH_VISION_DIR_NAME}   # see below for version of torchvision to download

cd ${MAINPATH_TORCH_VISION}
export BUILD_VERSION=${TORCH_VISION_VERSION}  # where 0.x.0 is the torchvision version  
python3 setup.py install --user

cd ${MAINPATH}
python3 verify.py