
all:  tpm-soft-spi.dtbo submodules boot

tpm-soft-spi.dtbo:	tpm-soft-spi.dts
	dtc -O dtb -b 0 -@ $^ -o $@

submodules:	u-boot
	git submodule update --init --recursive -j 4

boot: FORCE
	make -C boot 

FORCE:	;
