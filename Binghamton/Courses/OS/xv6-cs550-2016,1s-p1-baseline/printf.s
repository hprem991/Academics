	.file	"printf.c"
	.text
.Ltext0:
	.type	putc, @function
putc:
.LFB0:
	.file 1 "printf.c"
	.loc 1 7 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %eax
	movb	%al, -12(%ebp)
	.loc 1 8 0
	movl	$1, 8(%esp)
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	write
.LVL1:
	.loc 1 9 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	putc, .-putc
	.type	printint, @function
printint:
.LFB1:
	.loc 1 13 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	subl	$48, %esp
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 19 0
	movl	$0, -16(%ebp)
.LVL3:
	.loc 1 20 0
	cmpl	$0, 20(%ebp)
	je	.L3
	.loc 1 20 0 is_stmt 0 discriminator 1
	cmpl	$0, 12(%ebp)
	jns	.L3
	.loc 1 21 0 is_stmt 1
	movl	$1, -16(%ebp)
.LVL4:
	.loc 1 22 0
	movl	12(%ebp), %eax
	negl	%eax
	movl	%eax, -20(%ebp)
.LVL5:
	jmp	.L4
.LVL6:
.L3:
	.loc 1 24 0
	movl	12(%ebp), %eax
	movl	%eax, -20(%ebp)
.LVL7:
.L4:
	.loc 1 27 0
	movl	$0, -12(%ebp)
.LVL8:
.L5:
	.loc 1 29 0 discriminator 1
	movl	-12(%ebp), %ecx
	leal	1(%ecx), %eax
	movl	%eax, -12(%ebp)
.LVL9:
	movl	16(%ebp), %ebx
	movl	-20(%ebp), %eax
.LVL10:
	movl	$0, %edx
	divl	%ebx
	movl	%edx, %eax
	movzbl	digits.1030(%eax), %eax
	movb	%al, -36(%ebp,%ecx)
	.loc 1 30 0 discriminator 1
	movl	16(%ebp), %esi
	movl	-20(%ebp), %eax
	movl	$0, %edx
	divl	%esi
	movl	%eax, -20(%ebp)
.LVL11:
	cmpl	$0, -20(%ebp)
	jne	.L5
	.loc 1 31 0
	cmpl	$0, -16(%ebp)
	je	.L6
	.loc 1 32 0
	movl	-12(%ebp), %eax
.LVL12:
	leal	1(%eax), %edx
	movl	%edx, -12(%ebp)
.LVL13:
	movb	$45, -36(%ebp,%eax)
	.loc 1 34 0
	jmp	.L7
.LVL14:
.L6:
	jmp	.L7
