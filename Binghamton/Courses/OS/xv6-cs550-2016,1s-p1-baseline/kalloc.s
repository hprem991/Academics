	.file	"kalloc.c"
	.text
.Ltext0:
	.type	v2p, @function
v2p:
.LFB0:
	.file 1 "memlayout.h"
	.loc 1 13 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	.loc 1 13 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	v2p, .-v2p
	.comm	kmem,60,32
	.section	.rodata
.LC0:
	.string	"kmem"
	.text
	.globl	kinit1
	.type	kinit1, @function
kinit1:
.LFB2:
	.file 2 "kalloc.c"
	.loc 2 32 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 33 0
	movl	$.LC0, 4(%esp)
	movl	$kmem, (%esp)
	call	initlock
.LVL2:
	.loc 2 34 0
	movl	$0, kmem+52
	.loc 2 35 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	freerange
.LVL3:
	.loc 2 36 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	kinit1, .-kinit1
	.globl	kinit2
	.type	kinit2, @function
kinit2:
.LFB3:
	.loc 2 40 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 41 0
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	freerange
.LVL5:
	.loc 2 42 0
	movl	$1, kmem+52
	.loc 2 43 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	kinit2, .-kinit2
	.globl	freerange
	.type	freerange, @function
freerange:
.LFB4:
	.loc 2 47 0
	.cfi_startproc
