# turf-tank

## TPM device tree

Its necessary to add the TPM4670
Use this command:

`dtc -O dtb -b 0 -@ tpm-soft-spi.dts -o tpm-soft-spi.dtbo
`
and copy the output (tp-soft-spi.dtbo) into **<ubuntu-seed>/overlays**