	.file	"uart.c"
	.text
.Ltext0:
	.type	inb, @function
inb:
.LFB0:
	.file 1 "x86.h"
	.loc 1 5 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	.loc 1 8 0
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
#APP
# 8 "x86.h" 1
	in %dx,%al
# 0 "" 2
#NO_APP
	movb	%al, -1(%ebp)
.LVL1:
	.loc 1 9 0
	movzbl	-1(%ebp), %eax
	.loc 1 10 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	inb, .-inb
	.type	outb, @function
outb:
.LFB2:
	.loc 1 23 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	%dx, -4(%ebp)
	movb	%al, -8(%ebp)
	.loc 1 24 0
	movzbl	-8(%ebp), %eax
	movzwl	-4(%ebp), %edx
#APP
# 24 "x86.h" 1
	out %al,%dx
# 0 "" 2
	.loc 1 25 0
#NO_APP
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	outb, .-outb
	.local	uart
	.comm	uart,4,4
	.section	.rodata
.LC0:
	.string	"xv6...\n"
	.text
	.globl	uartinit
	.type	uartinit, @function
uartinit:
.LFB18:
	.file 2 "uart.c"
	.loc 2 20 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 24 0
	movl	$0, 4(%esp)
	movl	$1018, (%esp)
	call	outb
.LVL3:
	.loc 2 27 0
	movl	$128, 4(%esp)
	movl	$1019, (%esp)
	call	outb
.LVL4:
	.loc 2 28 0
	movl	$12, 4(%esp)
	movl	$1016, (%esp)
	call	outb
.LVL5:
	.loc 2 29 0
	movl	$0, 4(%esp)
	movl	$1017, (%esp)
	call	outb
.LVL6:
	.loc 2 30 0
	movl	$3, 4(%esp)
	movl	$1019, (%esp)
	call	outb
.LVL7:
	.loc 2 31 0
	movl	$0, 4(%esp)
	movl	$1020, (%esp)
	call	outb
.LVL8:
	.loc 2 32 0
	movl	$1, 4(%esp)
	movl	$1017, (%esp)
	call	outb
.LVL9:
	.loc 2 35 0
	movl	$1021, (%esp)
	call	inb
.LVL10:
	cmpb	$-1, %al
	jne	.L5
	.loc 2 36 0
	jmp	.L4
.L5:
	.loc 2 37 0
	movl	$1, uart
	.loc 2 41 0
	movl	$1018, (%esp)
	call	inb
.LVL11:
	.loc 2 42 0
	movl	$1016, (%esp)
	call	inb
.LVL12:
	.loc 2 43 0
	movl	$4, (%esp)
	call	picenable
.LVL13:
	.loc 2 44 0
	movl	$0, 4(%esp)
	movl	$4, (%esp)
	call	ioapicenable
.LVL14:
	.loc 2 47 0
	movl	$.LC0, -12(%ebp)
.LVL15:
	jmp	.L7
.L8:
	.loc 2 48 0 discriminator 2
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, (%esp)
	call	uartputc
.LVL16:
	.loc 2 47 0 discriminator 2
	addl	$1, -12(%ebp)
.L7:
	.loc 2 47 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L8
.LVL17:
.L4:
	.loc 2 49 0 is_stmt 1
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	uartinit, .-uartinit
	.globl	uartputc
	.type	uartputc, @function
uartputc:
.LFB19:
	.loc 2 53 0
	.cfi_startproc
.LVL18:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 56 0
	movl	uart, %eax
	testl	%eax, %eax
	jne	.L10
	.loc 2 57 0
	jmp	.L9
.L10:
	.loc 2 58 0
	movl	$0, -12(%ebp)
.LVL19:
	jmp	.L12
.L14:
	.loc 2 59 0 discriminator 1
	movl	$10, (%esp)
	call	microdelay
.LVL20:
	.loc 2 58 0 discriminator 1
	addl	$1, -12(%ebp)
