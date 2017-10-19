
CC=riscv64-unknown-linux-gnu-g++
CFLAGS=-O2 -static
LDFLAGS=

hpm_counters: hpm_counters.cxx Makefile
	$(CC) $(CFLAGS) -o $@ $@.cxx
	riscv-objdump --disassemble-all $@ > $@.dump

# likely won't work, as we're compiled using glibc
run: hpm_counters
	spike pk ./hpm_counters

clean:
	rm -f hpm_counters *.o *.dump

.PHONY: run clean
