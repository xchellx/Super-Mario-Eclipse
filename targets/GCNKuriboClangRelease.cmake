set(CMAKE_CROSSCOMPILING TRUE)
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR powerpc)

set(CMAKE_C_COMPILER "$ENV{DEVKITPPC}/bin/powerpc-eabi-clang")
set(CMAKE_CXX_COMPILER "$ENV{DEVKITPPC}/bin/powerpc-eabi-clang")
set(CMAKE_C_LINK_EXECUTABLE "$ENV{DEVKITPPC}/bin/powerpc-eabi-clang")

set(triple powerpc-unknown-linux-gnu) #set(triple powerpc-gecko-ibm-kuribo-eabi)
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_CXX_COMPILER_TARGET ${triple})

#if(WIN32)
#	set(CMAKE_LIBRARY_PATH "C:/Windows/System32")
#endif(WIN32)

#set(CMAKE_SYSROOT "C:/msys64/mingw64")

set(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=lld -T ${PROJECT_SOURCE_DIR}/lib/BetterSunshineEngine/linker.ld")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld -T ${PROJECT_SOURCE_DIR}/lib/BetterSunshineEngine/linker.ld")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld -T ${PROJECT_SOURCE_DIR}/lib/BetterSunshineEngine/linker.ld")

set(CMAKE_CXX_STANDARD_LIBRARIES "")

set(SMS_REGION us)

set(SMS_COMPILE_DEFINES
    -D__powerpc__ -DKURIBO_NO_TYPES
    -DGEKKO -DNTSCU -DNDEBUG
)

set(SMS_COMPILE_FLAGS
    $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++17>
    --target=${CMAKE_CXX_COMPILER_TARGET}

    ${SMS_COMPILE_DEFINES}

    #-fno-inline
	-Os -fno-exceptions 
    -fno-rtti -ffast-math -fpermissive
    -fdeclspec -fno-unwind-tables
    -nodefaultlibs -nobuiltininc -nostdinc++ -nostdlib
    -fno-use-init-array -fno-use-cxa-atexit
    -fno-c++-static-destructors -fno-function-sections
    -fno-data-sections -fpermissive

    -Werror -Wno-main 
    -Wno-incompatible-library-redeclaration
    -Wno-keyword-compat -Wno-deprecated-builtins
)

set(SMS_LINK_FLAGS
    $<$<COMPILE_LANGUAGE:CXX>:-std=gnu++17>
    --target=${CMAKE_CXX_COMPILER_TARGET}

    -r -v -fuse-ld=lld
    -fdeclspec -fno-exceptions -fno-rtti
    -fno-unwind-tables -ffast-math
    -nodefaultlibs -nostdlib -fno-use-init-array
    -fno-use-cxa-atexit -fno-c++-static-destructors
    -fno-function-sections -fno-data-sections
    -fpermissive -Werror
    -Wno-keyword-compat -Wno-deprecated-builtins
)

set(CMAKE_C_COMPILER_FORCED TRUE)
set(CMAKE_CXX_COMPILER_FORCED TRUE)

set(CMAKE_OBJCOPY "$ENV{DEVKITPPC}/bin/powerpc-eabi-objcopy" CACHE PATH "" FORCE)
