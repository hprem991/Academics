	.file	"sysproc.c"
	.text
.Ltext0:
	.globl	sys_fork
	.type	sys_fork, @function
sys_fork:
.LFB20:
	.file 1 "sysproc.c"
	.loc 1 12 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 13 0
	call	fork
.LVL0:
	.loc 1 14 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	sys_fork, .-sys_fork
	.globl	sys_exit
	.type	sys_exit, @function
sys_exit:
.LFB21:
	.loc 1 18 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 19 0
	call	exit
.LVL1:
	.loc 1 20 0
	movl	$0, %eax
	.loc 1 21 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	sys_exit, .-sys_exit
	.globl	sys_wait
	.type	sys_wait, @function
sys_wait:
.LFB22:
	.loc 1 25 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 26 0
	call	wait
.LVL2:
	.loc 1 27 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	sys_wait, .-sys_wait
	.globl	sys_kill
	.type	sys_kill, @function
sys_kill:
.LFB23:
	.loc 1 31 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 34 0
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argint
.LVL3:
	testl	%eax, %eax
	jns	.L8
	.loc 1 35 0
	movl	$-1, %eax
	jmp	.L10
.L8:
	.loc 1 36 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	kill
.LVL4:
.L10:
	.loc 1 37 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	sys_kill, .-sys_kill
	.globl	sys_getpid
	.type	sys_getpid, @function
sys_getpid:
.LFB24:
	.loc 1 41 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	.loc 1 42 0
	movl	%gs:4, %eax
	movl	16(%eax), %eax
	.loc 1 43 0
	popl	%ebp
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	sys_getpid, .-sys_getpid
	.globl	sys_sbrk
	.type	sys_sbrk, @function
sys_sbrk:
.LFB25:
	.loc 1 47 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 51 0
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argint
.LVL5:
	testl	%eax, %eax
	jns	.L14
	.loc 1 52 0
	movl	$-1, %eax
	jmp	.L17
.L14:
	.loc 1 53 0
	movl	%gs:4, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL6:
	.loc 1 54 0
	movl	-16(%ebp), %eax
.LVL7:
	movl	%eax, (%esp)
.LVL8:
	call	growproc
.LVL9:
	testl	%eax, %eax
	jns	.L16
	.loc 1 55 0
	movl	$-1, %eax
	jmp	.L17
.L16:
	.loc 1 56 0
	movl	-12(%ebp), %eax
.LVL10:
.L17:
	.loc 1 57 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	sys_sbrk, .-sys_sbrk
	.globl	sys_sleep
	.type	sys_sleep, @function
sys_sleep:
.LFB26:
	.loc 1 61 0
	.cfi_startproc
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 65 0
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argint
.LVL11:
	testl	%eax, %eax
	jns	.L19
	.loc 1 66 0
	movl	$-1, %eax
	jmp	.L24
.L19:
	.loc 1 67 0
	movl	$tickslock, (%esp)
	call	acquire
.LVL12:
	.loc 1 68 0
	movl	ticks, %eax
	movl	%eax, -12(%ebp)
.LVL13:
	.loc 1 69 0
	jmp	.L21
.LVL14:
.L23:
	.loc 1 70 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L22
	.loc 1 71 0
	movl	$tickslock, (%esp)
	call	release
.LVL15:
	.loc 1 72 0
	movl	$-1, %eax
	jmp	.L24
.L22:
	.loc 1 74 0
	movl	$tickslock, 4(%esp)
	movl	$ticks, (%esp)
	call	sleep
.LVL16:
.L21:
	.loc 1 69 0 discriminator 1
	movl	ticks, %eax
	subl	-12(%ebp), %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	cmpl	%eax, %edx
	jb	.L23
	.loc 1 76 0
	movl	$tickslock, (%esp)
	call	release
.LVL17:
	.loc 1 77 0
	movl	$0, %eax
.LVL18:
.L24:
	.loc 1 78 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	sys_sleep, .-sys_sleep
	.globl	sys_uptime
	.type	sys_uptime, @function
sys_uptime:
.LFB27:
	.loc 1 84 0
	.cfi_startproc
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 87 0
	movl	$tickslock, (%esp)
	call	acquire
.LVL19:
	.loc 1 88 0
	movl	ticks, %eax
	movl	%eax, -12(%ebp)
.LVL20:
	.loc 1 89 0
	movl	$tickslock, (%esp)
	call	release
