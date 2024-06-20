; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "riscv64-unknown-elf"

define void @"hello::hello::main(f0)"(ptr %0) {
  %2 = alloca { i128, [32 x i8] }, i64 1, align 16
  store { i1, i252 } { i1 true, i252 1234 }, ptr %2, align 16
  %3 = load { i128, [32 x i8] }, ptr %2, align 16
  store { i128, [32 x i8] } %3, ptr %0, align 16
  ret void
}

define void @"_mlir_ciface_hello::hello::main(f0)"(ptr %0) {
  call void @"hello::hello::main(f0)"(ptr %0)
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
