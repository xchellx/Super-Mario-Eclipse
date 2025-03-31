#!/usr/bin/env bash
[[ -f $DEVKITPPC/bin/powerpc-eabi-clang ]] || ln -s /usr/sbin/clang $DEVKITPPC/bin/powerpc-eabi-clang
[[ -v DEVKITPRO ]] || export DEVKITPRO=/opt/devkitpro
[[ -v DEVKITARM ]] || export DEVKITARM=${DEVKITPRO}/devkitARM
[[ -v DEVKITPPC ]] || export DEVKITPPC=${DEVKITPRO}/devkitPPC
[[ $PATH == *"${DEVKITPRO}/tools/bin:${DEVKITPPC}/bin"* ]] || export PATH=${DEVKITPRO}/tools/bin:${DEVKITPPC}/bin:$PATH
cmake --fresh -S $PWD -B $PWD/out/build/GCNKuriboClangRelease -DCMAKE_BUILD_TYPE=Release -G Ninja --install-prefix $PWD/out/install/GCNKuriboClangRelease --toolchain $PWD/targets/GCNKuriboClangRelease.cmake -DCMAKE_CXX_IMPLICIT_LINK_LIBRARIES="" -DCMAKE_CXX_IMPLICIT_LINK_DIRECTORIES="" -DCMAKE_CXX_STANDARD=17 -DCMAKE_CXX_STANDARD_REQUIRED=ON && cmake --build $PWD/out/build/GCNKuriboClangRelease
