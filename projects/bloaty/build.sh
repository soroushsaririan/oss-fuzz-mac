#!/bin/bash -eu
# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

cd $WORK
export LIB_FUZZING_ENGINE="-fsanitize=fuzzer"
cmake -G Ninja \
  -DBUILD_TESTING=false \
  -DCMAKE_CXX_COMPILER=clang++ \
  -DCMAKE_CXX_FLAGS="-fsanitize=address,undefined -fno-sanitize-recover=all" \
  $SRC/bloaty
ninja -j$(nproc)

for harness in dwarf_leb128_fuzzer elf_symtab_fuzzer dwarf_strtab_fuzzer readfixed_fuzzer elf_section_fuzzer; do
  cp $WORK/$harness $OUT/
  zip -j $OUT/${harness}_seed_corpus.zip $SRC/bloaty/extras/fuzzing/${harness%_fuzzer}_corpus/*
done