.L12:
	cmpl	$127, -12(%ebp)
	jg	.L13
	.loc 2 58 0 is_stmt 0 discriminator 2
	movl	$1021, (%esp)
	call	inb
.LVL21:
	movzbl	%al, %eax
	andl	$32, %eax
	testl	%eax, %eax
	je	.L14
.L13:
	.loc 2 60 0 is_stmt 1
	movl	8(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$1016, (%esp)
	call	outb
.LVL22:
.L9:
	.loc 2 61 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	uartputc, .-uartputc
	.type	uartgetc, @function
uartgetc:
.LFB20:
	.loc 2 65 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$4, %esp
	.loc 2 66 0
	movl	uart, %eax
	testl	%eax, %eax
	jne	.L16
	.loc 2 67 0
	movl	$-1, %eax
	jmp	.L17
.L16:
	.loc 2 68 0
	movl	$1021, (%esp)
	call	inb
.LVL23:
	movzbl	%al, %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L18
	.loc 2 69 0
	movl	$-1, %eax
	jmp	.L17
.L18:
	.loc 2 70 0
	movl	$1016, (%esp)
	call	inb
.LVL24:
	movzbl	%al, %eax
.L17:
	.loc 2 71 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	uartgetc, .-uartgetc
	.globl	uartintr
	.type	uartintr, @function
uartintr:
.LFB21:
	.loc 2 75 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 76 0
	movl	$uartgetc, (%esp)
	call	consoleintr
.LVL25:
	.loc 2 77 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	uartintr, .-uartintr
.Letext0:
	.file 3 "types.h"
	.file 4 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3a7
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF19
	.byte	0x1
	.long	.LASF20
	.long	.LASF21
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x3
	.byte	0x2
	.long	0x37
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x3
	.byte	0x3
	.long	0x49
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x4
	.byte	0x4
	.long	0x56
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.string	"inb"
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0x3e
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xab
	.uleb128 0x7
	.long	.LASF8
	.byte	0x1
	.byte	0x4
	.long	0x2c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x1
	.byte	0x6
	.long	0x3e
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST1
	.byte	0x1
	.long	0xe1
	.uleb128 0x7
	.long	.LASF8
	.byte	0x1
	.byte	0x16
	.long	0x2c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.long	.LASF9
	.byte	0x1
	.byte	0x16
	.long	0x3e
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x13
	.byte	0x1
	.long	.LFB18
	.long	.LFE18
	.long	.LLST2
	.byte	0x1
	.long	0x247
	.uleb128 0xb
	.string	"p"
	.byte	0x2
	.byte	0x15
	.long	0x50
	.long	.LLST3
	.uleb128 0xc
	.long	.LVL3
	.long	0xab
	.long	0x124
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fa
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.long	.LVL4
	.long	0xab
	.long	0x141
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fb
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0xc
	.long	.LVL5
	.long	0xab
	.long	0x15d
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f8
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x3c
	.byte	0
	.uleb128 0xc
	.long	.LVL6
	.long	0xab
	.long	0x179
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f9
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.long	.LVL7
	.long	0xab
	.long	0x195
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fb
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x33
	.byte	0
	.uleb128 0xc
	.long	.LVL8
	.long	0xab
	.long	0x1b1
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fc
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xc
	.long	.LVL9
	.long	0xab
	.long	0x1cd
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f9
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0xc
	.long	.LVL10
	.long	0x72
	.long	0x1e3
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fd
	.byte	0
	.uleb128 0xc
	.long	.LVL11
	.long	0x72
	.long	0x1f9
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fa
	.byte	0
	.uleb128 0xc
	.long	.LVL12
	.long	0x72
	.long	0x20f
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f8
	.byte	0
	.uleb128 0xc
	.long	.LVL13
	.long	0x349
	.long	0x223
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x34
	.byte	0
	.uleb128 0xc
	.long	.LVL14
	.long	0x35d
	.long	0x23d
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x34
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xe
	.long	.LVL16
	.long	0x247
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0x34
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.long	.LLST4
	.byte	0x1
	.long	0x2c3
	.uleb128 0xf
	.string	"c"
	.byte	0x2
	.byte	0x34
	.long	0x6b
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.string	"i"
	.byte	0x2
	.byte	0x36
	.long	0x6b
	.long	.LLST5
	.uleb128 0xc
	.long	.LVL20
	.long	0x376
	.long	0x28e
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0xc
	.long	.LVL21
	.long	0x72
	.long	0x2a4
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fd
	.byte	0
	.uleb128 0x10
	.long	.LVL22
	.long	0xab
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f8
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 0
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF12
	.byte	0x2
	.byte	0x40
	.byte	0x1
	.long	0x6b
	.long	.LFB20
	.long	.LFE20
	.long	.LLST6
	.byte	0x1
	.long	0x309
	.uleb128 0xc
	.long	.LVL23
	.long	0x72
	.long	0x2f6
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3fd
	.byte	0
	.uleb128 0x10
	.long	.LVL24
	.long	0x72
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f8
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF13
	.byte	0x2
	.byte	0x4a
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST7
	.byte	0x1
	.long	0x338
	.uleb128 0x10
	.long	.LVL25
	.long	0x38a
	.uleb128 0xd
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	uartgetc
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	.LASF14
	.byte	0x2
	.byte	0x10
	.long	0x6b
	.byte	0x5
	.byte	0x3
	.long	uart
	.uleb128 0x12
	.byte	0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x60
	.byte	0x1
	.byte	0x1
	.long	0x35d
	.uleb128 0x13
	.long	0x6b
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x3d
	.byte	0x1
	.byte	0x1
	.long	0x376
	.uleb128 0x13
	.long	0x6b
	.uleb128 0x13
	.long	0x6b
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x51
	.byte	0x1
	.byte	0x1
	.long	0x38a
	.uleb128 0x13
	.long	0x6b
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x15
	.byte	0x1
	.byte	0x1
	.long	0x39e
	.uleb128 0x13
	.long	0x39e
	.byte	0
	.uleb128 0x4
	.byte	0x4
	.long	0x3a4
	.uleb128 0x14
	.byte	0x1
	.long	0x6b
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB0-.Ltext0
	.long	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI0-.Ltext0
	.long	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI1-.Ltext0
	.long	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI2-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB2-.Ltext0
	.long	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI3-.Ltext0
	.long	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI4-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI5-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB18-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI8-.Ltext0
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL15-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST4:
	.long	.LFB19-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI10-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI11-.Ltext0
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LVL19-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST6:
	.long	.LFB20-.Ltext0
	.long	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI12-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI13-.Ltext0
	.long	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI14-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LFB21-.Ltext0
	.long	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI15-.Ltext0
	.long	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI16-.Ltext0
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI17-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF1:
	.string	"short unsigned int"
.LASF0:
	.string	"unsigned int"
.LASF19:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF9:
	.string	"data"
.LASF10:
	.string	"uartinit"
.LASF21:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF13:
	.string	"uartintr"
.LASF22:
	.string	"outb"
.LASF15:
	.string	"picenable"
.LASF16:
	.string	"ioapicenable"
.LASF8:
	.string	"port"
.LASF14:
	.string	"uart"
.LASF4:
	.string	"unsigned char"
.LASF5:
	.string	"char"
.LASF20:
	.string	"uart.c"
.LASF3:
	.string	"uchar"
.LASF2:
	.string	"ushort"
.LASF17:
	.string	"microdelay"
.LASF12:
	.string	"uartgetc"
.LASF18:
	.string	"consoleintr"
.LASF7:
	.string	"short int"
.LASF11:
	.string	"uartputc"
.LASF6:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
