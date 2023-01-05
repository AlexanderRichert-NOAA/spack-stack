# https://stackoverflow.com/questions/59895/how-can-i-get-the-source-directory-of-a-bash-script-from-within-the-script-itsel
# Portable way to get current directory
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export SPACK_STACK_DIR=${SCRIPT_DIR:?}
echo "Setting environment variable SPACK_STACK_DIR to ${SPACK_STACK_DIR}"

source ${SCRIPT_DIR}/spack/share/spack/setup-env.sh
echo "Sourcing spack environment ${SCRIPT_DIR}/spack/share/spack/setup-env.sh"

config=${SPACK_ROOT}/etc/spack/defaults/config.yaml
libpath=${SPACK_STACK_DIR}/lib/jcsda-emc/spack-stack
if [ $(grep -c " ${libpath}$" ${config}) -eq 0 ]; then
    echo -e "  extensions:\n  - ${libpath}" >> ${config}
fi

if [ "$1" != "-j" ]; then return; fi
repos=${SPACK_ROOT:?}/etc/spack/defaults/repos.yaml
main_repo=${SPACK_STACK_DIR}/repos/jcsda-emc
bundles_repo=${SPACK_STACK_DIR}/repos/jcsda-emc-bundles
for the_repo in $main_repo $bundles_repo; do
    if [ $(grep -c "^  - ${the_repo}$" ${repos}) -gt 0 ]; then continue; fi
    sed -i "s|^repos:|repos:\n  - ${the_repo}|" ${repos}
done
