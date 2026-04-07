SRC_C := $(wildcard src/*.c)
SRC_S := $(wildcard src/*.s)
OBJS := $(patsubst src/%.c,build/%.o,$(SRC_C)) $(patsubst src/%.s,build/%.o,$(SRC_S))

.PHONY: all alwaysrun

all: build/bootImage.elf

build:
	@echo "Making build directory"
	@mkdir -p build

build/%.o: src/%.c | build
	@echo "Compiling $<"
	@riscv64-unknown-elf-gcc -nostdlib -ffreestanding -c $< -o $@ -I include -mcmodel=medany

build/%.o: src/%.s | build
	@echo "Assembling $<"
	@riscv64-unknown-elf-gcc -nostdlib -ffreestanding -c $< -o $@ -mcmodel=medany

build/bootImage.elf: $(OBJS) | build
	@echo "Linking the kernel"
	@ld.lld -flavor gnu -m elf64lriscv $(OBJS) -o build/bootImage.elf -T kernel.ld

qemu:
	@qemu-system-riscv64 -machine virt -bios default -kernel build/bootImage.elf -serial stdio -smp 1 -m 16M -s

clean:
	@echo "Cleaning build/"
	@rm -rf build
	@echo "Cleaned"
