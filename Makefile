# menu
MENU=./lib/dialog/menu
CONF=./lib/dialog/config
DIALOGRC=$(shell cp -f lib/dialogrc ~/.dialogrc)

# functions
RFS=./scripts/rootfs
ROOTFS=sudo ./scripts/rootfs
CLN=./scripts/clean
CLEAN=sudo ./scripts/clean

PURGE=$(shell sudo rm -fdr sources)
PURGEALL=$(shell sudo rm -fdr sources output)

# uboot and linux
XUBOOT=./scripts/uboot
UBOOT=sudo ./scripts/uboot
XKERNEL=./scripts/linux
KERNEL=sudo ./scripts/linux

# image
IMG=./scripts/stage1
IMAGE=sudo ./scripts/stage1
STG2=./scripts/stage2

# dependencies
CCOMPILE=./scripts/.ccompile
NCOMPILE=./scripts/.ncompile

# do not edit above this line

help:
	@echo ""
	@echo "\e[1;31m                  Debian Image Builder\e[0m"
	@echo "\e[1;37m                  ********************"
	@echo "Boards:\e[0m"
	@echo "  Allwinner:  nanopi tritium"
	@echo "  Amlogic:    lepotato odroidc4 odroidn2 odroidn2+ rzero"
	@echo "  Broadcom:   raspi4"
	@echo "  Rockchip:   nanopc renegade rockpro64"
	@echo ""
	@echo "\e[1;37mCommand List:\e[0m"
	@echo "  make ccompile                Install all dependencies"
	@echo "  make ncompile                Install all native dependencies"
	@echo "  make config                  Create user data file"
	@echo "  make menu                    Menu interface"
	@echo "  make cleanup                 Clean up image errors"
	@echo "  make purge                   Remove sources directory"
	@echo "  make purge-all               Remove sources and output directory"
	@echo ""
	@echo "  make board-uboot             Make u-boot"
	@echo "  make board-kernel            Make linux kernel"
	@echo "  make rootfs                  Make rootfs tarball"
	@echo "  make board-image             Make bootable Debian image"
	@echo "  make board-all               Feeling lucky?"
	@echo ""
	@echo "For details consult the \e[1;37mREADME.md\e[0m file"
	@echo


ccompile:
	# Installing cross dependencies:
	@chmod +x ${CCOMPILE}
	@${CCOMPILE}

ncompile:
	# Installing native dependencies:
	@chmod +x ${NCOMPILE}
	@${NCOMPILE}

### TRITIUM
tritium-uboot:
	# Compiling u-boot
	@ echo tritium > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

tritium-kernel:
	# Compiling kernel
	@ echo tritium > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'allwinner_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

tritium-image:
	# Creating image
	@ echo tritium > board.txt
	@ echo allwinner >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

tritium-all:
	# T R I T I U M
	# - - - - - - - -
	# Compiling u-boot
	@ echo tritium > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo tritium > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'allwinner_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo tritium > board.txt
	@ echo allwinner >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### PINEA64
pine64-uboot:
	# Compiling u-boot
	@ echo pine64 > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

pine64-kernel:
	# Compiling kernel
	@ echo pine64 > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'allwinner_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

pine64-image:
	# Creating image
	@ echo pine64 > board.txt
	@ echo allwinner >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

pine64-all:
	# P I N E 6 4
	# - - - - - - - -
	# Compiling u-boot
	@ echo pine64 > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo pine64 > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'allwinner_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo pine64 > board.txt
	@ echo allwinner >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### NANOPI NEO PLUS2
nanopi-uboot:
	# Compiling u-boot
	@ echo nanopi > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

nanopi-kernel:
	# Compiling kernel
	@ echo nanopi > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'allwinner_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

nanopi-image:
	# Creating image
	@ echo nanopi > board.txt
	@ echo allwinner >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

nanopi-all:
	# N A N O  P I  N E O + 2
	# - - - - - - - -
	# Compiling u-boot
	@ echo nanopi > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo nanopi > board.txt
	@ echo allwinner >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'allwinner_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo nanopi > board.txt
	@ echo allwinner >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### ODROID C4
odroidc4-uboot:
	# Compiling u-boot
	@ echo odroidc4 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

odroidc4-kernel:
	# Compiling kernel
	@ echo odroidc4 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'odroid_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

odroidc4-image:
	# Creating image
	@ echo odroidc4 > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

odroidc4-all:
	# O D R O I D  C 4
	# - - - - - - - -
	# Compiling u-boot
	@ echo odroidc4 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo odroidc4 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'odroid_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo odroidc4 > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### ODROID N2
odroidn2-uboot:
	# Compiling u-boot
	@ echo odroidn2 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

odroidn2-kernel:
	# Compiling kernel
	@ echo odroidn2 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'odroid_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	
odroidn2-image:
	# Creating image
	@ echo odroidn2 > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

odroidn2-all:
	# O D R O I D  N 2
	# - - - - - - - -
	# Compiling u-boot
	@ echo odroidn2 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo odroidn2 > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'odroid_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo odroidn2 > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### ODROID N2 Plus
odroidn2+-uboot:
	# Compiling u-boot
	@ echo odroidn2plus > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

odroidn2+-kernel:
	# Compiling kernel
	@ echo odroidn2plus > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'odroid_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	
