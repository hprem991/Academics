	.file	"forktest.c"
	.text
.Ltext0:
	.globl	printf
	.type	printf, @function
printf:
.LFB0:
	.file 1 "forktest.c"
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
	subl	$24, %esp
	.loc 1 13 0
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL1:
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	write
.LVL2:
	.loc 1 14 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	printf, .-printf
	.section	.rodata
.LC0:
	.string	"fork test\n"
	.align 4
.LC1:
	.string	"fork claimed to work N times!\n"
.LC2:
	.string	"wait stopped early\n"
.LC3:
	.string	"wait got too many\n"
.LC4:
	.string	"fork test OK\n"
	.text
	.globl	forktest
	.type	forktest, @function
forktest:
.LFB1:
	.loc 1 18 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 21 0
	movl	$.LC0, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL3:
	.loc 1 23 0
	movl	$0, -12(%ebp)
.LVL4:
	jmp	.L3
.L7:
	.loc 1 24 0
	call	fork
.LVL5:
	movl	%eax, -16(%ebp)
.LVL6:
	.loc 1 25 0
	cmpl	$0, -16(%ebp)
	jns	.L4
	.loc 1 26 0
	jmp	.L5
.L4:
	.loc 1 27 0
	cmpl	$0, -16(%ebp)
	jne	.L6
	.loc 1 28 0
	call	exit
.LVL7:
.L6:
	.loc 1 23 0
	addl	$1, -12(%ebp)
.LVL8:
.L3:
	.loc 1 23 0 is_stmt 0 discriminator 1
	cmpl	$999, -12(%ebp)
	jle	.L7
.L5:
	.loc 1 31 0 is_stmt 1
	cmpl	$1000, -12(%ebp)
	jne	.L8
	.loc 1 32 0
	movl	$1000, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL9:
	.loc 1 33 0
	call	exit
.LVL10:
.L8:
	.loc 1 36 0
	jmp	.L9
.L11:
	.loc 1 37 0
	call	wait
.LVL11:
	testl	%eax, %eax
	jns	.L10
	.loc 1 38 0
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL12:
	.loc 1 39 0
	call	exit
.LVL13:
.L10:
	.loc 1 36 0
	subl	$1, -12(%ebp)
.L9:
	.loc 1 36 0 is_stmt 0 discriminator 1
	cmpl	$0, -12(%ebp)
	jg	.L11
	.loc 1 43 0 is_stmt 1
	call	wait
.LVL14:
	cmpl	$-1, %eax
	je	.L12
	.loc 1 44 0
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL15:
	.loc 1 45 0
	call	exit
.LVL16:
.L12:
	.loc 1 48 0
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL17:
	.loc 1 49 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL18:
	ret
	.cfi_endproc
.LFE1:
	.size	forktest, .-forktest
	.globl	main
	.type	main, @function
main:
.LFB2:
	.loc 1 53 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	.loc 1 54 0
	call	forktest
.LVL19:
	.loc 1 55 0
	call	exit
.LVL20:
	.cfi_endproc
.LFE2:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.file 3 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x269
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF12
	.byte	0x1
	.long	.LASF13
	.long	.LASF14
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF15
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
	.uleb128 0x5
	.byte	0x1
	.long	.LASF5
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xb8
	.uleb128 0x6
	.string	"fd"
	.byte	0x1
	.byte	0xb
	.long	0x4c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x6
	.string	"s"
	.byte	0x1
	.byte	0xb
	.long	0xb8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x7
	.uleb128 0x8
	.long	.LVL1
	.long	0x206
	.long	0x9d
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0xa
	.long	.LVL2
	.long	0x21e
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.long	0xbe
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x5
	.byte	0x1
	.long	.LASF6
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x1d5
	.uleb128 0xc
	.string	"n"
	.byte	0x1
	.byte	0x13
	.long	0x4c
	.long	.LLST2
	.uleb128 0xc
	.string	"pid"
	.byte	0x1
	.byte	0x13
	.long	0x4c
	.long	.LLST3
	.uleb128 0x8
	.long	.LVL3
	.long	0x53
	.long	0x119
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0xd
	.long	.LVL5
	.long	0x242
	.uleb128 0xd
	.long	.LVL7
	.long	0x250
	.uleb128 0x8
	.long	.LVL9
	.long	0x53
	.long	0x151
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x3e8
	.byte	0
	.uleb128 0xd
	.long	.LVL10
	.long	0x250
	.uleb128 0xd
	.long	.LVL11
	.long	0x25e
	.uleb128 0x8
	.long	.LVL12
	.long	0x53
	.long	0x181
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0xd
	.long	.LVL13
	.long	0x250
	.uleb128 0xd
	.long	.LVL14
	.long	0x25e
	.uleb128 0x8
	.long	.LVL15
	.long	0x53
	.long	0x1b1
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0xd
	.long	.LVL16
	.long	0x250
	.uleb128 0xa
	.long	.LVL17
	.long	0x53
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x9
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF16
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x4c
	.long	.LFB2
	.long	.LFE2
	.long	.LLST4
	.byte	0x1
	.long	0x206
	.uleb128 0xd
	.long	.LVL19
	.long	0xc5
	.uleb128 0xd
	.long	.LVL20
	.long	0x250
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF7
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.long	0x25
	.byte	0x1
	.long	0x21e
	.uleb128 0x10
	.long	0xb8
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF8
	.byte	0x2
	.byte	0x9
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.long	0x240
	.uleb128 0x10
	.long	0x4c
	.uleb128 0x10
	.long	0x240
	.uleb128 0x10
	.long	0x4c
	.byte	0
	.uleb128 0x11
	.byte	0x4
	.uleb128 0x12
	.byte	0x1
	.long	.LASF9
	.byte	0x2
	.byte	0x5
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.uleb128 0x12
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.long	0x4c
	.byte	0x1
	.uleb128 0x12
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0x7
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
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
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
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.long	.LVL4-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL18-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST3:
	.long	.LVL6-.Ltext0
	.long	.LVL7-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-1-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
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
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x75
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
.LASF0:
	.string	"unsigned int"
.LASF11:
	.string	"wait"
.LASF12:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF16:
	.string	"main"
.LASF6:
	.string	"forktest"
.LASF15:
	.string	"uint"
.LASF14:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF13:
	.string	"forktest.c"
.LASF8:
	.string	"write"
.LASF2:
	.string	"unsigned char"
.LASF4:
	.string	"char"
.LASF7:
	.string	"strlen"
.LASF1:
	.string	"short unsigned int"
.LASF5:
	.string	"printf"
.LASF9:
	.string	"fork"
.LASF10:
	.string	"exit"
.LASF3:
	.string	"short int"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
