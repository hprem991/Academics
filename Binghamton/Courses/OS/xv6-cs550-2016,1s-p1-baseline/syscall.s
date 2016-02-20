	.file	"syscall.c"
	.text
.Ltext0:
	.globl	fetchint
	.type	fetchint, @function
fetchint:
.LFB20:
	.file 1 "syscall.c"
	.loc 1 19 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	.loc 1 20 0
	movl	%gs:4, %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	jbe	.L2
	.loc 1 20 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	leal	4(%eax), %edx
	movl	%gs:4, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jbe	.L3
.L2:
	.loc 1 21 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L4
.L3:
	.loc 1 22 0
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 23 0
	movl	$0, %eax
.L4:
	.loc 1 24 0
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	fetchint, .-fetchint
	.globl	fetchstr
	.type	fetchstr, @function
fetchstr:
.LFB21:
	.loc 1 31 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 34 0
	movl	%gs:4, %eax
	movl	(%eax), %eax
	cmpl	8(%ebp), %eax
	ja	.L6
	.loc 1 35 0
	movl	$-1, %eax
	jmp	.L7
.L6:
	.loc 1 36 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 37 0
	movl	%gs:4, %eax
	movl	(%eax), %eax
	movl	%eax, -8(%ebp)
.LVL2:
	.loc 1 38 0
	movl	12(%ebp), %eax
.LVL3:
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
.LVL4:
	jmp	.L8
.L10:
	.loc 1 39 0
	movl	-4(%ebp), %eax
.LVL5:
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L9
	.loc 1 40 0
	movl	-4(%ebp), %edx
	movl	12(%ebp), %eax
	movl	(%eax), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	jmp	.L7
.L9:
	.loc 1 38 0
	addl	$1, -4(%ebp)
.LVL6:
.L8:
	.loc 1 38 0 is_stmt 0 discriminator 1
	movl	-4(%ebp), %eax
	cmpl	-8(%ebp), %eax
	jb	.L10
	.loc 1 41 0 is_stmt 1
	movl	$-1, %eax
.LVL7:
.L7:
	.loc 1 42 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	fetchstr, .-fetchstr
	.globl	argint
	.type	argint, @function
argint:
.LFB22:
	.loc 1 47 0
	.cfi_startproc
.LVL8:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 48 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	68(%eax), %edx
	movl	8(%ebp), %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	fetchint
.LVL9:
	.loc 1 49 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	argint, .-argint
	.globl	argptr
	.type	argptr, @function
argptr:
.LFB23:
	.loc 1 56 0
	.cfi_startproc
.LVL10:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 59 0
	leal	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	argint
.LVL11:
	testl	%eax, %eax
	jns	.L14
	.loc 1 60 0
	movl	$-1, %eax
	jmp	.L18
.L14:
	.loc 1 61 0
	movl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	%gs:4, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jnb	.L16
	.loc 1 61 0 is_stmt 0 discriminator 1
	movl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	16(%ebp), %eax
	addl	%eax, %edx
	movl	%gs:4, %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jbe	.L17
.L16:
	.loc 1 62 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L18
.L17:
	.loc 1 63 0
	movl	-4(%ebp), %eax
	movl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 1 64 0
	movl	$0, %eax
.L18:
	.loc 1 65 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	argptr, .-argptr
	.globl	argstr
	.type	argstr, @function
