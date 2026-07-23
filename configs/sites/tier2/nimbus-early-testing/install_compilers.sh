tee > /tmp/oneAPI.repo << EOF
[oneAPI]
name=Intel® oneAPI repository
baseurl=https://yum.repos.intel.com/oneapi
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://yum.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
EOF

sudo mv /tmp/oneAPI.repo /etc/yum.repos.d
sudo dnf install intel-oneapi-toolkit

dnf install intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic-2023.2.1.x86_64 intel-oneapi-compiler-fortran-2023.2.1.x86_64

dnf install openmpi openmpi-devel

dnf install slurm-devel slurm-slurmd
