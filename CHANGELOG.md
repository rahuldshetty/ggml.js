# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.2]

### Changes

- Updated llama.cpp engine to build commit: [fbb7fcf](https://github.com/ggerganov/llama.cpp/commit/fbb7fcffbcfc50009c275e75982b1603a6cb6b80).


## [2.0.1]

### Changes

- Structured LLM output with [JSON Schema](https://json-schema.org/) and [GBNF](https://github.com/ggerganov/llama.cpp/blob/master/grammars/README.md) Grammar Support for model type 'GGUF_CPU'

## [2.0.0]

### Changes

- Introducing new model type: GGUF_CPU to support running gguf compiled models on CPU with LLM.js
- Bumped up Llama.cpp worker to build commit [dd047b4](https://github.com/ggerganov/llama.cpp/tree/dd047b476c8b904e0c25e5dbc5bee6ffde2f6e17)
- Model Caching: Persisting model files in WebWorker's cache to avoid re-downloading model on every load. Thanks to [PR](https://github.com/rahuldshetty/llm.js/pull/3) from [@felladrin](https://github.com/felladrin).

### Removes

- Deprecating model types: LLAMA2, DOLLY_V2, GPT_2, GPT_J, GPT_NEO_X, MPT, REPLIT, STARCODER

## [1.0.2]

### Added

- Latest GGUF format supported with latest updated llama2-cpp module.
- Added *context_size* parameter for llama models.

### Changed

- Rebranded project to "LLM.JS".
- Removed *STACK_SIZE* flag from build scripts.

## [1.0.1]

### Added

- Added support for [llama2.c](https://github.com/karpathy/llama2.c) models

### Changed

- Added *tokenizer_url* parameter in GGML Wrapper for supporting LLaMa2.  
- Upgraded ggml version to [244776a](https://github.com/ggerganov/ggml/commit/244776a089ebed7f0332f9c8bdc38d2d40464493)

## [1.0.0]

### Added

- ggml.js package
- Added Model Support for Dollyv2, GPT2, GPT J, GPT Neo X, MPT, Replit, StarCoder
- docsify documentation