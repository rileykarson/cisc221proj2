	.arch armv6
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"f5.c"
	.comm	a,160000,4
	.comm	b,800,4
	.comm	c,160000,4
	.text
	.align	2
	.global	arrgen
	.type	arrgen, %function
arrgen:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L3:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	bl	rand
	mov	r3, r0
	mov	r2, r3, asr #31
	mov	r2, r2, lsr #19
	add	r3, r3, r2
	mov	r3, r3, asl #19
	mov	r3, r3, lsr #19
	rsb	r3, r2, r3
	str	r3, [r4, #0]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	arrgen, .-arrgen
	.align	2
	.global	ipow
	.type	ipow, %function
ipow:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L5
.L7:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-20]
	mov	r3, r3, asr #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	mul	r3, r2, r3
	str	r3, [fp, #-16]
.L5:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L7
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	ipow, .-ipow
	.align	2
	.global	f5
	.type	f5, %function
f5:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #24
	str	r0, [fp, #-24] ///int *b;
	str	r1, [fp, #-28] ///int size;
	str	r2, [fp, #-32] /// int mf;
	mov	r3, #0		///x = 0;
	str	r3, [fp, #-16]
	b	.L9
.L10:
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r5, [r3, #0]
	ldr	r0, [fp, #-32]
	mov	r1, #3
	bl	ipow
	mov	r3, r0
	add	r3, r5, r3
	str	r3, [r4, #0] ///b[x] = b[x] + ipow(mf,3);
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16] ///x++;
			       ///}
.L9:
	ldr	r3, [fp, #-28]
	ldr	r2, .L11
	smull	r1, r2, r2, r3
	mov	r3, r3, asr #31
	rsb	r2, r3, r2
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L10	///while (x<=size/3){
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, pc}
.L12:
	.align	2
.L11:
	.word	1431655766
	.size	f5, .-f5
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #0
	bl	time
	mov	r3, r0
	mov	r0, r3
	bl	srand
	ldr	r0, .L16
	mov	r1, #200
	bl	arrgen
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L14
.L15:
	ldr	r0, .L16
	mov	r1, #120
	mov	r2, #4
	bl	f5
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L14:
	ldr	r2, [fp, #-8]
	ldr	r3, .L16+4
	cmp	r2, r3
	ble	.L15
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L17:
	.align	2
.L16:
	.word	b
	.word	999999
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
