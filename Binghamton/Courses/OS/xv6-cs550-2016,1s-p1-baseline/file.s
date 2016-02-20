	.file	"file.c"
	.text
.Ltext0:
	.comm	devsw,80,32
	.comm	ftable,2452,32
	.section	.rodata
.LC0:
	.string	"ftable"
	.text
	.globl	fileinit
	.type	fileinit, @function
fileinit:
.LFB0:
	.file 1 "file.c"
	.loc 1 20 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 21 0
	movl	$.LC0, 4(%esp)
	movl	$ftable, (%esp)
	call	initlock
.LVL0:
	.loc 1 22 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	fileinit, .-fileinit
	.globl	filealloc
	.type	filealloc, @function
filealloc:
.LFB1:
	.loc 1 27 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 30 0
	movl	$ftable, (%esp)
	call	acquire
.LVL1:
	.loc 1 31 0
	movl	$ftable+52, -12(%ebp)
.LVL2:
	jmp	.L3
.L6:
	.loc 1 32 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L4
	.loc 1 33 0
	movl	-12(%ebp), %eax
	movl	$1, 4(%eax)
	.loc 1 34 0
	movl	$ftable, (%esp)
	call	release
.LVL3:
	.loc 1 35 0
	movl	-12(%ebp), %eax
	jmp	.L5
.L4:
	.loc 1 31 0
	addl	$24, -12(%ebp)
.LVL4:
.L3:
	.loc 1 31 0 is_stmt 0 discriminator 1
	cmpl	$ftable+2452, -12(%ebp)
	jb	.L6
	.loc 1 38 0 is_stmt 1
	movl	$ftable, (%esp)
	call	release
.LVL5:
	.loc 1 39 0
	movl	$0, %eax
.L5:
	.loc 1 40 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL6:
	ret
	.cfi_endproc
.LFE1:
	.size	filealloc, .-filealloc
	.section	.rodata
.LC1:
	.string	"filedup"
	.text
	.globl	filedup
	.type	filedup, @function
filedup:
.LFB2:
	.loc 1 45 0
	.cfi_startproc
.LVL7:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 46 0
	movl	$ftable, (%esp)
	call	acquire
.LVL8:
	.loc 1 47 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jg	.L8
	.loc 1 48 0
	movl	$.LC1, (%esp)
	call	panic
.LVL9:
.L8:
	.loc 1 49 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	.loc 1 50 0
	movl	$ftable, (%esp)
	call	release
.LVL10:
	.loc 1 51 0
	movl	8(%ebp), %eax
	.loc 1 52 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	filedup, .-filedup
	.section	.rodata
.LC2:
	.string	"fileclose"
	.text
	.globl	fileclose
	.type	fileclose, @function
fileclose:
.LFB3:
	.loc 1 57 0
	.cfi_startproc
.LVL11:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 60 0
	movl	$ftable, (%esp)
	call	acquire
.LVL12:
	.loc 1 61 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jg	.L11
	.loc 1 62 0
	movl	$.LC2, (%esp)
	call	panic
.LVL13:
.L11:
	.loc 1 63 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	leal	-1(%eax), %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jle	.L12
	.loc 1 64 0
	movl	$ftable, (%esp)
	call	release
.LVL14:
	jmp	.L10
.L12:
	.loc 1 67 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, -32(%ebp)
	movl	4(%eax), %edx
	movl	%edx, -28(%ebp)
	movl	8(%eax), %edx
	movl	%edx, -24(%ebp)
	movl	12(%eax), %edx
	movl	%edx, -20(%ebp)
	movl	16(%eax), %edx
	movl	%edx, -16(%ebp)
	movl	20(%eax), %eax
	movl	%eax, -12(%ebp)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movl	$0, 4(%eax)
	.loc 1 69 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 1 70 0
	movl	$ftable, (%esp)
	call	release