.LVL21:
	.loc 1 90 0
	movl	-12(%ebp), %eax
	.loc 1 91 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL22:
	ret
	.cfi_endproc
.LFE27:
	.size	sys_uptime, .-sys_uptime
.Letext0:
	.file 2 "types.h"
	.file 3 "x86.h"
	.file 4 "proc.h"
	.file 5 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x656
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF56
	.byte	0x1
	.long	.LASF57
	.long	.LASF58
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
	.long	.LASF15
	.byte	0x4c
	.byte	0x3
	.byte	0x9c
	.long	0x1c0
	.uleb128 0x5
	.string	"edi"
	.byte	0x3
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x3
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebp"
	.byte	0x3
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF6
	.byte	0x3
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"ebx"
	.byte	0x3
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.string	"edx"
	.byte	0x3
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"ecx"
	.byte	0x3
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.string	"eax"
	.byte	0x3
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.string	"gs"
	.byte	0x3
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF7
	.byte	0x3
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x5
	.string	"fs"
	.byte	0x3
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF8
	.byte	0x3
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x5
	.string	"es"
	.byte	0x3
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.long	.LASF9
	.byte	0x3
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x5
	.string	"ds"
	.byte	0x3
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.long	.LASF10
	.byte	0x3
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x6
	.long	.LASF11
	.byte	0x3
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x5
	.string	"err"
	.byte	0x3
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.string	"eip"
	.byte	0x3
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x5
	.string	"cs"
	.byte	0x3
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x6
	.long	.LASF12
	.byte	0x3
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x6
	.long	.LASF13
	.byte	0x3
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x5
	.string	"esp"
	.byte	0x3
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.string	"ss"
	.byte	0x3
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF14
	.byte	0x3
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.uleb128 0x4
	.long	.LASF16
	.byte	0x14
	.byte	0x4
	.byte	0x2c
	.long	0x215
	.uleb128 0x5
	.string	"edi"
	.byte	0x4
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x4
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebx"
	.byte	0x4
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"ebp"
	.byte	0x4
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"eip"
	.byte	0x4
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x1c2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF17
	.uleb128 0x9
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x4
	.long	.LASF18
	.byte	0x7c
	.byte	0x4
	.byte	0x37
	.long	0x2ea
	.uleb128 0x5
	.string	"sz"
	.byte	0x4
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF19
	.byte	0x4
	.byte	0x39
	.long	0x321
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF20
	.byte	0x4
	.byte	0x3a
	.long	0x327
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF21
	.byte	0x4
	.byte	0x3b
	.long	0x2f0
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"pid"
	.byte	0x4
	.byte	0x3c
	.long	0x222
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF22
	.byte	0x4
	.byte	0x3d
	.long	0x2ea
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"tf"
	.byte	0x4
	.byte	0x3e
	.long	0x334
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF16
	.byte	0x4
	.byte	0x3f
	.long	0x215
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.long	.LASF23
	.byte	0x4
	.byte	0x40
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF24
	.byte	0x4
	.byte	0x41
	.long	0x222
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF25
	.byte	0x4
	.byte	0x42
	.long	0x33a
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"cwd"
	.byte	0x4
	.byte	0x43
	.long	0x35c
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.long	.LASF26
	.byte	0x4
	.byte	0x44
	.long	0x362
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x229
	.uleb128 0xa
	.long	.LASF59
	.byte	0x4
	.byte	0x4
	.byte	0x34
	.long	0x321
	.uleb128 0xb
	.long	.LASF27
	.sleb128 0
	.uleb128 0xb
	.long	.LASF28
	.sleb128 1
	.uleb128 0xb
	.long	.LASF29
	.sleb128 2
	.uleb128 0xb
	.long	.LASF30
	.sleb128 3
	.uleb128 0xb
	.long	.LASF31
	.sleb128 4
	.uleb128 0xb
	.long	.LASF32
	.sleb128 5
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x50
	.uleb128 0x8
	.byte	0x4
	.long	0x32d
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF33
	.uleb128 0x8
	.byte	0x4
	.long	0x5b
	.uleb128 0xc
	.long	0x34a
	.long	0x34a
	.uleb128 0xd
	.long	0x21b
	.byte	0xf
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x350
	.uleb128 0xe
	.long	.LASF34
	.byte	0x1
	.uleb128 0xe
	.long	.LASF35
	.byte	0x1
	.uleb128 0x8
	.byte	0x4
	.long	0x356
	.uleb128 0xc
	.long	0x32d
	.long	0x372
	.uleb128 0xd
	.long	0x21b
	.byte	0xf
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF36
	.byte	0x1
	.byte	0xb
	.byte	0x1
	.long	0x222
	.long	.LFB20
	.long	.LFE20
	.long	.LLST0
	.byte	0x1
	.long	0x39a
	.uleb128 0x10
	.long	.LVL0
	.long	0x59d
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF37
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.long	0x222
	.long	.LFB21
	.long	.LFE21
	.long	.LLST1
	.byte	0x1
	.long	0x3c2
	.uleb128 0x10
	.long	.LVL1
	.long	0x5ab
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF38
	.byte	0x1
	.byte	0x18
	.byte	0x1
	.long	0x222
	.long	.LFB22
	.long	.LFE22
	.long	.LLST2
	.byte	0x1
	.long	0x3ea
	.uleb128 0x10
	.long	.LVL2
	.long	0x5b5
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF39
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.long	0x222
	.long	.LFB23
	.long	.LFE23
	.long	.LLST3
	.byte	0x1
	.long	0x43b
	.uleb128 0x11
	.string	"pid"
	.byte	0x1
	.byte	0x20
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.long	.LVL3
	.long	0x5c3
	.long	0x431
	.uleb128 0x13
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x13
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.byte	0
	.uleb128 0x10
	.long	.LVL4
	.long	0x5e6
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF60
	.byte	0x1
	.byte	0x28
	.byte	0x1
	.long	0x222
	.long	.LFB24
	.long	.LFE24
	.long	.LLST4
	.byte	0x1
	.uleb128 0xf
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x2e
	.byte	0x1
	.long	0x222
	.long	.LFB25
	.long	.LFE25
	.long	.LLST5
	.byte	0x1
	.long	0x4b3
	.uleb128 0x15
	.long	.LASF41
	.byte	0x1
	.byte	0x30
	.long	0x222
	.long	.LLST6
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x31
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.long	.LVL5
	.long	0x5c3
	.long	0x4a9
	.uleb128 0x13
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x13
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.long	.LVL9
	.long	0x5fe
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF42
	.byte	0x1
	.byte	0x3c
	.byte	0x1
	.long	0x222
	.long	.LFB26
	.long	.LFE26
	.long	.LLST7
	.byte	0x1
	.long	0x52c
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x3e
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x15
	.long	.LASF43
	.byte	0x1
	.byte	0x3f
	.long	0x25
	.long	.LLST8
	.uleb128 0x12
	.long	.LVL11
	.long	0x5c3
	.long	0x507
	.uleb128 0x13
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x13
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x10
	.long	.LVL12
	.long	0x616
	.uleb128 0x10
	.long	.LVL15
	.long	0x630
	.uleb128 0x10
	.long	.LVL16
	.long	0x644
	.uleb128 0x10
	.long	.LVL17
	.long	0x630
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF44
	.byte	0x1
	.byte	0x53
	.byte	0x1
	.long	0x222
	.long	.LFB27
	.long	.LFE27
	.long	.LLST9
	.byte	0x1
	.long	0x56c
	.uleb128 0x15
	.long	.LASF45
	.byte	0x1
	.byte	0x55
	.long	0x25
	.long	.LLST10
	.uleb128 0x10
	.long	.LVL19
	.long	0x616
	.uleb128 0x10
	.long	.LVL21
	.long	0x630
	.byte	0
	.uleb128 0xe
	.long	.LASF46
	.byte	0x1
	.uleb128 0x16
	.long	.LASF47
	.byte	0x5
	.byte	0x9c
	.long	0x25
	.byte	0x1
	.byte	0x1
	.uleb128 0x16
	.long	.LASF48
	.byte	0x5
	.byte	0x9e
	.long	0x56c
	.byte	0x1
	.byte	0x1
	.uleb128 0x17
	.long	.LASF18
	.byte	0x4
	.byte	0x1f
	.long	.LASF61
	.long	0x2ea
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.byte	0x1
	.long	.LASF49
	.byte	0x5
	.byte	0x6d
	.byte	0x1
	.long	0x222
	.byte	0x1
	.uleb128 0x19
	.byte	0x1
	.long	.LASF62
	.byte	0x5
	.byte	0x6c
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.byte	0x1
	.long	.LASF50
	.byte	0x5
	.byte	0x76
	.byte	0x1
	.long	0x222
	.byte	0x1
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF51
	.byte	0x5
	.byte	0x90
	.byte	0x1
	.long	0x222
	.byte	0x1
	.long	0x5e0
	.uleb128 0x1b
	.long	0x222
	.uleb128 0x1b
	.long	0x5e0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x222
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF52
	.byte	0x5
	.byte	0x6f
	.byte	0x1
	.long	0x222
	.byte	0x1
	.long	0x5fe
	.uleb128 0x1b
	.long	0x222
	.byte	0
	.uleb128 0x1a
	.byte	0x1
	.long	.LASF53
	.byte	0x5
	.byte	0x6e
	.byte	0x1
	.long	0x222
	.byte	0x1
	.long	0x616
	.uleb128 0x1b
	.long	0x222
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF54
	.byte	0x5
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0x62a
	.uleb128 0x1b
	.long	0x62a
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x56c
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF55
	.byte	0x5
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.long	0x644
	.uleb128 0x1b
	.long	0x62a
	.byte	0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF63
	.byte	0x5
	.byte	0x74
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.long	0x1c0
	.uleb128 0x1b
	.long	0x62a
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
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
.LLST3:
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
.LLST4:
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
.LLST5:
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
.LLST6:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST7:
	.long	.LFB26-.Ltext0
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
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST9:
	.long	.LFB27-.Ltext0
	.long	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI21-.Ltext0
	.long	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI22-.Ltext0
	.long	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI23-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST10:
	.long	.LVL20-.Ltext0
	.long	.LVL21-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-1-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL22-.Ltext0
	.long	.LFE27-.Ltext0
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
.LASF47:
	.string	"ticks"
