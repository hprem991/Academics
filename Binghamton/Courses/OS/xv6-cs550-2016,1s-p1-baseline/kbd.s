	.file	"kbd.c"
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
	.data
	.align 32
	.type	shiftcode, @object
	.size	shiftcode, 256
shiftcode:
	.zero	29
	.byte	2
	.zero	12
	.byte	1
	.zero	11
	.byte	1
	.zero	1
	.byte	4
	.zero	100
	.byte	2
	.zero	26
	.byte	4
	.zero	71
	.align 32
	.type	togglecode, @object
	.size	togglecode, 256
togglecode:
	.zero	58
	.byte	8
	.zero	10
	.byte	16
	.byte	32
	.zero	185
	.align 32
	.type	normalmap, @object
	.size	normalmap, 256
normalmap:
	.byte	0
	.byte	27
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	48
	.byte	45
	.byte	61
	.byte	8
	.byte	9
	.byte	113
	.byte	119
	.byte	101
	.byte	114
	.byte	116
	.byte	121
	.byte	117
	.byte	105
	.byte	111
	.byte	112
	.byte	91
	.byte	93
	.byte	10
	.byte	0
	.byte	97
	.byte	115
	.byte	100
	.byte	102
	.byte	103
	.byte	104
	.byte	106
	.byte	107
	.byte	108
	.byte	59
	.byte	39
	.byte	96
	.byte	0
	.byte	92
	.byte	122
	.byte	120
	.byte	99
	.byte	118
	.byte	98
	.byte	110
	.byte	109
	.byte	44
	.byte	46
	.byte	47
	.byte	0
	.byte	42
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	56
	.byte	57
	.byte	45
	.byte	52
	.byte	53
	.byte	54
	.byte	43
	.byte	49
	.byte	50
	.byte	51
	.byte	48
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	63
	.byte	-32
	.zero	4
	.byte	10
	.zero	24
	.byte	47
	.zero	18
	.byte	-30
	.byte	-26
	.zero	1
	.byte	-28
	.zero	1
	.byte	-27
	.zero	1
	.byte	-31
	.byte	-29
	.byte	-25
	.byte	-24
	.byte	-23
	.zero	44
	.align 32
	.type	shiftmap, @object
	.size	shiftmap, 256
shiftmap:
	.byte	0
	.byte	27
	.byte	33
	.byte	64
	.byte	35
	.byte	36
	.byte	37
	.byte	94
	.byte	38
	.byte	42
	.byte	40
	.byte	41
	.byte	95
	.byte	43
	.byte	8
	.byte	9
	.byte	81
	.byte	87
	.byte	69
	.byte	82
	.byte	84
	.byte	89
	.byte	85
	.byte	73
	.byte	79
	.byte	80
	.byte	123
	.byte	125
	.byte	10
	.byte	0
	.byte	65
	.byte	83
	.byte	68
	.byte	70
	.byte	71
	.byte	72
	.byte	74
	.byte	75
	.byte	76
	.byte	58
	.byte	34
	.byte	126
	.byte	0
	.byte	124
	.byte	90
	.byte	88
	.byte	67
	.byte	86
	.byte	66
	.byte	78
	.byte	77
	.byte	60
	.byte	62
	.byte	63
	.byte	0
	.byte	42
	.byte	0
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	55
	.byte	56
	.byte	57
	.byte	45
	.byte	52
	.byte	53
	.byte	54
	.byte	43
	.byte	49
	.byte	50
	.byte	51
	.byte	48
	.byte	46
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.zero	63
	.byte	-32
	.zero	4
	.byte	10
	.zero	24
	.byte	47
	.zero	18
	.byte	-30
	.byte	-26
	.zero	1
	.byte	-28
	.zero	1
	.byte	-27
	.zero	1
	.byte	-31
	.byte	-29
	.byte	-25
	.byte	-24
	.byte	-23
	.zero	44
	.align 32
	.type	ctlmap, @object
	.size	ctlmap, 256
ctlmap:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	17
	.byte	23
	.byte	5
	.byte	18
	.byte	20
	.byte	25
	.byte	21
	.byte	9
	.byte	15
	.byte	16
	.byte	0
	.byte	0
	.byte	13
	.byte	0
	.byte	1
	.byte	19
	.byte	4
	.byte	6
	.byte	7
	.byte	8
	.byte	10
	.byte	11
	.byte	12
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	28
	.byte	26
	.byte	24
	.byte	3
	.byte	22
	.byte	2
	.byte	14
	.byte	13
	.byte	0
	.byte	0
	.byte	-17
	.byte	0
	.byte	0
	.zero	95
	.byte	-32
	.zero	4
	.byte	13
	.zero	24
	.byte	-17
	.zero	18
	.byte	-30
	.byte	-26
	.zero	1
	.byte	-28
	.zero	1
	.byte	-27
	.zero	1
	.byte	-31
	.byte	-29
	.byte	-25
	.byte	-24
	.byte	-23
	.zero	44
	.text
	.globl	kbdgetc
	.type	kbdgetc, @function
