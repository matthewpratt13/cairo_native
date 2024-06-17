	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_c2p0"
	.file	"LLVMDialectModule"
	.section	.sdata,"aw",@progbits
	.p2align	3, 0x0                          # -- Begin function print::print::main(f0)
.LCPI0_0:
	.quad	3179672657468351521             # 0x2c20776f726c6421
	.text
	.globl	"print::print::main(f0)"
	.p2align	1
	.type	"print::print::main(f0)",@function
"print::print::main(f0)":               # @"print::print::main(f0)"
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	li	a1, 256
	li	a0, 0
	call	realloc
	lui	a1, %hi(.LCPI0_0)
	ld	a2, %lo(.LCPI0_0)(a1)
	mv	a1, a0
	sd	zero, 24(a0)
	sd	zero, 16(a0)
	sd	a2, 0(a0)
	lui	a0, 18533
	addiw	a0, a0, 1735
	slli	a0, a0, 12
	addi	a0, a0, -913
	sd	a0, 8(a1)
	li	a0, 1
	li	a2, 1
	call	cairo_native__libfunc__debug__print
	li	a1, 256
	li	a0, 0
	call	realloc
	mv	a1, a0
	sd	zero, 24(a0)
	sd	zero, 16(a0)
	sd	zero, 8(a0)
	li	a0, 1234
	sd	a0, 0(a1)
	li	a0, 1
	li	a2, 1
	call	cairo_native__libfunc__debug__print
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	"print::print::main(f0)", .Lfunc_end0-"print::print::main(f0)"
	.cfi_endproc
                                        # -- End function
	.globl	"_mlir_ciface_print::print::main(f0)" # -- Begin function _mlir_ciface_print::print::main(f0)
	.p2align	1
	.type	"_mlir_ciface_print::print::main(f0)",@function
"_mlir_ciface_print::print::main(f0)":  # @"_mlir_ciface_print::print::main(f0)"
	.cfi_startproc
# %bb.0:
	addi	sp, sp, -16
	.cfi_def_cfa_offset 16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	.cfi_offset ra, -8
	call	"print::print::main(f0)"
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end1:
	.size	"_mlir_ciface_print::print::main(f0)", .Lfunc_end1-"_mlir_ciface_print::print::main(f0)"
	.cfi_endproc
                                        # -- End function
	.section	".note.GNU-stack","",@progbits