.LASF43:
	.string	"ticks0"
.LASF28:
	.string	"EMBRYO"
.LASF29:
	.string	"SLEEPING"
.LASF35:
	.string	"inode"
.LASF30:
	.string	"RUNNABLE"
.LASF60:
	.string	"sys_getpid"
.LASF21:
	.string	"state"
.LASF55:
	.string	"release"
.LASF61:
	.string	"%gs:4"
.LASF17:
	.string	"sizetype"
.LASF13:
	.string	"eflags"
.LASF32:
	.string	"ZOMBIE"
.LASF37:
	.string	"sys_exit"
.LASF0:
	.string	"uint"
.LASF34:
	.string	"file"
.LASF39:
	.string	"sys_kill"
.LASF44:
	.string	"sys_uptime"
.LASF56:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF49:
	.string	"fork"
.LASF22:
	.string	"parent"
.LASF53:
	.string	"growproc"
.LASF24:
	.string	"killed"
.LASF50:
	.string	"wait"
.LASF1:
	.string	"ushort"
.LASF8:
	.string	"padding2"
.LASF9:
	.string	"padding3"
.LASF10:
	.string	"padding4"
.LASF5:
	.string	"pde_t"
.LASF14:
	.string	"padding6"
.LASF41:
	.string	"addr"
