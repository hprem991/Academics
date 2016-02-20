	.file	"wc.c"
	.text
.Ltext0:
	.comm	buf,512,32
	.section	.rodata
.LC0:
	.string	" \r\t\n\013"
.LC1:
	.string	"wc: read error\n"
.LC2:
	.string	"%d %d %d %s\n"
	.text
	.globl	wc
	.type	wc, @function
wc:
.LFB0:
	.file 1 "wc.c"
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
	subl	$72, %esp
	.loc 1 13 0
	movl	$0, -24(%ebp)
.LVL1:
	movl	-24(%ebp), %eax
	movl	%eax, -20(%ebp)
.LVL2:
	movl	-20(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL3:
	.loc 1 14 0
	movl	$0, -28(%ebp)
.LVL4:
	.loc 1 15 0
	jmp	.L2
.LVL5:
.L8:
	.loc 1 16 0
	movl	$0, -12(%ebp)
.LVL6:
	jmp	.L3
.LVL7:
.L7:
	.loc 1 17 0
	addl	$1, -24(%ebp)
.LVL8:
	.loc 1 18 0
	movl	-12(%ebp), %eax
.LVL9:
	addl	$buf, %eax
	movzbl	(%eax), %eax
	cmpb	$10, %al
	jne	.L4
	.loc 1 19 0
	addl	$1, -16(%ebp)
.LVL10:
.L4:
	.loc 1 20 0
	movl	-12(%ebp), %eax
	addl	$buf, %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	strchr
.LVL11:
	testl	%eax, %eax
	je	.L5
	.loc 1 21 0
	movl	$0, -28(%ebp)
	jmp	.L6
.L5:
	.loc 1 22 0
	cmpl	$0, -28(%ebp)
	jne	.L6
	.loc 1 23 0
	addl	$1, -20(%ebp)
	.loc 1 24 0
	movl	$1, -28(%ebp)
.L6:
	.loc 1 16 0
	addl	$1, -12(%ebp)
.L3:
	.loc 1 16 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	-32(%ebp), %eax
	jl	.L7
.LVL12:
.L2:
	.loc 1 15 0 is_stmt 1 discriminator 1
	movl	$512, 8(%esp)
	movl	$buf, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	read
.LVL13:
	movl	%eax, -32(%ebp)
.LVL14:
	cmpl	$0, -32(%ebp)
	jg	.L8
	.loc 1 28 0
	cmpl	$0, -32(%ebp)
	jns	.L9
	.loc 1 29 0
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL15:
	.loc 1 30 0
	call	exit
.LVL16:
.L9:
	.loc 1 32 0
	movl	12(%ebp), %eax
.LVL17:
	movl	%eax, 20(%esp)
	movl	-24(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-20(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL18:
	.loc 1 33 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	wc, .-wc
	.section	.rodata
.LC3:
	.string	""
.LC4:
	.string	"wc: cannot open %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 37 0
	.cfi_startproc
.LVL19:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	.loc 1 40 0
	cmpl	$1, 8(%ebp)
	jg	.L11
	.loc 1 41 0
	movl	$.LC3, 4(%esp)
	movl	$0, (%esp)
	call	wc
.LVL20:
	.loc 1 42 0
	call	exit
.LVL21:
.L11:
	.loc 1 45 0
	movl	$1, 28(%esp)
.LVL22:
	jmp	.L12
.LVL23:
.L14:
	.loc 1 46 0
	movl	28(%esp), %eax
.LVL24:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	open
.LVL25:
	movl	%eax, 24(%esp)
.LVL26:
	cmpl	$0, 24(%esp)
	jns	.L13
	.loc 1 47 0
	movl	28(%esp), %eax
.LVL27:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL28:
	.loc 1 48 0
	call	exit
.LVL29:
.L13:
	.loc 1 50 0
	movl	28(%esp), %eax
.LVL30:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	wc
.LVL31:
	.loc 1 51 0
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	close
.LVL32:
	.loc 1 45 0
	addl	$1, 28(%esp)
.LVL33:
.L12:
	.loc 1 45 0 is_stmt 0 discriminator 1
	movl	28(%esp), %eax
	cmpl	8(%ebp), %eax
	jl	.L14
	.loc 1 53 0 is_stmt 1
	call	exit
.LVL34:
	.cfi_endproc
.LFE1:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x339
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF15
	.byte	0x1
	.long	.LASF16
	.long	.LASF17
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
	.string	"wc"
	.byte	0x1
	.byte	0x8
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x16d
	.uleb128 0x5
	.string	"fd"
	.byte	0x1
	.byte	0x8
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LASF4
	.byte	0x1
	.byte	0x8
	.long	0x16d
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0xa
	.long	0x41
	.long	.LLST1
	.uleb128 0x7
	.string	"n"
	.byte	0x1
	.byte	0xa
	.long	0x41
	.long	.LLST2
	.uleb128 0x7
	.string	"l"
	.byte	0x1
	.byte	0xb
	.long	0x41
	.long	.LLST3
	.uleb128 0x7
	.string	"w"
	.byte	0x1
	.byte	0xb
	.long	0x41
	.long	.LLST4
	.uleb128 0x8
	.string	"c"
	.byte	0x1
	.byte	0xb
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x9
	.long	.LASF5
	.byte	0x1
	.byte	0xb
	.long	0x41
	.long	.LLST5
	.uleb128 0xa
	.long	.LVL11
	.long	0x297
	.long	0xe3
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0xa
	.long	.LVL13
	.long	0x2bf
	.long	0x10b
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x200
	.byte	0
	.uleb128 0xa
	.long	.LVL15
	.long	0x2e3
	.long	0x129
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0xc
	.long	.LVL16
	.long	0x2fd
	.uleb128 0xd
	.long	.LVL18
	.long	0x2e3
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 20
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.long	0x173
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xf
	.byte	0x1
	.long	.LASF18
	.byte	0x1
	.byte	0x24
	.byte	0x1
	.long	0x41
	.long	.LFB1
	.long	.LFE1
	.long	.LLST6
	.byte	0x1
	.long	0x267
	.uleb128 0x6
	.long	.LASF7
	.byte	0x1
	.byte	0x24
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LASF8
	.byte	0x1
	.byte	0x24
	.long	0x267
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"fd"
	.byte	0x1
	.byte	0x26
	.long	0x41
	.long	.LLST7
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0x26
	.long	0x41
	.long	.LLST8
	.uleb128 0xa
	.long	.LVL20
	.long	0x48
	.long	0x1ed
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0xc
	.long	.LVL21
	.long	0x2fd
	.uleb128 0xa
	.long	.LVL25
	.long	0x30b
	.long	0x20a
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	.LVL28
	.long	0x2e3
	.long	0x228
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0xc
	.long	.LVL29
	.long	0x2fd
	.uleb128 0xa
	.long	.LVL31
	.long	0x48
	.long	0x247
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	.LVL32
	.long	0x328
	.long	0x25d
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.long	.LVL34
	.long	0x2fd
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.long	0x16d
	.uleb128 0x10
	.long	0x173
	.long	0x27e
	.uleb128 0x11
	.long	0x27e
	.value	0x1ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x12
	.string	"buf"
	.byte	0x1
	.byte	0x5
	.long	0x26d
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0x13
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x1f
	.byte	0x1
	.long	0x16d
	.byte	0x1
	.long	0x2b4
	.uleb128 0x14
	.long	0x2b4
	.uleb128 0x14
	.long	0x173
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.long	0x2ba
	.uleb128 0x15
	.long	0x173
	.uleb128 0x13
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0xa
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x2e1
	.uleb128 0x14
	.long	0x41
	.uleb128 0x14
	.long	0x2e1
	.uleb128 0x14
	.long	0x41
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.uleb128 0x17
	.byte	0x1
	.long	.LASF13
	.byte	0x2
	.byte	0x21
	.byte	0x1
	.byte	0x1
	.long	0x2fd
	.uleb128 0x14
	.long	0x41
	.uleb128 0x14
	.long	0x16d
	.uleb128 0x18
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF19
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x13
	.byte	0x1
	.long	.LASF12
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x328
	.uleb128 0x14
	.long	0x16d
	.uleb128 0x14
	.long	0x41
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF14
	.byte	0x2
	.byte	0xb
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x14
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x26
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL7-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST2:
	.long	.LVL5-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL14-.Ltext0
	.long	.LVL15-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL15-1-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL17-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST3:
	.long	.LVL3-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL5-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST4:
	.long	.LVL2-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL5-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST5:
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL5-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST6:
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
.LLST7:
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL30-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	0
	.long	0
.LLST8:
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-.Ltext0
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
.LASF12:
	.string	"open"
.LASF0:
	.string	"unsigned int"
.LASF15:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF18:
	.string	"main"
.LASF16:
	.string	"wc.c"
.LASF5:
	.string	"inword"
.LASF17:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF4:
	.string	"name"
.LASF10:
	.string	"strchr"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"char"
.LASF14:
	.string	"close"
.LASF7:
	.string	"argc"
.LASF11:
	.string	"read"
.LASF1:
	.string	"short unsigned int"
.LASF13:
	.string	"printf"
.LASF8:
	.string	"argv"
.LASF19:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF9:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