odroidn2+-image:
	# Creating image
	@ echo odroidn2plus > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

odroidn2+-all:
	# O D R O I D  N 2  P L U S
	# - - - - - - - -
	# Compiling u-boot
	@ echo odroidn2plus > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo odroidn2plus > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'odroid_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo odroidn2plus > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### LE POTATO
lepotato-uboot:
	# Compiling u-boot
	@ echo lepotato > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

lepotato-kernel:
	# Compiling kernel
	@ echo lepotato > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'amlogic_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

lepotato-image:
	# Creating image
	@ echo lepotato > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

lepotato-all:
	# L E P O T A T O
	# - - - - - - - -
	# Compiling u-boot
	@ echo lepotato > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo lepotato > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'amlogic_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo lepotato > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}
	
### Radxa Zero
rzero-uboot:
	# Compiling u-boot
	@ echo radxazero > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

rzero-kernel:
	# Compiling kernel
	@ echo radxazero > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'amlogic_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

rzero-image:
	# Creating image
	@ echo radxazero > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

rzero-all:
	# R A D X A  Z E R O
	# - - - - - - - -
	# Compiling u-boot
	@ echo radxazero > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo radxazero > board.txt
	@ echo amlogic >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'amlogic_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo radxazero > board.txt
	@ echo amlogic >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

# RENEGADE
renegade-uboot:
	# Compiling u-boot
	@ echo renegade > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3328 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

renegade-kernel:
	# Compiling kernel
	@ echo renegade > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

renegade-image:
	# Creating image
	@ echo renegade > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

renegade-all:
	# R E N E G A D E
	# - - - - - - - -
	# Compiling u-boot
	@ echo renegade > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3328 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo renegade > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo renegade > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

# ROCK64
rock64-uboot:
	# Compiling u-boot
	@ echo rock64 > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3328 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

rock64-kernel:
	# Compiling kernel
	@ echo rock64 > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

rock64-image:
	# Creating image
	@ echo rock64 > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

rock64-all:
	# R O C K 6 4
	# - - - - - - - -
	# Compiling u-boot
	@ echo rock64 > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3328 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo rock64 > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo rock64 > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

# ROCK64PRO
rockpro64-uboot:
	# Compiling u-boot
	@ echo rockpro64 > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3399 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

rockpro64-kernel:
	# Compiling kernel
	@ echo rockpro64 > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

rockpro64-image:
	# Creating image
	@ echo rockpro64 > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

rockpro64-all:
	# R O C K 6 4 P R O
	# - - - - - - - -
	# Compiling u-boot
	@ echo rockpro64 > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3399 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo rockpro64 > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo rockpro64 > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

# NANOPC-T4
nanopc-uboot:
	# Compiling u-boot
	@ echo nanopc > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3399 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

nanopc-kernel:
	# Compiling kernel
	@ echo nanopc > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

nanopc-image:
	# Creating image
	@ echo nanopc > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

nanopc-all:
	# N A N O P C - T 4
	# - - - - - - - -
	# Compiling u-boot
	@ echo nanopc > board.txt
	@ echo rockchip >> board.txt
	@ echo rk3399 >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo nanopc > board.txt
	@ echo rockchip >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'rockchip64_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo nanopc > board.txt
	@ echo rockchip >> board.txt
	@ echo p1 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

# RASPBERRY PI 4B
raspi4-uboot:
	# Compiling u-boot
	@ echo bcm2711 > board.txt
	@ echo broadcom >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}

raspi4-kernel:
	# Compiling kernel
	@ echo bcm2711 > board.txt
	@ echo broadcom >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'bcm2711_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}

raspi4-image:
	# Creating image
	@ echo bcm2711 > board.txt
	@ echo broadcom >> board.txt
	@ echo p2 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

raspi4-all:
	# R A S P B E R R Y  P I  4 B
	# - - - - - - - -
	# Compiling u-boot
	@ echo bcm2711 > board.txt
	@ echo broadcom >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@chmod +x ${XUBOOT}
	@${UBOOT}
	# Building linux package
	@ echo bcm2711 > board.txt
	@ echo broadcom >> board.txt
	@ echo ARCH='"'arm64'"' >> board.txt
	@ echo CROSS_COMPILE='"'aarch64-linux-gnu-'"' >> board.txt
	@ echo DEFCONFIG='"'bcm2711_defconfig'"' >> board.txt
	@chmod +x ${XKERNEL}
	@${KERNEL}
	# Creating ROOTFS tarball
	@chmod +x ${RFS}
	@${ROOTFS}
	# Creating image
	@ echo bcm2711 > board.txt
	@ echo broadcom >> board.txt
	@ echo p2 >> board.txt
	@chmod +x ${IMG}
	@chmod +x ${STG2}
	@${IMAGE}

### MISCELLANEOUS
menu:
	# Menu
	@chmod +x ${MENU}
	@${MENU}
config:
	# Config Menu
	@chmod +x ${CONF}
	@${CONF}

dialogrc:
	# Builder theme set
	@${DIALOGRC}

rootfs:
	# Rootfs: arm64
	@chmod +x ${RFS}
	@${ROOTFS}

cleanup:
	# Cleaning up
	@chmod +x ${CLN}
	@${CLEAN}

purge:
	# Removing sources directory
	@${PURGE}

purge-all:
	# Removing sources and output directory
	@${PURGEALL}