.LASF7:
	.string	"padding1"
.LASF15:
	.string	"trapframe"
.LASF12:
	.string	"padding5"
.LASF26:
	.string	"name"
.LASF62:
	.string	"exit"
.LASF45:
	.string	"xticks"
.LASF38:
	.string	"sys_wait"
.LASF25:
	.string	"ofile"
.LASF4:
	.string	"unsigned char"
.LASF52:
	.string	"kill"
.LASF18:
	.string	"proc"
.LASF2:
	.string	"unsigned int"
.LASF16:
	.string	"context"
.LASF63:
	.string	"sleep"
.LASF54:
	.string	"acquire"
.LASF42:
	.string	"sys_sleep"
.LASF20:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF23:
	.string	"chan"
.LASF33:
	.string	"char"
.LASF31:
	.string	"RUNNING"
.LASF48:
	.string	"tickslock"
.LASF40:
	.string	"sys_sbrk"
.LASF27:
	.string	"UNUSED"
.LASF46:
	.string	"spinlock"
.LASF36:
	.string	"sys_fork"
.LASF58:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF6:
	.string	"oesp"
.LASF59:
	.string	"procstate"
.LASF57:
	.string	"sysproc.c"
.LASF19:
	.string	"pgdir"
.LASF11:
	.string	"trapno"
.LASF51:
	.string	"argint"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
