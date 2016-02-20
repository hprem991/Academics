	.file	"bio.c"
	.text
.Ltext0:
	.comm	bcache,16668,32
	.section	.rodata
.LC0:
	.string	"bcache"
	.text
	.globl	binit
	.type	binit, @function
binit:
.LFB0:
	.file 1 "bio.c"
	.loc 1 41 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 44 0
	movl	$.LC0, 4(%esp)
	movl	$bcache, (%esp)
	call	initlock
.LVL0:
	.loc 1 48 0
	movl	$bcache+16132, bcache+16144
	.loc 1 49 0
	movl	$bcache+16132, bcache+16148
	.loc 1 50 0
	movl	$bcache+52, -12(%ebp)
.LVL1:
	jmp	.L2
.L3:
	.loc 1 51 0 discriminator 2
	movl	bcache+16148, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 16(%eax)
	.loc 1 52 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	$bcache+16132, 12(%eax)
	.loc 1 53 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	$-1, 4(%eax)
	.loc 1 54 0 discriminator 2
	movl	bcache+16148, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%eax)
	.loc 1 55 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	%eax, bcache+16148
	.loc 1 50 0 discriminator 2
	addl	$536, -12(%ebp)
.LVL2:
.L2:
	.loc 1 50 0 is_stmt 0 discriminator 1
	cmpl	$bcache+16132, -12(%ebp)
	jb	.L3
	.loc 1 57 0 is_stmt 1
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL3:
	ret
	.cfi_endproc
.LFE0:
	.size	binit, .-binit
	.section	.rodata
.LC1:
	.string	"bget: no buffers"
	.text
	.type	bget, @function
bget:
.LFB1:
	.loc 1 64 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 67 0
	movl	$bcache, (%esp)
	call	acquire
.LVL5:
.L5:
	.loc 1 71 0
	movl	bcache+16148, %eax
	movl	%eax, -12(%ebp)
.LVL6:
	jmp	.L6
.LVL7:
.L10:
	.loc 1 72 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	.L7
	.loc 1 72 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	12(%ebp), %eax
	jne	.L7
	.loc 1 73 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L8
	.loc 1 74 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	orl	$1, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 75 0
	movl	$bcache, (%esp)
	call	release
.LVL8:
	.loc 1 76 0
	movl	-12(%ebp), %eax
	jmp	.L9
.L8:
	.loc 1 78 0
	movl	$bcache, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	sleep
.LVL9:
	.loc 1 79 0
	jmp	.L5
.L7:
	.loc 1 71 0
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL10:
.L6:
	.loc 1 71 0 is_stmt 0 discriminator 1
	cmpl	$bcache+16132, -12(%ebp)
	jne	.L10
	.loc 1 86 0 is_stmt 1
	movl	bcache+16144, %eax
	movl	%eax, -12(%ebp)
.LVL11:
	jmp	.L11
