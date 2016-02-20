	.file	"stressfs.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"stressfs starting\n"
.LC1:
	.string	"write %d\n"
.LC2:
	.string	"read\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "stressfs.c"
	.loc 1 18 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$560, %esp
	.loc 1 20 0
	movl	$1701999731, 542(%esp)
	movl	$1936094067, 546(%esp)
	movw	$48, 550(%esp)
	.loc 1 23 0
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL1:
	.loc 1 24 0
	movl	$512, 8(%esp)
	movl	$97, 4(%esp)
	leal	30(%esp), %eax
	movl	%eax, (%esp)
	call	memset
.LVL2:
	.loc 1 26 0
	movl	$0, 556(%esp)
.LVL3:
	jmp	.L2
.L5:
	.loc 1 27 0
	call	fork
.LVL4:
	testl	%eax, %eax
	jle	.L3
	.loc 1 28 0
	jmp	.L4
.L3:
	.loc 1 26 0
	addl	$1, 556(%esp)
.LVL5:
.L2:
	.loc 1 26 0 is_stmt 0 discriminator 1
	cmpl	$3, 556(%esp)
	jle	.L5
.L4:
	.loc 1 30 0 is_stmt 1
	movl	556(%esp), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL6:
	.loc 1 32 0
	movzbl	550(%esp), %eax
	movl	%eax, %edx
	movl	556(%esp), %eax
	addl	%edx, %eax
	movb	%al, 550(%esp)
	.loc 1 33 0
	movl	$514, 4(%esp)
	leal	542(%esp), %eax
	movl	%eax, (%esp)
	call	open
.LVL7:
	movl	%eax, 552(%esp)
.LVL8:
	.loc 1 34 0
	movl	$0, 556(%esp)
	jmp	.L6
.LVL9:
.L7:
	.loc 1 36 0 discriminator 2
	movl	$512, 8(%esp)
	leal	30(%esp), %eax
	movl	%eax, 4(%esp)
	movl	552(%esp), %eax
	movl	%eax, (%esp)
	call	write
.LVL10:
	.loc 1 34 0 discriminator 2
	addl	$1, 556(%esp)
.LVL11:
.L6:
	.loc 1 34 0 is_stmt 0 discriminator 1
	cmpl	$19, 556(%esp)
	jle	.L7
	.loc 1 37 0 is_stmt 1
	movl	552(%esp), %eax
	movl	%eax, (%esp)
	call	close
.LVL12:
	.loc 1 39 0
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL13:
	.loc 1 41 0
	movl	$0, 4(%esp)
	leal	542(%esp), %eax
	movl	%eax, (%esp)
	call	open
.LVL14:
	movl	%eax, 552(%esp)
.LVL15:
	.loc 1 42 0
	movl	$0, 556(%esp)
	jmp	.L8
.LVL16:
.L9:
	.loc 1 43 0 discriminator 2
	movl	$512, 8(%esp)
	leal	30(%esp), %eax
	movl	%eax, 4(%esp)
	movl	552(%esp), %eax
	movl	%eax, (%esp)
	call	read
.LVL17:
	.loc 1 42 0 discriminator 2
	addl	$1, 556(%esp)
.LVL18:
.L8:
	.loc 1 42 0 is_stmt 0 discriminator 1
	cmpl	$19, 556(%esp)
	jle	.L9
	.loc 1 44 0 is_stmt 1
	movl	552(%esp), %eax
	movl	%eax, (%esp)
	call	close
.LVL19:
	.loc 1 46 0
	call	wait
.LVL20:
	.loc 1 48 0
	call	exit
