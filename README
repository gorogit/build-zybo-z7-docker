
U-Boot Build
	make zynq_zybo_z7_defconfig
	make
	
Artifacts:
	spl/boot.bin  -> boot.bin
	u-boot.img    -> u-boot.img
	u-boot           -> u-boot.elf
	
Kernetl Build
	make ARCH=arm xilinx_zynq_defconfig
	make ARCH=arm menuconfig
	make ARCH=arm UIMAGE_LOADADDR=0x8000 uImage

Artifacts:
	arch/arm/boot/uImage
	arch/arm/boot/dts/zynq-zybo-z7.dtb


u-boot設定
	setenv bootargs root=/dev/mmcblk0p2
	saveenv
	

u-boot より LinuxカーネルをBoot　
	Zynq> fatload mmc 0 0x03000000 uImage && fatload mmc 0 0x02A00000 zynq-zybo-z7.dtb && bootm 0x03000000 - 0x02A00000
	
	Zynq> fatload mmc 0 0x02080000 uImage && fatload mmc 0 0x02000000 zynq-zybo-z7.dtb && bootm 0x02080000 - 0x02000000


Setup Ubuntu Image
debootstrup xenial

fstab /
proc /proc proc defaults 0 0
/dev/mmcblk0p1 /boot vfat defaults 0 2
/dev/mmcblk0p2 / ext4 defaults,noatime 0 1

getty ttyPS0
	/etc/init/tty0.conf
	modify from " exec /sbin/getty -8 38400 tty0" to "exec /sbin/getty -8 115200 ttyPS0"

/tmp permission check
	chmod 1777 /tmp