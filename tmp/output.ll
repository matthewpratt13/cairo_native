; ModuleID = 'LLVMDialectModule'
source_filename = "LLVMDialectModule"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "riscv64-unknown-elf"

declare ptr @realloc(ptr, i64)

declare void @free(ptr)

declare i32 @cairo_native__libfunc__debug__print(i32, ptr, i32)

define void @"print::print::main(f0)"() {
  %1 = call ptr @realloc(ptr null, i64 256)
  store i252 5735816763073854953388147237921, ptr %1, align 16
  %2 = call i32 @cairo_native__libfunc__debug__print(i32 1, ptr %1, i32 1)
  %3 = call ptr @realloc(ptr null, i64 256)
  store i252 1234, ptr %3, align 16
  %4 = call i32 @cairo_native__libfunc__debug__print(i32 1, ptr %3, i32 1)
  ret void
}

define void @"_mlir_ciface_print::print::main(f0)"() {
  call void @"print::print::main(f0)"()
  ret void
}

!llvm.module.flags = !{!0}

!0 = !{i32 2, !"Debug Info Version", i32 3}
