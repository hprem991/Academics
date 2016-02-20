	.file	"grep.c"
	.text
.Ltext0:
	.comm	buf,1024,32
	.globl	grep
	.type	grep, @function
grep:
.LFB0:
	.file 1 "grep.c"
	.loc 1 12 0
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
	.loc 1 16 0
	movl	$0, -12(%ebp)
.LVL1:
	.loc 1 17 0
	jmp	.L2
.LVL2:
.L7:
	.loc 1 18 0
	movl	-20(%ebp), %eax
.LVL3:
	addl	%eax, -12(%ebp)
	.loc 1 19 0
	movl	-12(%ebp), %eax
	addl	$buf, %eax
	movb	$0, (%eax)
	.loc 1 20 0
	movl	$buf, -16(%ebp)
.LVL4:
	.loc 1 21 0
	jmp	.L3
.LVL5:
.L5:
	.loc 1 22 0
	movl	-24(%ebp), %eax
.LVL6:
	movb	$0, (%eax)
	.loc 1 23 0
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	match
.LVL7:
	testl	%eax, %eax
	je	.L4
	.loc 1 24 0
	movl	-24(%ebp), %eax
	movb	$10, (%eax)
	.loc 1 25 0
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	write
.LVL8:
.L4:
	.loc 1 27 0
	movl	-24(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
.LVL9:
.L3:
	.loc 1 21 0 discriminator 1
	movl	$10, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	strchr
.LVL10:
	movl	%eax, -24(%ebp)
.LVL11:
	cmpl	$0, -24(%ebp)
	jne	.L5
	.loc 1 29 0
	cmpl	$buf, -16(%ebp)
	jne	.L6
	.loc 1 30 0
	movl	$0, -12(%ebp)
.L6:
	.loc 1 31 0
	cmpl	$0, -12(%ebp)
	jle	.L2
	.loc 1 32 0
	movl	$buf, %edx
	movl	-16(%ebp), %eax
.LVL12:
	subl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, -12(%ebp)
.LVL13:
	.loc 1 33 0
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$buf, (%esp)
	call	memmove
.LVL14:
.L2:
	.loc 1 17 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	$1023, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	-12(%ebp), %edx
	addl	$buf, %edx
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	read
.LVL15:
	movl	%eax, -20(%ebp)
.LVL16:
	cmpl	$0, -20(%ebp)
	jg	.L7
	.loc 1 36 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	grep, .-grep
	.section	.rodata
	.align 4
.LC0:
	.string	"usage: grep pattern [file ...]\n"
.LC1:
	.string	"grep: cannot open %s\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 40 0
	.cfi_startproc
.LVL17:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	.loc 1 44 0
	cmpl	$1, 8(%ebp)
	jg	.L9
	.loc 1 45 0
	movl	$.LC0, 4(%esp)
	movl	$2, (%esp)
	call	printf
.LVL18:
	.loc 1 46 0
	call	exit
.LVL19:
.L9:
	.loc 1 48 0
	movl	12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 24(%esp)
.LVL20:
	.loc 1 50 0
	cmpl	$2, 8(%ebp)
	jg	.L10
	.loc 1 51 0
	movl	$0, 4(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	grep
.LVL21:
	.loc 1 52 0
	call	exit
.LVL22:
.L10:
	.loc 1 55 0
	movl	$2, 28(%esp)
.LVL23:
	jmp	.L11
.LVL24:
.L13:
	.loc 1 56 0
	movl	28(%esp), %eax
.LVL25:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	open
.LVL26:
	movl	%eax, 20(%esp)
.LVL27:
	cmpl	$0, 20(%esp)
	jns	.L12
	.loc 1 57 0
	movl	28(%esp), %eax
.LVL28:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL29:
	.loc 1 58 0
	call	exit
.LVL30:
.L12:
	.loc 1 60 0
	movl	20(%esp), %eax
.LVL31:
	movl	%eax, 4(%esp)
	movl	24(%esp), %eax
	movl	%eax, (%esp)
	call	grep
.LVL32:
	.loc 1 61 0
	movl	20(%esp), %eax
	movl	%eax, (%esp)
	call	close
.LVL33:
	.loc 1 55 0
	addl	$1, 28(%esp)
.LVL34:
.L11:
	.loc 1 55 0 is_stmt 0 discriminator 1
	movl	28(%esp), %eax
	cmpl	8(%ebp), %eax
	jl	.L13
	.loc 1 63 0 is_stmt 1
	call	exit
.LVL35:
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.globl	match
	.type	match, @function
match:
.LFB2:
	.loc 1 74 0
	.cfi_startproc
.LVL36:
	pushl	%ebp
.LCFI5:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI6:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 75 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$94, %al
	jne	.L15
	.loc 1 76 0
	movl	8(%ebp), %eax
	leal	1(%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	matchhere
.LVL37:
	jmp	.L16
.L15:
	.loc 1 78 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	matchhere
.LVL38:
	testl	%eax, %eax
	je	.L17
	.loc 1 79 0
	movl	$1, %eax
	jmp	.L16
.L17:
	.loc 1 80 0
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 12(%ebp)
.LVL39:
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L15
	.loc 1 81 0
	movl	$0, %eax
.LVL40:
.L16:
	.loc 1 82 0
	leave
.LCFI7:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	match, .-match
	.globl	matchhere
	.type	matchhere, @function
matchhere:
.LFB3:
	.loc 1 86 0
	.cfi_startproc
.LVL41:
	pushl	%ebp
.LCFI8:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI9:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 87 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L19
	.loc 1 88 0
	movl	$1, %eax
	jmp	.L20
.L19:
	.loc 1 89 0
	movl	8(%ebp), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	cmpb	$42, %al
	jne	.L21
	.loc 1 90 0
	movl	8(%ebp), %eax
	leal	2(%eax), %ecx
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%ecx, 4(%esp)
	movl	%eax, (%esp)
	call	matchstar
.LVL42:
	jmp	.L20
.L21:
	.loc 1 91 0
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$36, %al
	jne	.L22
	.loc 1 91 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	addl	$1, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L22
	.loc 1 92 0 is_stmt 1
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	sete	%al
	movzbl	%al, %eax
	jmp	.L20
.L22:
	.loc 1 93 0
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L23
	.loc 1 93 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$46, %al
	je	.L24
	movl	8(%ebp), %eax
	movzbl	(%eax), %edx
	movl	12(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	%al, %dl
	jne	.L23
.L24:
	.loc 1 94 0 is_stmt 1
	movl	12(%ebp), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	addl	$1, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	matchhere
.LVL43:
	jmp	.L20
.L23:
	.loc 1 95 0
	movl	$0, %eax
.L20:
	.loc 1 96 0
	leave
.LCFI10:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	matchhere, .-matchhere
	.globl	matchstar
	.type	matchstar, @function
matchstar:
.LFB4:
	.loc 1 100 0
	.cfi_startproc
.LVL44:
	pushl	%ebp
.LCFI11:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI12:
	.cfi_def_cfa_register 5
	subl	$24, %esp
.L29:
	.loc 1 102 0
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	matchhere
.LVL45:
	testl	%eax, %eax
	je	.L26
	.loc 1 103 0
	movl	$1, %eax
	jmp	.L27
.L26:
	.loc 1 104 0
	movl	16(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	je	.L28
	.loc 1 104 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	leal	1(%eax), %edx
	movl	%edx, 16(%ebp)
.LVL46:
	movzbl	(%eax), %eax
	movsbl	%al, %eax
	cmpl	8(%ebp), %eax
	je	.L29
	cmpl	$46, 8(%ebp)
	je	.L29
.LVL47:
.L28:
	.loc 1 105 0 is_stmt 1
	movl	$0, %eax
.L27:
	.loc 1 106 0
	leave
.LCFI13:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	matchstar, .-matchstar
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x503
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF21
	.byte	0x1
	.long	.LASF22
	.long	.LASF23
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
	.long	.LASF24
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x169
	.uleb128 0x5
	.long	.LASF4
	.byte	0x1
	.byte	0xb
	.long	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0xb
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"n"
	.byte	0x1
	.byte	0xd
	.long	0x41
	.long	.LLST1
	.uleb128 0x8
	.string	"m"
	.byte	0x1
	.byte	0xd
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.string	"p"
	.byte	0x1
	.byte	0xe
	.long	0x169
	.long	.LLST2
	.uleb128 0x7
	.string	"q"
	.byte	0x1
	.byte	0xe
	.long	0x169
	.long	.LLST3
	.uleb128 0x9
	.long	.LVL7
	.long	0x2a5
	.long	0xce
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x9
	.long	.LVL8
	.long	0x41d
	.long	0xf8
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x9
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0x1c
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.uleb128 0x9
	.long	.LVL10
	.long	0x441
	.long	0x114
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x3a
	.byte	0
	.uleb128 0x9
	.long	.LVL14
	.long	0x469
	.long	0x13c
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0xb
	.long	.LVL15
	.long	0x48b
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x9
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0x3
	.long	buf
	.byte	0x22
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x7
	.byte	0xa
	.value	0x3ff
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0x1c
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x16f
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0xd
	.byte	0x1
	.long	.LASF8
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.long	0x41
	.long	.LFB1
	.long	.LFE1
	.long	.LLST4
	.byte	0x1
	.long	0x29f
	.uleb128 0x5
	.long	.LASF6
	.byte	0x1
	.byte	0x27
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF7
	.byte	0x1
	.byte	0x27
	.long	0x29f
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"fd"
	.byte	0x1
	.byte	0x29
	.long	0x41
	.long	.LLST5
	.uleb128 0x7
	.string	"i"
	.byte	0x1
	.byte	0x29
	.long	0x41
	.long	.LLST6
	.uleb128 0xe
	.long	.LASF4
	.byte	0x1
	.byte	0x2a
	.long	0x169
	.long	.LLST7
	.uleb128 0x9
	.long	.LVL18
	.long	0x4ad
	.long	0x1f8
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0xf
	.long	.LVL19
	.long	0x4c7
	.uleb128 0x9
	.long	.LVL21
	.long	0x48
	.long	0x21d
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.long	.LVL22
	.long	0x4c7
	.uleb128 0x9
	.long	.LVL26
	.long	0x4d5
	.long	0x23a
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x9
	.long	.LVL29
	.long	0x4ad
	.long	0x258
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0xf
	.long	.LVL30
	.long	0x4c7
	.uleb128 0x9
	.long	.LVL32
	.long	0x48
	.long	0x27f
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 24
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x74
	.sleb128 20
	.byte	0x6
	.byte	0
	.uleb128 0x9
	.long	.LVL33
	.long	0x4f2
	.long	0x295
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 20
	.byte	0x6
	.byte	0
	.uleb128 0xf
	.long	.LVL35
	.long	0x4c7
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x169
	.uleb128 0xd
	.byte	0x1
	.long	.LASF9
	.byte	0x1
	.byte	0x49
	.byte	0x1
	.long	0x41
	.long	.LFB2
	.long	.LFE2
	.long	.LLST8
	.byte	0x1
	.long	0x31a
	.uleb128 0x6
	.string	"re"
	.byte	0x1
	.byte	0x49
	.long	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.long	.LASF10
	.byte	0x1
	.byte	0x49
	.long	0x169
	.long	.LLST9
	.uleb128 0x9
	.long	.LVL37
	.long	0x31a
	.long	0x2ff
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0xb
	.long	.LVL38
	.long	0x31a
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF11
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.long	0x41
	.long	.LFB3
	.long	.LFE3
	.long	.LLST10
	.byte	0x1
	.long	0x392
	.uleb128 0x6
	.string	"re"
	.byte	0x1
	.byte	0x55
	.long	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.long	.LASF10
	.byte	0x1
	.byte	0x55
	.long	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x9
	.long	.LVL42
	.long	0x392
	.long	0x373
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0xb
	.long	.LVL43
	.long	0x31a
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0x23
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x63
	.byte	0x1
	.long	0x41
	.long	.LFB4
	.long	.LFE4
	.long	.LLST11
	.byte	0x1
	.long	0x3f3
	.uleb128 0x6
	.string	"c"
	.byte	0x1
	.byte	0x63
	.long	0x41
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"re"
	.byte	0x1
	.byte	0x63
	.long	0x169
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.long	.LASF10
	.byte	0x1
	.byte	0x63
	.long	0x169
	.long	.LLST12
	.uleb128 0xb
	.long	.LVL45
	.long	0x31a
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0xa
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	0x16f
	.long	0x404
	.uleb128 0x12
	.long	0x404
	.value	0x3ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF13
	.uleb128 0x13
	.string	"buf"
	.byte	0x1
	.byte	0x7
	.long	0x3f3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	buf
	.uleb128 0x14
	.byte	0x1
	.long	.LASF14
	.byte	0x2
	.byte	0x9
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x43f
	.uleb128 0x15
	.long	0x41
	.uleb128 0x15
	.long	0x43f
	.uleb128 0x15
	.long	0x41
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.uleb128 0x14
	.byte	0x1
	.long	.LASF15
	.byte	0x2
	.byte	0x1f
	.byte	0x1
	.long	0x169
	.byte	0x1
	.long	0x45e
	.uleb128 0x15
	.long	0x45e
	.uleb128 0x15
	.long	0x16f
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x464
	.uleb128 0x17
	.long	0x16f
	.uleb128 0x14
	.byte	0x1
	.long	.LASF16
	.byte	0x2
	.byte	0x1e
	.byte	0x1
	.long	0x43f
	.byte	0x1
	.long	0x48b
	.uleb128 0x15
	.long	0x43f
	.uleb128 0x15
	.long	0x43f
	.uleb128 0x15
	.long	0x41
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF17
	.byte	0x2
	.byte	0xa
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x4ad
	.uleb128 0x15
	.long	0x41
	.uleb128 0x15
	.long	0x43f
	.uleb128 0x15
	.long	0x41
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF19
	.byte	0x2
	.byte	0x21
	.byte	0x1
	.byte	0x1
	.long	0x4c7
	.uleb128 0x15
	.long	0x41
	.uleb128 0x15
	.long	0x169
	.uleb128 0x19
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF25
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x14
	.byte	0x1
	.long	.LASF18
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x4f2
	.uleb128 0x15
	.long	0x169
	.uleb128 0x15
	.long	0x41
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF20
	.byte	0x2
	.byte	0xb
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x15
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
	.uleb128 0x5
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
	.uleb128 0xa
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x17
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1b
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
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL3-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL16-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST2:
	.long	.LVL4-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST3:
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST4:
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
.LLST5:
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL28-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL31-.Ltext0
	.long	.LVL34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 20
	.long	0
	.long	0
.LLST6:
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL25-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	0
	.long	0
.LLST7:
	.long	.LVL20-.Ltext0
	.long	.LVL21-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-1-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	.LVL22-.Ltext0
	.long	.LVL24-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	0
	.long	0
.LLST8:
	.long	.LFB2-.Ltext0
	.long	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI5-.Ltext0
	.long	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI6-.Ltext0
	.long	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI7-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LVL36-.Ltext0
	.long	.LVL39-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL39-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL40-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST10:
	.long	.LFB3-.Ltext0
	.long	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI8-.Ltext0
	.long	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI9-.Ltext0
	.long	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI10-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LFB4-.Ltext0
	.long	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI11-.Ltext0
	.long	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI12-.Ltext0
	.long	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI13-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL44-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL47-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
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
.LASF24:
	.string	"grep"
.LASF21:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF16:
	.string	"memmove"
.LASF25:
	.string	"exit"
.LASF10:
	.string	"text"
.LASF15:
	.string	"strchr"
.LASF11:
	.string	"matchhere"
.LASF12:
	.string	"matchstar"
.LASF2:
	.string	"unsigned char"
.LASF9:
	.string	"match"
.LASF1:
	.string	"short unsigned int"
.LASF14:
	.string	"write"
.LASF23:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF8:
	.string	"main"
.LASF17:
	.string	"read"
.LASF0:
	.string	"unsigned int"
.LASF5:
	.string	"char"
.LASF6:
	.string	"argc"
.LASF13:
	.string	"sizetype"
.LASF4:
	.string	"pattern"
.LASF19:
	.string	"printf"
.LASF18:
	.string	"open"
.LASF3:
	.string	"short int"
.LASF7:
	.string	"argv"
.LASF22:
	.string	"grep.c"
.LASF20:
	.string	"close"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
