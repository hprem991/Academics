	.file	"ls.c"
	.text
.Ltext0:
	.globl	fmtname
	.type	fmtname, @function
fmtname:
.LFB0:
	.file 1 "ls.c"
	.loc 1 8 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 13 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL1:
	movl	8(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, -12(%ebp)
.LVL2:
	jmp	.L2
.LVL3:
.L4:
	.loc 1 13 0 is_stmt 0 discriminator 1
	subl	$1, -12(%ebp)
.LVL4:
.L2:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jb	.L3
	.loc 1 13 0 discriminator 2
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jne	.L4
.L3:
	.loc 1 15 0 is_stmt 1
	addl	$1, -12(%ebp)
.LVL5:
	.loc 1 18 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL6:
	cmpl	$13, %eax
	jbe	.L5
	.loc 1 19 0
	movl	-12(%ebp), %eax
	jmp	.L6
.L5:
	.loc 1 20 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL7:
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$buf.1041, (%esp)
	call	memmove
.LVL8:
	.loc 1 21 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL9:
	movl	$14, %edx
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL10:
	addl	$buf.1041, %eax
	movl	%ebx, 8(%esp)
	movl	$32, 4(%esp)
	movl	%eax, (%esp)
	call	memset
.LVL11:
	.loc 1 22 0
	movl	$buf.1041, %eax
.L6:
	.loc 1 23 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fmtname, .-fmtname
	.section	.rodata
.LC0:
	.string	"ls: cannot open %s\n"
.LC1:
	.string	"ls: cannot stat %s\n"
.LC2:
	.string	"%s %d %d %d\n"
.LC3:
	.string	"ls: path too long\n"
	.text
	.globl	ls
	.type	ls, @function
ls:
.LFB1:
	.loc 1 27 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$604, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 1 33 0
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	open
.LVL13:
	movl	%eax, -28(%ebp)
.LVL14:
	cmpl	$0, -28(%ebp)
	jns	.L8
	.loc 1 34 0
	movl	8(%ebp), %eax
.LVL15:
	movl	%eax, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	$2, (%esp)
	call	printf
.LVL16:
	.loc 1 35 0
	jmp	.L7
.LVL17:
.L8:
	.loc 1 38 0
	leal	-580(%ebp), %eax
.LVL18:
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	fstat
.LVL19:
	testl	%eax, %eax
	jns	.L10
	.loc 1 39 0
	movl	8(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$2, (%esp)
	call	printf
.LVL20:
	.loc 1 40 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	close
.LVL21:
	.loc 1 41 0
	jmp	.L7
.L10:
	.loc 1 44 0
	movzwl	-580(%ebp), %eax
	cwtl
	cmpl	$1, %eax
	je	.L12
	cmpl	$2, %eax
	jne	.L11
	.loc 1 46 0
	movl	-564(%ebp), %edi
	movl	-572(%ebp), %esi
	movzwl	-580(%ebp), %eax
	movswl	%ax, %ebx
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	fmtname
.LVL22:
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL23:
	.loc 1 47 0
	jmp	.L11
.L12:
	.loc 1 50 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL24:
	addl	$16, %eax
	cmpl	$512, %eax
	jbe	.L14
	.loc 1 51 0
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL25:
	.loc 1 52 0
	jmp	.L11
.L14:
	.loc 1 54 0
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-544(%ebp), %eax
	movl	%eax, (%esp)
	call	strcpy
.LVL26:
	.loc 1 55 0
	leal	-544(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL27:
	leal	-544(%ebp), %edx
	addl	%edx, %eax
	movl	%eax, -32(%ebp)
.LVL28:
	.loc 1 56 0
	movl	-32(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, -32(%ebp)
.LVL29:
	movb	$47, (%eax)
	.loc 1 57 0
	jmp	.L15
.LVL30:
.L18:
	.loc 1 58 0
	movzwl	-560(%ebp), %eax
	testw	%ax, %ax
	jne	.L16
	.loc 1 59 0
	jmp	.L15
.L16:
	.loc 1 60 0
	movl	$14, 8(%esp)
	leal	-560(%ebp), %eax
	addl	$2, %eax
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
.LVL31:
	.loc 1 61 0
	movl	-32(%ebp), %eax
	addl	$14, %eax
	movb	$0, (%eax)
	.loc 1 62 0
	leal	-580(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-544(%ebp), %eax
	movl	%eax, (%esp)
	call	stat
.LVL32:
	testl	%eax, %eax
	jns	.L17
	.loc 1 63 0
	leal	-544(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL33:
	.loc 1 64 0
	jmp	.L15
.L17:
	.loc 1 66 0
	movl	-564(%ebp), %edi
	movl	-572(%ebp), %esi
	movzwl	-580(%ebp), %eax
	movswl	%ax, %ebx
	leal	-544(%ebp), %eax
	movl	%eax, (%esp)
	call	fmtname
.LVL34:
	movl	%edi, 20(%esp)
	movl	%esi, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL35:
.L15:
	.loc 1 57 0 discriminator 1
	movl	$16, 8(%esp)
	leal	-560(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	read
.LVL36:
	cmpl	$16, %eax
	je	.L18
	.loc 1 68 0
	nop
.LVL37:
.L11:
	.loc 1 70 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	close
.LVL38:
.L7:
	.loc 1 71 0
	addl	$604, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	ls, .-ls
	.section	.rodata
.LC4:
	.string	"."
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 75 0
	.cfi_startproc
.LVL39:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	.loc 1 78 0
	cmpl	$1, 8(%ebp)
	jg	.L21
	.loc 1 79 0
	movl	$.LC4, (%esp)
	call	ls
.LVL40:
	.loc 1 80 0
	call	exit
.LVL41:
.L21:
	.loc 1 82 0
	movl	$1, 28(%esp)
.LVL42:
	jmp	.L22
.LVL43:
.L23:
	.loc 1 83 0 discriminator 2
	movl	28(%esp), %eax
.LVL44:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	ls
.LVL45:
	.loc 1 82 0 discriminator 2
	addl	$1, 28(%esp)
.LVL46:
.L22:
	.loc 1 82 0 is_stmt 0 discriminator 1
	movl	28(%esp), %eax
	cmpl	8(%ebp), %eax
	jl	.L23
	.loc 1 84 0 is_stmt 1
	call	exit
.LVL47:
	.cfi_endproc
.LFE2:
	.size	main, .-main
	.local	buf.1041
	.comm	buf.1041,15,1
.Letext0:
	.file 2 "types.h"
	.file 3 "stat.h"
	.file 4 "fs.h"
	.file 5 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x66a
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF28
	.byte	0x1
	.long	.LASF29
	.long	.LASF30
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF10
	.byte	0x14
	.byte	0x3
	.byte	0x5
	.long	0xa3
	.uleb128 0x5
	.long	.LASF5
	.byte	0x3
	.byte	0x6
	.long	0xa3
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"dev"
	.byte	0x3
	.byte	0x7
	.long	0xaa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ino"
	.byte	0x3
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF6
	.byte	0x3
	.byte	0x9
	.long	0xa3
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF7
	.byte	0x3
	.byte	0xa
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF8
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x4
	.long	.LASF11
	.byte	0x10
	.byte	0x4
	.byte	0x34
	.long	0xe1
	.uleb128 0x5
	.long	.LASF12
	.byte	0x4
	.byte	0x35
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF13
	.byte	0x4
	.byte	0x36
	.long	0xe1
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0x8
	.long	0xf1
	.long	0xf1
	.uleb128 0x9
	.long	0xb1
	.byte	0xd
	.byte	0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0xa
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.long	0x1e9
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x1e9
	.uleb128 0xb
	.long	.LASF15
	.byte	0x1
	.byte	0x7
	.long	0x1e9
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.string	"buf"
	.byte	0x1
	.byte	0x9
	.long	0x1ef
	.byte	0x5
	.byte	0x3
	.long	buf.1041
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0xa
	.long	0x1e9
	.long	.LLST1
	.uleb128 0xe
	.long	.LVL1
	.long	0x533
	.long	0x158
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL6
	.long	0x533
	.long	0x16e
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL7
	.long	0x533
	.long	0x184
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL8
	.long	0x54b
	.long	0x1a4
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	buf.1041
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL9
	.long	0x533
	.long	0x1ba
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL10
	.long	0x533
	.long	0x1d0
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x10
	.long	.LVL11
	.long	0x56f
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.long	0xf1
	.uleb128 0x8
	.long	0xf1
	.long	0x1ff
	.uleb128 0x9
	.long	0xb1
	.byte	0xe
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.string	"ls"
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x4a1
	.uleb128 0xb
	.long	.LASF15
	.byte	0x1
	.byte	0x1a
	.long	0x1e9
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xc
	.string	"buf"
	.byte	0x1
	.byte	0x1c
	.long	0x4a1
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x1c
	.long	0x1e9
	.long	.LLST3
	.uleb128 0xd
	.string	"fd"
	.byte	0x1
	.byte	0x1d
	.long	0xaa
	.long	.LLST4
	.uleb128 0xc
	.string	"de"
	.byte	0x1
	.byte	0x1e
	.long	0xb8
	.byte	0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0xc
	.string	"st"
	.byte	0x1
	.byte	0x1f
	.long	0x50
	.byte	0x3
	.byte	0x91
	.sleb128 -588
	.uleb128 0xe
	.long	.LVL13
	.long	0x591
	.long	0x288
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xe
	.long	.LVL16
	.long	0x5ae
	.long	0x2ae
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL19
	.long	0x5c8
	.long	0x2cc
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -588
	.byte	0
	.uleb128 0xe
	.long	.LVL20
	.long	0x5ae
	.long	0x2f2
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL21
	.long	0x5eb
	.long	0x308
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL22
	.long	0xf8
	.long	0x31e
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL23
	.long	0x5ae
	.long	0x351
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 20
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.long	.LVL24
	.long	0x533
	.long	0x367
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL25
	.long	0x5ae
	.long	0x385
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0xe
	.long	.LVL26
	.long	0x603
	.long	0x3a3
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	.LVL27
	.long	0x533
	.long	0x3b9
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.byte	0
	.uleb128 0xe
	.long	.LVL31
	.long	0x54b
	.long	0x3dd
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -566
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x3e
	.byte	0
	.uleb128 0xe
	.long	.LVL32
	.long	0x620
	.long	0x3fb
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -588
	.byte	0
	.uleb128 0xe
	.long	.LVL33
	.long	0x5ae
	.long	0x421
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.byte	0
	.uleb128 0xe
	.long	.LVL34
	.long	0xf8
	.long	0x437
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -552
	.byte	0
	.uleb128 0xe
	.long	.LVL35
	.long	0x5ae
	.long	0x46a
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 20
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.long	.LVL36
	.long	0x63d
	.long	0x48e
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -568
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x10
	.long	.LVL38
	.long	0x5eb
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x8
	.long	0xf1
	.long	0x4b2
	.uleb128 0x13
	.long	0xb1
	.value	0x1ff
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF17
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.long	0xaa
	.long	.LFB2
	.long	.LFE2
	.long	.LLST5
	.byte	0x1
	.long	0x52d
	.uleb128 0xb
	.long	.LASF18
	.byte	0x1
	.byte	0x4a
	.long	0xaa
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.long	.LASF19
	.byte	0x1
	.byte	0x4a
	.long	0x52d
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0xd
	.string	"i"
	.byte	0x1
	.byte	0x4c
	.long	0xaa
	.long	.LLST6
	.uleb128 0xe
	.long	.LVL40
	.long	0x1ff
	.long	0x511
	.uleb128 0xf
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0x14
	.long	.LVL41
	.long	0x65f
	.uleb128 0x14
	.long	.LVL45
	.long	0x1ff
	.uleb128 0x14
	.long	.LVL47
	.long	0x65f
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.long	0x1e9
	.uleb128 0x15
	.byte	0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x23
	.byte	0x1
	.long	0x25
	.byte	0x1
	.long	0x54b
	.uleb128 0x16
	.long	0x1e9
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF21
	.byte	0x5
	.byte	0x1e
	.byte	0x1
	.long	0x56d
	.byte	0x1
	.long	0x56d
	.uleb128 0x16
	.long	0x56d
	.uleb128 0x16
	.long	0x56d
	.uleb128 0x16
	.long	0xaa
	.byte	0
	.uleb128 0x17
	.byte	0x4
	.uleb128 0x15
	.byte	0x1
	.long	.LASF22
	.byte	0x5
	.byte	0x24
	.byte	0x1
	.long	0x56d
	.byte	0x1
	.long	0x591
	.uleb128 0x16
	.long	0x56d
	.uleb128 0x16
	.long	0xaa
	.uleb128 0x16
	.long	0x25
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF23
	.byte	0x5
	.byte	0xe
	.byte	0x1
	.long	0xaa
	.byte	0x1
	.long	0x5ae
	.uleb128 0x16
	.long	0x1e9
	.uleb128 0x16
	.long	0xaa
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF31
	.byte	0x5
	.byte	0x21
	.byte	0x1
	.byte	0x1
	.long	0x5c8
	.uleb128 0x16
	.long	0xaa
	.uleb128 0x16
	.long	0x1e9
	.uleb128 0x19
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x11
	.byte	0x1
	.long	0xaa
	.byte	0x1
	.long	0x5e5
	.uleb128 0x16
	.long	0xaa
	.uleb128 0x16
	.long	0x5e5
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.long	0x50
	.uleb128 0x15
	.byte	0x1
	.long	.LASF25
	.byte	0x5
	.byte	0xb
	.byte	0x1
	.long	0xaa
	.byte	0x1
	.long	0x603
	.uleb128 0x16
	.long	0xaa
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF26
	.byte	0x5
	.byte	0x1d
	.byte	0x1
	.long	0x1e9
	.byte	0x1
	.long	0x620
	.uleb128 0x16
	.long	0x1e9
	.uleb128 0x16
	.long	0x1e9
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF10
	.byte	0x5
	.byte	0x1c
	.byte	0x1
	.long	0xaa
	.byte	0x1
	.long	0x63d
	.uleb128 0x16
	.long	0x1e9
	.uleb128 0x16
	.long	0x5e5
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF27
	.byte	0x5
	.byte	0xa
	.byte	0x1
	.long	0xaa
	.byte	0x1
	.long	0x65f
	.uleb128 0x16
	.long	0xaa
	.uleb128 0x16
	.long	0x56d
	.uleb128 0x16
	.long	0xaa
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF32
	.byte	0x5
	.byte	0x6
	.byte	0x1
	.long	0xaa
	.byte	0x1
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x13
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0
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
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST2:
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
.LLST3:
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL30-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST4:
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL17-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL18-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST5:
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
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST6:
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	.LVL43-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL44-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
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
.LASF23:
	.string	"open"
.LASF28:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF21:
	.string	"memmove"
.LASF10:
	.string	"stat"
.LASF11:
	.string	"dirent"
.LASF16:
	.string	"fmtname"
.LASF20:
	.string	"strlen"
.LASF32:
	.string	"exit"
.LASF29:
	.string	"ls.c"
.LASF4:
	.string	"unsigned char"
.LASF26:
	.string	"strcpy"
.LASF3:
	.string	"short unsigned int"
.LASF22:
	.string	"memset"
.LASF30:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF12:
	.string	"inum"
.LASF17:
	.string	"main"
.LASF27:
	.string	"read"
.LASF0:
	.string	"uint"
.LASF2:
	.string	"unsigned int"
.LASF14:
	.string	"char"
.LASF24:
	.string	"fstat"
.LASF18:
	.string	"argc"
.LASF9:
	.string	"sizetype"
.LASF1:
	.string	"ushort"
.LASF13:
	.string	"name"
.LASF31:
	.string	"printf"
.LASF5:
	.string	"type"
.LASF8:
	.string	"short int"
.LASF19:
	.string	"argv"
.LASF15:
	.string	"path"
.LASF25:
	.string	"close"
.LASF6:
	.string	"nlink"
.LASF7:
	.string	"size"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
