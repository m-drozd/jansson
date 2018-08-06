#!/bin/bash
cd src
for i in *.c; do
	[ -f "$i" ] || break
	arm-none-eabi-gcc $i -c -Wall -pedantic -mcpu=cortex-m3 -mthumb
done

for i in *.o; do
	[ -f "$i" ] || break
	o=${i%?}a
	arm-none-eabi-ar -r $o $i
done
rm *.o
cd ..
rm -r  build
mkdir build
mkdir build/jansson
mkdir build/jansson/source
mkdir build/jansson/include
mv src/*.a build/jansson/source/
cp src/jansson.h build/jansson/include/
cp src/jansson_config.h build/jansson/include/


