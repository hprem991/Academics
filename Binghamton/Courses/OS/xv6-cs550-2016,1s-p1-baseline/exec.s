	.file	"exec.c"
	.text
.Ltext0:
	.globl	exec
	.type	exec, @function
exec:
.LFB20:
	.file 1 "exec.c"
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
	subl	$312, %esp
	.loc 1 21 0
	call	begin_op
.LVL1:
	.loc 1 22 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	namei
.LVL2:
	movl	%eax, -40(%ebp)
.LVL3:
	cmpl	$0, -40(%ebp)
	jne	.L2
	.loc 1 23 0
	call	end_op
.LVL4:
	.loc 1 24 0
	movl	$-1, %eax
	jmp	.L26
.LVL5:
.L2:
	.loc 1 26 0
	movl	-40(%ebp), %eax
.LVL6:
	movl	%eax, (%esp)
	call	ilock
.LVL7:
	.loc 1 27 0
	movl	$0, -44(%ebp)
.LVL8:
	.loc 1 30 0
	movl	$52, 12(%esp)
	movl	$0, 8(%esp)
	leal	-244(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	readi
.LVL9:
	cmpl	$51, %eax
	ja	.L4
	.loc 1 31 0
	jmp	.L5
.L4:
	.loc 1 32 0
	movl	-244(%ebp), %eax
	cmpl	$1179403647, %eax
	je	.L6
	.loc 1 33 0
	jmp	.L5
.L6:
	.loc 1 35 0
	call	setupkvm
.LVL10:
	movl	%eax, -44(%ebp)
.LVL11:
	cmpl	$0, -44(%ebp)
	jne	.L7
	.loc 1 36 0
	jmp	.L5
.L7:
	.loc 1 39 0
	movl	$0, -32(%ebp)
.LVL12:
	.loc 1 40 0
	movl	$0, -20(%ebp)
.LVL13:
	movl	-216(%ebp), %eax
.LVL14:
	movl	%eax, -24(%ebp)
.LVL15:
	jmp	.L8
.LVL16:
.L14:
	.loc 1 41 0
	movl	-24(%ebp), %eax
	movl	$32, 12(%esp)
	movl	%eax, 8(%esp)
	leal	-276(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	readi
.LVL17:
	cmpl	$32, %eax
	je	.L9
	.loc 1 42 0
	jmp	.L5
.L9:
	.loc 1 43 0
	movl	-276(%ebp), %eax
	cmpl	$1, %eax
	je	.L10
	.loc 1 44 0
	jmp	.L11
.L10:
	.loc 1 45 0
	movl	-256(%ebp), %edx
	movl	-260(%ebp), %eax
	cmpl	%eax, %edx
	jnb	.L12
	.loc 1 46 0
	jmp	.L5
.L12:
	.loc 1 47 0
	movl	-268(%ebp), %edx
	movl	-256(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, 8(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	allocuvm
.LVL18:
	movl	%eax, -32(%ebp)
.LVL19:
	cmpl	$0, -32(%ebp)
	jne	.L13
	.loc 1 48 0
	jmp	.L5
.L13:
	.loc 1 49 0
	movl	-260(%ebp), %ecx
	movl	-272(%ebp), %edx
	movl	-268(%ebp), %eax
.LVL20:
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	-40(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	loaduvm
.LVL21:
	testl	%eax, %eax
	jns	.L11
	.loc 1 50 0
	jmp	.L5
.L11:
	.loc 1 40 0
	addl	$1, -20(%ebp)
	movl	-24(%ebp), %eax
	addl	$32, %eax
	movl	%eax, -24(%ebp)
.LVL22:
.L8:
	.loc 1 40 0 is_stmt 0 discriminator 1
	movzwl	-200(%ebp), %eax
	movzwl	%ax, %eax
	cmpl	-20(%ebp), %eax
	jg	.L14
	.loc 1 52 0 is_stmt 1
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL23:
	.loc 1 53 0
	call	end_op
.LVL24:
	.loc 1 54 0
	movl	$0, -40(%ebp)
	.loc 1 58 0
	movl	-32(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -32(%ebp)
.LVL25:
	.loc 1 59 0
	movl	-32(%ebp), %eax
	addl	$8192, %eax
.LVL26:
	movl	%eax, 8(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	allocuvm
.LVL27:
	movl	%eax, -32(%ebp)
.LVL28:
	cmpl	$0, -32(%ebp)
	jne	.L15
	.loc 1 60 0
	jmp	.L5
.L15:
	.loc 1 61 0
	movl	-32(%ebp), %eax
.LVL29:
	subl	$8192, %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	clearpteu
.LVL30:
	.loc 1 62 0
	movl	-32(%ebp), %eax
	movl	%eax, -36(%ebp)
.LVL31:
	.loc 1 65 0
	movl	$0, -28(%ebp)
.LVL32:
	jmp	.L16
.LVL33:
.L19:
	.loc 1 66 0
	cmpl	$31, -28(%ebp)
	jbe	.L17
	.loc 1 67 0
	jmp	.L5
.L17:
	.loc 1 68 0
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL34:
	movl	-36(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	subl	$1, %eax
	andl	$-4, %eax
	movl	%eax, -36(%ebp)
.LVL35:
	.loc 1 69 0
	movl	-28(%ebp), %eax
.LVL36:
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	strlen
.LVL37:
	addl	$1, %eax
	movl	%eax, %edx
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %ecx
	movl	12(%ebp), %eax
	addl	%ecx, %eax
	movl	(%eax), %eax
	movl	%edx, 12(%esp)
	movl	%eax, 8(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	copyout
.LVL38:
	testl	%eax, %eax
	jns	.L18
	.loc 1 70 0
	jmp	.L5
.L18:
	.loc 1 71 0
	movl	-28(%ebp), %eax
	leal	3(%eax), %edx
	movl	-36(%ebp), %eax
	movl	%eax, -192(%ebp,%edx,4)
	.loc 1 65 0
	addl	$1, -28(%ebp)
.L16:
	.loc 1 65 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L19
	.loc 1 73 0 is_stmt 1
	movl	-28(%ebp), %eax
	addl	$3, %eax
	movl	$0, -192(%ebp,%eax,4)
	.loc 1 75 0
	movl	$-1, -192(%ebp)
	.loc 1 76 0
	movl	-28(%ebp), %eax
	movl	%eax, -188(%ebp)
	.loc 1 77 0
	movl	-28(%ebp), %eax
	addl	$1, %eax
	leal	0(,%eax,4), %edx
	movl	-36(%ebp), %eax
	subl	%edx, %eax
	movl	%eax, -184(%ebp)
	.loc 1 79 0
	movl	-28(%ebp), %eax
	addl	$4, %eax
	sall	$2, %eax
	subl	%eax, -36(%ebp)
.LVL39:
	.loc 1 80 0
	movl	-28(%ebp), %eax
	addl	$4, %eax
	sall	$2, %eax
	movl	%eax, 12(%esp)
	leal	-192(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	copyout
.LVL40:
	testl	%eax, %eax
	jns	.L20
	.loc 1 81 0
	jmp	.L5
.L20:
	.loc 1 84 0
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL41:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
.LVL42:
	jmp	.L21
.LVL43:
.L23:
	.loc 1 85 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	cmpb	$47, %al
	jne	.L22
	.loc 1 86 0
	movl	-12(%ebp), %eax
	addl	$1, %eax
	movl	%eax, -16(%ebp)
.LVL44:
.L22:
	.loc 1 84 0
	addl	$1, -12(%ebp)
.LVL45:
.L21:
	.loc 1 84 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L23
	.loc 1 87 0 is_stmt 1
	movl	%gs:4, %eax
	leal	108(%eax), %edx
	movl	$16, 8(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	safestrcpy
.LVL46:
	.loc 1 90 0
	movl	%gs:4, %eax
	movl	4(%eax), %eax
	movl	%eax, -48(%ebp)
.LVL47:
	.loc 1 91 0
	movl	%gs:4, %eax
.LVL48:
	movl	-44(%ebp), %edx
	movl	%edx, 4(%eax)
.LVL49:
	.loc 1 92 0
	movl	%gs:4, %eax
	movl	-32(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 93 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	-220(%ebp), %edx
	movl	%edx, 56(%eax)
	.loc 1 94 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	-36(%ebp), %edx
	movl	%edx, 68(%eax)
	.loc 1 95 0
	movl	%gs:4, %eax
	movl	%eax, (%esp)
	call	switchuvm
.LVL50:
	.loc 1 96 0
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	freevm
.LVL51:
	.loc 1 97 0
	movl	$0, %eax
	jmp	.L26
.LVL52:
.L5:
	.loc 1 100 0
	cmpl	$0, -44(%ebp)
	je	.L24
	.loc 1 101 0
	movl	-44(%ebp), %eax
	movl	%eax, (%esp)
	call	freevm
.LVL53:
.L24:
	.loc 1 102 0
	cmpl	$0, -40(%ebp)
	je	.L25
	.loc 1 103 0
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL54:
	.loc 1 104 0
	call	end_op
.LVL55:
.L25:
	.loc 1 106 0
	movl	$-1, %eax
.LVL56:
.L26:
	.loc 1 107 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	exec, .-exec
.Letext0:
	.file 2 "types.h"
	.file 3 "proc.h"
	.file 4 "x86.h"
	.file 5 "elf.h"
	.file 6 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x9b1
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF78
	.byte	0x1
	.long	.LASF79
	.long	.LASF80
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x2
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x2
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x2
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x2
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.long	.LASF8
	.byte	0x14
	.byte	0x3
	.byte	0x2c
	.long	0xbb
	.uleb128 0x6
	.string	"edi"
	.byte	0x3
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x3
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebx"
	.byte	0x3
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"ebp"
	.byte	0x3
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"eip"
	.byte	0x3
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x68
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF7
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF9
	.byte	0x7c
	.byte	0x3
	.byte	0x37
	.long	0x190
	.uleb128 0x6
	.string	"sz"
	.byte	0x3
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF10
	.byte	0x3
	.byte	0x39
	.long	0x1c7
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF11
	.byte	0x3
	.byte	0x3a
	.long	0x1cd
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF12
	.byte	0x3
	.byte	0x3b
	.long	0x196
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"pid"
	.byte	0x3
	.byte	0x3c
	.long	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF13
	.byte	0x3
	.byte	0x3d
	.long	0x190
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"tf"
	.byte	0x3
	.byte	0x3e
	.long	0x33f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF8
	.byte	0x3
	.byte	0x3f
	.long	0xbb
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF14
	.byte	0x3
	.byte	0x40
	.long	0x66
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF15
	.byte	0x3
	.byte	0x41
	.long	0xc8
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF16
	.byte	0x3
	.byte	0x42
	.long	0x345
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"cwd"
	.byte	0x3
	.byte	0x43
	.long	0x367
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF17
	.byte	0x3
	.byte	0x44
	.long	0x36d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0xcf
	.uleb128 0xa
	.long	.LASF81
	.byte	0x4
	.byte	0x3
	.byte	0x34
	.long	0x1c7
	.uleb128 0xb
	.long	.LASF18
	.sleb128 0
	.uleb128 0xb
	.long	.LASF19
	.sleb128 1
	.uleb128 0xb
	.long	.LASF20
	.sleb128 2
	.uleb128 0xb
	.long	.LASF21
	.sleb128 3
	.uleb128 0xb
	.long	.LASF22
	.sleb128 4
	.uleb128 0xb
	.long	.LASF23
	.sleb128 5
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x5b
	.uleb128 0x7
	.byte	0x4
	.long	0x1d3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF24
	.uleb128 0x5
	.long	.LASF25
	.byte	0x4c
	.byte	0x4
	.byte	0x9c
	.long	0x33f
	.uleb128 0x6
	.string	"edi"
	.byte	0x4
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x4
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebp"
	.byte	0x4
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF26
	.byte	0x4
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ebx"
	.byte	0x4
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.string	"edx"
	.byte	0x4
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"ecx"
	.byte	0x4
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.string	"eax"
	.byte	0x4
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.string	"gs"
	.byte	0x4
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF27
	.byte	0x4
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x6
	.string	"fs"
	.byte	0x4
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF28
	.byte	0x4
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x6
	.string	"es"
	.byte	0x4
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF29
	.byte	0x4
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x6
	.string	"ds"
	.byte	0x4
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.long	.LASF30
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x9
	.long	.LASF31
	.byte	0x4
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x6
	.string	"err"
	.byte	0x4
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x6
	.string	"eip"
	.byte	0x4
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x6
	.string	"cs"
	.byte	0x4
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x9
	.long	.LASF33
	.byte	0x4
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x6
	.string	"esp"
	.byte	0x4
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x6
	.string	"ss"
	.byte	0x4
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF34
	.byte	0x4
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x1da
	.uleb128 0xc
	.long	0x355
	.long	0x355
	.uleb128 0xd
	.long	0xc1
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x35b
	.uleb128 0xe
	.long	.LASF35
	.byte	0x1
	.uleb128 0xe
	.long	.LASF36
	.byte	0x1
	.uleb128 0x7
	.byte	0x4
	.long	0x361
	.uleb128 0xc
	.long	0x1d3
	.long	0x37d
	.uleb128 0xd
	.long	0xc1
	.byte	0xf
	.byte	0
	.uleb128 0x5
	.long	.LASF37
	.byte	0x34
	.byte	0x5
	.byte	0x6
	.long	0x45c
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.byte	0x7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"elf"
	.byte	0x5
	.byte	0x8
	.long	0x45c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.byte	0x9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.byte	0xa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x9
	.long	.LASF41
	.byte	0x5
	.byte	0xb
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF42
	.byte	0x5
	.byte	0xc
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF43
	.byte	0x5
	.byte	0xd
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF44
	.byte	0x5
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF45
	.byte	0x5
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF46
	.byte	0x5
	.byte	0x10
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF47
	.byte	0x5
	.byte	0x11
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x9
	.long	.LASF48
	.byte	0x5
	.byte	0x12
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x9
	.long	.LASF49
	.byte	0x5
	.byte	0x13
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x9
	.long	.LASF50
	.byte	0x5
	.byte	0x14
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF51
	.byte	0x5
	.byte	0x15
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.byte	0
	.uleb128 0xc
	.long	0x49
	.long	0x46c
	.uleb128 0xd
	.long	0xc1
	.byte	0xb
	.byte	0
	.uleb128 0x5
	.long	.LASF52
	.byte	0x20
	.byte	0x5
	.byte	0x19
	.long	0x4e9
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.byte	0x1a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"off"
	.byte	0x5
	.byte	0x1b
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF53
	.byte	0x5
	.byte	0x1c
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF54
	.byte	0x5
	.byte	0x1d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF55
	.byte	0x5
	.byte	0x1e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF56
	.byte	0x5
	.byte	0x1f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF45
	.byte	0x5
	.byte	0x20
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF57
	.byte	0x5
	.byte	0x21
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF82
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	0xc8
	.long	.LFB20
	.long	.LFE20
	.long	.LLST0
	.byte	0x1
	.long	0x803
	.uleb128 0x10
	.long	.LASF58
	.byte	0x1
	.byte	0xb
	.long	0x1cd
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x10
	.long	.LASF59
	.byte	0x1
	.byte	0xb
	.long	0x803
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.string	"s"
	.byte	0x1
	.byte	0xd
	.long	0x1cd
	.long	.LLST1
	.uleb128 0x12
	.long	.LASF60
	.byte	0x1
	.byte	0xd
	.long	0x1cd
	.long	.LLST2
	.uleb128 0x11
	.string	"i"
	.byte	0x1
	.byte	0xe
	.long	0xc8
	.long	.LLST3
	.uleb128 0x11
	.string	"off"
	.byte	0x1
	.byte	0xe
	.long	0xc8
	.long	.LLST4
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.byte	0xf
	.long	0x25
	.long	.LLST5
	.uleb128 0x11
	.string	"sz"
	.byte	0x1
	.byte	0xf
	.long	0x25
	.long	.LLST6
	.uleb128 0x11
	.string	"sp"
	.byte	0x1
	.byte	0xf
	.long	0x25
	.long	.LLST7
	.uleb128 0x13
	.long	.LASF62
	.byte	0x1
	.byte	0xf
	.long	0x809
	.byte	0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x14
	.string	"elf"
	.byte	0x1
	.byte	0x10
	.long	0x37d
	.byte	0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x11
	.string	"ip"
	.byte	0x1
	.byte	0x11
	.long	0x367
	.long	.LLST8
	.uleb128 0x14
	.string	"ph"
	.byte	0x1
	.byte	0x12
	.long	0x46c
	.byte	0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x12
	.long	.LASF10
	.byte	0x1
	.byte	0x13
	.long	0x1c7
	.long	.LLST9
	.uleb128 0x12
	.long	.LASF63
	.byte	0x1
	.byte	0x13
	.long	0x1c7
	.long	.LLST10
	.uleb128 0x15
	.string	"bad"
	.byte	0x1
	.byte	0x63
	.long	.L5
	.uleb128 0x16
	.long	.LVL1
	.long	0x82a
	.uleb128 0x17
	.long	.LVL2
	.long	0x839
	.long	0x608
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.long	.LVL4
	.long	0x851
	.uleb128 0x17
	.long	.LVL7
	.long	0x860
	.long	0x627
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL9
	.long	0x874
	.long	0x654
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -252
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x2
	.byte	0x8
	.byte	0x34
	.byte	0
	.uleb128 0x16
	.long	.LVL10
	.long	0x89b
	.uleb128 0x17
	.long	.LVL17
	.long	0x874
	.long	0x68a
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -284
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0x17
	.long	.LVL18
	.long	0x8a9
	.long	0x6a8
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL21
	.long	0x8cb
	.long	0x6c6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL23
	.long	0x8f7
	.long	0x6dc
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.long	.LVL24
	.long	0x851
	.uleb128 0x17
	.long	.LVL27
	.long	0x8a9
	.long	0x70e
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x6
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0x23
	.uleb128 0x2000
	.byte	0
	.uleb128 0x17
	.long	.LVL30
	.long	0x90b
	.long	0x730
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0xa
	.value	0x2000
	.byte	0x1c
	.byte	0
	.uleb128 0x16
	.long	.LVL34
	.long	0x924
	.uleb128 0x16
	.long	.LVL37
	.long	0x924
	.uleb128 0x17
	.long	.LVL38
	.long	0x947
	.long	0x760
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL40
	.long	0x947
	.long	0x792
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -44
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -200
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x7
	.byte	0x91
	.sleb128 -36
	.byte	0x6
	.byte	0x23
	.uleb128 0x4
	.byte	0x32
	.byte	0x24
	.byte	0
	.uleb128 0x17
	.long	.LVL46
	.long	0x96e
	.long	0x7ae
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x16
	.long	.LVL50
	.long	0x990
	.uleb128 0x17
	.long	.LVL51
	.long	0x9a4
	.long	0x7cd
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -56
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL53
	.long	0x9a4
	.long	0x7e3
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -52
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL54
	.long	0x8f7
	.long	0x7f9
	.uleb128 0x18
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -48
	.byte	0x6
	.byte	0
	.uleb128 0x16
	.long	.LVL55
	.long	0x851
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x1cd
	.uleb128 0xc
	.long	0x25
	.long	0x819
	.uleb128 0xd
	.long	0xc1
	.byte	0x23
	.byte	0
	.uleb128 0x19
	.long	.LASF9
	.byte	0x3
	.byte	0x1f
	.long	.LASF83
	.long	0x190
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF64
	.byte	0x6
	.byte	0x56
	.byte	0x1
	.long	0x839
	.uleb128 0x1b
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF66
	.byte	0x6
	.byte	0x31
	.byte	0x1
	.long	0x367
	.byte	0x1
	.long	0x851
	.uleb128 0x1d
	.long	0x1cd
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF65
	.byte	0x6
	.byte	0x57
	.byte	0x1
	.long	0x860
	.uleb128 0x1b
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF70
	.byte	0x6
	.byte	0x2b
	.byte	0x1
	.byte	0x1
	.long	0x874
	.uleb128 0x1d
	.long	0x367
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF67
	.byte	0x6
	.byte	0x33
	.byte	0x1
	.long	0xc8
	.byte	0x1
	.long	0x89b
	.uleb128 0x1d
	.long	0x367
	.uleb128 0x1d
	.long	0x1cd
	.uleb128 0x1d
	.long	0x25
	.uleb128 0x1d
	.long	0x25
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF84
	.byte	0x6
	.byte	0xa9
	.byte	0x1
	.long	0x1c7
	.byte	0x1
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF68
	.byte	0x6
	.byte	0xab
	.byte	0x1
	.long	0xc8
	.byte	0x1
	.long	0x8cb
	.uleb128 0x1d
	.long	0x1c7
	.uleb128 0x1d
	.long	0x25
	.uleb128 0x1d
	.long	0x25
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF69
	.byte	0x6
	.byte	0xaf
	.byte	0x1
	.long	0xc8
	.byte	0x1
	.long	0x8f7
	.uleb128 0x1d
	.long	0x1c7
	.uleb128 0x1d
	.long	0x1cd
	.uleb128 0x1d
	.long	0x367
	.uleb128 0x1d
	.long	0x25
	.uleb128 0x1d
	.long	0x25
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF71
	.byte	0x6
	.byte	0x2e
	.byte	0x1
	.byte	0x1
	.long	0x90b
	.uleb128 0x1d
	.long	0x367
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF72
	.byte	0x6
	.byte	0xb4
	.byte	0x1
	.byte	0x1
	.long	0x924
	.uleb128 0x1d
	.long	0x1c7
	.uleb128 0x1d
	.long	0x1cd
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF73
	.byte	0x6
	.byte	0x8b
	.byte	0x1
	.long	0xc8
	.byte	0x1
	.long	0x93c
	.uleb128 0x1d
	.long	0x93c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x942
	.uleb128 0x20
	.long	0x1d3
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF74
	.byte	0x6
	.byte	0xb3
	.byte	0x1
	.long	0xc8
	.byte	0x1
	.long	0x96e
	.uleb128 0x1d
	.long	0x1c7
	.uleb128 0x1d
	.long	0x25
	.uleb128 0x1d
	.long	0x66
	.uleb128 0x1d
	.long	0x25
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF75
	.byte	0x6
	.byte	0x8a
	.byte	0x1
	.long	0x1cd
	.byte	0x1
	.long	0x990
	.uleb128 0x1d
	.long	0x1cd
	.uleb128 0x1d
	.long	0x93c
	.uleb128 0x1d
	.long	0xc8
	.byte	0
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF76
	.byte	0x6
	.byte	0xb1
	.byte	0x1
	.byte	0x1
	.long	0x9a4
	.uleb128 0x1d
	.long	0x190
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF77
	.byte	0x6
	.byte	0xad
	.byte	0x1
	.byte	0x1
	.uleb128 0x1d
	.long	0x1c7
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x4
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
	.uleb128 0xb
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
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
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL41-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL43-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST2:
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL43-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST3:
	.long	.LVL13-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL16-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST4:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST5:
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	.LVL33-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST6:
	.long	.LVL12-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL19-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL20-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL25-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL26-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL29-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST7:
	.long	.LVL31-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL33-.Ltext0
	.long	.LVL35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	.LVL35-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL36-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -44
	.long	0
	.long	0
.LLST8:
	.long	.LVL3-.Ltext0
	.long	.LVL4-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-1-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -48
	.long	0
	.long	0
.LLST9:
	.long	.LVL8-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -52
	.long	.LVL11-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LVL56-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -52
	.long	0
	.long	0
.LLST10:
	.long	.LVL47-.Ltext0
	.long	.LVL48-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL48-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 4
	.long	.LVL49-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -56
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
.LASF44:
	.string	"shoff"
.LASF56:
	.string	"memsz"
.LASF54:
	.string	"paddr"
.LASF19:
	.string	"EMBRYO"
.LASF20:
	.string	"SLEEPING"
.LASF36:
	.string	"inode"
.LASF21:
	.string	"RUNNABLE"
.LASF12:
	.string	"state"
.LASF64:
	.string	"begin_op"
.LASF83:
	.string	"%gs:4"
.LASF79:
	.string	"exec.c"
.LASF7:
	.string	"sizetype"
.LASF33:
	.string	"eflags"
.LASF25:
	.string	"trapframe"
.LASF0:
	.string	"uint"
.LASF35:
	.string	"file"
.LASF50:
	.string	"shnum"
.LASF65:
	.string	"end_op"
.LASF48:
	.string	"phnum"
.LASF78:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF47:
	.string	"phentsize"
.LASF52:
	.string	"proghdr"
.LASF13:
	.string	"parent"
.LASF15:
	.string	"killed"
.LASF63:
	.string	"oldpgdir"
.LASF82:
	.string	"exec"
.LASF49:
	.string	"shentsize"
.LASF1:
	.string	"ushort"
.LASF28:
	.string	"padding2"
.LASF29:
	.string	"padding3"
.LASF30:
	.string	"padding4"
.LASF6:
	.string	"pde_t"
.LASF34:
	.string	"padding6"
.LASF27:
	.string	"padding1"
.LASF76:
	.string	"switchuvm"
.LASF8:
	.string	"context"
.LASF4:
	.string	"uchar"
.LASF55:
	.string	"filesz"
.LASF71:
	.string	"iunlockput"
.LASF17:
	.string	"name"
.LASF45:
	.string	"flags"
.LASF42:
	.string	"entry"
.LASF32:
	.string	"padding5"
.LASF69:
	.string	"loaduvm"
.LASF16:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF43:
	.string	"phoff"
.LASF61:
	.string	"argc"
.LASF77:
	.string	"freevm"
.LASF66:
	.string	"namei"
.LASF9:
	.string	"proc"
.LASF39:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF59:
	.string	"argv"
.LASF60:
	.string	"last"
.LASF51:
	.string	"shstrndx"
.LASF11:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF75:
	.string	"safestrcpy"
.LASF14:
	.string	"chan"
.LASF24:
	.string	"char"
.LASF53:
	.string	"vaddr"
.LASF22:
	.string	"RUNNING"
.LASF73:
	.string	"strlen"
.LASF18:
	.string	"UNUSED"
.LASF46:
	.string	"ehsize"
.LASF72:
	.string	"clearpteu"
.LASF31:
	.string	"trapno"
.LASF40:
	.string	"machine"
.LASF84:
	.string	"setupkvm"
.LASF67:
	.string	"readi"
.LASF58:
	.string	"path"
.LASF68:
	.string	"allocuvm"
.LASF80:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF70:
	.string	"ilock"
.LASF26:
	.string	"oesp"
.LASF81:
	.string	"procstate"
.LASF74:
	.string	"copyout"
.LASF38:
	.string	"magic"
.LASF10:
	.string	"pgdir"
.LASF62:
	.string	"ustack"
.LASF37:
	.string	"elfhdr"
.LASF57:
	.string	"align"
.LASF23:
	.string	"ZOMBIE"
.LASF41:
	.string	"version"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
