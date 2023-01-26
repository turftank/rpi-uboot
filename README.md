# turf-tank

## TPM device tree

Its necessary to add the Infineon SLB9670 device tree overlay
Use this command:

`dtc -O dtb -b 0 -@ tpm-soft-spi.dts -o tpm-soft-spi.dtbo
`

and copy the output (tp-soft-spi.dtbo) into **<ubuntu-seed\>/overlays**

Add to** <ubuntu-seed\>/config.txt**:

	dtparam=spi=on
	dtoverlay=tpm-soft-spi
	
	
## TPM aware RPI u-boot

I integrated the changes from the UC 20 u-boot with the u-boot tree.
Current u-boots don't seem to work on a RPI, u-boots from over the summer was no problem.

The version from UC 20 and the u-boot tree is based on v2021.1.

I made a branch of the u-boot tree called turf-tank.

I used a rpi4 for compiling (not a cross compiler).   Builds over NFS on the RPI4 for u-boot took less than a minute.

## Modifications to  boot scripts for debugging

In order to understand and easily inject options into the boot process, I modified the generic ubuntu-core boot loader and wrote a special boot loader (turf-tank.scr).

If $extraargs is set, it appends it to $bootargs.  Otherwise, it appens "quiet splash" to bootargs (the default)

If initramfs_name is in the environment, it uses that to boot.   Otherwise it uses the defaut initrd.img.

Bootargs can be totally overwritten iwth $new_bootargs.

Before booting, a printenv is issued (so the boot can be seen)



## FDE on ubuntu core

ubuntu core 18 has no  special instructions for FDE.
ubuntu core 20  uses "hooks".

## Ubuntu server

The ubuntu server has a conventional sysV init initramfs.    The ubuntu core has a kernel snap and a systemd  derived initramfs, which was foreign to me.
