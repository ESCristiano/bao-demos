{ stdenv
, fetchFromGitHub
, toolchain
, u-boot
, openssl
}:

stdenv.mkDerivation rec {
    pname = "atf";
    version = "bao/demo";
    platform = "qemu-aarch64-virt";

    src = fetchFromGitHub {
        owner = "bao-project";
        repo = "arm-trusted-firmware";
        rev = "bao/demo"; 
        sha256 = "sha256-KQdsoBlqhYQWmsPRBXHxV8s+g6hn0gniOcs/qN8xwEY=";
    };

    nativeBuildInputs = [ toolchain u-boot openssl]; #build time dependencies

    buildPhase = ''
        export CROSS_COMPILE=aarch64-none-elf-
        make PLAT=qemu bl1 fip BL33=${u-boot}/bin/u-boot.bin\
             QEMU_USE_GIC_DRIVER=QEMU_GICV3
    '';
    
    installPhase = ''
        mkdir -p $out/bin/$platform
        dd if=./build/qemu/release/bl1.bin\
           of=$out/bin/$platform/flash.bin
        dd if=./build/qemu/release/fip.bin\
           of=$out/bin/$platform/flash.bin seek=64 bs=4096 conv=notrunc
        # mkdir -p $out/bin
        # cp -r * $out
        # cp ./build/zynqmp/release/bl31/bl31.elf $out/bin/
    '';

}


