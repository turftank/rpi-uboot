
all:  tpm-soft-spi.dtbo submodules 

tpm-soft-spi.dtbo:	tpm-soft-spi.dts
	dtc -O dtb -b 0 -@ $^ -o $@

submodules:	u-boot
	git submodule update --init --recursive -j 4

