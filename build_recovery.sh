# Rom building script for gitpod
# coded by yash aka flashokiller

RECOVERY_NAME=ORANGE_FOX
GITHUB_USER=flashokiller
GITHUB_EMAIL=flashokiller@gmail.com
WORK_DIR=$(pwd)/${RECOVERY_NAME}
JOBS=nproc

# Set up git!
git config --global user.name ${GITHUB_USER}
git config --global user.email ${GITHUB_EMAIL}
# make directories
mkdir ${WORK_DIR} && cd ${WORK_DIR}
git clone https://gitlab.com/OrangeFox/sync.git
cd ~/ORANGE_FOX/sync
export USE_SSH=1
./get_fox_10.sh ~/ORANGEFOX/fox_10.0
cd .. && cd ~/ORANGEFOX/fox_10.0

#device
git clone --depth=1  https://github.com/flashokiller/twrp_micromax_e6746 device/micromax/E6746
#git clone --depth=1 https://github.com/I-n-o-k/prebuilt_vendor_juice --single-branch -b 11 vendor/xiaomi/juice
#git clone --depth=1 https://github.com/MiBengal-Development/android_kernel_xiaomi_bengal  --single-branch -b 11.0 kernel/xiaomi/juice
#git clone --depth=1 https://github.com/GengKapak/GengKapak-clang --single-branch -b 13 prebuilts/clang/host/linux-x86/clang-gengkapak

# Start building!
. build/envsetup.sh
lunch omni_E6746-eng
export OF_VANILLA_BUILD=1
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
make recoveryimage
