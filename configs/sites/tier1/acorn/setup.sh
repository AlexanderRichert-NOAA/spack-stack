#module load cray-python/3.11.7
module load gcc/12.1.0
module load python/3.8.6

## Go, Rust repo setup for fetcher scripts
export GOMODCACHE=${SPACK_STACK_DIR}/cache/go
export CARGO_HOME=${SPACK_STACK_DIR}/cache/cargo
