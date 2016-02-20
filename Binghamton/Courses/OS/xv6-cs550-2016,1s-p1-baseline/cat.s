	.file	"cat.c"
	.text
.Ltext0:
	.comm	buf,512,32
	.section	.rodata
.LC0:
	.string	"cat: read error\n"
	.text
	.globl	cat
	.type	cat, @function
cat:
.LFB0:
	.file 1 "cat.c"
	.loc 1 9 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 12 0
	jmp	.L2
.LVL1:
.L3:
	.loc 1 13 0
	movl	-12(%ebp), %eax
.LVL2:
	movl	%eax, 8(%esp)
	movl	$buf, 4(%esp)
	movl	$1, (%esp)
	call	write
.LVL3:
.L2:
	.loc 1 12 0 discriminator 1
	movl	$512, 8(%esp)
	movl	$buf, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	read
.LVL4:
	movl	%eax, -12(%ebp)
.LVL5:
	cmpl	$0, -12(%ebp)
	jg	.L3
	.loc 1 14 0
	cmpl	$0, -12(%ebp)
	jns	.L1
	.loc 1 15 0
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL6:
	.loc 1 16 0
	call	exit
.LVL7:
.L1:
	.loc 1 18 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	cat, .-cat
	.section	.rodata
.LC1:
	.string	"cat: cannot open %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 22 0
	.cfi_startproc
.LVL8:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	.loc 1 25 0
	cmpl	$1, 8(%ebp)
	jg	.L6
	.loc 1 26 0
	movl	$0, (%esp)
	call	cat
.LVL9:
	.loc 1 27 0
	call	exit
.LVL10:
.L6:
	.loc 1 30 0
	movl	$1, 28(%esp)
.LVL11:
	jmp	.L7
.LVL12:
.L9:
	.loc 1 31 0
	movl	28(%esp), %eax
.LVL13:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	open
.LVL14:
	movl	%eax, 24(%esp)
.LVL15:
	cmpl	$0, 24(%esp)
	jns	.L8
	.loc 1 32 0
	movl	28(%esp), %eax
.LVL16:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL17:
	.loc 1 33 0
	call	exit
.LVL18:
.L8:
	.loc 1 35 0
	movl	24(%esp), %eax
.LVL19:
	movl	%eax, (%esp)
	call	cat
.LVL20:
	.loc 1 36 0
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	close
.LVL21:
	.loc 1 30 0
	addl	$1, 28(%esp)
.LVL22:
.L7:
	.loc 1 30 0 is_stmt 0 discriminator 1
	movl	28(%esp), %eax
	cmpl	8(%ebp), %eax
	jl	.L9
	.loc 1 38 0 is_stmt 1
	call	exit
.LVL23:
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2ae
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF13
	.byte	0x1
	.long	.LASF14
	.long	.LASF15
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF1
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.byte	0x1
	.string	"cat"
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xf2
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0x8
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"n"
	.byte	0x1
	.byte	0xa
	.long	0x41
	.long	.LLST1
	.uleb128 0x7
	.long	.LVL3
	.long	0x212
	.long	0xa2
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LVL4
	.long	0x236
	.long	0xca
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
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x200
	.byte	0
	.uleb128 0x7
	.long	.LVL6
	.long	0x258
	.long	0xe8
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0x9
	.long	.LVL7
	.long	0x272
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x15
	.byte	0x1
	.long	0x41
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x1d5
	.uleb128 0xb
	.long	.LASF4
	.byte	0x1
	.byte	0x15
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xb
	.long	.LASF5
	.byte	0x1
	.byte	0x15
	.long	0x1d5
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0x17
	.long	0x41
	.long	.LLST3
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x17
	.long	0x41
	.long	.LLST4
	.uleb128 0x7
	.long	.LVL9
	.long	0x48
	.long	0x15b
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.long	.LVL10
	.long	0x272
	.uleb128 0x7
	.long	.LVL14
	.long	0x280
	.long	0x178
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x7
	.long	.LVL17
	.long	0x258
	.long	0x196
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x9
	.long	.LVL18
	.long	0x272
	.uleb128 0x7
	.long	.LVL20
	.long	0x48
	.long	0x1b5
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.byte	0
	.uleb128 0x7
	.long	.LVL21
	.long	0x29d
	.long	0x1cb
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.byte	0
	.uleb128 0x9
	.long	.LVL23
	.long	0x272
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x1db
	.uleb128 0xc
	.byte	0x4
	.long	0x1e1
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xd
	.long	0x1e1
	.long	0x1f9
	.uleb128 0xe
	.long	0x1f9
	.value	0x1ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0xf
	.string	"buf"
	.byte	0x1
	.byte	0x5
	.long	0x1e8
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0x10
	.byte	0x1
	.long	.LASF8
	.byte	0x2
	.byte	0x9
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x234
	.uleb128 0x11
	.long	0x41
	.uleb128 0x11
	.long	0x234
	.uleb128 0x11
	.long	0x41
	.byte	0
	.uleb128 0x12
	.byte	0x4
	.uleb128 0x10
	.byte	0x1
	.long	.LASF9
	.byte	0x2
	.byte	0xa
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x258
	.uleb128 0x11
	.long	0x41
	.uleb128 0x11
	.long	0x234
	.uleb128 0x11
	.long	0x41
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0x21
	.byte	0x1
	.byte	0x1
	.long	0x272
	.uleb128 0x11
	.long	0x41
	.uleb128 0x11
	.long	0x1db
	.uleb128 0x14
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF17
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x10
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x29d
	.uleb128 0x11
	.long	0x1db
	.uleb128 0x11
	.long	0x41
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF12
	.byte	0x2
	.byte	0xb
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x11
	.long	0x41
	.byte	0
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
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
	.long	.LVL1-.Ltext0
	.long	.LVL2-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL5-.Ltext0
	.long	.LVL6-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-1-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL7-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x1
	.byte	0x50
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
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST3:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	.LVL18-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	0
	.long	0
.LLST4:
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL13-.Ltext0
	.long	.LFE1-.Ltext0
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
.LASF10:
	.string	"open"
.LASF0:
	.string	"unsigned int"
.LASF13:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF15:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF8:
	.string	"write"
.LASF2:
	.string	"unsigned char"
.LASF16:
	.string	"main"
.LASF5:
	.string	"argv"
.LASF4:
	.string	"argc"
.LASF9:
	.string	"read"
.LASF1:
	.string	"short unsigned int"
.LASF11:
	.string	"printf"
.LASF14:
	.string	"cat.c"
.LASF7:
	.string	"sizetype"
.LASF17:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF12:
	.string	"close"
.LASF6:
	.string	"char"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