kbdgetc:
.LFB18:
	.file 2 "kbd.c"
	.loc 2 8 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	.loc 2 15 0
	movl	$100, (%esp)
	call	inb
.LVL2:
	movzbl	%al, %eax
	movl	%eax, -12(%ebp)
.LVL3:
	.loc 2 16 0
	movl	-12(%ebp), %eax
	andl	$1, %eax
.LVL4:
	testl	%eax, %eax
	jne	.L4
	.loc 2 17 0
	movl	$-1, %eax
	jmp	.L5
.L4:
	.loc 2 18 0
	movl	$96, (%esp)
	call	inb
.LVL5:
	movzbl	%al, %eax
	movl	%eax, -4(%ebp)
.LVL6:
	.loc 2 20 0
	cmpl	$224, -4(%ebp)
	jne	.L6
	.loc 2 21 0
	movl	shift.1355, %eax
.LVL7:
	orl	$64, %eax
	movl	%eax, shift.1355
	.loc 2 22 0
	movl	$0, %eax
	jmp	.L5
.LVL8:
.L6:
	.loc 2 23 0
	movl	-4(%ebp), %eax
.LVL9:
	andl	$128, %eax
	testl	%eax, %eax
	je	.L7
	.loc 2 25 0
	movl	shift.1355, %eax
	andl	$64, %eax
	testl	%eax, %eax
	jne	.L8
	.loc 2 25 0 is_stmt 0 discriminator 1
	movl	-4(%ebp), %eax
	andl	$127, %eax
	jmp	.L9
.L8:
	.loc 2 25 0 discriminator 2
	movl	-4(%ebp), %eax
.L9:
	.loc 2 25 0 discriminator 3
	movl	%eax, -4(%ebp)
.LVL10:
	.loc 2 26 0 is_stmt 1 discriminator 3
	movl	-4(%ebp), %eax
	addl	$shiftcode, %eax
.LVL11:
	movzbl	(%eax), %eax
	orl	$64, %eax
	movzbl	%al, %eax
	notl	%eax
	movl	%eax, %edx
	movl	shift.1355, %eax
	andl	%edx, %eax
	movl	%eax, shift.1355
	.loc 2 27 0 discriminator 3
	movl	$0, %eax
	jmp	.L5
.L7:
	.loc 2 28 0
	movl	shift.1355, %eax
	andl	$64, %eax
	testl	%eax, %eax
	je	.L10
	.loc 2 30 0
	orl	$128, -4(%ebp)
.LVL12:
	.loc 2 31 0
	movl	shift.1355, %eax
	andl	$-65, %eax
	movl	%eax, shift.1355
.L10:
	.loc 2 34 0
	movl	-4(%ebp), %eax
	addl	$shiftcode, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movl	shift.1355, %eax
	orl	%edx, %eax
	movl	%eax, shift.1355
	.loc 2 35 0
	movl	-4(%ebp), %eax
	addl	$togglecode, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %edx
	movl	shift.1355, %eax
	xorl	%edx, %eax
	movl	%eax, shift.1355
	.loc 2 36 0
	movl	shift.1355, %eax
	andl	$3, %eax
	movl	charcode.1356(,%eax,4), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, -8(%ebp)
.LVL13:
	.loc 2 37 0
	movl	shift.1355, %eax
.LVL14:
	andl	$8, %eax
	testl	%eax, %eax
	je	.L11
	.loc 2 38 0
	cmpl	$96, -8(%ebp)
	jbe	.L12
	.loc 2 38 0 is_stmt 0 discriminator 1
	cmpl	$122, -8(%ebp)
	ja	.L12
	.loc 2 39 0 is_stmt 1
	subl	$32, -8(%ebp)
.LVL15:
	jmp	.L11
.L12:
	.loc 2 40 0
	cmpl	$64, -8(%ebp)
	jbe	.L11
	.loc 2 40 0 is_stmt 0 discriminator 1
	cmpl	$90, -8(%ebp)
	ja	.L11
	.loc 2 41 0 is_stmt 1
	addl	$32, -8(%ebp)
.LVL16:
.L11:
	.loc 2 43 0
	movl	-8(%ebp), %eax
.LVL17:
.L5:
	.loc 2 44 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL18:
	ret
	.cfi_endproc
.LFE18:
	.size	kbdgetc, .-kbdgetc
	.globl	kbdintr
	.type	kbdintr, @function
kbdintr:
.LFB19:
	.loc 2 48 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 49 0
	movl	$kbdgetc, (%esp)
	call	consoleintr
.LVL19:
	.loc 2 50 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	kbdintr, .-kbdintr
	.local	shift.1355
	.comm	shift.1355,4,4
	.data
	.align 4
	.type	charcode.1356, @object
	.size	charcode.1356, 16
