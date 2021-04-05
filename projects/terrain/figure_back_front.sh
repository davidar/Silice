#!/bin/bash
for i in {4..256}
do
  echo "\$\$z_num_step = $i" > param.ice
  ./simul.sh
  n=$(printf "%03d" $i)
  cp BUILD_verilator/vgaout_0006.tga SCRATCH/$n.tga
done
