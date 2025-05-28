#aarch64-linux-gnu-gcc -O3 -march=armv8-a+sve -msve-vector-bits=512 -S run-sve.c -o run-sve.s

	.arch armv8-a+sve
	.file	"run-sve.c"
	.text
	.align	2
	.p2align 4,,11
	.global	compare
	.type	compare, %function
compare:
.LFB88:
	.cfi_startproc
	ldr	s1, [x0]
	ldr	s0, [x1]
	fcmpe	s1, s0
	cset	w0, mi
	csinv	w0, w0, wzr, le
	ret
	.cfi_endproc
.LFE88:
	.size	compare, .-compare
	.align	2
	.p2align 4,,11
	.global	compare_tokens
	.type	compare_tokens, %function
compare_tokens:
.LFB79:
	.cfi_startproc
	ldr	x0, [x0]
	ldr	x1, [x1]
	b	strcmp
	.cfi_endproc
.LFE79:
	.size	compare_tokens, .-compare_tokens
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"malloc failed!\n"
	.text
	.align	2
	.p2align 4,,11
	.global	malloc_run_state
	.type	malloc_run_state, %function
malloc_run_state:
.LFB69:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	mov	x20, x1
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	mov	x1, 4
	ldr	w2, [x20]
	ldp	w3, w4, [x20, 12]
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	.cfi_offset 23, -64
	.cfi_offset 24, -56
	sxtw	x21, w2
	mov	x0, x21
	stp	x25, x26, [sp, 64]
	mul	w2, w2, w4
	stp	x27, x28, [sp, 80]
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	.cfi_offset 27, -32
	.cfi_offset 28, -24
	str	w3, [sp, 108]
	sdiv	w22, w2, w3
	bl	calloc
	str	x0, [x19]
	mov	x28, x0
	mov	x1, 4
	mov	x0, x21
	bl	calloc
	str	x0, [x19, 8]
	mov	x27, x0
	mov	x1, 4
	mov	x0, x21
	bl	calloc
	ldrsw	x23, [x20, 4]
	mov	x26, x0
	str	x0, [x19, 16]
	mov	x1, 4
	mov	x0, x23
	bl	calloc
	str	x0, [x19, 24]
	mov	x25, x0
	mov	x1, 4
	mov	x0, x23
	bl	calloc
	str	x0, [x19, 32]
	mov	x24, x0
	mov	x1, 4
	mov	x0, x21
	bl	calloc
	ldr	w21, [x20, 8]
	ldr	w2, [x20, 24]
	mov	x23, x0
	str	x0, [x19, 40]
	mov	x1, 4
	str	w2, [sp, 104]
	mul	w21, w2, w21
	mul	w21, w21, w22
	sxtw	x21, w21
	mov	x0, x21
	bl	calloc
	str	x0, [x19, 80]
	mov	x22, x0
	mov	x1, 4
	mov	x0, x21
	bl	calloc
	mov	x21, x0
	ldp	w2, w3, [sp, 104]
	str	x21, [x19, 88]
	mov	x1, 4
	mul	w0, w3, w2
	sxtw	x0, w0
	bl	calloc
	mov	x1, x0
	ldrsw	x0, [x20, 20]
	str	x1, [x19, 64]
	mov	x20, x1
	mov	x1, 4
	bl	calloc
	mov	x1, x0
	cmp	x28, 0
	str	x0, [x19, 72]
	ccmp	x27, 0, 4, ne
	cset	w0, eq
	cmp	x26, 0
	ccmp	x25, 0, 4, ne
	cset	w2, eq
	cmp	x24, 0
	ccmp	x23, 0, 4, ne
	orr	w0, w0, w2
	cset	w2, eq
	cmp	x22, 0
	ccmp	x21, 0, 4, ne
	orr	w2, w2, w0
	cset	w0, eq
	cmp	x20, 0
	ccmp	x1, 0, 4, ne
	orr	w1, w0, w2
	cset	w0, eq
	orr	w0, w0, w1
	cbnz	w0, .L9
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 112
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L9:
	.cfi_restore_state
	adrp	x3, :got:stderr
	mov	x2, 15
	mov	x1, 1
	adrp	x0, .LC0
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC0
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE69:
	.size	malloc_run_state, .-malloc_run_state
	.align	2
	.p2align 4,,11
	.global	free_run_state
	.type	free_run_state, %function
free_run_state:
.LFB70:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldr	x0, [x0]
	bl	free
	ldr	x0, [x19, 8]
	bl	free
	ldr	x0, [x19, 16]
	bl	free
	ldr	x0, [x19, 24]
	bl	free
	ldr	x0, [x19, 32]
	bl	free
	ldr	x0, [x19, 40]
	bl	free
	ldr	x0, [x19, 64]
	bl	free
	ldr	x0, [x19, 72]
	bl	free
	ldr	x0, [x19, 80]
	bl	free
	ldr	x0, [x19, 88]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	b	free
	.cfi_endproc
.LFE70:
	.size	free_run_state, .-free_run_state
	.align	2
	.p2align 4,,11
	.global	memory_map_weights
	.type	memory_map_weights, %function
memory_map_weights:
.LFB71:
	.cfi_startproc
	ldr	w9, [x1]
	ptrue	p0.b, vl64
	ldp	w10, w4, [x1, 8]
	ldp	w5, w7, [x1, 16]
	sdiv	w11, w9, w4
	smull	x10, w9, w10
	ldrsw	x6, [x1, 4]
	ldr	w8, [x1, 24]
	mul	w7, w9, w7
	lsl	x1, x10, 2
	mul	w4, w4, w11
	mul	w5, w11, w5
	add	x7, x2, w7, sxtw 2
	mul	x6, x6, x10
	add	x10, x7, x1
	sxtw	x4, w4
	fmov	d3, x10
	sxtw	x5, w5
	lsl	x6, x6, 2
	mul	x4, x4, x1
	fmov	d1, x4
	mul	x4, x5, x1
	fmov	d2, x4
	add	d4, d3, d1
	add	d5, d4, d2
	add	d2, d5, d2
	add	d1, d2, d1
	fmov	x4, d1
	add	x1, x4, x1
	mov	z0.d, x1
	add	x1, x1, x6
	str	x1, [x0, 64]
	add	x1, x1, x6
	str	x1, [x0, 72]
	add	x1, x1, x6
	str	x1, [x0, 80]
	insr	z0.d, d2
	insr	z0.d, d5
	insr	z0.d, d4
	insr	z0.d, d3
	insr	z0.d, d1
	insr	z0.d, x7
	insr	z0.d, x2
	st1d	z0.d, p0, [x0]
	cbnz	w3, .L13
	mul	w8, w8, w11
	sxtw	x9, w9
	add	w8, w8, w8, lsr 31
	asr	w8, w8, 1
	add	x8, x9, w8, sxtw 1
	add	x2, x1, x8, lsl 2
.L13:
	str	x2, [x0, 88]
	ret
	.cfi_endproc
.LFE71:
	.size	memory_map_weights, .-memory_map_weights
	.section	.rodata.str1.8
	.align	3
.LC1:
	.string	"rb"
	.align	3
.LC2:
	.string	"Couldn't open file %s\n"
	.align	3
.LC3:
	.string	"open failed!\n"
	.align	3
.LC4:
	.string	"mmap failed!\n"
	.text
	.align	2
	.p2align 4,,11
	.global	read_checkpoint
	.type	read_checkpoint, %function
