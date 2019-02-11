#!/bin/bash

set -euo pipefail

thisdir=$(dirname "$0")

# pre-requisites for dotnet core
brew update
brew install openssl
mkdir -p /usr/local/lib
ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/
ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/

# download dotnet core
curl https://download.microsoft.com/download/B/9/F/B9F1AF57-C14A-4670-9973-CDF47209B5BF/dotnet-dev-osx-x64.1.0.4.pkg -o /tmp/dotnet-dev-osx-x64.1.0.4.pkg

# install dotnet core
sudo installer -pkg /tmp/dotnet-dev-osx-x64.1.0.4.pkg -target /

# make the link
ln -s /usr/local/share/dotnet/dotnet /usr/local/bin/

# Work around apparent rvm bug that is in Travis's Xcode image.
# https://github.com/direnv/direnv/issues/210
# https://github.com/travis-ci/travis-ci/issues/6307
shell_session_update() { :; }

