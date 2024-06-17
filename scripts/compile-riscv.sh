#!/usr/bin/env bash

cargo r --profile optimized-dev --all-features --bin cairo-native-dump $1 --target-triple $2 -o $3.mlir

# Convert MLIR to LLVM IR
"$MLIR_SYS_180_PREFIX"/bin/mlir-translate --mlir-to-llvmir $3.mlir -o ./tmp/output.ll

# Generate RISC-V assembly
"$MLIR_SYS_180_PREFIX"/bin/llc -march=riscv64 -mattr=+m,+a,+c -filetype=asm ./tmp/output.ll -o ./tmp/output.s

# Assemble the RISC-V assembly code
riscv64-unknown-elf-as ./tmp/output.s -o ./tmp/output.o

# Link the object file to create an executable, specifying the sysroot and library paths
"$MLIR_SYS_180_PREFIX"/bin/clang --target=riscv64 -mabi=lp64d ./tmp/output.o -o output -v

# alternative to above?
# riscv64-unknown-elf-gcc -mabi=lp64d ./tmp/output.o -o output

# Check if linking failed
if [ $? -ne 0 ]; then
    echo "Linking failed. See linker_error.log for details."
    exit 1
fi

echo "Compilation and linking succeeded. Executable created: output"

