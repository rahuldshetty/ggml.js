#!/bin/bash
set -e

BUILD_DIR=build

LLAMA_HASH="fbb7fcf"
LLAMA_DIR=$BUILD_DIR/llama-cpp

TARGET_DIR=$BUILD_DIR/llama-bin

mkdir -p $BUILD_DIR

# Clear build directory
if [ -d $BUILD_DIR ]; then
    rm -r $BUILD_DIR
fi

# Clone llama.cpp library
if [ ! -d $LLAMA_DIR ]; then
    echo "Downloading llama.cpp repository..."
    git clone https://github.com/ggerganov/llama.cpp.git $LLAMA_DIR
    cd $LLAMA_DIR
    git reset --hard $LLAMA_HASH

    # Apply patch
    echo "Applying patch..."
    git apply ../../patches/00-llama-cpp-enable-main.patch

    cd ../../ # move to root directory
fi

if [ -d $TARGET_DIR ]; then
    rm -r $TARGET_DIR
fi

mkdir -p $TARGET_DIR

cd $TARGET_DIR

emcmake cmake ../../$LLAMA_DIR

export EMCC_CFLAGS="-O3 -DNDEBUG -s FORCE_FILESYSTEM=1 -s EXPORT_ES6=1 -s MODULARIZE=1 -s INITIAL_MEMORY=100MB -s MAXIMUM_MEMORY=4GB -s ALLOW_MEMORY_GROWTH -s EXPORTED_FUNCTIONS=_main -s EXPORTED_RUNTIME_METHODS=callMain -s BUILD_AS_WORKER=1 -s SINGLE_FILE=1 -s NO_EXIT_RUNTIME=1 -msimd128 -fno-rtti -flto=full"

cd examples/main

emmake make

