
# install correct version of torch and torchvision according to your cuda version
pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117    
pip install -r requirements.txt
conda install -c conda-forge dlib==19.24.2
pip install -e git+https://github.com/CompVis/taming-transformers.git@master#egg=taming-transformers
pip install -e git+https://github.com/openai/CLIP.git@main#egg=clip
pip install -e .
cd eval_tool/Deep3DFaceRecon_pytorch_edit/
git clone https://github.com/NVlabs/nvdiffrast
cd nvdiffrast
pip install -e .
cd ../../../
# pip install -U "huggingface_hub[cli]"
# huggingface-cli login
huggingface-cli download  Sanoojan/REFace  --include "Other_dependencies/*"  --local-dir ./
rm -rf .cache
cd eval_tool/Deep3DFaceRecon_pytorch_edit/
huggingface-cli download  Sanoojan/REFace  --include "BFM/*"  --local-dir ./
rm -rf .cache
cd ../../
conda install cudatoolkit=11.7 cudnn nccl pytorch-cuda=11.7 -c nvidia -c pytorch -y
wget https://huggingface.co/Sanoojan/REFace/resolve/main/last.ckpt -O ./pretrained/last.ckpt
pip install PyYAML filelock flask
mkdir checkpoints
cd checkpoints
git clone --recurse-submodules https://huggingface.co/CompVis/stable-diffusion-safety-checker
git clone --recurse-submodules https://huggingface.co/openai/clip-vit-large-patch14
cd ..