.LVL12:
.L13:
	.loc 1 87 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L12
	.loc 1 87 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$4, %eax
	testl	%eax, %eax
	jne	.L12
	.loc 1 88 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 89 0
	movl	-12(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 8(%eax)
	.loc 1 90 0
	movl	-12(%ebp), %eax
	movl	$1, (%eax)
	.loc 1 91 0
	movl	$bcache, (%esp)
	call	release
.LVL13:
	.loc 1 92 0
	movl	-12(%ebp), %eax
	jmp	.L9
.L12:
	.loc 1 86 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL14:
.L11:
	.loc 1 86 0 is_stmt 0 discriminator 1
	cmpl	$bcache+16132, -12(%ebp)
	jne	.L13
	.loc 1 95 0 is_stmt 1
	movl	$.LC1, (%esp)
	call	panic
.LVL15:
.L9:
	.loc 1 96 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	bget, .-bget
	.globl	bread
	.type	bread, @function
bread:
.LFB2:
	.loc 1 101 0
	.cfi_startproc
.LVL16:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 104 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	bget
.LVL17:
	movl	%eax, -12(%ebp)
.LVL18:
	.loc 1 105 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
.LVL19:
	andl	$2, %eax
	testl	%eax, %eax
	jne	.L15
	.loc 1 106 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iderw
.LVL20:
.L15:
	.loc 1 108 0
	movl	-12(%ebp), %eax
	.loc 1 109 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	bread, .-bread
	.section	.rodata
.LC2:
	.string	"bwrite"
	.text
	.globl	bwrite
	.type	bwrite, @function
bwrite:
.LFB3:
	.loc 1 114 0
	.cfi_startproc
.LVL21:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 115 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L18
	.loc 1 116 0
	movl	$.LC2, (%esp)
	call	panic
.LVL22:
.L18:
	.loc 1 117 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	orl	$4, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 118 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	iderw
.LVL23:
	.loc 1 119 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	bwrite, .-bwrite
	.section	.rodata
.LC3:
	.string	"brelse"
	.text
	.globl	brelse
	.type	brelse, @function
brelse:
.LFB4:
	.loc 1 125 0
	.cfi_startproc
.LVL24:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 126 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L20
	.loc 1 127 0
	movl	$.LC3, (%esp)
	call	panic
.LVL25:
.L20:
	.loc 1 129 0
	movl	$bcache, (%esp)
	call	acquire
.LVL26:
	.loc 1 131 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	8(%ebp), %edx
	movl	12(%edx), %edx
	movl	%edx, 12(%eax)
	.loc 1 132 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	8(%ebp), %edx
	movl	16(%edx), %edx
	movl	%edx, 16(%eax)
	.loc 1 133 0
	movl	bcache+16148, %edx
	movl	8(%ebp), %eax
	movl	%edx, 16(%eax)
	.loc 1 134 0
	movl	8(%ebp), %eax
	movl	$bcache+16132, 12(%eax)
	.loc 1 135 0
	movl	bcache+16148, %eax
	movl	8(%ebp), %edx
	movl	%edx, 12(%eax)
	.loc 1 136 0
	movl	8(%ebp), %eax
	movl	%eax, bcache+16148
	.loc 1 138 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$-2, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 139 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	wakeup
.LVL27:
	.loc 1 141 0
	movl	$bcache, (%esp)
	call	release
.LVL28:
	.loc 1 142 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	brelse, .-brelse
.Letext0:
	.file 2 "types.h"
	.file 3 "spinlock.h"
	.file 4 "buf.h"
	.file 5 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4a6
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
	.long	.LASF2
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
	.uleb128 0x2
	.long	.LASF3
	.byte	0x2
	.byte	0x3
	.long	0x49
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF10
	.byte	0x34
	.byte	0x3
	.byte	0x2
	.long	0x95
	.uleb128 0x5
	.long	.LASF5
	.byte	0x3
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF6
	.byte	0x3
	.byte	0x6
	.long	0x95
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"cpu"
	.byte	0x3
	.byte	0x7
	.long	0xa8
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"pcs"
	.byte	0x3
	.byte	0x8
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x9b
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF7
	.uleb128 0x8
	.string	"cpu"
	.byte	0x1
	.uleb128 0x7
	.byte	0x4
	.long	0xa2
	.uleb128 0x9
	.long	0x25
	.long	0xbe
	.uleb128 0xa
	.long	0xbe
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0xb
	.string	"buf"
	.value	0x218
	.byte	0x4
	.byte	0x1
	.long	0x13c
	.uleb128 0x5
	.long	.LASF11
	.byte	0x4
	.byte	0x2
	.long	0x13c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"dev"
	.byte	0x4
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF12
	.byte	0x4
	.byte	0x4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF13
	.byte	0x4
	.byte	0x5
	.long	0x143
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF14
	.byte	0x4
	.byte	0x6
	.long	0x143
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF15
	.byte	0x4
	.byte	0x7
	.long	0x143
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.long	.LASF16
	.byte	0x4
	.byte	0x8
	.long	0x149
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x7
	.byte	0x4
	.long	0xcc
	.uleb128 0x9
	.long	0x3e
	.long	0x15a
	.uleb128 0xd
	.long	0xbe
	.value	0x1ff
	.byte	0
	.uleb128 0xe
	.value	0x411c
	.byte	0x1
	.byte	0x1e
	.long	0x18f
	.uleb128 0x5
	.long	.LASF17
	.byte	0x1
	.byte	0x1f
	.long	0x50
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"buf"
	.byte	0x1
	.byte	0x20
	.long	0x18f
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.long	.LASF18
	.byte	0x1
	.byte	0x24
	.long	0xcc
	.byte	0x3
	.byte	0x23
	.uleb128 0x3f04
	.byte	0
	.uleb128 0x9
	.long	0xcc
	.long	0x19f
	.uleb128 0xa
	.long	0xbe
	.byte	0x1d
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x1e5
	.uleb128 0x10
	.string	"b"
	.byte	0x1
	.byte	0x2a
	.long	0x143
	.long	.LLST1
	.uleb128 0x11
	.long	.LVL0
	.long	0x40f
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	bcache
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	.LASF31
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.long	0x143
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x2b3
	.uleb128 0x14
	.string	"dev"
	.byte	0x1
	.byte	0x3f
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF12
	.byte	0x1
	.byte	0x3f
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.string	"b"
	.byte	0x1
	.byte	0x41
	.long	0x143
	.long	.LLST3
	.uleb128 0x16
	.long	.LASF32
	.byte	0x1
	.byte	0x45
	.long	.L5
	.uleb128 0x17
	.long	.LVL5
	.long	0x42e
	.long	0x24e
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	bcache
	.byte	0
	.uleb128 0x17
	.long	.LVL8
	.long	0x442
	.long	0x266
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	bcache
	.byte	0
	.uleb128 0x17
	.long	.LVL9
	.long	0x456
	.long	0x286
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	bcache
	.byte	0
	.uleb128 0x17
	.long	.LVL13
	.long	0x442
	.long	0x29e
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	bcache
	.byte	0
	.uleb128 0x11
	.long	.LVL15
	.long	0x471
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF33
	.byte	0x1
	.byte	0x64
	.byte	0x1
	.long	0x143
	.long	.LFB2
	.long	.LFE2
	.long	.LLST4
	.byte	0x1
	.long	0x32b
	.uleb128 0x14
	.string	"dev"
	.byte	0x1
	.byte	0x64
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF12
	.byte	0x1
	.byte	0x64
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.string	"b"
	.byte	0x1
	.byte	0x66
	.long	0x143
	.long	.LLST5
	.uleb128 0x17
	.long	.LVL17
	.long	0x1e5
	.long	0x318
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.long	.LVL20
	.long	0x485
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x71
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST6
	.byte	0x1
	.long	0x37c
	.uleb128 0x14
	.string	"b"
	.byte	0x1
	.byte	0x71
	.long	0x143
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LVL22
	.long	0x471
	.long	0x369
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x11
	.long	.LVL23
	.long	0x485
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x7c
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST7
	.byte	0x1
	.long	0x3fd
	.uleb128 0x14
	.string	"b"
	.byte	0x1
	.byte	0x7c
	.long	0x143
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LVL25
	.long	0x471
	.long	0x3ba
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x17
	.long	.LVL26
	.long	0x42e
	.long	0x3d2
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	bcache
	.byte	0
	.uleb128 0x17
	.long	.LVL27
	.long	0x499
	.long	0x3e8
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x11
	.long	.LVL28
	.long	0x442
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	bcache
	.byte	0
	.byte	0
	.uleb128 0x19
	.long	.LASF34
	.byte	0x1
	.byte	0x25
	.long	0x15a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	bcache
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF22
	.byte	0x5
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.long	0x428
	.uleb128 0x1b
	.long	0x428
	.uleb128 0x1b
	.long	0x95
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x50
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF23
	.byte	0x5
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0x442
	.uleb128 0x1b
	.long	0x428
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.long	0x456
	.uleb128 0x1b
	.long	0x428
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF25
	.byte	0x5
	.byte	0x74
	.byte	0x1
	.byte	0x1
	.long	0x46f
	.uleb128 0x1b
	.long	0x46f
	.uleb128 0x1b
	.long	0x428
	.byte	0
	.uleb128 0x1c
	.byte	0x4
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF26
	.byte	0x5
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0x485
	.uleb128 0x1b
	.long	0x95
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF27
	.byte	0x5
	.byte	0x3a
	.byte	0x1
	.byte	0x1
	.long	0x499
	.uleb128 0x1b
	.long	0x143
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF35
	.byte	0x5
	.byte	0x77
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.long	0x46f
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x11
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.long	.LVL3-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
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
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL7-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL12-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
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
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST6:
	.long	.LFB3-.Ltext0
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
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LFB4-.Ltext0
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
	.long	.LFE4-.Ltext0
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
.LASF28:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF12:
	.string	"blockno"
.LASF25:
	.string	"sleep"
.LASF26:
	.string	"panic"
.LASF31:
	.string	"bget"
.LASF10:
	.string	"spinlock"
.LASF21:
	.string	"brelse"
.LASF32:
	.string	"loop"
.LASF16:
	.string	"data"
.LASF4:
	.string	"unsigned char"
.LASF22:
	.string	"initlock"
.LASF1:
	.string	"short unsigned int"
.LASF3:
	.string	"uchar"
.LASF30:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF5:
	.string	"locked"
.LASF18:
	.string	"head"
.LASF2:
	.string	"uint"
.LASF19:
	.string	"binit"
.LASF0:
	.string	"unsigned int"
.LASF11:
	.string	"flags"
.LASF23:
	.string	"acquire"
.LASF7:
	.string	"char"
.LASF29:
	.string	"bio.c"
.LASF8:
	.string	"sizetype"
.LASF20:
	.string	"bwrite"
.LASF6:
	.string	"name"
.LASF35:
	.string	"wakeup"
.LASF9:
	.string	"short int"
.LASF15:
	.string	"qnext"
.LASF27:
	.string	"iderw"
.LASF34:
	.string	"bcache"
.LASF14:
	.string	"next"
.LASF17:
	.string	"lock"
.LASF13:
	.string	"prev"
.LASF33:
	.string	"bread"
.LASF24:
	.string	"release"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