argstr:
.LFB24:
	.loc 1 73 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 75 0
	leal	-4(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	argint
.LVL13:
	testl	%eax, %eax
	jns	.L20
	.loc 1 76 0
	movl	$-1, %eax
	jmp	.L22
.L20:
	.loc 1 77 0
	movl	-4(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fetchstr
.LVL14:
.L22:
	.loc 1 78 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	argstr, .-argstr
	.data
	.align 32
	.type	syscalls, @object
	.size	syscalls, 88
syscalls:
	.zero	4
	.long	sys_fork
	.long	sys_exit
	.long	sys_wait
	.long	sys_pipe
	.long	sys_read
	.long	sys_kill
	.long	sys_exec
	.long	sys_fstat
	.long	sys_chdir
	.long	sys_dup
	.long	sys_getpid
	.long	sys_sbrk
	.long	sys_sleep
	.long	sys_uptime
	.long	sys_open
	.long	sys_write
	.long	sys_mknod
	.long	sys_unlink
	.long	sys_link
	.long	sys_mkdir
	.long	sys_close
	.section	.rodata
.LC0:
	.string	"%d %s: unknown sys call %d\n"
	.text
	.globl	syscall
	.type	syscall, @function
syscall:
.LFB25:
	.loc 1 128 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 1 131 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	28(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL15:
	.loc 1 132 0
	cmpl	$0, -12(%ebp)
	jle	.L24
	.loc 1 132 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	$21, %eax
	ja	.L24
	movl	-12(%ebp), %eax
	movl	syscalls(,%eax,4), %eax
.LVL16:
	testl	%eax, %eax
	je	.L24
	.loc 1 133 0 is_stmt 1
	movl	%gs:4, %eax
	movl	24(%eax), %ebx
	movl	-12(%ebp), %eax
	movl	syscalls(,%eax,4), %eax
	call	*%eax
.LVL17:
	movl	%eax, 28(%ebx)
	jmp	.L23
.LVL18:
.L24:
	.loc 1 136 0
	movl	%gs:4, %eax
	leal	108(%eax), %ecx
	movl	%gs:4, %eax
	.loc 1 135 0
	movl	16(%eax), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 12(%esp)
.LVL19:
	movl	%ecx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	cprintf
.LVL20:
	.loc 1 137 0
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	$-1, 28(%eax)
.L23:
	.loc 1 139 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL21:
	ret
	.cfi_endproc
.LFE25:
	.size	syscall, .-syscall
.Letext0:
	.file 2 "types.h"
	.file 3 "proc.h"
	.file 4 "x86.h"
	.file 5 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5c9
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF44
	.byte	0x1
	.long	.LASF45
	.long	.LASF46
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
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x2
	.long	.LASF5
	.byte	0x2
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.byte	0x4
	.uleb128 0x5
	.long	.LASF7
	.byte	0x14
	.byte	0x3
	.byte	0x2c
	.long	0xb0
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
	.long	0x5d
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x8
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.long	.LASF8
	.byte	0x7c
	.byte	0x3
	.byte	0x37
	.long	0x185
	.uleb128 0x6
	.string	"sz"
	.byte	0x3
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x9
	.long	.LASF9
	.byte	0x3
	.byte	0x39
	.long	0x1bc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x9
	.long	.LASF10
	.byte	0x3
	.byte	0x3a
	.long	0x1c2
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF11
	.byte	0x3
	.byte	0x3b
	.long	0x18b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"pid"
	.byte	0x3
	.byte	0x3c
	.long	0xbd
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF12
	.byte	0x3
	.byte	0x3d
	.long	0x185
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"tf"
	.byte	0x3
	.byte	0x3e
	.long	0x334
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF7
	.byte	0x3
	.byte	0x3f
	.long	0xb0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF13
	.byte	0x3
	.byte	0x40
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF14
	.byte	0x3
	.byte	0x41
	.long	0xbd
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x9
	.long	.LASF15
	.byte	0x3
	.byte	0x42
	.long	0x33a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"cwd"
	.byte	0x3
	.byte	0x43
	.long	0x35c
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF16
	.byte	0x3
	.byte	0x44
	.long	0x362
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0xc4
	.uleb128 0xa
	.long	.LASF47
	.byte	0x4
	.byte	0x3
	.byte	0x34
	.long	0x1bc
	.uleb128 0xb
	.long	.LASF17
	.sleb128 0
	.uleb128 0xb
	.long	.LASF18
	.sleb128 1
	.uleb128 0xb
	.long	.LASF19
	.sleb128 2
	.uleb128 0xb
	.long	.LASF20
	.sleb128 3
	.uleb128 0xb
	.long	.LASF21
	.sleb128 4
	.uleb128 0xb
	.long	.LASF22
	.sleb128 5
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x50
	.uleb128 0x7
	.byte	0x4
	.long	0x1c8
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF23
	.uleb128 0x5
	.long	.LASF24
	.byte	0x4c
	.byte	0x4
	.byte	0x9c
	.long	0x334
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
	.long	.LASF25
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
	.long	.LASF26
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
	.long	.LASF27
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
	.long	.LASF28
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
	.long	.LASF29
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x9
	.long	.LASF30
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
	.long	.LASF31
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x9
	.long	.LASF32
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
	.long	.LASF33
	.byte	0x4
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x1cf
	.uleb128 0xc
	.long	0x34a
	.long	0x34a
	.uleb128 0xd
	.long	0xb6
	.byte	0xf
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x350
	.uleb128 0xe
	.long	.LASF34
	.byte	0x1
	.uleb128 0xe
	.long	.LASF35
	.byte	0x1
	.uleb128 0x7
	.byte	0x4
	.long	0x356
	.uleb128 0xc
	.long	0x1c8
	.long	0x372
	.uleb128 0xd
	.long	0xb6
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.long	0xbd
	.long	.LFB20
	.long	.LFE20
	.long	.LLST0
	.byte	0x1
	.long	0x3ac
	.uleb128 0x10
	.long	.LASF36
	.byte	0x1
	.byte	0x12
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"ip"
	.byte	0x1
	.byte	0x12
	.long	0x3ac
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0xbd
	.uleb128 0xf
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.long	0xbd
	.long	.LFB21
	.long	.LFE21
	.long	.LLST1
	.byte	0x1
	.long	0x407
	.uleb128 0x10
	.long	.LASF36
	.byte	0x1
	.byte	0x1e
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"pp"
	.byte	0x1
	.byte	0x1e
	.long	0x407
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x12
	.string	"s"
	.byte	0x1
	.byte	0x20
	.long	0x1c2
	.long	.LLST2
	.uleb128 0x12
	.string	"ep"
	.byte	0x1
	.byte	0x20
	.long	0x1c2
	.long	.LLST3
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x1c2
	.uleb128 0xf
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.long	0xbd
	.long	.LFB22
	.long	.LFE22
	.long	.LLST4
	.byte	0x1
	.long	0x457
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x2e
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"ip"
	.byte	0x1
	.byte	0x2e
	.long	0x3ac
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x13
	.long	.LVL9
	.long	0x372
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
	.uleb128 0xf
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x37
	.byte	0x1
	.long	0xbd
	.long	.LFB23
	.long	.LFE23
	.long	.LLST5
	.byte	0x1
	.long	0x4c2
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x37
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"pp"
	.byte	0x1
	.byte	0x37
	.long	0x407
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x10
	.long	.LASF41
	.byte	0x1
	.byte	0x37
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x39
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.long	.LVL11
	.long	0x40d
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
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF42
	.byte	0x1
	.byte	0x48
	.byte	0x1
	.long	0xbd
	.long	.LFB24
	.long	.LFE24
	.long	.LLST6
	.byte	0x1
	.long	0x537
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x48
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"pp"
	.byte	0x1
	.byte	0x48
	.long	0x407
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.long	.LASF36
	.byte	0x1
	.byte	0x4a
	.long	0xbd
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.long	.LVL13
	.long	0x40d
	.long	0x524
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
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.long	.LVL14
	.long	0x3b2
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
	.uleb128 0x18
	.byte	0x1
	.long	.LASF48
	.byte	0x1
	.byte	0x7f
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST7
	.byte	0x1
	.long	0x57d
	.uleb128 0x12
	.string	"num"
	.byte	0x1
	.byte	0x81
	.long	0xbd
	.long	.LLST8
	.uleb128 0x13
	.long	.LVL20
	.long	0x5bb
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.uleb128 0x14
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x58d
	.long	0x58d
	.uleb128 0xd
	.long	0xb6
	.byte	0x15
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.long	0x593
	.uleb128 0x19
	.byte	0x1
	.long	0xbd
	.uleb128 0x16
	.long	.LASF43
	.byte	0x1
	.byte	0x66
	.long	0x57d
	.byte	0x5
	.byte	0x3
	.long	syscalls
	.uleb128 0x1a
	.long	.LASF8
	.byte	0x3
	.byte	0x1f
	.long	.LASF49
	.long	0x185
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF50
	.byte	0x5
	.byte	0x14
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.long	0x1c2
	.uleb128 0x1d
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
	.uleb128 0x12
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
	.uleb128 0xa
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x18
	.byte	0
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
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL5-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	0
	.long	0
.LLST3:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST4:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB23-.Ltext0
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
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LFB24-.Ltext0
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
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LFB25-.Ltext0
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
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL17-1-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL19-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL21-.Ltext0
	.long	.LFE25-.Ltext0
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
.LASF18:
	.string	"EMBRYO"
.LASF19:
	.string	"SLEEPING"
.LASF35:
	.string	"inode"
.LASF20:
	.string	"RUNNABLE"
.LASF37:
	.string	"fetchint"
.LASF11:
	.string	"state"
.LASF49:
	.string	"%gs:4"
.LASF6:
	.string	"sizetype"
.LASF32:
	.string	"eflags"
.LASF24:
	.string	"trapframe"
.LASF0:
	.string	"uint"
.LASF34:
	.string	"file"
.LASF44:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF12:
	.string	"parent"
.LASF14:
	.string	"killed"
.LASF50:
	.string	"cprintf"
.LASF1:
	.string	"ushort"
.LASF27:
	.string	"padding2"
.LASF28:
	.string	"padding3"
.LASF29:
	.string	"padding4"
.LASF5:
	.string	"pde_t"
.LASF33:
	.string	"padding6"
.LASF36:
	.string	"addr"
.LASF26:
	.string	"padding1"
.LASF7:
	.string	"context"
.LASF16:
	.string	"name"
.LASF31:
	.string	"padding5"
.LASF15:
	.string	"ofile"
.LASF4:
	.string	"unsigned char"
.LASF38:
	.string	"fetchstr"
.LASF8:
	.string	"proc"
.LASF2:
	.string	"unsigned int"
.LASF42:
	.string	"argstr"
.LASF48:
	.string	"syscall"
.LASF10:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF13:
	.string	"chan"
.LASF23:
	.string	"char"
.LASF21:
	.string	"RUNNING"
.LASF17:
	.string	"UNUSED"
.LASF45:
	.string	"syscall.c"
.LASF43:
	.string	"syscalls"
.LASF30:
	.string	"trapno"
.LASF40:
	.string	"argptr"
.LASF41:
	.string	"size"
.LASF46:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF25:
	.string	"oesp"
.LASF47:
	.string	"procstate"
.LASF9:
	.string	"pgdir"
.LASF22:
	.string	"ZOMBIE"
.LASF39:
	.string	"argint"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
