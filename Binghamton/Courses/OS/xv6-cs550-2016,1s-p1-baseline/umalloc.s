	.file	"umalloc.c"
	.text
.Ltext0:
	.local	base
	.comm	base,8,4
	.local	freep
	.comm	freep,4,4
	.globl	free
	.type	free, @function
free:
.LFB0:
	.file 1 "umalloc.c"
	.loc 1 26 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 29 0
	movl	8(%ebp), %eax
	subl	$8, %eax
	movl	%eax, -8(%ebp)
.LVL1:
	.loc 1 30 0
	movl	freep, %eax
.LVL2:
	movl	%eax, -4(%ebp)
.LVL3:
	jmp	.L2
.LVL4:
.L5:
	.loc 1 31 0
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-4(%ebp), %eax
	ja	.L3
	.loc 1 31 0 is_stmt 0 discriminator 1
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	ja	.L4
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-8(%ebp), %eax
	ja	.L4
.L3:
	.loc 1 30 0 is_stmt 1
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
.LVL5:
.L2:
	.loc 1 30 0 is_stmt 0 discriminator 1
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jbe	.L5
	.loc 1 30 0 discriminator 2
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-8(%ebp), %eax
	jbe	.L5
.L4:
	.loc 1 33 0 is_stmt 1
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,8), %edx
	movl	-8(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	.L6
	.loc 1 34 0
	movl	-8(%ebp), %eax
	movl	4(%eax), %edx
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	4(%eax), %eax
	addl	%eax, %edx
	movl	-8(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 35 0
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	movl	%edx, (%eax)
	jmp	.L7
.L6:
	.loc 1 37 0
	movl	-4(%ebp), %eax
	movl	(%eax), %edx
	movl	-8(%ebp), %eax
	movl	%edx, (%eax)
.L7:
	.loc 1 38 0
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	leal	0(,%eax,8), %edx
	movl	-4(%ebp), %eax
	addl	%edx, %eax
	cmpl	-8(%ebp), %eax
	jne	.L8
	.loc 1 39 0
	movl	-4(%ebp), %eax
	movl	4(%eax), %edx
	movl	-8(%ebp), %eax
	movl	4(%eax), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 40 0
	movl	-8(%ebp), %eax
	movl	(%eax), %edx
	movl	-4(%ebp), %eax
	movl	%edx, (%eax)
	jmp	.L9
.L8:
	.loc 1 42 0
	movl	-4(%ebp), %eax
	movl	-8(%ebp), %edx
	movl	%edx, (%eax)
.L9:
	.loc 1 43 0
	movl	-4(%ebp), %eax
	movl	%eax, freep
	.loc 1 44 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	free, .-free
	.type	morecore, @function
morecore:
.LFB1:
	.loc 1 48 0
	.cfi_startproc
.LVL6:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 52 0
	cmpl	$4095, 8(%ebp)
	ja	.L11
	.loc 1 53 0
	movl	$4096, 8(%ebp)
.LVL7:
.L11:
	.loc 1 54 0
	movl	8(%ebp), %eax
	sall	$3, %eax
	movl	%eax, (%esp)
	call	sbrk
.LVL8:
	movl	%eax, -12(%ebp)
.LVL9:
	.loc 1 55 0
	cmpl	$-1, -12(%ebp)
	jne	.L12
	.loc 1 56 0
	movl	$0, %eax
.LVL10:
	jmp	.L13
.LVL11:
.L12:
	.loc 1 57 0
	movl	-12(%ebp), %eax
.LVL12:
	movl	%eax, -16(%ebp)
.LVL13:
	.loc 1 58 0
	movl	-16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 1 59 0
	movl	-16(%ebp), %eax
	addl	$8, %eax
.LVL14:
	movl	%eax, (%esp)
	call	free
.LVL15:
	.loc 1 60 0
	movl	freep, %eax
.LVL16:
.L13:
	.loc 1 61 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	morecore, .-morecore
	.globl	malloc
	.type	malloc, @function
malloc:
.LFB2:
	.loc 1 65 0
	.cfi_startproc
.LVL17:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 69 0
	movl	8(%ebp), %eax
	addl	$7, %eax
	shrl	$3, %eax
	addl	$1, %eax
	movl	%eax, -20(%ebp)
.LVL18:
	.loc 1 70 0
	movl	freep, %eax
.LVL19:
	movl	%eax, -16(%ebp)
.LVL20:
	cmpl	$0, -16(%ebp)
	jne	.L15
	.loc 1 71 0
	movl	$base, -16(%ebp)
.LVL21:
	movl	-16(%ebp), %eax
	movl	%eax, freep
	movl	freep, %eax
	movl	%eax, base
	.loc 1 72 0
	movl	$0, base+4
.LVL22:
.L15:
	.loc 1 74 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL23:
.L21:
	.loc 1 75 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	jb	.L16
	.loc 1 76 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	cmpl	-20(%ebp), %eax
	jne	.L17
	.loc 1 77 0
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
	jmp	.L18
.L17:
	.loc 1 79 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	subl	-20(%ebp), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 80 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	sall	$3, %eax
	addl	%eax, -12(%ebp)
.LVL24:
	.loc 1 81 0
	movl	-12(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%eax)
.L18:
	.loc 1 83 0
	movl	-16(%ebp), %eax
	movl	%eax, freep
	.loc 1 84 0
	movl	-12(%ebp), %eax
	addl	$8, %eax
	jmp	.L19
.L16:
	.loc 1 86 0
	movl	freep, %eax
	cmpl	%eax, -12(%ebp)
	jne	.L20
	.loc 1 87 0
	movl	-20(%ebp), %eax
	movl	%eax, (%esp)
	call	morecore
.LVL25:
	movl	%eax, -12(%ebp)
.LVL26:
	cmpl	$0, -12(%ebp)
	jne	.L20
	.loc 1 88 0
	movl	$0, %eax
.LVL27:
	jmp	.L19
.L20:
	.loc 1 74 0
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL28:
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL29:
	.loc 1 89 0
	jmp	.L21
.LVL30:
.L19:
	.loc 1 90 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	malloc, .-malloc
.Letext0:
	.file 2 "types.h"
	.file 3 "user.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x222
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
	.long	.LASF4
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
	.uleb128 0x2
	.long	.LASF5
	.byte	0x1
	.byte	0x9
	.long	0x5e
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF6
	.uleb128 0x5
	.byte	0x8
	.byte	0x1
	.byte	0xc
	.long	0x8a
	.uleb128 0x6
	.string	"ptr"
	.byte	0x1
	.byte	0xd
	.long	0xa9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF7
	.byte	0x1
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x8
	.long	.LASF18
	.byte	0x8
	.byte	0x1
	.byte	0xb
	.long	0xa9
	.uleb128 0x9
	.string	"s"
	.byte	0x1
	.byte	0xf
	.long	0x65
	.uleb128 0x9
	.string	"x"
	.byte	0x1
	.byte	0x10
	.long	0x53
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x8a
	.uleb128 0x2
	.long	.LASF8
	.byte	0x1
	.byte	0x13
	.long	0x8a
	.uleb128 0xb
	.byte	0x1
	.long	.LASF19
	.byte	0x1
	.byte	0x19
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xfd
	.uleb128 0xc
	.string	"ap"
	.byte	0x1
	.byte	0x19
	.long	0xfd
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.string	"bp"
	.byte	0x1
	.byte	0x1b
	.long	0xff
	.long	.LLST1
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x1b
	.long	0xff
	.long	.LLST2
	.byte	0
	.uleb128 0xe
	.byte	0x4
	.uleb128 0xa
	.byte	0x4
	.long	0xaf
	.uleb128 0xf
	.long	.LASF20
	.byte	0x1
	.byte	0x2f
	.byte	0x1
	.long	0xff
	.long	.LFB1
	.long	.LFE1
	.long	.LLST3
	.byte	0x1
	.long	0x178
	.uleb128 0x10
	.string	"nu"
	.byte	0x1
	.byte	0x2f
	.long	0x25
	.long	.LLST4
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x31
	.long	0x178
	.long	.LLST5
	.uleb128 0xd
	.string	"hp"
	.byte	0x1
	.byte	0x32
	.long	0xff
	.long	.LLST6
	.uleb128 0x11
	.long	.LVL8
	.long	0x211
	.long	0x163
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x33
	.byte	0x24
	.byte	0
	.uleb128 0x13
	.long	.LVL15
	.long	0xba
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x17e
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF9
	.uleb128 0x14
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.long	0xfd
	.long	.LFB2
	.long	.LFE2
	.long	.LLST7
	.byte	0x1
	.long	0x1ef
	.uleb128 0x15
	.long	.LASF10
	.byte	0x1
	.byte	0x40
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.string	"p"
	.byte	0x1
	.byte	0x42
	.long	0xff
	.long	.LLST8
	.uleb128 0x16
	.long	.LASF11
	.byte	0x1
	.byte	0x42
	.long	0xff
	.long	.LLST9
	.uleb128 0x16
	.long	.LASF12
	.byte	0x1
	.byte	0x43
	.long	0x25
	.long	.LLST10
	.uleb128 0x13
	.long	.LVL25
	.long	0x105
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF13
	.byte	0x1
	.byte	0x15
	.long	0xaf
	.byte	0x5
	.byte	0x3
	.long	base
	.uleb128 0x17
	.long	.LASF14
	.byte	0x1
	.byte	0x16
	.long	0xff
	.byte	0x5
	.byte	0x3
	.long	freep
	.uleb128 0x18
	.byte	0x1
	.long	.LASF22
	.byte	0x3
	.byte	0x17
	.byte	0x1
	.long	0x178
	.byte	0x1
	.uleb128 0x19
	.long	0x4c
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
	.uleb128 0x8
	.uleb128 0x17
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
	.uleb128 0x9
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
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x1
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x17
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
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
	.long	.LVL1-.Ltext0
	.long	.LVL2-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL2-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -16
	.long	0
	.long	0
.LLST2:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-.Ltext0
	.long	.LFE0-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	0
	.long	0
.LLST3:
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
.LLST4:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL7-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST5:
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL10-.Ltext0
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
.LLST6:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST7:
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
.LLST8:
	.long	.LVL23-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL30-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST9:
	.long	.LVL20-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL29-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST10:
	.long	.LVL18-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
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
	.string	"nbytes"
.LASF0:
	.string	"unsigned int"
.LASF18:
	.string	"header"
.LASF15:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF16:
	.string	"umalloc.c"
.LASF4:
	.string	"uint"
.LASF8:
	.string	"Header"
.LASF17:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF22:
	.string	"sbrk"
.LASF13:
	.string	"base"
.LASF2:
	.string	"unsigned char"
.LASF12:
	.string	"nunits"
.LASF9:
	.string	"char"
.LASF6:
	.string	"long int"
.LASF20:
	.string	"morecore"
.LASF11:
	.string	"prevp"
.LASF5:
	.string	"Align"
.LASF1:
	.string	"short unsigned int"
.LASF14:
	.string	"freep"
.LASF7:
	.string	"size"
.LASF19:
	.string	"free"
.LASF3:
	.string	"short int"
.LASF21:
	.string	"malloc"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
