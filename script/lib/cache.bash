fetch-tarball() {
  local url=$1
  local name=$2
  local cache="${CACHE_PATH}/$(basename ${url})"

  if [ ! -f ${cache} ]; then
    wget ${url} --no-verbose -O ${cache}
  fi

  tar xf ${cache}
  mv ${name}-* ${name}
}

fetch-git-repository() {
  local url=$1
  local name=$2
  local version=$3
  local cache="${CACHE_PATH}/${name}"

  if [ -d ${cache} ]; then
    pushd ${cache}
    git fetch origin
    git reset --hard origin/master
    git clean -x -f -f -d
    git submodule update --init
    popd
  else
    git clone --recursive ${url} ${cache}
  fi

  cp -r ${cache} ${name}
  pushd ${name}
  git checkout ${version} -b build
  git clean -x -f -f -d
  git submodule update --init
  git log --oneline | head -1
  popd
}
