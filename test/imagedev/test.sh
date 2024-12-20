#!/bin/bash

set -e

# OImport test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "check python3" bash -c "python3 --version"
check "check git" bash -c "git --version"
check "check sudo" bash -c "sudo echo 'Hello from root'"

check "check build" bash -c "ls -lah /build"
check "check venv" bash -c "ls -lah /build/venv"
check "check build tools" bash -c "test -d /build/build_tools"
check "check root_generator command" bash -c "source /build/venv/bin/activate; root_generator -h"
check "check embdgen" bash -c "test -d /build/embdgen"
check "check embdgen command" bash -c "source /build/venv/bin/activate; embdgen -h"

# Report results
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
