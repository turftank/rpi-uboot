
all:  tpm-soft-spi.dtbo submodules 

tpm-soft-spi.dtbo:	tpm-soft-spi.dtc

submodules:	u-boot
	git submodule update --init --recursive -j 4

