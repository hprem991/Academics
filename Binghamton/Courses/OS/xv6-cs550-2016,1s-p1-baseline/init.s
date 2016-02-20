	.file	"init.c"
	.text
.Ltext0:
	.globl	argv
	.section	.rodata
.LC0:
	.string	"sh"
	.data
	.align 4
	.type	argv, @object
	.size	argv, 8
argv:
	.long	.LC0
	.long	0
	.section	.rodata
.LC1:
	.string	"console"
.LC2:
	.string	"init: starting sh\n"
.LC3:
	.string	"init: fork failed\n"
.LC4:
	.string	"init: exec sh failed\n"
.LC5:
	.string	"zombie!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.file 1 "init.c"
	.loc 1 12 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	.loc 1 15 0
	movl	$2, 4(%esp)
	movl	$.LC1, (%esp)
	call	open
.LVL0:
	testl	%eax, %eax
	jns	.L2
	.loc 1 16 0
	movl	$1, 8(%esp)
	movl	$1, 4(%esp)
	movl	$.LC1, (%esp)
	call	mknod
.LVL1:
	.loc 1 17 0
	movl	$2, 4(%esp)
	movl	$.LC1, (%esp)
	call	open
.LVL2:
.L2:
	.loc 1 19 0
	movl	$0, (%esp)
	call	dup
.LVL3:
	.loc 1 20 0
	movl	$0, (%esp)
	call	dup
.LVL4:
.L8:
	.loc 1 23 0
	movl	$.LC2, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL5:
	.loc 1 24 0
	call	fork
.LVL6:
	movl	%eax, 28(%esp)
.LVL7:
	.loc 1 25 0
	cmpl	$0, 28(%esp)
	jns	.L3
	.loc 1 26 0
	movl	$.LC3, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL8:
	.loc 1 27 0
	call	exit
.LVL9:
.L3:
	.loc 1 29 0
	cmpl	$0, 28(%esp)
	jne	.L4
	.loc 1 30 0
	movl	$argv, 4(%esp)
	movl	$.LC0, (%esp)
	call	exec
.LVL10:
	.loc 1 31 0
	movl	$.LC4, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL11:
	.loc 1 32 0
	call	exit
.LVL12:
.L4:
	.loc 1 34 0
	jmp	.L5
.LVL13:
.L7:
	.loc 1 35 0
	movl	$.LC5, 4(%esp)
	movl	$1, (%esp)
	call	printf
.LVL14:
.L5:
	.loc 1 34 0 discriminator 1
	call	wait
.LVL15:
	movl	%eax, 24(%esp)
.LVL16:
	cmpl	$0, 24(%esp)
	js	.L6
	.loc 1 34 0 is_stmt 0 discriminator 2
	movl	24(%esp), %eax
	cmpl	28(%esp), %eax
	jne	.L7
.L6:
	.loc 1 36 0 is_stmt 1
	jmp	.L8
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2bc
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
	.long	.LASF16
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	0x41
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x1cb
	.uleb128 0x5
	.string	"pid"
	.byte	0x1
	.byte	0xd
	.long	0x41
	.long	.LLST1
	.uleb128 0x6
	.long	.LASF4
	.byte	0x1
	.byte	0xd
	.long	0x41
	.long	.LLST2
	.uleb128 0x7
	.long	.LVL0
	.long	0x201
	.long	0xa2
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x32
	.byte	0
	.uleb128 0x7
	.long	.LVL1
	.long	0x21e
	.long	0xc6
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x31
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x7
	.long	.LVL2
	.long	0x201
	.long	0xe4
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x32
	.byte	0
	.uleb128 0x7
	.long	.LVL3
	.long	0x240
	.long	0xf8
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x7
	.long	.LVL4
	.long	0x240
	.long	0x10c
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x7
	.long	.LVL5
	.long	0x258
	.long	0x12a
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
	.long	.LC2
	.byte	0
	.uleb128 0x9
	.long	.LVL6
	.long	0x272
	.uleb128 0x7
	.long	.LVL8
	.long	0x258
	.long	0x151
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
	.long	.LC3
	.byte	0
	.uleb128 0x9
	.long	.LVL9
	.long	0x280
	.uleb128 0x7
	.long	.LVL10
	.long	0x28e
	.long	0x17c
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.uleb128 0x8
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	argv
	.byte	0
	.uleb128 0x7
	.long	.LVL11
	.long	0x258
	.long	0x19a
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
	.long	.LC4
	.byte	0
	.uleb128 0x9
	.long	.LVL12
	.long	0x280
	.uleb128 0x7
	.long	.LVL14
	.long	0x258
	.long	0x1c1
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
	.long	.LC5
	.byte	0
	.uleb128 0x9
	.long	.LVL15
	.long	0x2b1
	.byte	0
	.uleb128 0xa
	.long	0x1e2
	.long	0x1db
	.uleb128 0xb
	.long	0x1db
	.byte	0x1
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0xc
	.byte	0x4
	.long	0x1e8
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0xd
	.long	.LASF17
	.byte	0x1
	.byte	0x8
	.long	0x1cb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	argv
	.uleb128 0xe
	.byte	0x1
	.long	.LASF7
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x21e
	.uleb128 0xf
	.long	0x1e2
	.uleb128 0xf
	.long	0x41
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF8
	.byte	0x2
	.byte	0xf
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x240
	.uleb128 0xf
	.long	0x1e2
	.uleb128 0xf
	.long	0x3a
	.uleb128 0xf
	.long	0x3a
	.byte	0
	.uleb128 0x10
	.byte	0x1
	.string	"dup"
	.byte	0x2
	.byte	0x15
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x258
	.uleb128 0xf
	.long	0x41
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF18
	.byte	0x2
	.byte	0x21
	.byte	0x1
	.byte	0x1
	.long	0x272
	.uleb128 0xf
	.long	0x41
	.uleb128 0xf
	.long	0x1e2
	.uleb128 0x12
	.byte	0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF9
	.byte	0x2
	.byte	0x5
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0x13
	.byte	0x1
	.long	.LASF10
	.byte	0x2
	.byte	0x6
	.byte	0x1
	.long	0x41
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.long	.LASF11
	.byte	0x2
	.byte	0xd
	.byte	0x1
	.long	0x41
	.byte	0x1
	.long	0x2ab
	.uleb128 0xf
	.long	0x1e2
	.uleb128 0xf
	.long	0x2ab
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x1e2
	.uleb128 0x13
	.byte	0x1
	.long	.LASF12
	.byte	0x2
	.byte	0x7
	.byte	0x1
	.long	0x41
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.long	.LVL7-.Ltext0
	.long	.LVL8-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-1-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	.LVL9-.Ltext0
	.long	.LVL10-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL10-1-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL13-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 28
	.long	0
	.long	0
.LLST2:
	.long	.LVL13-.Ltext0
	.long	.LVL14-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-1-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 24
	.long	.LVL16-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x1
	.byte	0x50
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
.LASF7:
	.string	"open"
.LASF0:
	.string	"unsigned int"
.LASF12:
	.string	"wait"
.LASF13:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF11:
	.string	"exec"
.LASF15:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF6:
	.string	"char"
.LASF2:
	.string	"unsigned char"
.LASF16:
	.string	"main"
.LASF8:
	.string	"mknod"
.LASF4:
	.string	"wpid"
.LASF1:
	.string	"short unsigned int"
.LASF18:
	.string	"printf"
.LASF17:
	.string	"argv"
.LASF9:
	.string	"fork"
.LASF10:
	.string	"exit"
.LASF3:
	.string	"short int"
.LASF14:
	.string	"init.c"
.LASF5:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
