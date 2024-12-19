#!/bin/sh
set -e

# Pacakges required by this script
packages="sudo git python3 python3-pip python3-venv gnupg"

echo "Installing required packages"

apt update

echo "Installing required packages"

DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y $packages $build_tools_dependencies

echo "Setting up build tools in folder /build"

mkdir -p /build

python3 -m venv /build/venv

# Install build tools

echo "Using build tools from repo: $BUILD_TOOLS_REPO"
echo "Using build tools version: $BUILD_TOOLS_VERSION"

git clone --branch $BUILD_TOOLS_VERSION $BUILD_TOOLS_REPO /build/build_tools

bash -c "source /build/venv/bin/activate && cd /build && pip install -e build_tools"

# Install build tools system dependencies
bash -c "source /build/venv/bin/activate && build_tools_core -d"
# Apply required host configuration
bash -c "source /build/venv/bin/activate && build_tools_core -c"

# Install embdgen

echo "Using build tools from repo: $EMBDGEN_REPO"
echo "Using build tools version: $EMBDGEN_VERSION"

git clone --branch $EMBDGEN_VERSION $EMBDGEN_REPO /build/embdgen

DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt install -y \
    pkg-config python3 python3-pip python3-venv libparted-dev \
    mtools e2fsprogs cryptsetup-bin fakeroot

bash -c "source /build/venv/bin/activate && cd /build/embdgen && pip install -e embdgen-core && pip install -e embdgen-cominit && pip install -e embdgen-config-yaml"

echo "Enabling venv as default."

echo "source /build/venv/bin/activate" >> $_REMOTE_USER_HOME/.bashrc

