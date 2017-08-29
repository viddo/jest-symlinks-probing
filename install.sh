#!/bin/bash
# output what the script actually does when executing
set +x

NODE_MODULES=node_modules
JEST_SRC=$NODE_MODULES/jest-monorepo
JEST_NPM_PKG="$JEST_SRC/packages/jest"

# can't install jest using npm install since it's a private monorepo package, that has neither name or version there
# AFAIK there is no way to do this using native `npm install`, since the jest repo is a monorepo
# install it from the fork instead, to get the changed build, without having someone to do these steps manually
# related discussion: https://github.com/npm/npm/issues/2974 "Allow subdirectories within git repos in npm install "
mkdir -p $JEST_SRC
git clone https://github.com/viddo/jest.git $JEST_SRC
pushd $JEST_SRC
git co follow-linux-symlinks
popd

# install modified jest
pushd $JEST_SRC/packages/jest/
yarn install
popd

# this effectively does the same as a npm link, i.e. symlink the jest package to the node_modules path
ln -s $JEST_NPM_PKG $NODE_MODULES/jest