.LVL6:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 49 0
	movl	8(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL7:
	.loc 2 50 0
	jmp	.L6
.LVL8:
.L7:
	.loc 2 51 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	kfree
.LVL9:
	.loc 2 50 0 discriminator 2
	addl	$4096, -12(%ebp)
.L6:
	.loc 2 50 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	addl	$4096, %eax
	cmpl	12(%ebp), %eax
	jbe	.L7
	.loc 2 52 0 is_stmt 1
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	freerange, .-freerange
	.section	.rodata
.LC1:
	.string	"kfree"
	.text
	.globl	kfree
	.type	kfree, @function
kfree:
.LFB5:
	.loc 2 61 0
	.cfi_startproc
.LVL10:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 64 0
	movl	8(%ebp), %eax
	andl	$4095, %eax
	testl	%eax, %eax
	jne	.L9
	.loc 2 64 0 is_stmt 0 discriminator 1
	cmpl	$end, 8(%ebp)
	jb	.L9
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	v2p
.LVL11:
	cmpl	$234881023, %eax
	jbe	.L10
.L9:
	.loc 2 65 0 is_stmt 1
	movl	$.LC1, (%esp)
	call	panic
.LVL12:
.L10:
	.loc 2 68 0
	movl	$4096, 8(%esp)
	movl	$1, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
.LVL13:
	.loc 2 70 0
	movl	kmem+52, %eax
	testl	%eax, %eax
	je	.L11
	.loc 2 71 0
	movl	$kmem, (%esp)
	call	acquire
.LVL14:
.L11:
	.loc 2 72 0
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL15:
	.loc 2 73 0
	movl	kmem+56, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 2 74 0
	movl	-12(%ebp), %eax
	movl	%eax, kmem+56
	.loc 2 75 0
	movl	kmem+52, %eax
.LVL16:
	testl	%eax, %eax
	je	.L8
	.loc 2 76 0
	movl	$kmem, (%esp)
	call	release
.LVL17:
.L8:
	.loc 2 77 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	kfree, .-kfree
	.globl	kalloc
	.type	kalloc, @function
kalloc:
.LFB6:
	.loc 2 84 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 87 0
	movl	kmem+52, %eax
	testl	%eax, %eax
	je	.L14
	.loc 2 88 0
	movl	$kmem, (%esp)
	call	acquire
.LVL18:
.L14:
	.loc 2 89 0
	movl	kmem+56, %eax
	movl	%eax, -12(%ebp)
.LVL19:
	.loc 2 90 0
	cmpl	$0, -12(%ebp)
	je	.L15
	.loc 2 91 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
.LVL20:
	movl	%eax, kmem+56
.LVL21:
.L15:
	.loc 2 92 0
	movl	kmem+52, %eax
	testl	%eax, %eax
	je	.L16
	.loc 2 93 0
	movl	$kmem, (%esp)
	call	release
.LVL22:
.L16:
	.loc 2 94 0
	movl	-12(%ebp), %eax
	.loc 2 95 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL23:
	ret
	.cfi_endproc
.LFE6:
	.size	kalloc, .-kalloc
.Letext0:
	.file 3 "spinlock.h"
	.file 4 "defs.h"
	.file 5 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x405
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF22
	.byte	0x1
	.long	.LASF23
	.long	.LASF24
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF25
	.byte	0x5
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
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.long	.LASF7
	.byte	0x34
	.byte	0x3
	.byte	0x2
	.long	0x8c
	.uleb128 0x6
	.long	.LASF3
	.byte	0x3
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF4
	.byte	0x3
	.byte	0x6
	.long	0x8c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.string	"cpu"
	.byte	0x3
	.byte	0x7
	.long	0x9f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.string	"pcs"
	.byte	0x3
	.byte	0x8
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x92
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x9
	.string	"cpu"
	.byte	0x1
	.uleb128 0x8
	.byte	0x4
	.long	0x99
	.uleb128 0xa
	.long	0x25
	.long	0xb5
	.uleb128 0xb
	.long	0xb5
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0xc
	.string	"run"
	.byte	0x4
	.byte	0x2
	.byte	0xf
	.long	0xd7
	.uleb128 0x6
	.long	.LASF8
	.byte	0x2
	.byte	0x10
	.long	0xd7
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0xbc
	.uleb128 0xd
	.byte	0x3c
	.byte	0x2
	.byte	0x13
	.long	0x110
	.uleb128 0x6
	.long	.LASF9
	.byte	0x2
	.byte	0x14
	.long	0x47
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF10
	.byte	0x2
	.byte	0x15
	.long	0x110
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.long	.LASF11
	.byte	0x2
	.byte	0x16
	.long	0xd7
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xf
	.string	"v2p"
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	0x25
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x141
	.uleb128 0x10
	.string	"a"
	.byte	0x1
	.byte	0xd
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF14
	.byte	0x2
	.byte	0x1f
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST1
	.byte	0x1
	.long	0x1b4
	.uleb128 0x12
	.long	.LASF12
	.byte	0x2
	.byte	0x1f
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.long	.LASF13
	.byte	0x2
	.byte	0x1f
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.long	.LVL2
	.long	0x38f
	.long	0x199
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	kmem
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0x15
	.long	.LVL3
	.long	0x205
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF15
	.byte	0x2
	.byte	0x27
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST2
	.byte	0x1
	.long	0x205
	.uleb128 0x12
	.long	.LASF12
	.byte	0x2
	.byte	0x27
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.long	.LASF13
	.byte	0x2
	.byte	0x27
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LVL5
	.long	0x205
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF16
	.byte	0x2
	.byte	0x2e
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST3
	.byte	0x1
	.long	0x25b
	.uleb128 0x12
	.long	.LASF12
	.byte	0x2
	.byte	0x2e
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.long	.LASF13
	.byte	0x2
	.byte	0x2e
	.long	0x45
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.string	"p"
	.byte	0x2
	.byte	0x30
	.long	0x8c
	.long	.LLST4
	.uleb128 0x15
	.long	.LVL9
	.long	0x25b
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF17
	.byte	0x2
	.byte	0x3c
	.byte	0x1
	.long	.LFB5
	.long	.LFE5
	.long	.LLST5
	.byte	0x1
	.long	0x30d
	.uleb128 0x10
	.string	"v"
	.byte	0x2
	.byte	0x3c
	.long	0x8c
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.string	"r"
	.byte	0x2
	.byte	0x3e
	.long	0xd7
	.long	.LLST6
	.uleb128 0x13
	.long	.LVL11
	.long	0x117
	.long	0x2a4
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.long	.LVL12
	.long	0x3ae
	.long	0x2bc
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x13
	.long	.LVL13
	.long	0x3c2
	.long	0x2e0
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x31
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x13
	.long	.LVL14
	.long	0x3e4
	.long	0x2f8
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	kmem
	.byte	0
	.uleb128 0x15
	.long	.LVL17
	.long	0x3f8
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	kmem
	.byte	0
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF26
	.byte	0x2
	.byte	0x53
	.byte	0x1
	.long	0x8c
	.long	.LFB6
	.long	.LFE6
	.long	.LLST7
	.byte	0x1
	.long	0x365
	.uleb128 0x16
	.string	"r"
	.byte	0x2
	.byte	0x55
	.long	0xd7
	.long	.LLST8
	.uleb128 0x13
	.long	.LVL18
	.long	0x3e4
	.long	0x350
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	kmem
	.byte	0
	.uleb128 0x15
	.long	.LVL22
	.long	0x3f8
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	kmem
	.byte	0
	.byte	0
	.uleb128 0xa
	.long	0x92
	.long	0x370
	.uleb128 0x18
	.byte	0
	.uleb128 0x19
	.string	"end"
	.byte	0x2
	.byte	0xd
	.long	0x365
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.long	.LASF18
	.byte	0x2
	.byte	0x17
	.long	0xdd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	kmem
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.long	0x3a8
	.uleb128 0x1c
	.long	0x3a8
	.uleb128 0x1c
	.long	0x8c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x47
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0x3c2
	.uleb128 0x1c
	.long	0x8c
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x89
	.byte	0x1
	.long	0x45
	.byte	0x1
	.long	0x3e4
	.uleb128 0x1c
	.long	0x45
	.uleb128 0x1c
	.long	0x110
	.uleb128 0x1c
	.long	0x25
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0x3f8
	.uleb128 0x1c
	.long	0x3a8
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.long	0x3a8
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
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
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0xa
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.long	.LFB2-.Ltext0
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
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB3-.Ltext0
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
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB4-.Ltext0
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
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST5:
	.long	.LFB5-.Ltext0
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
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST7:
	.long	.LFB6-.Ltext0
	.long	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI15-.Ltext0
	.long	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI16-.Ltext0
	.long	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI17-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LVL19-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL20-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x5
	.byte	0x3
	.long	kmem+56
	.long	.LVL21-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL23-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
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
	.string	"release"
.LASF6:
	.string	"sizetype"
.LASF20:
	.string	"panic"
.LASF17:
	.string	"kfree"
.LASF25:
	.string	"uint"
.LASF18:
	.string	"kmem"
.LASF23:
	.string	"kalloc.c"
.LASF22:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF27:
	.string	"memset"
.LASF10:
	.string	"use_lock"
.LASF4:
	.string	"name"
.LASF2:
	.string	"unsigned char"
.LASF0:
	.string	"unsigned int"
.LASF12:
	.string	"vstart"
.LASF21:
	.string	"acquire"
.LASF1:
	.string	"short unsigned int"
.LASF5:
	.string	"char"
.LASF3:
	.string	"locked"
.LASF9:
	.string	"lock"
.LASF11:
	.string	"freelist"
.LASF7:
	.string	"spinlock"
.LASF13:
	.string	"vend"
.LASF24:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF19:
	.string	"initlock"
.LASF16:
	.string	"freerange"
.LASF14:
	.string	"kinit1"
.LASF15:
	.string	"kinit2"
.LASF8:
	.string	"next"
.LASF26:
	.string	"kalloc"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