.LVL21:
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.file 3 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x335
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF18
	.byte	0x1
	.long	.LASF19
	.long	.LASF20
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF21
	.byte	0x3
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
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.long	0x4c
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x22a
	.uleb128 0x6
	.long	.LASF6
	.byte	0x1
	.byte	0x11
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.long	.LASF7
	.byte	0x1
	.byte	0x11
	.long	0x22a
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.string	"fd"
	.byte	0x1
	.byte	0x13
	.long	0x4c
	.long	.LLST1
	.uleb128 0x8
	.string	"i"
	.byte	0x1
	.byte	0x13
	.long	0x4c
	.byte	0x3
	.byte	0x74
	.sleb128 556
	.uleb128 0x9
	.long	.LASF8
	.byte	0x1
	.byte	0x14
	.long	0x236
	.byte	0x3
	.byte	0x74
	.sleb128 542
	.uleb128 0x9
	.long	.LASF9
	.byte	0x1
	.byte	0x15
	.long	0x246
	.byte	0x2
	.byte	0x74
	.sleb128 30
	.uleb128 0xa
	.long	.LVL1
	.long	0x257
	.long	0xf1
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
	.long	.LC0
	.byte	0
	.uleb128 0xa
	.long	.LVL2
	.long	0x271
	.long	0x115
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x74
	.sleb128 30
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x61
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x200
	.byte	0
	.uleb128 0xc
	.long	.LVL4
	.long	0x295
	.uleb128 0xa
	.long	.LVL6
	.long	0x257
	.long	0x145
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
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x4
	.byte	0x74
	.sleb128 556
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	.LVL7
	.long	0x2a3
	.long	0x163
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 542
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0xa
	.value	0x202
	.byte	0
	.uleb128 0xa
	.long	.LVL10
	.long	0x2c0
	.long	0x189
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x4
	.byte	0x74
	.sleb128 552
	.byte	0x6
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x74
	.sleb128 30
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x200
	.byte	0
	.uleb128 0xa
	.long	.LVL12
	.long	0x2e2
	.long	0x1a0
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x4
	.byte	0x74
	.sleb128 552
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	.LVL13
	.long	0x257
	.long	0x1be
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
	.byte	0
	.uleb128 0xa
	.long	.LVL14
	.long	0x2a3
	.long	0x1da
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x74
	.sleb128 542
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xa
	.long	.LVL17
	.long	0x2fa
	.long	0x200
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x4
	.byte	0x74
	.sleb128 552
	.byte	0x6
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x74
	.sleb128 30
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x200
	.byte	0
	.uleb128 0xa
	.long	.LVL19
	.long	0x2e2
	.long	0x217
	.uleb128 0xb
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x4
	.byte	0x74
	.sleb128 552
	.byte	0x6
	.byte	0
	.uleb128 0xc
	.long	.LVL20
	.long	0x31c
	.uleb128 0xc
	.long	.LVL21
	.long	0x32a
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.long	0x230
	.uleb128 0xd
	.byte	0x4
	.long	0x5a
	.uleb128 0xe
	.long	0x5a
	.long	0x246
	.uleb128 0xf
	.long	0x53
	.byte	0x9
	.byte	0
	.uleb128 0xe
	.long	0x5a
	.long	0x257
	.uleb128 0x10
	.long	0x53
	.value	0x1ff
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF23
	.byte	0x2
	.byte	0x21
	.byte	0x1
	.byte	0x1
	.long	0x271
	.uleb128 0x12
	.long	0x4c
	.uleb128 0x12
	.long	0x230
	.uleb128 0x13
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x24
	.byte	0x1
	.long	0x293
	.byte	0x1
	.long	0x293
	.uleb128 0x12
	.long	0x293
	.uleb128 0x12
	.long	0x4c
	.uleb128 0x12
	.long	0x25
	.byte	0
	.uleb128 0x15
	.byte	0x4
	.uleb128 0x16
	.byte	0x1
	.long	.LASF15
	.byte	0x2
	.byte	0x5
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.uleb128 0x14
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.long	0x2c0
	.uleb128 0x12
	.long	0x230
	.uleb128 0x12
	.long	0x4c
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF12
	.byte	0x2
	.byte	0x9
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.long	0x2e2
	.uleb128 0x12
	.long	0x4c
	.uleb128 0x12
	.long	0x293
	.uleb128 0x12
	.long	0x4c
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF13
	.byte	0x2
	.byte	0xb
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.long	0x2fa
	.uleb128 0x12
	.long	0x4c
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF14
	.byte	0x2
	.byte	0xa
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.long	0x31c
	.uleb128 0x12
	.long	0x4c
	.uleb128 0x12
	.long	0x293
	.uleb128 0x12
	.long	0x4c
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF16
	.byte	0x2
	.byte	0x7
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.uleb128 0x16
	.byte	0x1
	.long	.LASF17
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.long	0x4c
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
	.uleb128 0xa
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST1:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x3
	.byte	0x74
	.sleb128 552
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x3
	.byte	0x74
	.sleb128 552
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
.LASF11:
	.string	"open"
.LASF18:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF17:
	.string	"exit"
.LASF23:
	.string	"printf"
.LASF9:
	.string	"data"
.LASF2:
	.string	"unsigned char"
.LASF1:
	.string	"short unsigned int"
.LASF12:
	.string	"write"
.LASF10:
	.string	"memset"
.LASF20:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF22:
	.string	"main"
.LASF14:
	.string	"read"
.LASF21:
	.string	"uint"
.LASF16:
	.string	"wait"
.LASF0:
	.string	"unsigned int"
.LASF15:
	.string	"fork"
.LASF5:
	.string	"char"
.LASF6:
	.string	"argc"
.LASF4:
	.string	"sizetype"
.LASF19:
	.string	"stressfs.c"
.LASF3:
	.string	"short int"
.LASF7:
	.string	"argv"
.LASF8:
	.string	"path"
.LASF13:
	.string	"close"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