read_checkpoint:
.LFB72:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -80
	.cfi_offset 20, -72
	mov	x20, x1
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -64
	.cfi_offset 22, -56
	mov	x21, x5
	mov	x22, x0
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -48
	.cfi_offset 24, -40
	mov	x24, x2
	mov	x23, x3
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -32
	.cfi_offset 26, -24
	mov	x25, x4
	str	x27, [sp, 80]
	.cfi_offset 27, -16
	bl	fopen
	cbz	x0, .L20
	mov	x3, x0
	mov	x19, x0
	mov	x2, 1
	mov	x0, x20
	mov	x1, 28
	bl	fread
	mov	x26, x0
	cmp	x0, 1
	bne	.L21
	ldr	w6, [x20, 20]
	mov	w2, 2
	mov	x1, 0
	mov	x0, x19
	cmp	w6, 0
	csneg	w6, w6, w6, ge
	str	w6, [x20, 20]
	cset	w27, gt
	bl	fseek
	mov	x0, x19
	bl	ftell
	str	x0, [x21]
	mov	x0, x19
	bl	fclose
	mov	x0, x22
	mov	w1, 0
	bl	open
	str	w0, [x23]
	mov	w4, w0
	cmn	w0, #1
	beq	.L22
	ldr	x1, [x21]
	mov	w2, w26
	mov	x5, 0
	mov	w3, 2
	mov	x0, 0
	bl	mmap
	str	x0, [x25]
	cmn	x0, #1
	beq	.L23
	mov	w3, w27
	add	x2, x0, 28
	mov	x1, x20
	mov	x0, x24
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 96
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	memory_map_weights
.L20:
	.cfi_restore_state
	adrp	x0, :got:stderr
	mov	x3, x22
	adrp	x2, .LC2
	add	x2, x2, :lo12:.LC2
	ldr	x0, [x0, #:got_lo12:stderr]
	mov	w1, 1
	ldr	x0, [x0]
	bl	__fprintf_chk
	mov	w0, 1
	bl	exit
.L23:
	adrp	x3, :got:stderr
	mov	x1, x26
	mov	x2, 13
	adrp	x0, .LC4
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC4
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, w26
	bl	exit
.L22:
	adrp	x3, :got:stderr
	mov	x1, x26
	mov	x2, 13
	adrp	x0, .LC3
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC3
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, w26
	bl	exit
.L21:
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE72:
	.size	read_checkpoint, .-read_checkpoint
	.align	2
	.p2align 4,,11
	.global	build_transformer
	.type	build_transformer, %function
build_transformer:
.LFB73:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	add	x5, x19, 240
	mov	x0, x1
	add	x4, x19, 232
	add	x3, x19, 224
	add	x2, x19, 32
	mov	x1, x19
	bl	read_checkpoint
	mov	x1, x19
	add	x0, x19, 128
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	b	malloc_run_state
	.cfi_endproc
.LFE73:
	.size	build_transformer, .-build_transformer
	.align	2
	.p2align 4,,11
	.global	free_transformer
	.type	free_transformer, %function
free_transformer:
.LFB74:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	ldr	x0, [x0, 232]
	cmn	x0, #1
	beq	.L27
	ldr	x1, [x19, 240]
	bl	munmap
.L27:
	ldr	w0, [x19, 224]
	cmn	w0, #1
	beq	.L28
	bl	close
.L28:
	ldr	x0, [x19, 128]
	add	x19, x19, 128
	bl	free
	ldr	x0, [x19, 8]
	bl	free
	ldr	x0, [x19, 16]
	bl	free
	ldr	x0, [x19, 24]
	bl	free
	ldr	x0, [x19, 32]
	bl	free
	ldr	x0, [x19, 40]
	bl	free
	ldr	x0, [x19, 64]
	bl	free
	ldr	x0, [x19, 72]
	bl	free
	ldr	x0, [x19, 80]
	bl	free
	ldr	x0, [x19, 88]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	b	free
	.cfi_endproc
.LFE74:
	.size	free_transformer, .-free_transformer
	.align	2
	.p2align 4,,11
	.global	rmsnorm
	.type	rmsnorm, %function
rmsnorm:
.LFB75:
	.cfi_startproc
	movi	v0.2s, #0
	cmp	w3, 0
	ble	.L37
	mov	x4, 0
	whilelo	p0.s, wzr, w3
	.p2align 3,,7
.L38:
	ld1w	z1.s, p0/z, [x1, x4, lsl 2]
	add	x4, x4, 16
	fmul	z1.s, z1.s, z1.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, w4, w3
	b.any	.L38
.L37:
	scvtf	s2, w3
	mov	w4, 50604
	movk	w4, 0x3727, lsl 16
	fmov	s1, w4
	fdiv	s0, s0, s2
	fadd	s0, s0, s1
	fcmp	s0, #0.0
	bpl	.L48
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	stp	x0, x1, [sp, 16]
	str	x2, [sp, 32]
	str	w3, [sp, 44]
	bl	sqrtf
	fmov	s1, 1.0e+0
	ldr	w3, [sp, 44]
	ldp	x0, x1, [sp, 16]
	fdiv	s1, s1, s0
	ldr	x2, [sp, 32]
	cmp	w3, 0
	ble	.L36
	add	x5, x1, 4
	add	x4, x2, 4
	sub	x5, x0, x5
	sub	x4, x0, x4
	cmp	x5, 56
	mov	x5, 56
	ccmp	x4, x5, 0, hi
	mov	x4, 0
	bls	.L43
	mov	z1.s, s1
	whilelo	p0.s, wzr, w3
.L44:
	ld1w	z0.s, p0/z, [x1, x4, lsl 2]
	ld1w	z2.s, p0/z, [x2, x4, lsl 2]
	fmul	z0.s, z0.s, z1.s
	fmul	z0.s, z0.s, z2.s
	st1w	z0.s, p0, [x0, x4, lsl 2]
	add	x4, x4, 16
	whilelo	p0.s, w4, w3
	b.any	.L44
.L36:
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L48:
	fsqrt	s0, s0
	fmov	s1, 1.0e+0
	fdiv	s1, s1, s0
	cmp	w3, 0
	ble	.L56
	add	x5, x1, 4
	add	x4, x2, 4
	sub	x5, x0, x5
	sub	x4, x0, x4
	cmp	x5, 56
	mov	x5, 56
	ccmp	x4, x5, 0, hi
	mov	x4, 0
	bls	.L61
	mov	z1.s, s1
	whilelo	p0.s, wzr, w3
	.p2align 3,,7
.L59:
	ld1w	z0.s, p0/z, [x1, x4, lsl 2]
	ld1w	z2.s, p0/z, [x2, x4, lsl 2]
	fmul	z0.s, z0.s, z1.s
	fmul	z0.s, z0.s, z2.s
	st1w	z0.s, p0, [x0, x4, lsl 2]
	add	x4, x4, 16
	whilelo	p0.s, w4, w3
	b.any	.L59
	ret
	.p2align 2,,3
.L61:
	ldr	s0, [x1, x4, lsl 2]
	ldr	s2, [x2, x4, lsl 2]
	fmul	s0, s1, s0
	fmul	s0, s0, s2
	str	s0, [x0, x4, lsl 2]
	add	x4, x4, 1
	cmp	w3, w4
	bgt	.L61
	ret
	.p2align 2,,3
.L56:
	ret
.L43:
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	ldr	s0, [x1, x4, lsl 2]
	ldr	s2, [x2, x4, lsl 2]
	fmul	s0, s1, s0
	fmul	s0, s0, s2
	str	s0, [x0, x4, lsl 2]
	add	x4, x4, 1
	cmp	w3, w4
	bgt	.L43
	b	.L36
	.cfi_endproc
.LFE75:
	.size	rmsnorm, .-rmsnorm
	.align	2
	.p2align 4,,11
	.global	softmax
	.type	softmax, %function
softmax:
.LFB76:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	x19, x0
	stp	d8, d9, [sp, 48]
	.cfi_offset 72, -16
	.cfi_offset 73, -8
	ldr	s9, [x0]
	str	x21, [sp, 32]
	.cfi_offset 21, -32
	mov	w21, w1
	cmp	w1, 1
	ble	.L65
	mov	x0, 1
	.p2align 3,,7
.L68:
	ldr	s0, [x19, x0, lsl 2]
	fcmpe	s0, s9
	bgt	.L74
.L66:
	add	x0, x0, 1
	cmp	w21, w0
	bgt	.L68
	movi	v8.2s, #0
	mov	x20, 0
	.p2align 3,,7
.L69:
	ldr	s0, [x19, x20, lsl 2]
	fsub	s0, s0, s9
	bl	expf
	str	s0, [x19, x20, lsl 2]
	add	x20, x20, 1
	fadd	s8, s8, s0
	cmp	w21, w20
	bgt	.L69
.L73:
	cmp	w21, 0
	mov	x0, 0
	csinc	w21, w21, wzr, gt
	mov	z8.s, s8
	ptrue	p1.b, vl64
	whilelo	p0.s, wzr, w21
	.p2align 3,,7
.L72:
	ld1w	z0.s, p0/z, [x19, x0, lsl 2]
	fdiv	z0.s, p1/m, z0.s, z8.s
	st1w	z0.s, p0, [x19, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w21
	b.any	.L72
.L64:
	ldp	x19, x20, [sp, 16]
	ldr	x21, [sp, 32]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L74:
	.cfi_restore_state
	fmov	s9, s0
	b	.L66
	.p2align 2,,3
.L65:
	bne	.L64
	fsub	s0, s9, s9
	bl	expf
	str	s0, [x19]
	movi	v8.2s, #0
	fadd	s8, s0, s8
	b	.L73
	.cfi_endproc
.LFE76:
	.size	softmax, .-softmax
	.align	2
	.p2align 4,,11
	.global	matmul
	.type	matmul, %function
matmul:
.LFB77:
	.cfi_startproc
	cmp	w4, 0
	ble	.L79
	mov	w8, 0
	mov	x9, 0
	.p2align 3,,7
.L81:
	movi	v1.2s, #0
	mov	w5, 0
	cmp	w3, 0
	ble	.L84
	.p2align 3,,7
.L82:
	add	w6, w8, w5
	whilelt	p0.s, w5, w3
	add	x7, x1, w5, sxtw 2
	add	w5, w5, 16
	add	x6, x2, w6, sxtw 2
	ld1w	z2.s, p0/z, [x7]
	ld1w	z0.s, p0/z, [x6]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w3, w5
	bgt	.L82
.L84:
	str	s1, [x0, x9, lsl 2]
	add	x9, x9, 1
	add	w8, w8, w3
	cmp	w4, w9
	bgt	.L81
.L79:
	ret
	.cfi_endproc
.LFE77:
	.size	matmul, .-matmul
	.align	2
	.p2align 4,,11
	.global	forward
	.type	forward, %function
forward:
.LFB78:
	.cfi_startproc
	stp	x29, x30, [sp, -384]!
	.cfi_def_cfa_offset 384
	.cfi_offset 29, -384
	.cfi_offset 30, -376
	mov	x29, sp
	ldr	w3, [x0, 12]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -368
	.cfi_offset 20, -360
	mov	x19, x0
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -352
	.cfi_offset 22, -344
	mov	w22, w2
	ldr	w21, [x0, 4]
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -336
	.cfi_offset 24, -328
	add	x24, x0, 128
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -304
	.cfi_offset 28, -296
	ldr	w27, [x0]
	str	x0, [sp, 200]
	ldr	x2, [x0, 32]
	sbfiz	x5, x27, 2, 32
	ldr	x6, [x0, 128]
	mul	w1, w27, w1
	ldr	w0, [x0, 16]
	sdiv	w23, w27, w3
	str	x5, [sp, 264]
	add	x1, x2, w1, sxtw 2
	mov	x2, x5
	stp	d10, d11, [sp, 112]
	mul	w4, w0, w27
	sdiv	w0, w3, w0
	str	x24, [sp, 160]
	str	x6, [sp, 176]
	sdiv	w5, w4, w3
	str	w0, [sp, 156]
	mov	x0, x6
	mov	w20, w5
	str	w5, [sp, 212]
	.cfi_offset 74, -272
	.cfi_offset 75, -264
	bl	memcpy
	ldr	w0, [x19, 8]
	cbz	w0, .L88
	sub	w0, w21, #1
	mul	w4, w20, w22
	add	x0, x0, 1
	sub	w2, w22, #1
	ubfiz	x1, x22, 2, 32
	mov	x3, x19
	lsl	x0, x0, 2
	str	x0, [sp, 280]
	smull	x0, w27, w27
	scvtf	s10, w27
	str	x0, [sp, 304]
	sxtw	x0, w4
	str	x0, [sp, 272]
	smull	x0, w27, w21
	str	x0, [sp, 312]
	lsl	x0, x2, 2
	str	x0, [sp, 184]
	add	x0, x1, 4
	str	x0, [sp, 192]
	add	w0, w22, 1
	str	w0, [sp, 208]
	sbfiz	x0, x23, 2, 32
	str	x0, [sp, 288]
	add	x0, x3, 32
	smull	x6, w27, w20
	mov	w28, w23
	mov	w1, 50604
	sbfiz	x20, x20, 2, 32
	mov	w23, w27
	str	x0, [sp, 168]
	mov	w0, 16384
	movk	w1, 0x3727, lsl 16
	movk	w0, 0x461c, lsl 16
	mov	x24, 0
	fmov	s11, w1
	stp	x25, x26, [sp, 64]
	.cfi_offset 26, -312
	.cfi_offset 25, -320
	mov	x26, 0
	stp	d8, d9, [sp, 96]
	.cfi_offset 73, -280
	.cfi_offset 72, -288
	fmov	s9, w0
	stp	xzr, xzr, [sp, 216]
	str	x6, [sp, 296]
	ldr	x25, [x19, 136]
	mov	x19, 0
	stp	d12, d13, [sp, 128]
	.cfi_offset 77, -248
	.cfi_offset 76, -256
.L183:
	movi	v1.2s, #0
	ldr	x0, [sp, 168]
	ldr	x27, [x0, 8]
	cmp	w23, 0
	ble	.L89
	ldr	x1, [sp, 176]
	whilelo	p0.s, wzr, w23
	mov	x0, 0
.L90:
	ld1w	z0.s, p0/z, [x1, x0, lsl 2]
	add	x0, x0, 16
	fmul	z0.s, z0.s, z0.s
	fadda	s1, p0, s1, z0.s
	whilelo	p0.s, w0, w23
	b.any	.L90
.L89:
	fdiv	s0, s1, s10
	fadd	s0, s0, s11
	fcmp	s0, #0.0
	bpl	.L218
	bl	sqrtf
	b	.L93
	.p2align 2,,3
.L218:
	fsqrt	s0, s0
.L93:
	fmov	s1, 1.0e+0
	fdiv	s1, s1, s0
	cmp	w23, 0
	ble	.L99
	ldr	x3, [sp, 216]
	mov	x2, 56
	ldr	x4, [sp, 176]
	add	x0, x3, 4
	add	x0, x27, x0
	add	x1, x4, 4
	sub	x0, x25, x0
	sub	x1, x25, x1
	cmp	x0, x2
	ccmp	x1, x2, 0, hi
	bls	.L210
	add	x1, x27, x3
	mov	x2, x4
	mov	x0, 0
	mov	z1.s, s1
	whilelo	p0.s, wzr, w23
.L98:
	ld1w	z0.s, p0/z, [x2, x0, lsl 2]
	ld1w	z2.s, p0/z, [x1, x0, lsl 2]
	fmul	z0.s, z1.s, z0.s
	fmul	z0.s, z0.s, z2.s
	st1w	z0.s, p0, [x25, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w23
	b.any	.L98
.L99:
	ldr	x1, [sp, 200]
	mov	w4, 0
	ldr	w2, [sp, 212]
	mov	x7, 0
	ldrsw	x0, [x1, 24]
	ldr	q0, [x1, 208]
	mul	w0, w2, w0
	ldr	w2, [sp, 224]
	mul	w0, w0, w2
	ldr	x2, [sp, 272]
	sxtw	x0, w0
	str	x0, [sp, 144]
	add	x0, x0, x2
	fmov	d1, x0
	ldr	x0, [sp, 168]
	shl	d1, d1, 2
	dup	v1.2d, v1.d[0]
	add	v0.2d, v0.2d, v1.2d
	str	q0, [x1, 176]
	fmov	x8, d0
	ldr	x6, [x0, 24]
	ldr	x0, [sp, 160]
	ldr	x9, [x0, 40]
	cmp	w23, 0
	ble	.L292
	.p2align 3,,7
.L102:
	movi	v1.2s, #0
	mov	w0, 0
	.p2align 3,,7
.L101:
	add	w1, w4, w0
	whilelt	p0.s, w0, w23
	add	x2, x25, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x24, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w23, w0
	bgt	.L101
	str	s1, [x9, x7, lsl 2]
	add	x7, x7, 1
	add	w4, w4, w23
	cmp	w23, w7
	bgt	.L102
	ldp	x0, x1, [sp, 160]
	ldr	x25, [x0, 8]
	ldr	x8, [x0, 48]
	ldr	w0, [sp, 212]
	ldr	x6, [x1, 32]
	cmp	w0, 0
	ble	.L293
.L103:
	ldr	w3, [sp, 212]
	mov	w4, 0
	mov	x7, 0
	.p2align 3,,7
.L105:
	movi	v1.2s, #0
	mov	w0, 0
	cmp	w23, 0
	ble	.L109
	.p2align 3,,7
.L106:
	add	w1, w4, w0
	whilelt	p0.s, w0, w23
	add	x2, x25, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x26, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w23, w0
	bgt	.L106
.L109:
	str	s1, [x8, x7, lsl 2]
	add	x7, x7, 1
	add	w4, w4, w23
	cmp	w3, w7
	bgt	.L105
	ldp	x0, x1, [sp, 160]
	mov	w4, 0
	ldr	w3, [sp, 212]
	mov	x8, 0
	ldr	x7, [x0, 8]
	ldr	x6, [x1, 40]
	ldr	x9, [x0, 56]
	.p2align 3,,7
.L203:
	movi	v1.2s, #0
	mov	w0, 0
	cmp	w23, 0
	ble	.L113
	.p2align 3,,7
.L110:
	add	w1, w4, w0
	whilelt	p0.s, w0, w23
	add	x2, x7, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x26, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w23, w0
	bgt	.L110
.L113:
	str	s1, [x9, x8, lsl 2]
	add	x8, x8, 1
	add	w4, w4, w23
	cmp	w3, w8
	bgt	.L203
	cmp	w23, 0
	ble	.L208
	ldr	w0, [sp, 212]
	mov	w25, 0
	str	w23, [sp, 232]
	scvtf	s12, w28
	cmp	w23, w0
	scvtf	s8, w22
	csel	w1, w23, w0, le
	add	x0, sp, 376
	ldr	x23, [sp, 160]
	mov	x4, 0
	add	x27, sp, 380
	str	w21, [sp, 240]
	mov	w21, w28
	mov	w28, w22
	mov	w22, w25
	mov	x25, x19
	mov	w19, w1
	stp	x20, x0, [sp, 248]
	mov	x20, x0
	str	x24, [sp, 320]
	mov	x24, x4
	fmov	s13, 1.0e+0
	.p2align 3,,7
.L114:
	sdiv	w0, w22, w21
	fmov	s0, s9
	msub	w0, w0, w21, w22
	add	w22, w22, 2
	scvtf	s1, w0
	fdiv	s1, s1, s12
	bl	powf
	fdiv	s0, s13, s0
	mov	x1, x20
	mov	x0, x27
	fmul	s0, s8, s0
	bl	sincosf
	ldp	x3, x1, [x23, 40]
	add	x0, x24, 4
	ldr	s1, [sp, 380]
	ldr	s2, [sp, 376]
	ldr	s0, [x3, x0]
	ldr	s4, [x3, x24]
	fmul	s3, s1, s0
	fmul	s0, s2, s0
	fnmsub	s3, s2, s4, s3
	fmadd	s0, s1, s4, s0
	str	s3, [x3, x24]
	str	s0, [x3, x0]
	ldr	s0, [x1, x0]
	ldr	s4, [x1, x24]
	fmul	s3, s1, s0
	fmul	s0, s2, s0
	fnmsub	s2, s2, s4, s3
	fmadd	s0, s1, s4, s0
	str	s2, [x1, x24]
	add	x24, x24, 8
	str	s0, [x1, x0]
	cmp	w22, w19
	blt	.L114
	ldr	w23, [sp, 232]
	mov	x19, x25
	mov	w25, w22
	mov	w22, w28
	mov	w28, w21
	ldr	w21, [sp, 240]
	ldr	x20, [sp, 248]
	ldr	x24, [sp, 320]
	cmp	w23, w25
	ble	.L119
.L115:
	sbfiz	x4, x25, 2, 32
	str	w21, [sp, 232]
	mov	w21, w25
	stp	x20, x19, [sp, 240]
	mov	x19, x27
	ldr	x25, [sp, 160]
	mov	w20, w28
	ldr	x27, [sp, 256]
	mov	w28, w22
	mov	x22, x4
	fmov	s13, 1.0e+0
	.p2align 3,,7
.L118:
	sdiv	w0, w21, w20
	fmov	s0, s9
	msub	w0, w0, w20, w21
	add	w21, w21, 2
	scvtf	s1, w0
	fdiv	s1, s1, s12
	bl	powf
	fdiv	s0, s13, s0
	mov	x1, x27
	mov	x0, x19
	fmul	s0, s8, s0
	bl	sincosf
	ldr	x0, [x25, 40]
	add	x1, x22, 4
	ldr	s2, [sp, 380]
	ldr	s4, [sp, 376]
	ldr	s0, [x0, x1]
	ldr	s3, [x0, x22]
	fmul	s1, s0, s2
	fmul	s0, s0, s4
	fnmsub	s1, s3, s4, s1
	fmadd	s0, s3, s2, s0
	str	s1, [x0, x22]
	add	x22, x22, 8
	str	s0, [x0, x1]
	cmp	w23, w21
	bgt	.L118
	mov	w22, w28
	mov	w28, w20
	ldp	x20, x19, [sp, 240]
	ldr	w21, [sp, 232]
.L119:
	ldr	x0, [sp, 200]
	ldr	w0, [x0, 12]
	cmp	w0, 0
	ble	.L294
.L116:
	str	w21, [sp, 240]
	mov	x1, 0
	stp	x26, x24, [sp, 248]
	mov	w0, 0
	ldr	x21, [sp, 160]
	str	w23, [sp, 232]
	ldr	x26, [sp, 200]
	mov	x23, x1
	ldr	x25, [sp, 288]
	str	x19, [sp, 320]
	mov	w19, w0
	.p2align 3,,7
.L141:
	ldr	w10, [x26, 24]
	ldr	x8, [x21, 64]
	ldr	x2, [x21, 40]
	mul	w10, w19, w10
	sbfiz	x9, x10, 2, 32
	sxtw	x24, w10
	add	x27, x8, x9
	tbnz	w22, #31, .L130
	ldr	w0, [sp, 156]
	scvtf	s12, w28
	ldr	x3, [sp, 192]
	whilelo	p2.s, wzr, w28
	add	x2, x2, x23
	mov	x4, x27
	sdiv	w1, w19, w0
	add	x11, x3, x27
	ldr	x3, [sp, 144]
	ldr	x0, [x21, 80]
	mul	w1, w1, w28
	add	x1, x3, w1, sxtw
	add	x1, x0, x1, lsl 2
	.p2align 3,,7
.L131:
	movi	v8.2s, #0
	cmp	w28, 0
	ble	.L125
	mov	x0, 0
	mov	p0.b, p2.b
	.p2align 3,,7
.L126:
	ld1w	z1.s, p0/z, [x2, x0, lsl 2]
	ld1w	z0.s, p0/z, [x1, x0, lsl 2]
	add	x0, x0, 16
	fmul	z0.s, z0.s, z1.s
	fadda	s8, p0, s8, z0.s
	whilelo	p0.s, w0, w28
	b.any	.L126
.L125:
	fcmp	s12, #0.0
	bpl	.L219
	fmov	s0, s12
	add	x1, x1, x20
	stp	x1, x4, [sp, 328]
	stp	x11, x9, [sp, 344]
	stp	x8, x2, [sp, 360]
	bl	sqrtf
	whilelo	p2.s, wzr, w28
	fdiv	s8, s8, s0
	ldp	x1, x4, [sp, 328]
	ldp	x11, x9, [sp, 344]
	ldp	x8, x2, [sp, 360]
	str	s8, [x4], 4
	cmp	x4, x11
	bne	.L131
.L130:
	ldr	x0, [sp, 184]
	ldr	w2, [sp, 208]
	add	x1, x0, 8
	add	x0, x27, 4
	add	x1, x27, x1
	ldr	s12, [x8, x24, lsl 2]
	cmp	w2, 1
	ble	.L295
	.p2align 3,,7
.L134:
	ldr	s0, [x0]
	fcmpe	s12, s0
	bmi	.L220
.L132:
	add	x0, x0, 4
	cmp	x1, x0
	bne	.L134
	movi	v8.2s, #0
	mov	x24, 0
	.p2align 3,,7
.L135:
	ldr	s0, [x27, x24, lsl 2]
	fsub	s0, s0, s12
	bl	expf
	str	s0, [x27, x24, lsl 2]
	add	x24, x24, 1
	fadd	s8, s8, s0
	sub	w0, w24, #1
	cmp	w22, w0
	bgt	.L135
.L204:
	cmp	w22, 0
	mov	x0, 0
	csel	w1, w22, wzr, ge
	ptrue	p1.b, vl64
	add	w1, w1, 1
	mov	z8.s, s8
	whilelo	p0.s, wzr, w1
	.p2align 3,,7
.L139:
	ld1w	z0.s, p0/z, [x27, x0, lsl 2]
	fdiv	z0.s, p1/m, z0.s, z8.s
	st1w	z0.s, p0, [x27, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w1
	b.any	.L139
.L140:
	ldr	x4, [x21, 8]
	mov	x2, x25
	mov	w1, 0
	add	x4, x4, x23
	mov	x0, x4
	bl	memset
	mov	x4, x0
	tbnz	w22, #31, .L138
	ldr	w0, [sp, 156]
	ldr	x2, [sp, 144]
	ldr	x1, [x21, 88]
	sdiv	w0, w19, w0
	mul	w0, w0, w28
	sxtw	x0, w0
	add	x8, x2, x0
	cmp	w28, 0
	ble	.L138
	add	x2, x2, 1
	add	x8, x1, x8, lsl 2
	add	x2, x2, x0
	mov	x9, 0
	whilelo	p2.s, wzr, w28
	ptrue	p1.b, vl64
	add	x2, x1, x2, lsl 2
	.p2align 3,,7
.L147:
	sub	x0, x4, x2
	ldr	s2, [x27, x9, lsl 2]
	cmp	x0, 56
	bls	.L296
	sub	x1, x2, #4
	mov	x0, 0
	mov	z2.s, s2
	mov	p0.b, p2.b
	.p2align 3,,7
.L146:
	ld1w	z1.s, p0/z, [x4, x0, lsl 2]
	ld1w	z0.s, p0/z, [x1, x0, lsl 2]
	fmad	z0.s, p1/m, z2.s, z1.s
	st1w	z0.s, p0, [x4, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w28
	b.any	.L146
	add	x9, x9, 1
	add	x2, x2, x20
	add	x8, x8, x20
	cmp	w22, w9
	bge	.L147
.L138:
	ldr	w0, [x26, 12]
	add	w19, w19, 1
	add	x23, x23, x25
	cmp	w0, w19
	bgt	.L141
	ldr	x0, [sp, 160]
	ldr	w23, [sp, 232]
	ldr	w21, [sp, 240]
	ldp	x25, x8, [x0, 8]
	ldr	x0, [sp, 168]
	ldp	x26, x24, [sp, 248]
	ldr	x6, [x0, 48]
	ldr	x19, [sp, 320]
	cmp	w23, 0
	ble	.L120
.L205:
	mov	w4, 0
	mov	x7, 0
	.p2align 3,,7
.L121:
	movi	v1.2s, #0
	mov	w0, 0
	.p2align 3,,7
.L149:
	add	w1, w4, w0
	whilelt	p0.s, w0, w23
	add	x2, x25, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x24, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w23, w0
	bgt	.L149
	str	s1, [x8, x7, lsl 2]
	add	x7, x7, 1
	add	w4, w4, w23
	cmp	w23, w7
	bgt	.L121
	ldr	x0, [sp, 160]
	ldr	x2, [sp, 176]
	ldr	x1, [x0, 16]
	add	x0, x1, 4
	sub	x0, x2, x0
	cmp	x0, 56
	mov	x0, 0
	bls	.L151
	whilelo	p0.s, wzr, w23
.L152:
	ld1w	z1.s, p0/z, [x2, x0, lsl 2]
	ld1w	z0.s, p0/z, [x1, x0, lsl 2]
	fadd	z0.s, z0.s, z1.s
	st1w	z0.s, p0, [x2, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w23
	b.any	.L152
.L153:
	ldr	x1, [sp, 160]
	whilelo	p0.s, wzr, w23
	movi	v1.2s, #0
	mov	x0, 0
	ldr	x25, [x1, 8]
	ldr	x1, [sp, 168]
	ldr	x27, [x1, 16]
	ldr	x1, [sp, 176]
.L154:
	ld1w	z0.s, p0/z, [x1, x0, lsl 2]
	add	x0, x0, 16
	fmul	z0.s, z0.s, z0.s
	fadda	s1, p0, s1, z0.s
	whilelo	p0.s, w0, w23
	b.any	.L154
	fdiv	s0, s1, s10
	fadd	s0, s0, s11
	fcmp	s0, #0.0
	bpl	.L221
.L297:
	bl	sqrtf
	b	.L157
	.p2align 2,,3
.L219:
	fsqrt	s0, s12
	add	x1, x1, x20
	fdiv	s8, s8, s0
	str	s8, [x4], 4
	cmp	x4, x11
	bne	.L131
	ldr	x0, [sp, 184]
	ldr	w2, [sp, 208]
	add	x1, x0, 8
	add	x0, x27, 4
	add	x1, x27, x1
	ldr	s12, [x8, x24, lsl 2]
	cmp	w2, 1
	bgt	.L134
.L295:
	bne	.L140
	fsub	s0, s12, s12
	stp	x9, x8, [sp, 328]
	bl	expf
	ldp	x9, x8, [sp, 328]
	movi	v8.2s, #0
	fadd	s8, s0, s8
	str	s0, [x8, x9]
	b	.L204
	.p2align 2,,3
.L151:
	ldr	s0, [x2, x0, lsl 2]
	ldr	s1, [x1, x0, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x2, x0, lsl 2]
	add	x0, x0, 1
	cmp	w23, w0
	ble	.L153
	ldr	s0, [x2, x0, lsl 2]
	ldr	s1, [x1, x0, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x2, x0, lsl 2]
	add	x0, x0, 1
	cmp	w23, w0
	bgt	.L151
	b	.L153
.L221:
	fsqrt	s0, s0
.L157:
	fmov	s1, 1.0e+0
	fdiv	s1, s1, s0
	cmp	w23, 0
	ble	.L163
	ldr	x3, [sp, 216]
	mov	x2, 56
	ldr	x4, [sp, 176]
	add	x0, x3, 4
	add	x0, x27, x0
	add	x1, x4, 4
	sub	x0, x25, x0
	sub	x1, x25, x1
	cmp	x0, x2
	ccmp	x1, x2, 0, hi
	bls	.L213
	add	x1, x27, x3
	mov	x2, x4
	mov	x0, 0
	mov	z1.s, s1
	whilelo	p0.s, wzr, w23
.L162:
	ld1w	z0.s, p0/z, [x2, x0, lsl 2]
	ld1w	z2.s, p0/z, [x1, x0, lsl 2]
	fmul	z0.s, z1.s, z0.s
	fmul	z0.s, z0.s, z2.s
	st1w	z0.s, p0, [x25, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w23
	b.any	.L162
.L163:
	ldr	x0, [sp, 160]
	ldr	x27, [x0, 24]
	ldr	x0, [sp, 168]
	ldr	x6, [x0, 56]
	cmp	w21, 0
	ble	.L159
	mov	w4, 0
	mov	x7, 0
	.p2align 3,,7
.L160:
	movi	v1.2s, #0
	mov	w0, 0
	cmp	w23, 0
	ble	.L168
	.p2align 3,,7
.L165:
	add	w1, w4, w0
	whilelt	p0.s, w0, w23
	add	x2, x25, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x19, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w0, w23
	blt	.L165
.L168:
	str	s1, [x27, x7, lsl 2]
	add	x7, x7, 1
	add	w4, w4, w23
	cmp	w21, w7
	bgt	.L160
	ldr	x0, [sp, 160]
	mov	w4, 0
	mov	x8, 0
	ldr	x7, [x0, 8]
	ldr	x9, [x0, 32]
	ldr	x0, [sp, 168]
	ldr	x6, [x0, 72]
	.p2align 3,,7
.L201:
	movi	v1.2s, #0
	mov	w0, 0
	cmp	w23, 0
	ble	.L172
	.p2align 3,,7
.L169:
	add	w1, w4, w0
	whilelt	p0.s, w0, w23
	add	x2, x7, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x19, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w0, w23
	blt	.L169
.L172:
	str	s1, [x9, x8, lsl 2]
	add	x8, x8, 1
	add	w4, w4, w23
	cmp	w21, w8
	bgt	.L201
	ldr	x0, [sp, 160]
	mov	x25, 0
	mov	w1, w22
	str	w21, [sp, 144]
	mov	x21, x25
	mov	x25, x19
	ldr	x27, [x0, 24]
	str	x20, [sp, 232]
	ldr	x19, [sp, 280]
	mov	x22, x27
	mov	x20, x0
	mov	w27, w1
	fmov	s12, 1.0e+0
	.p2align 3,,7
.L173:
	ldr	s8, [x22, x21]
	fneg	s0, s8
	bl	expf
	fadd	s0, s0, s12
	ldr	x2, [x20, 32]
	fdiv	s0, s12, s0
	ldr	s1, [x2, x21]
	fmul	s0, s0, s8
	fmul	s0, s1, s0
	str	s0, [x22, x21]
	add	x21, x21, 4
	cmp	x19, x21
	bne	.L173
	mov	w0, w27
	ldr	w21, [sp, 144]
	ldr	x20, [sp, 232]
	mov	x27, x22
	mov	x19, x25
	mov	w22, w0
.L159:
	ldr	x0, [sp, 160]
	mov	w4, 0
	mov	x7, 0
	ldr	x25, [x0, 8]
	ldr	x0, [sp, 168]
	ldr	x6, [x0, 64]
	cmp	w23, 0
	ble	.L175
	.p2align 3,,7
.L174:
	movi	v1.2s, #0
	mov	w0, 0
	cmp	w21, 0
	ble	.L179
	.p2align 3,,7
.L176:
	add	w1, w4, w0
	whilelt	p0.s, w0, w21
	add	x2, x27, w0, sxtw 2
	add	w0, w0, 16
	add	x1, x19, w1, sxtw
	ld1w	z2.s, p0/z, [x2]
	ld1w	z0.s, p0/z, [x6, x1, lsl 2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w21, w0
	bgt	.L176
.L179:
	str	s1, [x25, x7, lsl 2]
	add	x7, x7, 1
	add	w4, w4, w21
	cmp	w23, w7
	bgt	.L174
	ldr	x0, [sp, 160]
	ldr	x1, [sp, 176]
	ldr	x25, [x0, 8]
	add	x0, x25, 4
	sub	x0, x1, x0
	cmp	x0, 56
	mov	x0, 0
	bls	.L180
	whilelo	p0.s, wzr, w23
.L181:
	ld1w	z1.s, p0/z, [x1, x0, lsl 2]
	ld1w	z0.s, p0/z, [x25, x0, lsl 2]
	fadd	z0.s, z0.s, z1.s
	st1w	z0.s, p0, [x1, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w23
	b.any	.L181
.L175:
	ldp	x2, x1, [sp, 216]
	ldr	x3, [sp, 264]
	ldr	x0, [sp, 200]
	add	x2, x2, x3
	add	x1, x1, 1
	stp	x2, x1, [sp, 216]
	ldrsw	x0, [x0, 8]
	ldr	x2, [sp, 296]
	add	x26, x26, x2
	ldr	x2, [sp, 304]
	add	x24, x24, x2
	ldr	x2, [sp, 312]
	add	x19, x19, x2
	cmp	x0, x1
	bhi	.L183
	ldp	x25, x26, [sp, 64]
	.cfi_restore 26
	.cfi_restore 25
	mov	w27, w23
	ldp	d8, d9, [sp, 96]
	.cfi_restore 73
	.cfi_restore 72
	ldp	d12, d13, [sp, 128]
	.cfi_restore 77
	.cfi_restore 76
.L184:
	movi	v0.2s, #0
	ldr	x0, [sp, 168]
	ldr	x19, [x0, 80]
	cmp	w27, 0
	ble	.L185
	mov	x0, 0
	whilelo	p0.s, wzr, w27
.L186:
	ldr	x1, [sp, 176]
	ld1w	z1.s, p0/z, [x1, x0, lsl 2]
	add	x0, x0, 16
	fmul	z1.s, z1.s, z1.s
	fadda	s0, p0, s0, z1.s
	whilelo	p0.s, w0, w27
	b.any	.L186
.L185:
	fdiv	s0, s0, s10
	mov	w0, 50604
	movk	w0, 0x3727, lsl 16
	fmov	s1, w0
	fadd	s0, s0, s1
	fcmp	s0, #0.0
	bpl	.L222
	bl	sqrtf
	b	.L189
	.p2align 2,,3
.L180:
	.cfi_offset 25, -320
	.cfi_offset 26, -312
	.cfi_offset 72, -288
	.cfi_offset 73, -280
	.cfi_offset 76, -256
	.cfi_offset 77, -248
	ldr	s0, [x1, x0, lsl 2]
	ldr	s1, [x25, x0, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	w23, w0
	ble	.L175
	ldr	s0, [x1, x0, lsl 2]
	ldr	s1, [x25, x0, lsl 2]
	fadd	s0, s0, s1
	str	s0, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	w23, w0
	bgt	.L180
	b	.L175
.L222:
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 76
	.cfi_restore 77
	fsqrt	s0, s0
.L189:
	fmov	s1, 1.0e+0
	fdiv	s0, s1, s0
	cmp	w27, 0
	ble	.L195
	ldr	x1, [sp, 176]
	add	x0, x19, 4
	sub	x0, x1, x0
	cmp	x0, 56
	mov	x0, 0
	bls	.L193
	mov	z0.s, s0
	whilelo	p0.s, wzr, w27
.L194:
	ld1w	z1.s, p0/z, [x1, x0, lsl 2]
	ld1w	z2.s, p0/z, [x19, x0, lsl 2]
	fmul	z1.s, z0.s, z1.s
	fmul	z1.s, z1.s, z2.s
	st1w	z1.s, p0, [x1, x0, lsl 2]
	add	x0, x0, 16
	whilelo	p0.s, w0, w27
	b.any	.L194
.L195:
	ldr	x0, [sp, 200]
	mov	w5, 0
	ldr	x1, [sp, 168]
	mov	x7, 0
	ldr	w3, [x0]
	ldr	w8, [x0, 20]
	ldr	x0, [sp, 160]
	ldr	x6, [x1, 88]
	ldr	x0, [x0, 72]
	cmp	w8, 0
	ble	.L87
	ldr	x9, [sp, 176]
.L198:
	movi	v1.2s, #0
	mov	w1, 0
	cmp	w3, 0
	ble	.L200
	.p2align 3,,7
.L197:
	add	w2, w5, w1
	whilelt	p0.s, w1, w3
	add	x4, x9, w1, sxtw 2
	add	w1, w1, 16
	add	x2, x6, w2, sxtw 2
	ld1w	z2.s, p0/z, [x4]
	ld1w	z0.s, p0/z, [x2]
	fmul	z0.s, p0/m, z0.s, z2.s
	faddv	s0, p0, z0.s
	fadd	s1, s1, s0
	cmp	w3, w1
	bgt	.L197
.L200:
	str	s1, [x0, x7, lsl 2]
	add	x7, x7, 1
	add	w5, w5, w3
	cmp	w8, w7
	bgt	.L198
	ldr	x0, [sp, 160]
	ldr	x0, [x0, 72]
.L87:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x27, x28, [sp, 80]
	ldp	d10, d11, [sp, 112]
	ldp	x29, x30, [sp], 384
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 74
	.cfi_restore 75
	.cfi_def_cfa_offset 0
	ret
.L193:
	.cfi_restore_state
	ldr	s1, [x1, x0, lsl 2]
	ldr	s2, [x19, x0, lsl 2]
	fmul	s1, s0, s1
	fmul	s1, s1, s2
	str	s1, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	w27, w0
	ble	.L195
	ldr	s1, [x1, x0, lsl 2]
	ldr	s2, [x19, x0, lsl 2]
	fmul	s1, s0, s1
	fmul	s1, s1, s2
	str	s1, [x1, x0, lsl 2]
	add	x0, x0, 1
	cmp	w27, w0
	bgt	.L193
	b	.L195
	.p2align 2,,3
.L220:
	.cfi_offset 25, -320
	.cfi_offset 26, -312
	.cfi_offset 72, -288
	.cfi_offset 73, -280
	.cfi_offset 76, -256
	.cfi_offset 77, -248
	fmov	s12, s0
	b	.L132
	.p2align 2,,3
.L296:
	mov	x0, 0
	.p2align 3,,7
.L145:
	ldr	s1, [x8, x0, lsl 2]
	ldr	s0, [x4, x0, lsl 2]
	fmadd	s0, s2, s1, s0
	str	s0, [x4, x0, lsl 2]
	add	x0, x0, 1
	cmp	w28, w0
	bgt	.L145
	add	x9, x9, 1
	add	x2, x2, x20
	add	x8, x8, x20
	cmp	w22, w9
	bge	.L147
	b	.L138
.L213:
	mov	x2, x4
	add	x1, x27, x3
	mov	x0, 0
.L161:
	ldr	s0, [x2, x0, lsl 2]
	ldr	s2, [x1, x0, lsl 2]
	fmul	s0, s1, s0
	fmul	s0, s0, s2
	str	s0, [x25, x0, lsl 2]
	add	x0, x0, 1
	cmp	w23, w0
	bgt	.L161
	b	.L163
.L210:
	mov	x2, x4
	add	x1, x27, x3
	mov	x0, 0
.L97:
	ldr	s0, [x2, x0, lsl 2]
	ldr	s2, [x1, x0, lsl 2]
	fmul	s0, s1, s0
	fmul	s0, s0, s2
	str	s0, [x25, x0, lsl 2]
	add	x0, x0, 1
	cmp	w23, w0
	bgt	.L97
	b	.L99
.L292:
	ldr	x0, [sp, 168]
	ldr	x6, [x0, 32]
	ldr	w0, [sp, 212]
	cmp	w0, 0
	bgt	.L103
.L208:
	ldr	x0, [sp, 200]
	ldr	w0, [x0, 12]
	cmp	w0, 0
	bgt	.L116
	ldr	x0, [sp, 160]
	ldr	x25, [x0, 8]
.L120:
	movi	v1.2s, #0
	ldr	x0, [sp, 168]
	fdiv	s0, s1, s10
	ldr	x27, [x0, 16]
	fadd	s0, s0, s11
	fcmp	s0, #0.0
	bpl	.L221
	b	.L297
	.p2align 2,,3
.L294:
	ldr	x0, [sp, 160]
	ldp	x25, x8, [x0, 8]
	ldr	x0, [sp, 168]
	ldr	x6, [x0, 48]
	b	.L205
.L293:
	add	x0, sp, 376
	scvtf	s12, w28
	scvtf	s8, w22
	add	x27, sp, 380
	mov	w25, 0
	str	x0, [sp, 256]
	b	.L115
.L88:
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 72
	.cfi_restore 73
	.cfi_restore 76
	.cfi_restore 77
	ldr	x0, [sp, 200]
	scvtf	s10, w27
	add	x0, x0, 32
	str	x0, [sp, 168]
	b	.L184
	.cfi_endproc
.LFE78:
	.size	forward, .-forward
	.section	.rodata.str1.8
	.align	3
.LC5:
	.string	"couldn't load %s\n"
	.align	3
.LC6:
	.string	"failed read\n"
	.text
	.align	2
	.p2align 4,,11
	.global	build_tokenizer
	.type	build_tokenizer, %function
build_tokenizer:
.LFB80:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	adrp	x3, :got:__stack_chk_guard
	mov	x29, sp
	ldr	x3, [x3, #:got_lo12:__stack_chk_guard]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -80
	.cfi_offset 22, -72
	mov	x22, x0
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -96
	.cfi_offset 20, -88
	mov	x19, x1
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -48
	.cfi_offset 26, -40
	sxtw	x25, w2
	mov	x20, x25
	ldr	x0, [x3]
	str	x0, [sp, 104]
	mov	x0, 0
	str	w25, [x22, 24]
	sbfiz	x0, x25, 3, 32
	lsl	x25, x25, 2
	bl	malloc
	str	x0, [x22]
	mov	x0, x25
	bl	malloc
	stp	x0, xzr, [x22, 8]
	index	z0.b, #0, #1
	mov	z1.b, #0
	ptrue	p0.b, vl64
	add	x5, x22, 32
	add	x4, x22, 160
	add	x3, x22, 288
	add	x2, x22, 416
	mov	w8, 64
	st2b	{z0.b - z1.b}, p0, [x5]
	index	z0.b, w8, #1
	mov	z1.b, #0
	mov	w7, -128
	mov	w6, -64
	st2b	{z0.b - z1.b}, p0, [x4]
	index	z0.b, w7, #1
	mov	z1.b, #0
	st2b	{z0.b - z1.b}, p0, [x3]
	index	z0.b, w6, #1
	mov	z1.b, #0
	mov	x0, x19
	adrp	x1, .LC1
	add	x1, x1, :lo12:.LC1
	st2b	{z0.b - z1.b}, p0, [x2]
	bl	fopen
	stp	x23, x24, [sp, 48]
	.cfi_offset 24, -56
	.cfi_offset 23, -64
	cbz	x0, .L313
	mov	x23, x0
	mov	x3, x0
	mov	x2, 1
	add	x0, x22, 28
	mov	x1, 4
	bl	fread
	cmp	x0, 1
	bne	.L300
	add	x26, sp, 100
	mov	x19, 0
	cmp	w20, 0
	ble	.L302
	str	x27, [sp, 80]
	.cfi_offset 27, -32
	.p2align 3,,7
.L306:
	ldr	x0, [x22, 8]
	mov	x3, x23
	mov	x2, 1
	mov	x1, 4
	add	x0, x0, x19
	bl	fread
	mov	x20, x0
	cmp	x0, 1
	bne	.L312
	mov	x2, x0
	mov	x3, x23
	mov	x0, x26
	mov	x1, 4
	bl	fread
	mov	x21, x0
	cmp	x0, 1
	bne	.L314
	ldr	w24, [sp, 100]
	lsl	x20, x19, 1
	ldr	x27, [x22]
	add	w0, w24, 1
	sxtw	x0, w0
	bl	malloc
	str	x0, [x27, x20]
	sxtw	x1, w24
	mov	x3, x23
	mov	x2, x21
	bl	fread
	cmp	x0, 1
	bne	.L315
	ldr	x1, [x22]
	add	x19, x19, 4
	ldrsw	x0, [sp, 100]
	ldr	x1, [x1, x20]
	strb	wzr, [x1, x0]
	cmp	x25, x19
	bne	.L306
	ldr	x27, [sp, 80]
	.cfi_restore 27
.L302:
	mov	x0, x23
	bl	fclose
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 104]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L316
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	.cfi_remember_state
	.cfi_restore 24
	.cfi_restore 23
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L300:
	.cfi_restore_state
	str	x27, [sp, 80]
	.cfi_offset 27, -32
.L312:
	adrp	x3, :got:stderr
	mov	x2, 12
	mov	x1, 1
	adrp	x0, .LC6
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC6
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, 1
	bl	exit
.L315:
	adrp	x3, :got:stderr
	mov	x1, x21
	mov	x2, 12
	adrp	x0, .LC6
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC6
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, w21
	bl	exit
.L314:
	adrp	x3, :got:stderr
	mov	x1, x20
	mov	x2, 12
	adrp	x0, .LC6
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC6
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, w20
	bl	exit
.L313:
	.cfi_restore 27
	adrp	x0, :got:stderr
	mov	x3, x19
	adrp	x2, .LC5
	add	x2, x2, :lo12:.LC5
	ldr	x0, [x0, #:got_lo12:stderr]
	mov	w1, 1
	ldr	x0, [x0]
	str	x27, [sp, 80]
	.cfi_remember_state
	.cfi_offset 27, -32
	bl	__fprintf_chk
	mov	w0, 1
	bl	exit
.L316:
	.cfi_restore_state
	str	x27, [sp, 80]
	.cfi_offset 27, -32
	bl	__stack_chk_fail
	.cfi_endproc
.LFE80:
	.size	build_tokenizer, .-build_tokenizer
	.align	2
	.p2align 4,,11
	.global	free_tokenizer
	.type	free_tokenizer, %function
free_tokenizer:
.LFB81:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x20, x0
	ldr	w0, [x0, 24]
	cmp	w0, 0
	ble	.L318
	mov	x19, 0
	.p2align 3,,7
.L319:
	ldr	x0, [x20]
	ldr	x0, [x0, x19, lsl 3]
	add	x19, x19, 1
	bl	free
	ldr	w0, [x20, 24]
	cmp	w0, w19
	bgt	.L319
.L318:
	ldr	x0, [x20]
	bl	free
	ldr	x0, [x20, 8]
	bl	free
	ldr	x0, [x20, 16]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	free
	.cfi_endproc
.LFE81:
	.size	free_tokenizer, .-free_tokenizer
	.section	.rodata.str1.8
	.align	3
.LC7:
	.string	"<0x%02hhX>"
	.text
	.align	2
	.p2align 4,,11
	.global	decode
	.type	decode, %function
decode:
.LFB82:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	adrp	x3, :got:__stack_chk_guard
	mov	x29, sp
	ldr	x3, [x3, #:got_lo12:__stack_chk_guard]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x20, x0
	ldr	x0, [x0]
	ldr	x4, [x3]
	str	x4, [sp, 40]
	mov	x4, 0
	ldr	x19, [x0, w2, sxtw 3]
	cmp	w1, 1
	bne	.L323
	ldrb	w0, [x19]
	cmp	w0, 32
	cinc	x19, x19, eq
.L323:
	adrp	x1, .LC7
	add	x2, sp, 39
	add	x1, x1, :lo12:.LC7
	mov	x0, x19
	bl	__isoc99_sscanf
	cmp	w0, 1
	bne	.L322
	ldrb	w19, [sp, 39]
	add	x20, x20, 32
	add	x19, x20, w19, uxtb 1
.L322:
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 40]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L327
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
.L327:
	.cfi_restore_state
	bl	__stack_chk_fail
	.cfi_endproc
.LFE82:
	.size	decode, .-decode
	.section	.rodata.str1.8
	.align	3
.LC8:
	.string	"%s"
	.text
	.align	2
	.p2align 4,,11
	.global	safe_printf
	.type	safe_printf, %function
safe_printf:
.LFB83:
	.cfi_startproc
	cbz	x0, .L341
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x19, x0
	ldrb	w20, [x0]
	cbz	w20, .L328
	ldrb	w0, [x0, 1]
	cbnz	w0, .L330
	bl	__ctype_b_loc
	ubfiz	x20, x20, 1, 8
	ldr	x0, [x0]
	ldrh	w0, [x0, x20]
	tst	w0, 24576
	beq	.L328
.L330:
	mov	x2, x19
	adrp	x1, .LC8
	ldp	x19, x20, [sp, 16]
	add	x1, x1, :lo12:.LC8
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	mov	w0, 1
	b	__printf_chk
	.p2align 2,,3
.L328:
	.cfi_restore_state
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L341:
	ret
	.cfi_endproc
.LFE83:
	.size	safe_printf, .-safe_printf
	.align	2
	.p2align 4,,11
	.global	str_lookup
	.type	str_lookup, %function
str_lookup:
.LFB84:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	sxtw	x20, w2
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	x22, x1
	mov	x21, 0
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -16
	.cfi_offset 24, -8
	mov	x23, x0
	.p2align 3,,7
.L346:
	add	x19, x21, x20
	mov	x0, x23
	cmp	x21, x20
	bcs	.L352
.L348:
	lsr	x19, x19, 1
	lsl	x3, x19, 4
	add	x24, x22, x3
	ldr	x1, [x22, x3]
	bl	strcmp
	cmp	w0, 0
	blt	.L350
	beq	.L347
	add	x21, x19, 1
	mov	x0, x23
	add	x19, x21, x20
	cmp	x21, x20
	bcc	.L348
.L352:
	mov	w0, -1
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L350:
	.cfi_restore_state
	mov	x20, x19
	b	.L346
	.p2align 2,,3
.L347:
	ldr	w0, [x24, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE84:
	.size	str_lookup, .-str_lookup
	.section	.rodata.str1.8
	.align	3
.LC9:
	.string	"cannot encode NULL text\n"
	.align	3
.LC10:
	.string	"%s%s"
	.text
	.align	2
	.p2align 4,,11
	.global	encode
	.type	encode, %function
encode:
.LFB85:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	mov	x23, x0
	sxtb	w0, w3
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	str	x4, [sp, 120]
	str	w0, [sp, 156]
	stp	d8, d9, [sp, 96]
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	.cfi_offset 72, -64
	.cfi_offset 73, -56
	cbz	x1, .L425
	ldr	x0, [x23, 16]
	mov	x21, x1
	mov	x25, x5
	sxtb	w20, w2
	cbz	x0, .L426
.L355:
	ldr	w0, [x23, 28]
	lsl	w0, w0, 1
	add	w0, w0, 3
	bl	malloc
	mov	x19, x0
	cbnz	w20, .L362
	str	wzr, [x25]
	ldrb	w0, [x21]
	cbnz	w0, .L364
.L371:
	mov	w0, 761
	adrp	x28, .LC10
	movk	w0, 0xd015, lsl 16
	fmov	s9, w0
	add	x0, x28, :lo12:.LC10
	str	x0, [sp, 128]
	ldr	w0, [x25]
	cmp	w0, 1
	ble	.L382
	.p2align 3,,7
.L427:
	ldr	x0, [sp, 120]
	fmov	s8, s9
	mov	w24, 0
	add	x22, x0, 4
	mov	w0, -1
	str	x22, [sp, 136]
	stp	w0, w0, [sp, 148]
	.p2align 3,,7
.L389:
	ldpsw	x7, x5, [x22, -4]
	mov	x0, x19
	ldr	x4, [x23]
	mov	x2, -1
	ldr	x3, [sp, 128]
	mov	w1, 1
	ldr	x5, [x4, x5, lsl 3]
	mov	x28, 0
	ldr	x4, [x4, x7, lsl 3]
	bl	__sprintf_chk
	ldrsw	x26, [x23, 24]
	ldr	x21, [x23, 16]
	.p2align 3,,7
.L384:
	cmp	x26, x28
	bls	.L387
.L386:
	add	x2, x26, x28
	mov	x0, x19
	lsr	x27, x2, 1
	lsl	x1, x27, 4
	add	x20, x21, x1
	ldr	x1, [x21, x1]
	bl	strcmp
	cmp	w0, 0
	blt	.L402
	beq	.L385
	add	x28, x27, 1
	cmp	x26, x28
	bhi	.L386
.L387:
	ldr	w0, [x25]
	add	w24, w24, 1
	add	x22, x22, 4
	sub	w1, w0, #1
	cmp	w1, w24
	bgt	.L389
.L431:
	ldr	w1, [sp, 152]
	cmn	w1, #1
	beq	.L382
	ldr	x2, [sp, 120]
	mov	w0, w1
	ldr	w1, [sp, 148]
	str	w1, [x2, w0, sxtw 2]
	add	w1, w0, 1
	ldr	w0, [x25]
	sub	w0, w0, #1
	cmp	w0, w1
	ble	.L390
	sxtw	x1, w1
	.p2align 3,,7
.L391:
	ldr	x0, [sp, 136]
	ldr	x2, [sp, 120]
	ldr	w0, [x0, x1, lsl 2]
	str	w0, [x2, x1, lsl 2]
	add	x1, x1, 1
	ldr	w0, [x25]
	sub	w0, w0, #1
	cmp	w0, w1
	bgt	.L391
.L390:
	str	w0, [x25]
	cmp	w0, 1
	bgt	.L427
.L382:
	ldr	w1, [sp, 156]
	cbz	w1, .L392
	ldr	x2, [sp, 120]
	add	w1, w0, 1
	str	w1, [x25]
	mov	w1, 2
	str	w1, [x2, w0, sxtw 2]
.L392:
	mov	x0, x19
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	b	free
.L362:
	.cfi_restore_state
	ldr	x1, [sp, 120]
	mov	w0, 1
	str	w0, [x25]
	str	w0, [x1]
	ldrb	w0, [x21]
	cbz	w0, .L371
.L364:
	ldrsw	x4, [x23, 24]
	mov	x2, 0
	ldr	x24, [x23, 16]
	mov	w6, 32
.L368:
	cmp	x4, x2
	bls	.L428
.L370:
	add	x1, x4, x2
	lsr	x1, x1, 1
	lsl	x0, x1, 4
	add	x7, x24, x0
	ldr	x5, [x24, x0]
	ldrb	w0, [x5]
	subs	w0, w6, w0
	bne	.L367
	ldrb	w0, [x5, 1]
	neg	w0, w0
.L367:
	cmp	w0, 0
	blt	.L399
	beq	.L369
	add	x2, x1, 1
	cmp	x4, x2
	bhi	.L370
.L428:
	mov	w0, -1
.L397:
	ldr	w1, [x25]
	add	w2, w1, 1
	str	w2, [x25]
	ldr	x2, [sp, 120]
	str	w0, [x2, w1, sxtw 2]
	ldrb	w0, [x21]
	cbz	w0, .L371
.L424:
	mov	x4, 0
.L381:
	ldrb	w1, [x21, 1]
	mov	w2, w1
	and	w1, w0, 192
	str	w2, [sp, 128]
	and	w2, w2, 192
	cmp	w1, 128
	beq	.L429
	strb	w0, [x19]
	strb	wzr, [x19, 1]
	cmp	w2, 128
	beq	.L403
	mov	x22, 1
.L395:
	ldrsw	x26, [x23, 24]
	mov	x28, 0
	.p2align 3,,7
.L375:
	cmp	x26, x28
	bls	.L394
.L377:
	add	x20, x26, x28
	mov	x0, x19
	lsr	x20, x20, 1
	lsl	x1, x20, 4
	add	x27, x24, x1
	ldr	x1, [x24, x1]
	bl	strcmp
	cmp	w0, 0
	blt	.L401
	beq	.L376
	add	x28, x20, 1
	cmp	x26, x28
	bhi	.L377
.L394:
	mov	x1, x19
	add	x5, x22, x19
	cbz	x22, .L430
.L380:
	ldr	w2, [x25]
	ldr	x3, [sp, 120]
	add	w4, w2, 1
	ldrb	w0, [x1], 1
	str	w4, [x25]
	add	w0, w0, 3
	str	w0, [x3, w2, sxtw 2]
	cmp	x5, x1
	bne	.L380
	ldrb	w0, [x21, 1]
.L379:
	add	x21, x21, 1
	cbnz	w0, .L424
	b	.L371
	.p2align 2,,3
.L402:
	mov	x26, x27
	b	.L384
	.p2align 2,,3
.L385:
	ldr	w0, [x20, 8]
	cmn	w0, #1
	beq	.L387
	ldr	x1, [x23, 8]
	ldr	s0, [x1, w0, sxtw 2]
	fcmpe	s0, s8
	bgt	.L404
	ldr	w0, [x25]
	add	w24, w24, 1
	add	x22, x22, 4
	sub	w1, w0, #1
	cmp	w1, w24
	bgt	.L389
	b	.L431
	.p2align 2,,3
.L404:
	stp	w0, w24, [sp, 148]
	add	w24, w24, 1
	ldr	w0, [x25]
	fmov	s8, s0
	add	x22, x22, 4
	sub	w1, w0, #1
	cmp	w1, w24
	bgt	.L389
	b	.L431
	.p2align 2,,3
.L401:
	mov	x26, x20
	b	.L375
.L376:
	ldr	w0, [x27, 8]
	cmn	w0, #1
	beq	.L394
	ldr	w1, [x25]
	add	w2, w1, 1
	str	w2, [x25]
	ldr	x2, [sp, 120]
	str	w0, [x2, w1, sxtw 2]
	ldrb	w0, [x21, 1]
	b	.L379
.L429:
	add	x22, x4, 1
	strb	w0, [x19, x4]
	cmp	w2, 128
	ccmp	x22, 4, 4, eq
	strb	wzr, [x19, x22]
	beq	.L395
	mov	x4, x22
	b	.L373
	.p2align 2,,3
.L403:
	mov	x4, 1
.L373:
	ldr	w0, [sp, 128]
	add	x21, x21, 1
	b	.L381
.L399:
	mov	x4, x1
	b	.L368
.L430:
	ldr	w0, [sp, 128]
	b	.L379
.L369:
	ldr	w0, [x7, 8]
	b	.L397
.L426:
	ldr	w19, [x23, 24]
	sbfiz	x0, x19, 4, 32
	bl	malloc
	str	x0, [x23, 16]
	sxtw	x1, w19
	cmp	w19, 0
	ble	.L359
	ldr	x4, [x23]
	add	x3, x0, x1, lsl 4
	sub	x3, x3, #8
	sub	w2, w19, #1
	cmp	x4, x3
	add	x3, x4, x1, lsl 3
	ccmp	x0, x3, 2, cc
	ccmp	w2, 13, 0, cs
	bls	.L357
	add	x3, x0, 8
	mov	x2, 0
	mov	x5, 16
	whilelo	p0.d, wzr, w19
	index	z1.d, #0, x5
	index	z0.d, #0, #1
.L358:
	ld1d	z2.d, p0/z, [x4, x2, lsl 3]
	sub	x5, x3, #8
	st1d	z2.d, p0, [x5, z1.d]
	add	x2, x2, 8
	st1w	z0.d, p0, [x3, z1.d]
	add	x3, x3, 128
	add	z0.s, z0.s, #8
	whilelo	p0.d, w2, w19
	b.any	.L358
.L359:
	adrp	x3, compare_tokens
	mov	x2, 16
	add	x3, x3, :lo12:compare_tokens
	bl	qsort
	b	.L355
.L357:
	mov	x3, x0
	mov	x2, 0
.L360:
	ldr	x5, [x4, x2, lsl 3]
	str	x5, [x3]
	str	w2, [x3, 8]
	add	x2, x2, 1
	add	x3, x3, 16
	cmp	w19, w2
	bgt	.L360
	b	.L359
.L425:
	adrp	x3, :got:stderr
	mov	x2, 24
	mov	x1, 1
	adrp	x0, .LC9
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC9
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE85:
	.size	encode, .-encode
	.align	2
	.p2align 4,,11
	.global	sample_argmax
	.type	sample_argmax, %function
sample_argmax:
.LFB86:
	.cfi_startproc
	mov	x3, x0
	ldr	s1, [x0]
	cmp	w1, 1
	ble	.L436
	mov	x2, 1
	mov	w0, 0
	.p2align 3,,7
.L435:
	ldr	s0, [x3, x2, lsl 2]
	fcmpe	s1, s0
	bmi	.L437
.L434:
	add	x2, x2, 1
	cmp	w1, w2
	bgt	.L435
	ret
	.p2align 2,,3
.L437:
	fmov	s1, s0
	mov	w0, w2
	b	.L434
	.p2align 2,,3
.L436:
	mov	w0, 0
	ret
	.cfi_endproc
.LFE86:
	.size	sample_argmax, .-sample_argmax
	.align	2
	.p2align 4,,11
	.global	sample_mult
	.type	sample_mult, %function
sample_mult:
.LFB87:
	.cfi_startproc
	mov	x3, x0
	cmp	w1, 0
	ble	.L440
	movi	v1.2s, #0
	mov	x2, 0
	.p2align 3,,7
.L442:
	ldr	s2, [x3, x2, lsl 2]
	mov	w0, w2
	add	x2, x2, 1
	fadd	s1, s1, s2
	fcmpe	s1, s0
	bgt	.L439
	cmp	w1, w2
	bgt	.L442
.L440:
	sub	w0, w1, #1
.L439:
	ret
	.cfi_endproc
.LFE87:
	.size	sample_mult, .-sample_mult
	.align	2
	.p2align 4,,11
	.global	sample_topp
	.type	sample_topp, %function
sample_topp:
.LFB89:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	sub	w3, w1, #1
	fmov	s3, 1.0e+0
	mov	x29, sp
	stp	d8, d9, [sp, 32]
	.cfi_offset 72, -16
	.cfi_offset 73, -8
	fmov	s8, s0
	scvtf	s0, w3
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -32
	.cfi_offset 20, -24
	mov	x20, x2
	fsub	s3, s3, s8
	fdiv	s3, s3, s0
	cmp	w1, 0
	ble	.L445
	fmov	s9, s1
	mov	x3, 0
	mov	w19, 0
	.p2align 3,,7
.L448:
	ldr	s2, [x0, x3, lsl 2]
	sbfiz	x2, x19, 3, 32
	add	x4, x20, x2
	fcmpe	s3, s2
	bls	.L460
.L446:
	add	x3, x3, 1
	cmp	w1, w3
	bgt	.L448
	adrp	x3, compare
	sxtw	x1, w19
	add	x3, x3, :lo12:compare
	mov	x0, x20
	mov	x2, 8
	bl	qsort
	cbz	w19, .L459
	movi	v2.2s, #0
	mov	x1, 0
	.p2align 3,,7
.L452:
	lsl	x3, x1, 3
	mov	w2, w1
	add	x1, x1, 1
	ldr	s3, [x20, x3]
	fadd	s2, s2, s3
	fcmpe	s8, s2
	bmi	.L469
	cmp	w19, w1
	bgt	.L452
	sub	w2, w19, #1
.L469:
	fmul	s2, s2, s9
	movi	v0.2s, #0
	mov	x0, x20
	mov	w1, 0
	.p2align 3,,7
.L457:
	ldr	s1, [x0]
	fadd	s0, s0, s1
	fcmpe	s0, s2
	bgt	.L461
	add	w1, w1, 1
	add	x0, x0, 8
	cmp	w1, w2
	ble	.L457
	sbfiz	x2, x2, 3, 32
.L450:
	add	x20, x20, x2
	ldp	d8, d9, [sp, 32]
	ldr	w0, [x20, 4]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L460:
	.cfi_restore_state
	str	w3, [x4, 4]
	add	w19, w19, 1
	str	s2, [x20, x2]
	b	.L446
	.p2align 2,,3
.L461:
	ldr	w0, [x0, 4]
	ldp	x19, x20, [sp, 16]
	ldp	d8, d9, [sp, 32]
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L445:
	.cfi_restore_state
	mov	x2, 8
	mov	x0, x20
	adrp	x3, compare
	mov	x1, 0
	add	x3, x3, :lo12:compare
	bl	qsort
	mov	x2, -8
	b	.L450
.L459:
	mov	x2, -8
	b	.L450
	.cfi_endproc
.LFE89:
	.size	sample_topp, .-sample_topp
	.align	2
	.p2align 4,,11
	.type	sample.part.0, %function
sample.part.0:
.LFB102:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -32
	.cfi_offset 22, -24
	mov	x22, x0
	ldr	w21, [x0]
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -48
	.cfi_offset 20, -40
	mov	x19, x1
	stp	d8, d9, [sp, 48]
	.cfi_offset 72, -16
	.cfi_offset 73, -8
	cmp	w21, 0
	ble	.L471
	add	x0, x1, w21, sxtw 2
	add	x1, x22, 16
	cmp	x0, x1
	add	x0, x22, 20
	ccmp	x19, x0, 2, hi
	bcc	.L490
	mov	x1, 0
	ptrue	p1.b, vl64
	whilelo	p0.s, wzr, w21
	ld1rw	z1.s, p1/z, [x22, 16]
	.p2align 3,,7
.L473:
	ld1w	z0.s, p0/z, [x19, x1, lsl 2]
	fdiv	z0.s, p1/m, z0.s, z1.s
	st1w	z0.s, p0, [x19, x1, lsl 2]
	add	x1, x1, 16
	whilelo	p0.s, w1, w21
	b.any	.L473
.L474:
	ldr	s9, [x19]
	cmp	w21, 1
	ble	.L475
	mov	x1, 1
	.p2align 3,,7
.L478:
	ldr	s0, [x19, x1, lsl 2]
	fcmpe	s0, s9
	bgt	.L491
.L476:
	add	x1, x1, 1
	cmp	w21, w1
	bgt	.L478
	movi	v8.2s, #0
	mov	x20, 0
	.p2align 3,,7
.L479:
	ldr	s0, [x19, x20, lsl 2]
	fsub	s0, s0, s9
	bl	expf
	str	s0, [x19, x20, lsl 2]
	add	x20, x20, 1
	fadd	s8, s8, s0
	cmp	w21, w20
	bgt	.L479
.L489:
	cmp	w21, 0
	mov	x1, 0
	csinc	w0, w21, wzr, gt
	mov	z8.s, s8
	ptrue	p1.b, vl64
	whilelo	p0.s, wzr, w0
	.p2align 3,,7
.L482:
	ld1w	z0.s, p0/z, [x19, x1, lsl 2]
	fdiv	z0.s, p1/m, z0.s, z8.s
	st1w	z0.s, p0, [x19, x1, lsl 2]
	add	x1, x1, 16
	whilelo	p0.s, w1, w0
	b.any	.L482
.L481:
	ldr	x1, [x22, 24]
	mov	x0, 56605
	movk	x0, 0x4f6c, lsl 16
	ldr	s0, [x22, 20]
	movk	x0, 0xf491, lsl 32
	eor	x1, x1, x1, lsr 12
	movk	x0, 0x2545, lsl 48
	fcmpe	s0, #0.0
	eor	x1, x1, x1, lsl 25
	eor	x1, x1, x1, lsr 27
	str	x1, [x22, 24]
	mul	x1, x1, x0
	fmov	d1, x1
	ushr	d1, d1, 40
	scvtf	s1, s1, #24
	bls	.L483
	fmov	s2, 1.0e+0
	fcmpe	s0, s2
	bge	.L483
	mov	w1, w21
	mov	x0, x19
	ldr	x2, [x22, 8]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	b	sample_topp
	.p2align 2,,3
.L483:
	.cfi_restore_state
	cmp	w21, 0
	ble	.L486
	movi	v0.2s, #0
	mov	x1, 0
	.p2align 3,,7
.L488:
	ldr	s2, [x19, x1, lsl 2]
	mov	w0, w1
	add	x1, x1, 1
	fadd	s0, s0, s2
	fcmpe	s1, s0
	bmi	.L470
	cmp	w21, w1
	bgt	.L488
.L486:
	sub	w0, w21, #1
.L470:
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	d8, d9, [sp, 48]
	ldp	x29, x30, [sp], 64
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L491:
	.cfi_restore_state
	fmov	s9, s0
	b	.L476
	.p2align 2,,3
.L490:
	mov	x0, 0
	.p2align 3,,7
.L472:
	ldr	s0, [x19, x0, lsl 2]
	ldr	s1, [x22, 16]
	fdiv	s0, s0, s1
	str	s0, [x19, x0, lsl 2]
	add	x0, x0, 1
	cmp	w21, w0
	bgt	.L472
	b	.L474
	.p2align 2,,3
.L471:
	ldr	s9, [x1]
.L475:
	cmp	w21, 1
	bne	.L481
	ldr	s0, [x19]
	fsub	s0, s0, s9
	bl	expf
	str	s0, [x19]
	movi	v8.2s, #0
	fadd	s8, s0, s8
	b	.L489
	.cfi_endproc
.LFE102:
	.size	sample.part.0, .-sample.part.0
	.align	2
	.p2align 4,,11
	.global	build_sampler
	.type	build_sampler, %function
build_sampler:
.LFB90:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	mov	x19, x0
	sbfiz	x0, x1, 3, 32
	str	w1, [x19]
	str	x2, [x19, 24]
	stp	s0, s1, [x19, 16]
	bl	malloc
	str	x0, [x19, 8]
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE90:
	.size	build_sampler, .-build_sampler
	.align	2
	.p2align 4,,11
	.global	free_sampler
	.type	free_sampler, %function
free_sampler:
.LFB91:
	.cfi_startproc
	ldr	x0, [x0, 8]
	b	free
	.cfi_endproc
.LFE91:
	.size	free_sampler, .-free_sampler
	.align	2
	.p2align 4,,11
	.global	random_u32
	.type	random_u32, %function
random_u32:
.LFB92:
	.cfi_startproc
	ldr	x1, [x0]
	mov	x2, 56605
	movk	x2, 0x4f6c, lsl 16
	movk	x2, 0xf491, lsl 32
	eor	x1, x1, x1, lsr 12
	movk	x2, 0x2545, lsl 48
	eor	x1, x1, x1, lsl 25
	eor	x1, x1, x1, lsr 27
	str	x1, [x0]
	mul	x0, x1, x2
	lsr	x0, x0, 32
	ret
	.cfi_endproc
.LFE92:
	.size	random_u32, .-random_u32
	.align	2
	.p2align 4,,11
	.global	random_f32
	.type	random_f32, %function
random_f32:
.LFB93:
	.cfi_startproc
	ldr	x1, [x0]
	mov	x2, 56605
	movk	x2, 0x4f6c, lsl 16
	movk	x2, 0xf491, lsl 32
	eor	x1, x1, x1, lsr 12
	movk	x2, 0x2545, lsl 48
	eor	x1, x1, x1, lsl 25
	eor	x1, x1, x1, lsr 27
	str	x1, [x0]
	mul	x1, x1, x2
	fmov	d0, x1
	ushr	d0, d0, 40
	scvtf	s0, s0, #24
	ret
	.cfi_endproc
.LFE93:
	.size	random_f32, .-random_f32
	.align	2
	.p2align 4,,11
	.global	sample
	.type	sample, %function
sample:
.LFB94:
	.cfi_startproc
	ldr	s0, [x0, 16]
	mov	x3, x1
	fcmp	s0, #0.0
	bne	.L506
	ldr	w1, [x0]
	ldr	s1, [x3]
	cmp	w1, 1
	ble	.L510
	mov	x2, 1
	mov	w0, 0
	.p2align 3,,7
.L509:
	ldr	s0, [x3, x2, lsl 2]
	fcmpe	s1, s0
	bmi	.L511
.L508:
	add	x2, x2, 1
	cmp	w1, w2
	bgt	.L509
	ret
	.p2align 2,,3
.L506:
	b	sample.part.0
	.p2align 2,,3
.L511:
	fmov	s1, s0
	mov	w0, w2
	b	.L508
	.p2align 2,,3
.L510:
	mov	w0, 0
	ret
	.cfi_endproc
.LFE94:
	.size	sample, .-sample
	.align	2
	.p2align 4,,11
	.global	time_in_ms
	.type	time_in_ms, %function
time_in_ms:
.LFB95:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	adrp	x2, :got:__stack_chk_guard
	mov	w0, 0
	mov	x29, sp
	ldr	x2, [x2, #:got_lo12:__stack_chk_guard]
	add	x1, sp, 24
	ldr	x3, [x2]
	str	x3, [sp, 40]
	mov	x3, 0
	bl	clock_gettime
	ldp	x4, x2, [sp, 24]
	mov	x1, 13531
	movk	x1, 0xd7b6, lsl 16
	adrp	x3, :got:__stack_chk_guard
	movk	x1, 0xde82, lsl 32
	movk	x1, 0x431b, lsl 48
	ldr	x3, [x3, #:got_lo12:__stack_chk_guard]
	smulh	x1, x2, x1
	lsl	x0, x4, 5
	sub	x0, x0, x4
	asr	x1, x1, 18
	add	x0, x4, x0, lsl 2
	sub	x2, x1, x2, asr 63
	ldr	x1, [sp, 40]
	ldr	x4, [x3]
	subs	x1, x1, x4
	mov	x4, 0
	add	x0, x2, x0, lsl 3
	bne	.L516
	ldp	x29, x30, [sp], 48
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
.L516:
	.cfi_restore_state
	bl	__stack_chk_fail
	.cfi_endproc
.LFE95:
	.size	time_in_ms, .-time_in_ms
	.section	.rodata.str1.8
	.align	3
.LC11:
	.string	""
	.align	3
.LC12:
	.string	"something is wrong, expected at least 1 prompt token\n"
	.align	3
.LC13:
	.string	"achieved tok/s: %f\n"
	.text
	.align	2
	.p2align 4,,11
	.global	generate
	.type	generate, %function
generate:
.LFB96:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	adrp	x5, :got:__stack_chk_guard
	cmp	x3, 0
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -144
	.cfi_offset 20, -136
	mov	x19, x3
	adrp	x6, .LC11
	ldr	x3, [x5, #:got_lo12:__stack_chk_guard]
	stp	x21, x22, [sp, 32]
	add	x6, x6, :lo12:.LC11
	stp	x23, x24, [sp, 48]
	.cfi_offset 21, -128
	.cfi_offset 22, -120
	.cfi_offset 23, -112
	.cfi_offset 24, -104
	mov	x23, x1
	csel	x19, x6, x19, eq
	stp	x25, x26, [sp, 64]
	mov	w20, w4
	.cfi_offset 25, -96
	.cfi_offset 26, -88
	mov	x26, x0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -80
	.cfi_offset 28, -72
	mov	x0, x19
	mov	x28, x2
	ldr	x1, [x3]
	str	x1, [sp, 152]
	mov	x1, 0
	str	wzr, [sp, 132]
	bl	strlen
	add	x0, x0, 3
	lsl	x0, x0, 2
	bl	malloc
	mov	x25, x0
	mov	x1, x19
	mov	x0, x23
	mov	x4, x25
	add	x5, sp, 132
	mov	w3, 0
	mov	w2, 1
	bl	encode
	ldr	w24, [sp, 132]
	cmp	w24, 0
	ble	.L562
	ldr	w22, [x25]
	cmp	w20, 0
	ble	.L520
	sub	w0, w24, #1
	adrp	x27, .LC7
	add	x27, x27, :lo12:.LC7
	str	w0, [sp, 112]
	sxtw	x0, w20
	mov	x19, 0
	mov	x21, 0
	str	x0, [sp, 104]
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	str	x0, [sp, 120]
	.p2align 3,,7
.L537:
	mov	w1, w22
	mov	w2, w19
	mov	x0, x26
	bl	forward
	ldr	w1, [sp, 112]
	str	w19, [sp, 100]
	str	w19, [sp, 116]
	cmp	w19, w1
	bge	.L521
	add	x0, x25, 4
	ldr	w20, [x0, x19, lsl 2]
.L522:
	cmp	w20, 1
	beq	.L527
	sbfiz	x1, x20, 3, 32
.L524:
	ldr	x0, [x23]
	ldr	x24, [x0, x1]
	cmp	w22, 1
	beq	.L563
	add	x22, sp, 136
	mov	x1, x27
	mov	x2, x22
	mov	x0, x24
	bl	__isoc99_sscanf
	cmp	w0, 1
	beq	.L540
	cbz	x24, .L532
.L531:
	ldrb	w1, [x24]
	str	w1, [sp, 96]
	cbz	w1, .L532
	ldrb	w0, [x24, 1]
	cbnz	w0, .L534
	bl	__ctype_b_loc
	ldr	w1, [sp, 96]
	ldr	x0, [x0]
	ubfiz	x1, x1, 1, 8
	ldrh	w0, [x0, x1]
	tst	w0, 24576
	beq	.L532
.L534:
	ldr	x1, [sp, 120]
	mov	x2, x24
	mov	w0, 1
	bl	__printf_chk
.L532:
	adrp	x0, :got:stdout
	ldr	x0, [x0, #:got_lo12:stdout]
	ldr	x0, [x0]
	bl	fflush
	cbz	x21, .L564
	ldr	x0, [sp, 104]
	add	x19, x19, 1
	cmp	x19, x0
	beq	.L527
.L536:
	mov	w22, w20
	b	.L537
	.p2align 2,,3
.L564:
	mov	x1, x22
	mov	w0, 0
	bl	clock_gettime
	add	x19, x19, 1
	ldp	x2, x0, [sp, 136]
	mov	x1, 13531
	movk	x1, 0xd7b6, lsl 16
	movk	x1, 0xde82, lsl 32
	movk	x1, 0x431b, lsl 48
	lsl	x21, x2, 5
	smulh	x1, x0, x1
	sub	x21, x21, x2
	asr	x1, x1, 18
	add	x21, x2, x21, lsl 2
	sub	x0, x1, x0, asr 63
	add	x21, x0, x21, lsl 3
	ldr	x0, [sp, 104]
	cmp	x0, x19
	bne	.L536
	.p2align 3,,7
.L527:
	mov	w0, 10
	bl	putchar
	ldr	w0, [sp, 100]
	cbz	w0, .L538
	add	x1, sp, 136
	mov	w0, 0
	bl	clock_gettime
	ldp	x5, x3, [sp, 136]
	mov	x1, 13531
	movk	x1, 0xd7b6, lsl 16
	ldr	w0, [sp, 116]
	movk	x1, 0xde82, lsl 32
	adrp	x4, :got:stderr
	movk	x1, 0x431b, lsl 48
	mov	x2, 70368744177664
	scvtf	d0, w0
	movk	x2, 0x408f, lsl 48
	smulh	x1, x3, x1
	lsl	x0, x5, 5
	sub	x0, x0, x5
	fmov	d2, x2
	ldr	x4, [x4, #:got_lo12:stderr]
	asr	x1, x1, 18
	add	x0, x5, x0, lsl 2
	sub	x3, x1, x3, asr 63
	adrp	x2, .LC13
	mov	w1, 1
	add	x0, x3, x0, lsl 3
	add	x2, x2, :lo12:.LC13
	sub	x3, x0, x21
	ldr	x0, [x4]
	scvtf	d1, x3
	fdiv	d0, d0, d1
	fmul	d0, d0, d2
	bl	__fprintf_chk
.L538:
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 152]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L565
	mov	x0, x25
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 160
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	b	free
	.p2align 2,,3
.L521:
	.cfi_restore_state
	ldr	s0, [x28, 16]
	fcmp	s0, #0.0
	bne	.L523
	ldr	w1, [x28]
	ldr	s1, [x0]
	cmp	w1, 1
	ble	.L543
	mov	x2, 1
	mov	w20, 0
	.p2align 3,,7
.L526:
	ldr	s0, [x0, x2, lsl 2]
	fcmpe	s0, s1
	bgt	.L544
.L525:
	add	x2, x2, 1
	cmp	w1, w2
	bgt	.L526
	b	.L522
	.p2align 2,,3
.L544:
	fmov	s1, s0
	mov	w20, w2
	b	.L525
	.p2align 2,,3
.L563:
	ldrb	w0, [x24]
	add	x22, sp, 136
	mov	x2, x22
	mov	x1, x27
	cmp	w0, 32
	cinc	x24, x24, eq
	mov	x0, x24
	bl	__isoc99_sscanf
	cmp	w0, 1
	bne	.L531
.L540:
	ldrb	w3, [sp, 136]
	add	x0, x23, 32
	add	x24, x0, w3, uxtb 1
	b	.L531
	.p2align 2,,3
.L523:
	mov	x1, x0
	mov	x0, x28
	bl	sample.part.0
	mov	w20, w0
	b	.L522
	.p2align 2,,3
.L543:
	mov	x1, 0
	mov	w20, 0
	b	.L524
.L520:
	mov	w0, 10
	bl	putchar
	b	.L538
.L562:
	adrp	x3, :got:stderr
	mov	x2, 53
	mov	x1, 1
	adrp	x0, .LC12
	ldr	x3, [x3, #:got_lo12:stderr]
	add	x0, x0, :lo12:.LC12
	ldr	x3, [x3]
	bl	fwrite
	mov	w0, 1
	bl	exit
.L565:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE96:
	.size	generate, .-generate
	.align	2
	.p2align 4,,11
	.global	read_stdin
	.type	read_stdin, %function
read_stdin:
.LFB97:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -16
	.cfi_offset 20, -8
	mov	x19, x1
	mov	x20, x2
	adrp	x1, .LC8
	mov	x2, x0
	add	x1, x1, :lo12:.LC8
	mov	w0, 1
	bl	__printf_chk
	adrp	x3, :got:stdin
	mov	w2, w20
	mov	x0, x19
	mov	x1, -1
	ldr	x3, [x3, #:got_lo12:stdin]
	ldr	x3, [x3]
	bl	__fgets_chk
	cbz	x0, .L566
	mov	x0, x19
	bl	strlen
	cbz	x0, .L566
	sub	x0, x0, #1
	ldrb	w1, [x19, x0]
	cmp	w1, 10
	beq	.L575
.L566:
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_remember_state
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.p2align 2,,3
.L575:
	.cfi_restore_state
	strb	wzr, [x19, x0]
	ldp	x19, x20, [sp, 16]
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE97:
	.size	read_stdin, .-read_stdin
	.section	.rodata.str1.8
	.align	3
.LC14:
	.string	"Enter system prompt (optional): "
	.align	3
.LC17:
	.string	"Assistant: "
	.align	3
.LC18:
	.string	"User: "
	.text
	.align	2
	.p2align 4,,11
	.global	chat
	.type	chat, %function
chat:
.LFB98:
	.cfi_startproc
	sub	sp, sp, #2400
	.cfi_def_cfa_offset 2400
	adrp	x7, :got:__stack_chk_guard
	stp	x29, x30, [sp]
	.cfi_offset 29, -2400
	.cfi_offset 30, -2392
	mov	x29, sp
	ldr	x7, [x7, #:got_lo12:__stack_chk_guard]
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -2368
	.cfi_offset 22, -2360
	mov	x22, x2
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	.cfi_offset 23, -2352
	.cfi_offset 24, -2344
	.cfi_offset 25, -2336
	.cfi_offset 26, -2328
	mov	x26, x0
	stp	x27, x28, [sp, 80]
	.cfi_offset 27, -2320
	.cfi_offset 28, -2312
	mov	w27, w5
	str	w5, [sp, 100]
	str	x1, [sp, 104]
	str	x4, [sp, 120]
	str	x3, [sp, 136]
	ldr	x0, [x7]
	str	x0, [sp, 2392]
	mov	x0, 0
	str	wzr, [sp, 172]
	mov	x0, 4608
	bl	malloc
	mov	x24, x0
	cmp	w27, 0
	ble	.L602
	add	x28, sp, 728
	adrp	x1, .LC18
	adrp	x0, .LC17
	add	x1, x1, :lo12:.LC18
	add	x0, x0, :lo12:.LC17
	mov	w21, 0
	mov	w23, 1
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -2376
	.cfi_offset 19, -2384
	mov	w19, 0
	str	x0, [sp, 112]
	str	x1, [sp, 128]
	.p2align 3,,7
.L577:
	cbz	w23, .L579
	cbz	w19, .L635
	ldr	x0, [sp, 128]
	mov	x1, x28
	mov	x2, 512
	bl	read_stdin
.L584:
	adrp	x1, .LC16
	add	x1, x1, :lo12:.LC16
	add	x3, sp, 176
	add	x21, sp, 1240
	mov	x0, x21
	mov	x4, x28
	ldp	x8, x9, [x1]
	stp	x8, x9, [sp, 176]
	ldrh	w5, [x1, 16]
	strh	w5, [x3, 16]
	mov	x2, 1152
	mov	w1, 1
	bl	__sprintf_chk
.L585:
	ldr	x0, [sp, 104]
	mov	x1, x21
	add	x5, sp, 172
	mov	x4, x24
	mov	w3, 0
	mov	w2, 1
	bl	encode
	mov	w20, 0
	ldr	x1, [sp, 112]
	mov	w0, 1
	bl	__printf_chk
	ldr	w21, [sp, 172]
.L579:
	mov	w27, w25
	cmp	w20, w21
	bge	.L586
	ldr	w27, [x24, w20, sxtw 2]
	add	w20, w20, 1
.L586:
	cmp	w27, 2
	mov	w2, w19
	cset	w23, eq
	mov	w1, w27
	mov	x0, x26
	add	w19, w19, 1
	bl	forward
	mov	x1, x0
	ldr	s0, [x22, 16]
	fcmp	s0, #0.0
	bne	.L587
	ldr	w0, [x22]
	mov	x2, 1
	mov	w25, 0
	ldr	s1, [x1]
	cmp	w0, 1
	ble	.L636
	.p2align 3,,7
.L588:
	ldr	s0, [x1, x2, lsl 2]
	fcmpe	s1, s0
	bmi	.L611
.L591:
	add	x2, x2, 1
	cmp	w0, w2
	bgt	.L588
.L592:
	cmp	w20, w21
	blt	.L593
	sbfiz	x0, x25, 3, 32
	cmp	w25, 2
	bne	.L589
.L594:
	mov	w25, 2
	mov	w0, 10
	bl	putchar
.L590:
	ldr	w0, [sp, 100]
	cmp	w0, w19
	bne	.L577
	ldp	x19, x20, [sp, 16]
	.cfi_restore 20
	.cfi_restore 19
.L602:
	mov	w0, 10
	bl	putchar
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 2392]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L637
	mov	x0, x24
	ldp	x29, x30, [sp]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	add	sp, sp, 2400
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_def_cfa_offset 0
	b	free
	.p2align 2,,3
.L611:
	.cfi_def_cfa_offset 2400
	.cfi_offset 19, -2384
	.cfi_offset 20, -2376
	.cfi_offset 21, -2368
	.cfi_offset 22, -2360
	.cfi_offset 23, -2352
	.cfi_offset 24, -2344
	.cfi_offset 25, -2336
	.cfi_offset 26, -2328
	.cfi_offset 27, -2320
	.cfi_offset 28, -2312
	.cfi_offset 29, -2400
	.cfi_offset 30, -2392
	fmov	s1, s0
	mov	w25, w2
	b	.L591
	.p2align 2,,3
.L593:
	cmp	w25, 2
	bne	.L590
	b	.L594
	.p2align 2,,3
.L587:
	mov	x0, x22
	bl	sample.part.0
	mov	w25, w0
	b	.L592
	.p2align 2,,3
.L636:
	cmp	w20, w21
	blt	.L590
	mov	x0, 0
	.p2align 3,,7
.L589:
	ldr	x1, [sp, 104]
	ldr	x1, [x1]
	ldr	x4, [x1, x0]
	cmp	w27, 1
	beq	.L638
	mov	x0, x4
	add	x2, sp, 171
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	str	x4, [sp, 144]
	bl	__isoc99_sscanf
	cmp	w0, 1
	ldr	x4, [sp, 144]
	beq	.L603
	cbz	x4, .L599
.L598:
	ldrb	w1, [x4]
	str	w1, [sp, 144]
	cbz	w1, .L599
	ldrb	w0, [x4, 1]
	cbnz	w0, .L601
	str	x4, [sp, 152]
	bl	__ctype_b_loc
	ldr	w1, [sp, 144]
	ldr	x0, [x0]
	ubfiz	x1, x1, 1, 8
	ldr	x4, [sp, 152]
	ldrh	w0, [x0, x1]
	tst	w0, 24576
	beq	.L599
.L601:
	adrp	x1, .LC8
	mov	x2, x4
	add	x1, x1, :lo12:.LC8
	mov	w0, 1
	bl	__printf_chk
.L599:
	adrp	x0, :got:stdout
	ldr	x0, [x0, #:got_lo12:stdout]
	ldr	x0, [x0]
	bl	fflush
	b	.L590
	.p2align 2,,3
.L635:
	ldr	x0, [sp, 120]
	cbz	x0, .L639
	add	x20, sp, 216
	mov	x1, x0
	mov	x2, 512
	mov	x0, x20
	bl	__strcpy_chk
.L582:
	ldr	x0, [sp, 136]
	mov	x2, 512
	cbz	x0, .L583
	mov	x1, x0
	mov	x0, x28
	bl	__strcpy_chk
.L605:
	ldrb	w0, [sp, 216]
	cbz	w0, .L584
	adrp	x1, .LC15
	add	x1, x1, :lo12:.LC15
	add	x3, sp, 176
	add	x21, sp, 1240
	mov	x4, x20
	mov	x0, x21
	ldp	q0, q1, [x1]
	mov	x5, x28
	ldr	x7, [x1, 31]
	mov	x2, 1152
	stp	q0, q1, [x3]
	mov	w1, 1
	str	x7, [x3, 31]
	bl	__sprintf_chk
	b	.L585
	.p2align 2,,3
.L638:
	ldrb	w0, [x4]
	add	x2, sp, 171
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	cmp	w0, 32
	cinc	x4, x4, eq
	str	x4, [sp, 144]
	mov	x0, x4
	bl	__isoc99_sscanf
	cmp	w0, 1
	ldr	x4, [sp, 144]
	bne	.L598
.L603:
	ldr	x0, [sp, 104]
	ldrb	w4, [sp, 171]
	add	x0, x0, 32
	add	x4, x0, w4, uxtb 1
	b	.L598
	.p2align 2,,3
.L639:
	add	x20, sp, 216
	adrp	x0, .LC14
	mov	x1, x20
	add	x0, x0, :lo12:.LC14
	mov	x2, 512
	bl	read_stdin
	b	.L582
.L583:
	ldr	x0, [sp, 128]
	mov	x1, x28
	bl	read_stdin
	b	.L605
.L637:
	.cfi_restore 19
	.cfi_restore 20
	stp	x19, x20, [sp, 16]
	.cfi_offset 20, -2376
	.cfi_offset 19, -2384
	bl	__stack_chk_fail
	.cfi_endproc
.LFE98:
	.size	chat, .-chat
	.section	.rodata.str1.8
	.align	3
.LC16:
	.string	"[INST] %s [/INST]"
	.align	3
.LC15:
	.string	"[INST] <<SYS>>\n%s\n<</SYS>>\n\n%s [/INST]"
	.text
	.section	.rodata.str1.8
	.align	3
.LC19:
	.string	"Usage:   run <checkpoint> [options]\n"
	.align	3
.LC20:
	.string	"Example: run model.bin -n 256 -i \"Once upon a time\"\n"
	.align	3
.LC21:
	.string	"Options:\n"
	.align	3
.LC22:
	.string	"  -t <float>  temperature in [0,inf], default 1.0\n"
	.align	3
.LC23:
	.string	"  -p <float>  p value in top-p (nucleus) sampling in [0,1] default 0.9\n"
	.align	3
.LC24:
	.string	"  -s <int>    random seed, default time(NULL)\n"
	.align	3
.LC25:
	.string	"  -n <int>    number of steps to run for, default 256. 0 = max_seq_len\n"
	.align	3
.LC26:
	.string	"  -i <string> input prompt\n"
	.align	3
.LC27:
	.string	"  -z <string> optional path to custom tokenizer\n"
	.align	3
.LC28:
	.string	"  -m <string> mode: generate|chat, default: generate\n"
	.align	3
.LC29:
	.string	"  -y <string> (optional) system prompt in chat mode\n"
	.text
	.align	2
	.p2align 4,,11
	.global	error_usage
	.type	error_usage, %function
error_usage:
.LFB99:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x2, 36
	mov	x1, 1
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -16
	adrp	x19, :got:stderr
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	ldr	x19, [x19, #:got_lo12:stderr]
	ldr	x3, [x19]
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 52
	mov	x1, 1
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 9
	mov	x1, 1
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 50
	mov	x1, 1
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 71
	mov	x1, 1
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 46
	mov	x1, 1
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 71
	mov	x1, 1
	adrp	x0, .LC25
	add	x0, x0, :lo12:.LC25
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 27
	mov	x1, 1
	adrp	x0, .LC26
	add	x0, x0, :lo12:.LC26
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 48
	mov	x1, 1
	adrp	x0, .LC27
	add	x0, x0, :lo12:.LC27
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 53
	mov	x1, 1
	adrp	x0, .LC28
	add	x0, x0, :lo12:.LC28
	bl	fwrite
	ldr	x3, [x19]
	mov	x2, 52
	mov	x1, 1
	adrp	x0, .LC29
	add	x0, x0, :lo12:.LC29
	bl	fwrite
	mov	w0, 1
	bl	exit
	.cfi_endproc
.LFE99:
	.size	error_usage, .-error_usage
	.section	.rodata.str1.8
	.align	3
.LC30:
	.string	"generate"
	.align	3
.LC31:
	.string	"tokenizer.bin"
	.align	3
.LC32:
	.string	"chat"
	.align	3
.LC33:
	.string	"unknown mode: %s\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 4,,11
	.global	main
	.type	main, %function
main:
.LFB100:
	.cfi_startproc
	sub	sp, sp, #960
	.cfi_def_cfa_offset 960
	adrp	x2, :got:__stack_chk_guard
	stp	x29, x30, [sp]
	.cfi_offset 29, -960
	.cfi_offset 30, -952
	mov	x29, sp
	ldr	x2, [x2, #:got_lo12:__stack_chk_guard]
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	.cfi_offset 19, -944
	.cfi_offset 20, -936
	.cfi_offset 21, -928
	.cfi_offset 22, -920
	.cfi_offset 23, -912
	.cfi_offset 24, -904
	.cfi_offset 25, -896
	.cfi_offset 26, -888
	.cfi_offset 27, -880
	.cfi_offset 28, -872
	.cfi_offset 72, -864
	.cfi_offset 73, -856
	ldr	x3, [x2]
	str	x3, [sp, 952]
	mov	x3, 0
	cmp	w0, 1
	ble	.L679
	ldr	x2, [x1, 8]
	str	x2, [sp, 112]
	cmp	w0, 2
	beq	.L667
	cmp	w0, 3
	beq	.L679
	sub	w20, w0, #4
	sub	w19, w0, #3
	add	x0, x1, 40
	add	x28, x1, 24
	lsr	w20, w20, 1
	lsr	w19, w19, 1
	adrp	x1, .LC30
	adrp	x23, .LC31
	add	x20, x0, w20, uxtw 4
	mov	w0, 26214
	movk	w0, 0x3f66, lsl 16
	add	x19, x28, w19, uxtw 4
	add	x26, x1, :lo12:.LC30
	add	x23, x23, :lo12:.LC31
	mov	x25, 0
	fmov	s9, w0
	mov	x21, 0
	mov	x24, 0
	mov	w22, 256
	fmov	s8, 1.0e+0
	str	x1, [sp, 120]
	b	.L647
	.p2align 2,,3
.L648:
	cmp	w0, 112
	beq	.L680
	cmp	w0, 115
	beq	.L681
	cmp	w0, 110
	beq	.L682
	cmp	w0, 105
	beq	.L683
	cmp	w0, 122
	beq	.L684
	cmp	w0, 109
	beq	.L685
	cmp	w0, 121
	bne	.L679
	ldr	x25, [x28]
	.p2align 3,,7
.L649:
	cmp	x19, x28
	beq	.L686
.L656:
	add	x28, x28, 16
	cmp	x20, x28
	beq	.L679
.L647:
	ldr	x27, [x28, -8]
	ldrb	w0, [x27]
	cmp	w0, 45
	bne	.L679
	mov	x0, x27
	bl	strlen
	cmp	x0, 2
	bne	.L679
	ldrb	w0, [x27, 1]
	cmp	w0, 116
	bne	.L648
	ldr	x0, [x28]
	mov	x1, 0
	bl	strtod
	fcvt	s8, d0
	cmp	x19, x28
	bne	.L656
.L686:
	cbz	x21, .L644
.L657:
	fcmpe	s8, #0.0
	bmi	.L670
.L658:
	fcmpe	s9, #0.0
	bmi	.L669
	fmov	s0, 1.0e+0
	fcmpe	s9, s0
	bgt	.L669
	b	.L660
	.p2align 2,,3
.L680:
	ldr	x0, [x28]
	mov	x1, 0
	bl	strtod
	fcvt	s9, d0
	b	.L649
	.p2align 2,,3
.L683:
	ldr	x24, [x28]
	b	.L649
	.p2align 2,,3
.L681:
	ldr	x0, [x28]
	mov	w2, 10
	mov	x1, 0
	bl	strtol
	sxtw	x21, w0
	b	.L649
	.p2align 2,,3
.L682:
	ldr	x0, [x28]
	mov	w2, 10
	mov	x1, 0
	bl	strtol
	mov	w22, w0
	b	.L649
	.p2align 2,,3
.L684:
	ldr	x23, [x28]
	b	.L649
	.p2align 2,,3
.L685:
	ldr	x26, [x28]
	b	.L649
	.p2align 2,,3
.L669:
	mov	w0, 26214
	movk	w0, 0x3f66, lsl 16
	fmov	s9, w0
.L660:
	ldr	x1, [sp, 112]
	add	x19, sp, 160
	mov	x0, x19
	bl	build_transformer
	ldr	w0, [sp, 184]
	cmp	w22, 0
	bgt	.L677
.L661:
	mov	w22, w0
.L662:
	ldr	w2, [sp, 180]
	add	x20, sp, 408
	mov	x1, x23
	mov	x0, x20
	bl	build_tokenizer
	stp	s8, s9, [sp, 144]
	ldr	w0, [sp, 180]
	str	w0, [sp, 128]
	str	x21, [sp, 152]
	sbfiz	x0, x0, 3, 32
	bl	malloc
	mov	x2, x0
	str	x2, [sp, 136]
	ldr	x0, [sp, 120]
	add	x1, x0, :lo12:.LC30
	mov	x0, x26
	bl	strcmp
	cbz	w0, .L687
	adrp	x1, .LC32
	mov	x0, x26
	add	x1, x1, :lo12:.LC32
	bl	strcmp
	cbnz	w0, .L665
	mov	w5, w22
	mov	x4, x25
	mov	x3, x24
	add	x2, sp, 128
	mov	x1, x20
	mov	x0, x19
	bl	chat
.L664:
	ldr	x0, [sp, 136]
	bl	free
	mov	x0, x20
	bl	free_tokenizer
	mov	x0, x19
	bl	free_transformer
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x2, [sp, 952]
	ldr	x1, [x0]
	subs	x2, x2, x1
	mov	x1, 0
	bne	.L688
	mov	w0, 0
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	add	sp, sp, 960
	.cfi_remember_state
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 72
	.cfi_restore 73
	.cfi_def_cfa_offset 0
	ret
.L677:
	.cfi_restore_state
	cmp	w0, w22
	bge	.L662
	b	.L661
.L670:
	movi	v8.2s, #0
	b	.L658
.L667:
	adrp	x0, .LC30
	adrp	x23, .LC31
	add	x26, x0, :lo12:.LC30
	add	x23, x23, :lo12:.LC31
	str	x0, [sp, 120]
	mov	w0, 26214
	movk	w0, 0x3f66, lsl 16
	mov	x25, 0
	fmov	s8, 1.0e+0
	mov	x24, 0
	mov	w22, 256
	fmov	s9, w0
.L644:
	mov	x0, 0
	bl	time
	uxtw	x21, w0
	b	.L657
.L687:
	mov	w4, w22
	mov	x3, x24
	add	x2, sp, 128
	mov	x1, x20
	mov	x0, x19
	bl	generate
	b	.L664
.L665:
	adrp	x0, :got:stderr
	adrp	x2, .LC33
	mov	x3, x26
	add	x2, x2, :lo12:.LC33
	ldr	x0, [x0, #:got_lo12:stderr]
	mov	w1, 1
	ldr	x0, [x0]
	bl	__fprintf_chk
.L679:
	bl	error_usage
.L688:
	bl	__stack_chk_fail
	.cfi_endproc
.LFE100:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
