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
        .file   "f3opt.c"
        .comm   a,160000,4
        .comm   b,800,4
        .text
        .align  2
        .global arrgen
        .type   arrgen, %function
arrgen:
        @ args = 0, pretend = 0, frame = 16
        @ frame_needed = 1, uses_anonymous_args = 0
        stmfd   sp!, {r4, fp, lr}
        add     fp, sp, #8
        sub     sp, sp, #20
        str     r0, [fp, #-24]
        str     r1, [fp, #-28]
        mov     r3, #0
        str     r3, [fp, #-16]
        b       .L2
.L3:
        ldr     r3, [fp, #-16]
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-24]
        add     r4, r2, r3
        bl      rand
        mov     r3, r0
        mov     r2, r3, asr #31
        mov     r2, r2, lsr #19
        add     r3, r3, r2
        mov     r3, r3, asl #19
        mov     r3, r3, lsr #19
        rsb     r3, r2, r3
        str     r3, [r4, #0]
        ldr     r3, [fp, #-16]
        add     r3, r3, #1
        str     r3, [fp, #-16]
.L2:
        ldr     r2, [fp, #-16]
        ldr     r3, [fp, #-28]
        cmp     r2, r3
        blt     .L3
        sub     sp, fp, #8
        ldmfd   sp!, {r4, fp, pc}
        .size   arrgen, .-arrgen
        .align  2
        .global arrgen2d
        .type   arrgen2d, %function
arrgen2d:
        @ args = 0, pretend = 0, frame = 24
        @ frame_needed = 1, uses_anonymous_args = 0
        stmfd   sp!, {r4, fp, lr}
        add     fp, sp, #8
        sub     sp, sp, #28
        str     r0, [fp, #-24]
        str     r1, [fp, #-28]
        str     r2, [fp, #-32]
        mov     r3, #0
        str     r3, [fp, #-16]
        b       .L5
.L8:
        mov     r3, #0
        str     r3, [fp, #-20]
        b       .L6
.L7:
        ldr     r3, [fp, #-16]
        ldr     r2, [fp, #-32]
        mul     r2, r2, r3
        ldr     r3, [fp, #-20]
        add     r3, r2, r3
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-24]
        add     r4, r2, r3
        bl      rand
        mov     r3, r0
        mov     r2, r3, asr #31
        mov     r2, r2, lsr #19
        add     r3, r3, r2
        mov     r3, r3, asl #19
        mov     r3, r3, lsr #19
        rsb     r3, r2, r3
        str     r3, [r4, #0]
        ldr     r3, [fp, #-20]
        add     r3, r3, #1
        str     r3, [fp, #-20]
.L6:
        ldr     r2, [fp, #-20]
        ldr     r3, [fp, #-32]
        cmp     r2, r3
        blt     .L7
        ldr     r3, [fp, #-16]
        add     r3, r3, #1
        str     r3, [fp, #-16]
.L5:
        ldr     r2, [fp, #-16]
        ldr     r3, [fp, #-28]
        cmp     r2, r3
        blt     .L8
        sub     sp, fp, #8
        ldmfd   sp!, {r4, fp, pc}
        .size   arrgen2d, .-arrgen2d
        .align  2
        .global f3
        .type   f3, %function
f3:
        @ args = 0, pretend = 0, frame = 32
        @ frame_needed = 1, uses_anonymous_args = 0
        @ link register save eliminated.
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #36
        str     r0, [fp, #-24] @a
        str     r1, [fp, #-28] @b
        str     r2, [fp, #-32] @rows
        str     r3, [fp, #-36] @cols
        mov     r3, #0         @(
        str     r3, [fp, #-8]  @i = 0 )
        b       .L10
.L13:
        ldr     r3, [fp, #-8]  @ (
        ldr     r2, [fp, #-36]
        mul     r3, r2, r3
        str     r3, [fp, #-16] @ temp = i*cols)
        ldr     r3, [fp, #-8]  @ (
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-28]
        add     r3, r2, r3
        ldr     r3, [r3, #0]
        str     r3, [fp, #-20] @ val = b[i])
        mov     r3, #0         @(
        str     r3, [fp, #-12] @ j = 0)
        b       .L11
.L12:
        ldr     r2, [fp, #-16] @(
        ldr     r3, [fp, #-12]
        add     r3, r2, r3     
        mov     r3, r3, asl #2 
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        ldr     r2, [fp, #-20]
        str     r2, [r3, #0]   @ a[temp + j] = val)
        ldr     r3, [fp, #-12] @(
        add     r3, r3, #1
        str     r3, [fp, #-12] @ j++)
.L11:
        ldr     r2, [fp, #-12] @(
        ldr     r3, [fp, #-36]
        cmp     r2, r3         @ j < cols)
        blt     .L12
        ldr     r3, [fp, #-8]  @(
        add     r3, r3, #1
        str     r3, [fp, #-8]  @ i++)
.L10:
        ldr     r2, [fp, #-8]  @i
        ldr     r3, [fp, #-32] @rows
        cmp     r2, r3         @(
        blt     .L13           @ i<rows)
        add     sp, fp, #0
        ldmfd   sp!, {fp}
        bx      lr
        .size   f3, .-f3
        .align  2
        .global main
        .type   main, %function
main:
        @ args = 0, pretend = 0, frame = 8
        @ frame_needed = 1, uses_anonymous_args = 0
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #8
        mov     r0, #0
        bl      time
        mov     r3, r0
        mov     r0, r3
        bl      srand
        ldr     r0, .L17
        mov     r1, #200
        bl      arrgen
        ldr     r0, .L17+4
        mov     r1, #200
        mov     r2, #200
        bl      arrgen2d
        mov     r3, #1
        str     r3, [fp, #-8]
        b       .L15
.L16:
        ldr     r0, .L17+4
        ldr     r1, .L17
        mov     r2, #200
        mov     r3, #200
        bl      f3
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
.L15:
        ldr     r2, [fp, #-8]
        ldr     r3, .L17+8
        cmp     r2, r3
        ble     .L16
        sub     sp, fp, #4
        ldmfd   sp!, {fp, pc}
.L18:
        .align  2
.L17:
        .word   b
        .word   a
        .word   4999
        .size   main, .-main
        .ident  "GCC: (Debian 4.6.3-14+rpi1) 4.6.3"
        .section        .note.GNU-stack,"",%progbits
