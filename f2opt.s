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
	.file	"f2opt.c"
	.comm	a,160000,4
	.comm	c,160000,4
	.text
	.align	2
	.global	arrgen2d
	.type	arrgen2d, %function
arrgen2d:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L3
.L4:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	mul	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
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
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L3:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L4
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L5
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
	.size	arrgen2d, .-arrgen2d
	.align	2
	.global	f2
	.type	f2, %function
f2:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-40] @ *a
	str	r1, [fp, #-44] @ *c
	str	r2, [fp, #-48] @ rows
	str	r3, [fp, #-52] @ columns
	ldr	r3, [fp, #-48] @( 
	sub	r3, r3, #2
	str	r3, [fp, #-20] @ int r = rows - 2;)
	ldr	r3, [fp, #-52] @(
	sub	r3, r3, #2
	str	r3, [fp, #-24]  @ int co = cols - 2;)
	ldr	r3, [fp, #-20] @(
	str	r3, [fp, #-8] @ i = r)
	b	.L7 @ Outer Loop Conditional
.L10:
	ldr	r3, [fp, #-8] @(
	ldr	r2, [fp, #-52]
	mul	r3, r2, r3
	str	r3, [fp, #-28] @ pre = i*cols;);
	ldr	r2, [fp, #-28] @( 
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-16] @ prej = pre + co;)
	ldr	r3, [fp, #-24] @ (
	str	r3, [fp, #-12] @ prej = pre + co;)
	b	.L8 @ Inner Loop Conditional
.L9:
	ldr	r3, [fp, #-16] @(
	sub	r3, r3, #1
	str	r3, [fp, #-16] @ prej--;)
	ldr	r2, [fp, #-16] @ (
	ldr	r3, [fp, #-52]
	rsb	r3, r3, r2
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	str	r3, [fp, #-32] @ avg = a[prej - cols];)
	ldr	r2, [fp, #-16] @(
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32] @ avg += a[prej + cols];)
	ldr	r3, [fp, #-16] @(
	sub	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32] @ avg += a[prej + (-1)];)
	ldr	r3, [fp, #-16] @(
	add	r3, r3, #1
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32] @ avg += a[prej + (+1)];)
	ldr	r3, [fp, #-16] @(
	mov	r3, r3, asl #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	mov	r2, r2, asr #2
	str	r2, [r3, #0] @ c[prej] = avg >> 2; );
	ldr	r3, [fp, #-12] @(
	sub	r3, r3, #1
	str	r3, [fp, #-12] @ j--)
.L8:
	ldr	r3, [fp, #-12] @(
	cmp	r3, #0 @ j > 0)
	bgt	.L9 @ Inner Loop Body
	ldr	r3, [fp, #-8] @(
	sub	r3, r3, #1
	str	r3, [fp, #-8] @ i--)
.L7:
	ldr	r3, [fp, #-8] @( 
	cmp	r3, #0 @ i > 0)
	bgt	.L10 @ Outer Loop Body
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	f2, .-f2
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
	ldr	r0, .L14
	mov	r1, #200
	mov	r2, #200
	bl	arrgen2d
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L12
.L13:
	ldr	r0, .L14
	ldr	r1, .L14+4
	mov	r2, #200
	mov	r3, #200
	bl	f2
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r2, [fp, #-8]
	ldr	r3, .L14+8
	cmp	r2, r3
	ble	.L13
	sub	sp, fp, #4
	ldmfd	sp!, {fp, pc}
.L15:
	.align	2
.L14:
	.word	a
	.word	c
	.word	999
	.size	main, .-main
	.ident	"GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
	.section	.note.GNU-stack,"",%progbits
