# Bao Hypervisor Demo Guide (Nix)

This tutorial provides a step-by-step guide on how to run different demo 
configurations of the Bao hypervisor featuring multiple guest operating 
systems and targeting several supported platforms. The available demos are:

* [Single-guest Baremetal](demos/baremetal/README.md)
* [Dual-guest Linux+FreeRTOS](demos/linux+freertos/README.md)

---

**NOTE**

If you have any doubts, questions, feedback, or suggestions regarding 
this guide, please raise an issue in GitHub or contact us via 
info@bao-project.org.

If you run into any problem while following this guide, we ask you to raise 
an issue on Github, but first please make sure you are using the same or
newer/compatible versions of the tools and software listed in 
[Appendix II](#Appendix-II) (not all are needed for all target platforms). 

---

## -1. Install dependencies

Install Nix

```
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

## 1. Setup base environment

Clone this repo and cd to it:

```
git clone https://github.com/ESCristiano/bao-demos.git
cd bao-demos
```
---
Just execute:

**Note:** For now, only qemu-aarch64-virt is supported.
```
nix-build
```

And all the needed source and images will be automatically downloaded and built. 

---

If you are targetting an emulator platform like QEMU, after building 
you can start it with:

```
./run_qemu.sh
```

In this case, if you don't have qemu for the target architecture installed, 
it will build it for you.

---

## Appendix I

| | PLATFORM | ARCH
|--|--|--|
| Xilinx ZCU102 | zcu102 | aarch64
| Xilinx ZCU104 | zcu104 | aarch64
| NXP i.MX8QM | imx8qm | aarch64
| Nvidia TX2 | tx2 | aarch64
| Raspberry 4 Model B | rpi4 | aarch64
| QEMU Aarch64 virt | qemu-aarch64-virt | aarch64
| QEMU RV64 virt | qemu-riscv64-virt | riscv64
<!-- TODO -->
<!-- | NXP i.MX8MQ | imx8mq | -->
<!-- | Avnet Ultra96 | ultra96 | -->
<!-- | Rocket on ZynqMP | rocket-fpga | -->
<!-- | Rocket on Firesim | rocket-firesim | -->
<!-- | Hikey 960 | hikey960 | -->
<!-- | Rock 960 | rock960 | -->

| | DEMO |
|--|--|
| Baremetal guest | baremetal |
| Linux+FreeRTOS | linux+freertos |

<!-- TODO: Add Accepted Platform/Demos table -->

---

## Appendix II

| Tool                    | Version |
| ----------------------- | ------- |
| aarch64-none-elf-gcc    | 11.3.1  |
| riscv64-unknown-elf-gcc | 10.2.0  |
| make                    | 4.2.1   |
| dtc                     | 1.5.0   |
| gcc                     | 9.3.0   |
| mkimage                 | 20.10   |
| cmake                   | 3.16.3  |
| ninja                   | 1.10.1  |


<!-- Links -->

[arm-toolchains]: https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads
[riscv-toolchains]: https://github.com/sifive/freedom-tools/releases