.LVL15:
	.loc 1 72 0
	movl	-32(%ebp), %eax
	cmpl	$1, %eax
	jne	.L14
	.loc 1 73 0
	movzbl	-23(%ebp), %eax
	movsbl	%al, %edx
	movl	-20(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	pipeclose
.LVL16:
	jmp	.L10
.L14:
	.loc 1 74 0
	movl	-32(%ebp), %eax
	cmpl	$2, %eax
	jne	.L10
	.loc 1 75 0
	call	begin_op
.LVL17:
	.loc 1 76 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iput
.LVL18:
	.loc 1 77 0
	call	end_op
.LVL19:
.L10:
	.loc 1 79 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	fileclose, .-fileclose
	.globl	filestat
	.type	filestat, @function
filestat:
.LFB4:
	.loc 1 84 0
	.cfi_startproc
.LVL20:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 85 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	.L17
	.loc 1 86 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	ilock
.LVL21:
	.loc 1 87 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	stati
.LVL22:
	.loc 1 88 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	iunlock
.LVL23:
	.loc 1 89 0
	movl	$0, %eax
	jmp	.L18
.L17:
	.loc 1 91 0
	movl	$-1, %eax
.L18:
	.loc 1 92 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	filestat, .-filestat
	.section	.rodata
.LC3:
	.string	"fileread"
	.text
	.globl	fileread
	.type	fileread, @function
fileread:
.LFB5:
	.loc 1 97 0
	.cfi_startproc
.LVL24:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 100 0
	movl	8(%ebp), %eax
	movzbl	8(%eax), %eax
	testb	%al, %al
	jne	.L20
	.loc 1 101 0
	movl	$-1, %eax
	jmp	.L21
.L20:
	.loc 1 102 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L22
	.loc 1 103 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	piperead
.LVL25:
	jmp	.L21
.L22:
	.loc 1 104 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	.L23
	.loc 1 105 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	ilock
.LVL26:
	.loc 1 106 0
	movl	16(%ebp), %ecx
	movl	8(%ebp), %eax
	movl	20(%eax), %edx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	readi
.LVL27:
	movl	%eax, -12(%ebp)
.LVL28:
	cmpl	$0, -12(%ebp)
	jle	.L24
	.loc 1 107 0
	movl	8(%ebp), %eax
.LVL29:
	movl	20(%eax), %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
.L24:
	.loc 1 108 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	iunlock
.LVL30:
	.loc 1 109 0
	movl	-12(%ebp), %eax
	jmp	.L21
.LVL31:
.L23:
	.loc 1 111 0
	movl	$.LC3, (%esp)
	call	panic
.LVL32:
.L21:
	.loc 1 112 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	fileread, .-fileread
	.section	.rodata
.LC4:
	.string	"short filewrite"
.LC5:
	.string	"filewrite"
	.text
	.globl	filewrite
	.type	filewrite, @function
filewrite:
.LFB6:
	.loc 1 118 0
	.cfi_startproc
.LVL33:
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 121 0
	movl	8(%ebp), %eax
	movzbl	9(%eax), %eax
	testb	%al, %al
	jne	.L26
	.loc 1 122 0
	movl	$-1, %eax
	jmp	.L27
.L26:
	.loc 1 123 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	.L28
	.loc 1 124 0
	movl	8(%ebp), %eax
	movl	12(%eax), %eax
	movl	16(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	pipewrite
.LVL34:
	jmp	.L27
.L28:
	.loc 1 125 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$2, %eax
	jne	.L29
.LBB2:
	.loc 1 132 0
	movl	$6656, -20(%ebp)
.LVL35:
	.loc 1 133 0
	movl	$0, -12(%ebp)
.LVL36:
	.loc 1 134 0
	jmp	.L30
.LVL37:
.L36:
.LBB3:
	.loc 1 135 0
	movl	-12(%ebp), %eax
.LVL38:
	movl	16(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL39:
	.loc 1 136 0
	movl	-16(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jle	.L31
	.loc 1 137 0
	movl	-20(%ebp), %eax
.LVL40:
	movl	%eax, -16(%ebp)
.LVL41:
.L31:
	.loc 1 139 0
	call	begin_op
.LVL42:
	.loc 1 140 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	ilock
.LVL43:
	.loc 1 141 0
	movl	-16(%ebp), %ecx
	movl	8(%ebp), %eax
	movl	20(%eax), %edx
	movl	-12(%ebp), %ebx
	movl	12(%ebp), %eax
	addl	%eax, %ebx
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, (%esp)
	call	writei
.LVL44:
	movl	%eax, -24(%ebp)
.LVL45:
	cmpl	$0, -24(%ebp)
	jle	.L32
	.loc 1 142 0
	movl	8(%ebp), %eax
.LVL46:
	movl	20(%eax), %edx
	movl	-24(%ebp), %eax
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 20(%eax)
.L32:
	.loc 1 143 0
	movl	8(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, (%esp)
	call	iunlock
.LVL47:
	.loc 1 144 0
	call	end_op
.LVL48:
	.loc 1 146 0
	cmpl	$0, -24(%ebp)
	jns	.L33
	.loc 1 147 0
	jmp	.L34
.L33:
	.loc 1 148 0
	movl	-24(%ebp), %eax
	cmpl	-16(%ebp), %eax
	je	.L35
	.loc 1 149 0
	movl	$.LC4, (%esp)
	call	panic
.LVL49:
.L35:
	.loc 1 150 0
	movl	-24(%ebp), %eax
	addl	%eax, -12(%ebp)
.LVL50:
.L30:
.LBE3:
	.loc 1 134 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.L36
.L34:
	.loc 1 152 0
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jne	.L37
	.loc 1 152 0 is_stmt 0 discriminator 1
	movl	16(%ebp), %eax
	jmp	.L38
.L37:
	.loc 1 152 0 discriminator 2
	movl	$-1, %eax
.L38:
	.loc 1 152 0 discriminator 3
	jmp	.L27
.LVL51:
.L29:
.LBE2:
	.loc 1 154 0 is_stmt 1
	movl	$.LC5, (%esp)
	call	panic
.LVL52:
.L27:
	.loc 1 155 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	filewrite, .-filewrite
.Letext0:
	.file 2 "file.h"
	.file 3 "spinlock.h"
	.file 4 "defs.h"
	.file 5 "types.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x869
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF54
	.byte	0x1
	.long	.LASF55
	.long	.LASF56
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF57
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
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF3
	.uleb128 0x4
	.long	0x25
	.long	0x5c
	.uleb128 0x5
	.long	0x5c
	.byte	0xc
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF4
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF5
	.uleb128 0x6
	.byte	0x4
	.byte	0x2
	.byte	0x2
	.long	0x85
	.uleb128 0x7
	.long	.LASF6
	.sleb128 0
	.uleb128 0x7
	.long	.LASF7
	.sleb128 1
	.uleb128 0x7
	.long	.LASF8
	.sleb128 2
	.byte	0
	.uleb128 0x8
	.long	.LASF13
	.byte	0x18
	.byte	0x2
	.byte	0x1
	.long	0xf3
	.uleb128 0x9
	.long	.LASF9
	.byte	0x2
	.byte	0x2
	.long	0x6a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xa
	.string	"ref"
	.byte	0x2
	.byte	0x3
	.long	0xf3
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF10
	.byte	0x2
	.byte	0x4
	.long	0x63
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF11
	.byte	0x2
	.byte	0x5
	.long	0x63
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x9
	.long	.LASF12
	.byte	0x2
	.byte	0x6
	.long	0x100
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xa
	.string	"ip"
	.byte	0x2
	.byte	0x7
	.long	0x19f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xa
	.string	"off"
	.byte	0x2
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xc
	.long	.LASF12
	.byte	0x1
	.uleb128 0xd
	.byte	0x4
	.long	0xfa
	.uleb128 0x8
	.long	.LASF14
	.byte	0x50
	.byte	0x2
	.byte	0xd
	.long	0x19f
	.uleb128 0xa
	.string	"dev"
	.byte	0x2
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF15
	.byte	0x2
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.string	"ref"
	.byte	0x2
	.byte	0x10
	.long	0xf3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF16
	.byte	0x2
	.byte	0x11
	.long	0xf3
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x9
	.long	.LASF9
	.byte	0x2
	.byte	0x13
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF17
	.byte	0x2
	.byte	0x14
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x9
	.long	.LASF18
	.byte	0x2
	.byte	0x15
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x9
	.long	.LASF19
	.byte	0x2
	.byte	0x16
	.long	0x45
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x9
	.long	.LASF20
	.byte	0x2
	.byte	0x17
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF21
	.byte	0x2
	.byte	0x18
	.long	0x4c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.long	0x106
	.uleb128 0x8
	.long	.LASF22
	.byte	0x8
	.byte	0x2
	.byte	0x1f
	.long	0x1ce
	.uleb128 0x9
	.long	.LASF23
	.byte	0x2
	.byte	0x20
	.long	0x1ee
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF24
	.byte	0x2
	.byte	0x21
	.long	0x1ee
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	0xf3
	.long	0x1e8
	.uleb128 0xf
	.long	0x19f
	.uleb128 0xf
	.long	0x1e8
	.uleb128 0xf
	.long	0xf3
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.long	0x63
	.uleb128 0xd
	.byte	0x4
	.long	0x1ce
	.uleb128 0x8
	.long	.LASF25
	.byte	0x34
	.byte	0x3
	.byte	0x2
	.long	0x239
	.uleb128 0x9
	.long	.LASF26
	.byte	0x3
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF27
	.byte	0x3
	.byte	0x6
	.long	0x1e8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xa
	.string	"cpu"
	.byte	0x3
	.byte	0x7
	.long	0x23f
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xa
	.string	"pcs"
	.byte	0x3
	.byte	0x8
	.long	0x245
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x10
	.string	"cpu"
	.byte	0x1
	.uleb128 0xd
	.byte	0x4
	.long	0x239
	.uleb128 0x4
	.long	0x25
	.long	0x255
	.uleb128 0x5
	.long	0x5c
	.byte	0x9
	.byte	0
	.uleb128 0x11
	.value	0x994
	.byte	0x1
	.byte	0xd
	.long	0x27b
	.uleb128 0x9
	.long	.LASF28
	.byte	0x1
	.byte	0xe
	.long	0x1f4
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x1
	.byte	0xf
	.long	0x27b
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x4
	.long	0x85
	.long	0x28b
	.uleb128 0x5
	.long	0x5c
	.byte	0x63
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x2c4
	.uleb128 0x13
	.long	.LVL0
	.long	0x6f7
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF29
	.byte	0x1
	.byte	0x1a
	.byte	0x1
	.long	0x334
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x334
	.uleb128 0x16
	.string	"f"
	.byte	0x1
	.byte	0x1c
	.long	0x334
	.long	.LLST2
	.uleb128 0x17
	.long	.LVL1
	.long	0x716
	.long	0x307
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.uleb128 0x17
	.long	.LVL3
	.long	0x72a
	.long	0x31f
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.uleb128 0x13
	.long	.LVL5
	.long	0x72a
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.long	0x85
	.uleb128 0x15
	.byte	0x1
	.long	.LASF30
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.long	0x334
	.long	.LFB2
	.long	.LFE2
	.long	.LLST3
	.byte	0x1
	.long	0x3a9
	.uleb128 0x18
	.string	"f"
	.byte	0x1
	.byte	0x2c
	.long	0x334
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LVL8
	.long	0x716
	.long	0x37c
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.uleb128 0x17
	.long	.LVL9
	.long	0x73e
	.long	0x394
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x13
	.long	.LVL10
	.long	0x72a
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x38
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST4
	.byte	0x1
	.long	0x488
	.uleb128 0x18
	.string	"f"
	.byte	0x1
	.byte	0x38
	.long	0x334
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.string	"ff"
	.byte	0x1
	.byte	0x3a
	.long	0x85
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.long	.LVL12
	.long	0x716
	.long	0x3f4
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.uleb128 0x17
	.long	.LVL13
	.long	0x73e
	.long	0x40c
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x17
	.long	.LVL14
	.long	0x72a
	.long	0x424
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.uleb128 0x17
	.long	.LVL15
	.long	0x72a
	.long	0x43c
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ftable
	.byte	0
	.uleb128 0x17
	.long	.LVL16
	.long	0x752
	.long	0x45f
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x8
	.byte	0x91
	.sleb128 -31
	.byte	0x94
	.byte	0x1
	.byte	0x48
	.byte	0x24
	.byte	0x48
	.byte	0x26
	.byte	0
	.uleb128 0x1a
	.long	.LVL17
	.long	0x76b
	.uleb128 0x17
	.long	.LVL18
	.long	0x77a
	.long	0x47e
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LVL19
	.long	0x78e
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF33
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.long	0xf3
	.long	.LFB4
	.long	.LFE4
	.long	.LLST5
	.byte	0x1
	.long	0x4e8
	.uleb128 0x18
	.string	"f"
	.byte	0x1
	.byte	0x53
	.long	0x334
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.string	"st"
	.byte	0x1
	.byte	0x53
	.long	0x4ee
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1a
	.long	.LVL21
	.long	0x79d
	.uleb128 0x17
	.long	.LVL22
	.long	0x7b1
	.long	0x4de
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LVL23
	.long	0x7ca
	.byte	0
	.uleb128 0xc
	.long	.LASF34
	.byte	0x1
	.uleb128 0xd
	.byte	0x4
	.long	0x4e8
	.uleb128 0x15
	.byte	0x1
	.long	.LASF35
	.byte	0x1
	.byte	0x60
	.byte	0x1
	.long	0xf3
	.long	.LFB5
	.long	.LFE5
	.long	.LLST6
	.byte	0x1
	.long	0x5a8
	.uleb128 0x18
	.string	"f"
	.byte	0x1
	.byte	0x60
	.long	0x334
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.long	.LASF36
	.byte	0x1
	.byte	0x60
	.long	0x1e8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.string	"n"
	.byte	0x1
	.byte	0x60
	.long	0xf3
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.string	"r"
	.byte	0x1
	.byte	0x62
	.long	0xf3
	.long	.LLST7
	.uleb128 0x17
	.long	.LVL25
	.long	0x7de
	.long	0x563
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LVL26
	.long	0x79d
	.uleb128 0x17
	.long	.LVL27
	.long	0x800
	.long	0x58a
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LVL30
	.long	0x7ca
	.uleb128 0x13
	.long	.LVL32
	.long	0x73e
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0x75
	.byte	0x1
	.long	0xf3
	.long	.LFB6
	.long	.LFE6
	.long	.LLST8
	.byte	0x1
	.long	0x6c3
	.uleb128 0x18
	.string	"f"
	.byte	0x1
	.byte	0x75
	.long	0x334
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.long	.LASF36
	.byte	0x1
	.byte	0x75
	.long	0x1e8
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x18
	.string	"n"
	.byte	0x1
	.byte	0x75
	.long	0xf3
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x16
	.string	"r"
	.byte	0x1
	.byte	0x77
	.long	0xf3
	.long	.LLST9
	.uleb128 0x1c
	.long	.LBB2
	.long	.LBE2
	.long	0x690
	.uleb128 0x16
	.string	"max"
	.byte	0x1
	.byte	0x84
	.long	0xf3
	.long	.LLST10
	.uleb128 0x16
	.string	"i"
	.byte	0x1
	.byte	0x85
	.long	0xf3
	.long	.LLST11
	.uleb128 0x1d
	.long	.LBB3
	.long	.LBE3
	.uleb128 0x16
	.string	"n1"
	.byte	0x1
	.byte	0x87
	.long	0xf3
	.long	.LLST12
	.uleb128 0x1a
	.long	.LVL42
	.long	0x76b
	.uleb128 0x1a
	.long	.LVL43
	.long	0x79d
	.uleb128 0x17
	.long	.LVL44
	.long	0x827
	.long	0x668
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x1a
	.long	.LVL47
	.long	0x7ca
	.uleb128 0x1a
	.long	.LVL48
	.long	0x78e
	.uleb128 0x13
	.long	.LVL49
	.long	0x73e
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LVL34
	.long	0x84e
	.long	0x6ae
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0
	.uleb128 0x13
	.long	.LVL52
	.long	0x73e
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC5
	.byte	0
	.byte	0
	.uleb128 0x4
	.long	0x1a5
	.long	0x6d3
	.uleb128 0x5
	.long	0x5c
	.byte	0x9
	.byte	0
	.uleb128 0x1e
	.long	.LASF22
	.byte	0x1
	.byte	0xc
	.long	0x6c3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	devsw
	.uleb128 0x1e
	.long	.LASF38
	.byte	0x1
	.byte	0x10
	.long	0x255
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ftable
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.long	0x710
	.uleb128 0xf
	.long	0x710
	.uleb128 0xf
	.long	0x1e8
	.byte	0
	.uleb128 0xd
	.byte	0x4
	.long	0x1f4
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0x72a
	.uleb128 0xf
	.long	0x710
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.long	0x73e
	.uleb128 0xf
	.long	0x710
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0x752
	.uleb128 0xf
	.long	0x1e8
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF43
	.byte	0x4
	.byte	0x65
	.byte	0x1
	.byte	0x1
	.long	0x76b
	.uleb128 0xf
	.long	0x100
	.uleb128 0xf
	.long	0xf3
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF45
	.byte	0x4
	.byte	0x56
	.byte	0x1
	.long	0x77a
	.uleb128 0x21
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF44
	.byte	0x4
	.byte	0x2c
	.byte	0x1
	.byte	0x1
	.long	0x78e
	.uleb128 0xf
	.long	0x19f
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF46
	.byte	0x4
	.byte	0x57
	.byte	0x1
	.long	0x79d
	.uleb128 0x21
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF47
	.byte	0x4
	.byte	0x2b
	.byte	0x1
	.byte	0x1
	.long	0x7b1
	.uleb128 0xf
	.long	0x19f
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF48
	.byte	0x4
	.byte	0x34
	.byte	0x1
	.byte	0x1
	.long	0x7ca
	.uleb128 0xf
	.long	0x19f
	.uleb128 0xf
	.long	0x4ee
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.long	.LASF49
	.byte	0x4
	.byte	0x2d
	.byte	0x1
	.byte	0x1
	.long	0x7de
	.uleb128 0xf
	.long	0x19f
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF50
	.byte	0x4
	.byte	0x66
	.byte	0x1
	.long	0xf3
	.byte	0x1
	.long	0x800
	.uleb128 0xf
	.long	0x100
	.uleb128 0xf
	.long	0x1e8
	.uleb128 0xf
	.long	0xf3
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF51
	.byte	0x4
	.byte	0x33
	.byte	0x1
	.long	0xf3
	.byte	0x1
	.long	0x827
	.uleb128 0xf
	.long	0x19f
	.uleb128 0xf
	.long	0x1e8
	.uleb128 0xf
	.long	0x25
	.uleb128 0xf
	.long	0x25
	.byte	0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF52
	.byte	0x4
	.byte	0x35
	.byte	0x1
	.long	0xf3
	.byte	0x1
	.long	0x84e
	.uleb128 0xf
	.long	0x19f
	.uleb128 0xf
	.long	0x1e8
	.uleb128 0xf
	.long	0x25
	.uleb128 0xf
	.long	0x25
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF53
	.byte	0x4
	.byte	0x67
	.byte	0x1
	.long	0xf3
	.byte	0x1
	.uleb128 0xf
	.long	0x100
	.uleb128 0xf
	.long	0x1e8
	.uleb128 0xf
	.long	0xf3
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4
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
	.uleb128 0x7
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.long	.LVL2-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL6-.Ltext0
	.long	.LFE1-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST3:
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
.LLST4:
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
.LLST5:
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
.LLST6:
	.long	.LFB5-.Ltext0
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
	.long	.LFE5-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL29-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST8:
	.long	.LFB6-.Ltext0
	.long	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI18-.Ltext0
	.long	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI19-.Ltext0
	.long	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI20-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL46-.Ltext0
	.long	.LVL50-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST10:
	.long	.LVL35-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST11:
	.long	.LVL36-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL38-.Ltext0
	.long	.LVL51-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST12:
	.long	.LVL39-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL40-.Ltext0
	.long	.LVL41-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL41-.Ltext0
	.long	.LVL50-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
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
.LASF33:
	.string	"filestat"
.LASF54:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF34:
	.string	"stat"
.LASF43:
	.string	"pipeclose"
.LASF31:
	.string	"fileinit"
.LASF7:
	.string	"FD_PIPE"
.LASF41:
	.string	"release"
.LASF48:
	.string	"stati"
.LASF25:
	.string	"spinlock"
.LASF52:
	.string	"writei"
.LASF44:
	.string	"iput"
.LASF51:
	.string	"readi"
.LASF22:
	.string	"devsw"
.LASF36:
	.string	"addr"
.LASF10:
	.string	"readable"
.LASF13:
	.string	"file"
.LASF2:
	.string	"unsigned char"
.LASF39:
	.string	"initlock"
.LASF18:
	.string	"minor"
.LASF1:
	.string	"short unsigned int"
.LASF24:
	.string	"write"
.LASF30:
	.string	"filedup"
.LASF29:
	.string	"filealloc"
.LASF56:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF15:
	.string	"inum"
.LASF21:
	.string	"addrs"
.LASF26:
	.string	"locked"
.LASF8:
	.string	"FD_INODE"
.LASF57:
	.string	"uint"
.LASF0:
	.string	"unsigned int"
.LASF16:
	.string	"flags"
.LASF40:
	.string	"acquire"
.LASF5:
	.string	"char"
.LASF49:
	.string	"iunlock"
.LASF17:
	.string	"major"
.LASF53:
	.string	"pipewrite"
.LASF4:
	.string	"sizetype"
.LASF46:
	.string	"end_op"
.LASF6:
	.string	"FD_NONE"
.LASF37:
	.string	"filewrite"
.LASF27:
	.string	"name"
.LASF50:
	.string	"piperead"
.LASF9:
	.string	"type"
.LASF3:
	.string	"short int"
.LASF35:
	.string	"fileread"
.LASF38:
	.string	"ftable"
.LASF12:
	.string	"pipe"
.LASF11:
	.string	"writable"
.LASF14:
	.string	"inode"
.LASF42:
	.string	"panic"
.LASF19:
	.string	"nlink"
.LASF45:
	.string	"begin_op"
.LASF28:
	.string	"lock"
.LASF20:
	.string	"size"
.LASF32:
	.string	"fileclose"
.LASF55:
	.string	"file.c"
.LASF47:
	.string	"ilock"
.LASF23:
	.string	"read"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