.LVL15:
.L8:
	.loc 1 35 0
	leal	-36(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	putc
.LVL16:
.L7:
	.loc 1 34 0 discriminator 1
	subl	$1, -12(%ebp)
.LVL17:
	cmpl	$0, -12(%ebp)
	jns	.L8
	.loc 1 36 0
	addl	$48, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	printint, .-printint
	.section	.rodata
.LC0:
	.string	"(null)"
	.text
	.globl	printf
	.type	printf, @function
printf:
.LFB2:
	.loc 1 41 0
	.cfi_startproc
.LVL18:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 46 0
	movl	$0, -20(%ebp)
.LVL19:
	.loc 1 47 0
	leal	12(%ebp), %eax
.LVL20:
	addl	$4, %eax
.LVL21:
	movl	%eax, -24(%ebp)
.LVL22:
	.loc 1 48 0
	movl	$0, -16(%ebp)
.LVL23:
	jmp	.L10
.LVL24:
.L25:
	.loc 1 49 0
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	andl	$255, %eax
	movl	%eax, -28(%ebp)
.LVL25:
	.loc 1 50 0
	cmpl	$0, -20(%ebp)
	jne	.L11
	.loc 1 51 0
	cmpl	$37, -28(%ebp)
	jne	.L12
	.loc 1 52 0
	movl	$37, -20(%ebp)
.LVL26:
	jmp	.L14
.L12:
	.loc 1 54 0
	movl	-28(%ebp), %eax
.LVL27:
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	putc
.LVL28:
	jmp	.L14
.LVL29:
.L11:
	.loc 1 56 0
	cmpl	$37, -20(%ebp)
	jne	.L14
	.loc 1 57 0
	cmpl	$100, -28(%ebp)
	jne	.L15
	.loc 1 58 0
	movl	-24(%ebp), %eax
.LVL30:
	movl	(%eax), %eax
	movl	$1, 12(%esp)
	movl	$10, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	printint
.LVL31:
	.loc 1 59 0
	addl	$4, -24(%ebp)
	jmp	.L16
.LVL32:
.L15:
	.loc 1 60 0
	cmpl	$120, -28(%ebp)
	je	.L17
	.loc 1 60 0 is_stmt 0 discriminator 1
	cmpl	$112, -28(%ebp)
	jne	.L18
.L17:
	.loc 1 61 0 is_stmt 1
	movl	-24(%ebp), %eax
.LVL33:
	movl	(%eax), %eax
	movl	$0, 12(%esp)
	movl	$16, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	printint
.LVL34:
	.loc 1 62 0
	addl	$4, -24(%ebp)
	jmp	.L16
.LVL35:
.L18:
	.loc 1 63 0
	cmpl	$115, -28(%ebp)
	jne	.L19
	.loc 1 64 0
	movl	-24(%ebp), %eax
.LVL36:
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL37:
	.loc 1 65 0
	addl	$4, -24(%ebp)
.LVL38:
	.loc 1 66 0
	cmpl	$0, -12(%ebp)
	jne	.L20
	.loc 1 67 0
	movl	$.LC0, -12(%ebp)
.LVL39:
	.loc 1 68 0
	jmp	.L21
.LVL40:
.L20:
	jmp	.L21
.L22:
	.loc 1 69 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	putc
.LVL41:
	.loc 1 70 0
	addl	$1, -12(%ebp)
.L21:
	.loc 1 68 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L22
	jmp	.L16
.LVL42:
.L19:
	.loc 1 72 0
	cmpl	$99, -28(%ebp)
	jne	.L23
	.loc 1 73 0
	movl	-24(%ebp), %eax
.LVL43:
	movl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	putc
.LVL44:
	.loc 1 74 0
	addl	$4, -24(%ebp)
	jmp	.L16
.LVL45:
.L23:
	.loc 1 75 0
	cmpl	$37, -28(%ebp)
	jne	.L24
	.loc 1 76 0
	movl	-28(%ebp), %eax
.LVL46:
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	putc
.LVL47:
	jmp	.L16
.LVL48:
.L24:
	.loc 1 79 0
	movl	$37, 4(%esp)
	movl	8(%ebp), %eax
.LVL49:
	movl	%eax, (%esp)
	call	putc
.LVL50:
	.loc 1 80 0
	movl	-28(%ebp), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	putc
.LVL51:
.L16:
	.loc 1 82 0
	movl	$0, -20(%ebp)
.L14:
	.loc 1 48 0
	addl	$1, -16(%ebp)
.LVL52:
.L10:
	.loc 1 48 0 is_stmt 0 discriminator 1
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L25
	.loc 1 85 0 is_stmt 1
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	printf, .-printf
	.data
	.type	digits.1030, @object
	.size	digits.1030, 17
digits.1030:
	.string	"0123456789ABCDEF"
	.text
.Letext0:
	.file 2 "types.h"
	.file 3 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x316
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF11
	.byte	0x1
	.long	.LASF12
	.long	.LASF13
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF14
	.byte	0x2
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF5
	.byte	0x1
	.byte	0x6
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xa5
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0x6
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"c"
	.byte	0x1
	.byte	0x6
	.long	0xa5
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.long	.LVL1
	.long	0x2f5
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x5
	.long	.LASF6
	.byte	0x1
	.byte	0xc
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x155
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0xc
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"xx"
	.byte	0x1
	.byte	0xc
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x9
	.long	.LASF7
	.byte	0x1
	.byte	0xc
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x6
	.string	"sgn"
	.byte	0x1
	.byte	0xc
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xa
	.long	.LASF8
	.byte	0x1
	.byte	0xe
	.long	0x155
	.byte	0x5
	.byte	0x3
	.long	digits.1030
	.uleb128 0xb
	.string	"buf"
	.byte	0x1
	.byte	0xf
	.long	0x16c
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0x10
	.long	0x4c
	.long	.LLST2
	.uleb128 0xb
	.string	"neg"
	.byte	0x1
	.byte	0x10
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xc
	.string	"x"
	.byte	0x1
	.byte	0x11
	.long	0x25
	.long	.LLST3
	.uleb128 0x7
	.long	.LVL16
	.long	0x53
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0xa5
	.long	0x165
	.uleb128 0xe
	.long	0x165
	.byte	0x10
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0xd
	.long	0xa5
	.long	0x17c
	.uleb128 0xe
	.long	0x165
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF15
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST4
	.byte	0x1
	.long	0x2e9
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0x28
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.string	"fmt"
	.byte	0x1
	.byte	0x28
	.long	0x2e9
	.long	.LLST5
	.uleb128 0x11
	.uleb128 0xc
	.string	"s"
	.byte	0x1
	.byte	0x2a
	.long	0x2e9
	.long	.LLST6
	.uleb128 0xc
	.string	"c"
	.byte	0x1
	.byte	0x2b
	.long	0x4c
	.long	.LLST7
	.uleb128 0xc
	.string	"i"
	.byte	0x1
	.byte	0x2b
	.long	0x4c
	.long	.LLST8
	.uleb128 0xa
	.long	.LASF10
	.byte	0x1
	.byte	0x2b
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0xc
	.string	"ap"
	.byte	0x1
	.byte	0x2c
	.long	0x2ef
	.long	.LLST9
	.uleb128 0x12
	.long	.LVL28
	.long	0x53
	.long	0x219
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x8
	.byte	0x91
	.sleb128 -36
	.byte	0x94
	.byte	0x1
	.byte	0x48
	.byte	0x24
	.byte	0x48
	.byte	0x26
	.byte	0
	.uleb128 0x12
	.long	.LVL31
	.long	0xac
	.long	0x23b
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x3a
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x12
	.long	.LVL34
	.long	0xac
	.long	0x25d
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x40
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x12
	.long	.LVL41
	.long	0x53
	.long	0x273
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x12
	.long	.LVL44
	.long	0x53
	.long	0x289
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x12
	.long	.LVL47
	.long	0x53
	.long	0x2ac
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x8
	.byte	0x91
	.sleb128 -36
	.byte	0x94
	.byte	0x1
	.byte	0x48
	.byte	0x24
	.byte	0x48
	.byte	0x26
	.byte	0
	.uleb128 0x12
	.long	.LVL50
	.long	0x53
	.long	0x2c9
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x25
	.byte	0
	.uleb128 0x7
	.long	.LVL51
	.long	0x53
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x8
	.byte	0x91
	.sleb128 -36
	.byte	0x94
	.byte	0x1
	.byte	0x48
	.byte	0x24
	.byte	0x48
	.byte	0x26
	.byte	0
	.byte	0
	.uleb128 0x13
	.byte	0x4
	.long	0xa5
	.uleb128 0x13
	.byte	0x4
	.long	0x25
	.uleb128 0x14
	.byte	0x1
	.long	.LASF16
	.byte	0x3
	.byte	0x9
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.long	0x317
	.uleb128 0x15
	.long	0x4c
	.uleb128 0x15
	.long	0x317
	.uleb128 0x15
	.long	0x4c
	.byte	0
	.uleb128 0x16
	.byte	0x4
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
	.uleb128 0x3
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.long	.LFB1-.Ltext0
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
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL10-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL14-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST3:
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST4:
	.long	.LFB2-.Ltext0
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
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LVL18-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL20-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL21-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 -4
	.long	.LVL24-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LVL37-.Ltext0
	.long	.LVL39-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL39-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST7:
	.long	.LVL25-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL30-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL33-.Ltext0
	.long	.LVL35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL35-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL36-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL43-.Ltext0
	.long	.LVL45-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL46-.Ltext0
	.long	.LVL48-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL48-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL49-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST8:
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL24-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST9:
	.long	.LVL22-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
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
.LASF0:
	.string	"unsigned int"
.LASF11:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF12:
	.string	"printf.c"
.LASF14:
	.string	"uint"
.LASF13:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF7:
	.string	"base"
.LASF16:
	.string	"write"
.LASF2:
	.string	"unsigned char"
.LASF4:
	.string	"char"
.LASF6:
	.string	"printint"
.LASF15:
	.string	"printf"
.LASF1:
	.string	"short unsigned int"
.LASF8:
	.string	"digits"
.LASF10:
	.string	"state"
.LASF5:
	.string	"putc"
.LASF3:
	.string	"short int"
.LASF9:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
