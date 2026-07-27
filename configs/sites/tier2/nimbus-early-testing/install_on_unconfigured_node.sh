# Download/run this script by itself, as it will download spack-stack and spack-helpers

tee > /tmp/oneAPI.repo << EOF
[oneAPI]
name=Intel® oneAPI repository
baseurl=https://yum.repos.intel.com/oneapi
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
EOF

sudo mv /tmp/oneAPI.repo /etc/yum.repos.d/.
sudo dnf install intel-oneapi-toolkit

dnf install intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2023.2.1.x86_64 intel-oneapi-compiler-fortran-2023.2.1.x86_64

dnf install openmpi openmpi-devel

dnf install slurm-devel slurm-slurmd

git clone --recurse-submodules https://github.com/AlexanderRichert-NOAA/spack-stack -b nimbus-early-testing
git clone https://github.com/NOAA-EMC/spack-helpers

pushd spack-stack/
export SPACK_STACK_SITE=nimbus-early-testing
. setup.sh
popd
. spack-helpers/source_me.sh

spack deploy --disable-validation-use-at-your-own-risk --no-scheduler
