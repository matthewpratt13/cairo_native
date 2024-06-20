	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_f2p2_d2p2_zicsr2p0"
	.file	"LLVMDialectModule"
	.globl	"hello::hello::main(f0)"        # -- Begin function hello::hello::main(f0)
	.p2align	2
	.type	"hello::hello::main(f0)",@function
"hello::hello::main(f0)":               # @"hello::hello::main(f0)"
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -48
	.cfi_def_cfa_offset 48
	li	a1, 1
	sb	a1, 0(sp)
	sd	zero, 32(sp)
	sd	zero, 24(sp)
	li	a1, 1234
	ld	a2, 8(sp)
	sd	a1, 16(sp)
	sd	zero, 40(sp)
	ld	a3, 0(sp)
	sd	a2, 8(a0)
	sd	a1, 16(a0)
	sd	zero, 24(a0)
	sd	zero, 32(a0)
	sd	zero, 40(a0)
	sd	a3, 0(a0)
	addi	sp, sp, 48
	ret
.Lfunc_end0:
	.size	"hello::hello::main(f0)", .Lfunc_end0-"hello::hello::main(f0)"
	.cfi_endproc
                                        # -- End function
	.globl	"_mlir_ciface_hello::hello::main(f0)" # -- Begin function _mlir_ciface_hello::hello::main(f0)
	.p2align	2
	.type	"_mlir_ciface_hello::hello::main(f0)",@function
"_mlir_ciface_hello::hello::main(f0)":  # @"_mlir_ciface_hello::hello::main(f0)"
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	call	"hello::hello::main(f0)"
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	"_mlir_ciface_hello::hello::main(f0)", .Lfunc_end1-"_mlir_ciface_hello::hello::main(f0)"
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