charcode.1356:
	.long	normalmap
	.long	shiftmap
	.long	ctlmap
	.long	ctlmap
	.text
.Letext0:
	.file 3 "types.h"
	.file 4 "kbd.h"
	.file 5 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1fa
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
	.long	.LASF0
	.byte	0x3
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x3
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x3
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x4
	.string	"inb"
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0x49
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x94
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x4
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LASF6
	.byte	0x1
	.byte	0x6
	.long	0x49
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF19
	.byte	0x2
	.byte	0x7
	.byte	0x1
	.long	0x125
	.long	.LFB18
	.long	.LFE18
	.long	.LLST1
	.byte	0x1
	.long	0x125
	.uleb128 0x6
	.long	.LASF7
	.byte	0x2
	.byte	0x9
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	shift.1355
	.uleb128 0x6
	.long	.LASF8
	.byte	0x2
	.byte	0xa
	.long	0x12c
	.byte	0x5
	.byte	0x3
	.long	charcode.1356
	.uleb128 0x8
	.string	"st"
	.byte	0x2
	.byte	0xd
	.long	0x25
	.long	.LLST2
	.uleb128 0x9
	.long	.LASF6
	.byte	0x2
	.byte	0xd
	.long	0x25
	.long	.LLST3
	.uleb128 0x8
	.string	"c"
	.byte	0x2
	.byte	0xd
	.long	0x25
	.long	.LLST4
	.uleb128 0xa
	.long	.LVL2
	.long	0x5b
	.long	0x113
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0xc
	.long	.LVL5
	.long	0x5b
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x8
	.byte	0x60
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xe
	.long	0x143
	.long	0x13c
	.uleb128 0xf
	.long	0x13c
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x10
	.byte	0x4
	.long	0x49
	.uleb128 0x11
	.byte	0x1
	.long	.LASF20
	.byte	0x2
	.byte	0x2f
	.byte	0x1
	.long	.LFB19
	.long	.LFE19
	.long	.LLST5
	.byte	0x1
	.long	0x178
	.uleb128 0xc
	.long	.LVL19
	.long	0x1dd
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	kbdgetc
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	0x49
	.long	0x188
	.uleb128 0xf
	.long	0x13c
	.byte	0xff
	.byte	0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x4
	.byte	0x22
	.long	0x178
	.byte	0x5
	.byte	0x3
	.long	shiftcode
	.uleb128 0x6
	.long	.LASF11
	.byte	0x4
	.byte	0x2c
	.long	0x178
	.byte	0x5
	.byte	0x3
	.long	togglecode
	.uleb128 0x6
	.long	.LASF12
	.byte	0x4
	.byte	0x33
	.long	0x178
	.byte	0x5
	.byte	0x3
	.long	normalmap
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0x49
	.long	0x178
	.byte	0x5
	.byte	0x3
	.long	shiftmap
	.uleb128 0x6
	.long	.LASF14
	.byte	0x4
	.byte	0x5f
	.long	0x178
	.byte	0x5
	.byte	0x3
	.long	ctlmap
	.uleb128 0x12
	.byte	0x1
	.long	.LASF21
	.byte	0x5
	.byte	0x15
	.byte	0x1
	.byte	0x1
	.long	0x1f1
	.uleb128 0x13
	.long	0x1f1
	.byte	0
	.uleb128 0x10
	.byte	0x4
	.long	0x1f7
	.uleb128 0x14
	.byte	0x1
	.long	0x125
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
	.uleb128 0x7
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
	.uleb128 0x6
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
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.long	.LFB18-.Ltext0
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
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL18-.Ltext0
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST3:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -4
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -4
	.long	.LVL10-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL11-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -4
	.long	0
	.long	0
.LLST4:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -8
	.long	0
	.long	0
.LLST5:
	.long	.LFB19-.Ltext0
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
	.long	.LFE19-.Ltext0
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
.LASF15:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF7:
	.string	"shift"
.LASF21:
	.string	"consoleintr"
.LASF6:
	.string	"data"
.LASF5:
	.string	"unsigned char"
.LASF12:
	.string	"normalmap"
.LASF3:
	.string	"short unsigned int"
.LASF4:
	.string	"uchar"
.LASF17:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF13:
	.string	"shiftmap"
.LASF14:
	.string	"ctlmap"
.LASF16:
	.string	"kbd.c"
.LASF0:
	.string	"uint"
.LASF8:
	.string	"charcode"
.LASF10:
	.string	"shiftcode"
.LASF20:
	.string	"kbdintr"
.LASF2:
	.string	"unsigned int"
.LASF9:
	.string	"sizetype"
.LASF1:
	.string	"ushort"
.LASF11:
	.string	"togglecode"
.LASF18:
	.string	"port"
.LASF19:
	.string	"kbdgetc"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
