SERIAL="0"

JOBS="$(grep processor /proc/cpuinfo | wc -l)"
BUILD_ID="$(cat /dev/urandom | tr -dc '[:alnum:]' | head -c 10)"

CACHE_PATH="/tmp/cyanurus-cache"
BUILD_PATH="/tmp/cyanurus-$$-${BUILD_ID}"
