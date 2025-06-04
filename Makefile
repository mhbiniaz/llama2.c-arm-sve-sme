# choose your compiler, e.g. gcc/clang
# example override to clang: make run CC=clang
CC = gcc

# the most basic way of building that is most likely to work on most systems
.PHONY: run
run: run.c
	$(CC) -O3 -o run run.c -lm
	$(CC) -O3 -o runq runq.c -lm

# useful for a debug build, can then e.g. analyze with valgrind, example:
# $ valgrind --leak-check=full ./run out/model.bin -n 3
rundebug: run.c
	$(CC) -g -o run run.c -lm
	$(CC) -g -o runq runq.c -lm

# https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
# https://simonbyrne.github.io/notes/fastmath/
# -Ofast enables all -O3 optimizations.
# Disregards strict standards compliance.
# It also enables optimizations that are not valid for all standard-compliant programs.
# It turns on -ffast-math, -fallow-store-data-races and the Fortran-specific
# -fstack-arrays, unless -fmax-stack-var-size is specified, and -fno-protect-parens.
# It turns off -fsemantic-interposition.
# In our specific application this is *probably* okay to use
.PHONY: runfast
runfast: run.c
	$(CC) -Ofast -o run run.c -lm
	$(CC) -Ofast -o runq runq.c -lm

# additionally compiles with OpenMP, allowing multithreaded runs
# make sure to also enable multiple threads when running, e.g.:
# OMP_NUM_THREADS=4 ./run out/model.bin
.PHONY: runomp
runomp: run.c
	$(CC) -Ofast -fopenmp -march=native run.c  -lm  -o run
	$(CC) -Ofast -fopenmp -march=native runq.c  -lm  -o runq

.PHONY: win64
win64:
	x86_64-w64-mingw32-gcc -Ofast -D_WIN32 -o run.exe -I. run.c win.c
	x86_64-w64-mingw32-gcc -Ofast -D_WIN32 -o runq.exe -I. runq.c win.c

# compiles with gnu99 standard flags for amazon linux, coreos, etc. compatibility
.PHONY: rungnu
rungnu:
	$(CC) -Ofast -std=gnu11 -o run run.c -lm
	$(CC) -Ofast -std=gnu11 -o runq runq.c -lm

.PHONY: runompgnu
runompgnu:
	$(CC) -Ofast -fopenmp -std=gnu11 run.c  -lm  -o run
	$(CC) -Ofast -fopenmp -std=gnu11 runq.c  -lm  -o runq


## ===================== Run ARM/X86 Cross compiled ===================================

.PHONY: runarm
runarm:
	aarch64-linux-gnu-gcc -g -O0 -static -o run.arm run.c -lm
	aarch64-linux-gnu-gcc -g -O0 -static -o runq.arm runq.c -lm


.PHONY: qemu-arm-count
qemu-arm-count: runarm
	qemu-aarch64 -d in_asm ./run.arm $(ARGS)


.PHONY: runarm-sve
runarm-sve:
	aarch64-linux-gnu-gcc -g -O3 -march=armv8-a+sve -msve-vector-bits=512 -static -o sve.run.arm run-sve.c -lm

.PHONY: sve-qemu-arm-count
sve-qemu-arm-count: runarm-sve
	qemu-aarch64 -cpu max,sve=on -d in_asm ./sve.run.arm $(ARGS)

## ===================== Native ARM build and run on Kunpeng 920 =======================
## -mcpu=generic

.PHONY: native-arm
native-arm:
	gcc-14 -O3 -march=armv8-a+sve -msve-vector-bits=512 -static -ftree-vectorize -o run.native run-sve.c -lm
	objdump -d run.native | grep "matmul"

.PHONY: run-native
run-native: native-arm
	./run.native $(ARGS)

.PHONY: native-arm-qemu
native-arm-qemu: native-arm
	qemu-aarch64 -cpu max,sve=on -d in_asm ./run.native $(ARGS)
# make qemu-1 ARGS="stories15M.bin -n 5"

.PHONY: qemu-1
qemu-1: native-arm
	qemu-aarch64 -cpu max,sve=on -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so ./run.native $(ARGS)

.PHONY: qemu-2
qemu-2: native-arm
	qemu-aarch64 -cpu max,sve512=on -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so -d plugin ./run.native $(ARGS) 
# 2>&1 | grep "total insns:"



# Apptainer> make qemu-2 ARGS="stories15M.bin -n 5"
# gcc-14 -O3 -march=armv8-a+sve -msve-vector-bits=512 -static -ftree-vectorize -o run.native run-sve.c -lm
# qemu-aarch64 -cpu max,sve512=on -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so -d plugin ./run.native stories15M.bin -n 5 
# Once upon a time,
# achieved tok/s: 0.287274
# cpu 0 insns: 120063299
# total insns: 120063299
# Apptainer> make qemu-2 ARGS="stories15M.bin -n 10"
# gcc-14 -O3 -march=armv8-a+sve -msve-vector-bits=512 -static -ftree-vectorize -o run.native run-sve.c -lm
# qemu-aarch64 -cpu max,sve512=on -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so -d plugin ./run.native stories15M.bin -n 10 
# Once upon a time, there was a little girl
# achieved tok/s: 0.286752
# cpu 0 insns: 189245822
# total insns: 189245822


## qemu-aarch64 -cpu max,sve512=on -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so,match=fmla\ d,match=fmla\ v,match=fmls\ z,match=fmls\ d,match=fmls\ v,match=fmul\ z,match=fmul\ d,match=fmul\ v,match=fneg,match=revd,match=mov\ z,match=mova\ z,match=ldr\ d,match=str\ d,match=ld1rd\ {z,match=ld1d\ {z,match=ld2d\ {z,match=st1d\ {z,match=st2d\ {z,match=fmopa\ z,match=fmadd,match=fmsub \-d plugin ./run.native $(ARGS)  2>&1 | grep  "Match:\|insns"

## make qemu-2 ARGS="stories15M.bin -n 5"
## qemu-aarch64 -cpu max,sve512=on -plugin /opt/qemu/build/tests/tcg/plugins/libinsn.so,match=fmla\ z,match=fmla\ d,match=fmla\ v,match=fmls\ z,match=fmls\ d,match=fmls\ v,match=fmul\ z,match=fmul\ d,match=fmul\ v,match=fneg,match=revd,match=mov\ z,match=mova\ z,match=ldr\ d,match=str\ d,match=ld1rd\ {z,match=ld1d\ {z,match=ld2d\ {z,match=st1d\ {z,match=st2d\ {z,match=fmopa\ z,match=fmadd,match=fmsub \-d plugin ./run.native $(ARGS)  2>&1 | grep  "Match:\|insns"

## ======================================================================================


# run all tests
.PHONY: test
test:
	pytest

# run only tests for run.c C implementation (is a bit faster if only C code changed)
.PHONY: testc
testc:
	pytest -k runc

# run the C tests, without touching pytest / python
# to increase verbosity level run e.g. as `make testcc VERBOSITY=1`
VERBOSITY ?= 0
.PHONY: testcc
testcc:
	$(CC) -DVERBOSITY=$(VERBOSITY) -O3 -o testc test.c -lm
	./testc

.PHONY: clean
clean:
	rm -f run runq run.arm runq.arm sve.run.arm sve.runq.arm run.native runq.native
	rm -f qemu.log
