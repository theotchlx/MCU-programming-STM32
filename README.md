# MCU Programming

## Guide to MCU programming without CubeIDE

https://kleinembedded.com/stm32-without-cubeide-part-1-the-bare-necessities/

## Pre-requisites

```bash
$ pacman -S arm-none-eabi-gcc
$ pacman -S arm-none-eabi-newlib
```

## Building the executable

```bash
$ arm-none-eabi-gcc main.c startup.c -T linker_script.ld -o blink.elf -mcpu=cortex-m4 -mthumb -nostdlib
```

