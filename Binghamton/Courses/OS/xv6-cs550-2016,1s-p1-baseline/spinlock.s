	.file	"spinlock.c"
	.text
.Ltext0:
	.type	readeflags, @function
readeflags:
.LFB10:
	.file 1 "x86.h"
	.loc 1 96 0
	.cfi_startproc
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 98 0
#APP
# 98 "x86.h" 1
	pushfl; popl %eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%ebp)
.LVL0:
	.loc 1 99 0
	movl	-4(%ebp), %eax
	.loc 1 100 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	readeflags, .-readeflags
	.type	cli, @function
cli:
.LFB12:
	.loc 1 110 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	.loc 1 111 0
#APP
# 111 "x86.h" 1
	cli
# 0 "" 2
	.loc 1 112 0
#NO_APP
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	cli, .-cli
	.type	sti, @function
sti:
.LFB13:
	.loc 1 116 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	.loc 1 117 0
#APP
# 117 "x86.h" 1
	sti
# 0 "" 2
	.loc 1 118 0
#NO_APP
	popl	%ebp
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE13:
	.size	sti, .-sti
	.type	xchg, @function
xchg:
.LFB14:
	.loc 1 122 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 126 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movl	8(%ebp), %ecx
#APP
# 126 "x86.h" 1
	lock; xchgl (%edx), %eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%ebp)
.LVL2:
	.loc 1 130 0
	movl	-4(%ebp), %eax
	.loc 1 131 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	xchg, .-xchg
	.globl	initlock
	.type	initlock, @function
initlock:
.LFB20:
	.file 2 "spinlock.c"
	.loc 2 14 0
	.cfi_startproc
.LVL3:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	.loc 2 15 0
	movl	8(%ebp), %eax
	movl	12(%ebp), %edx
	movl	%edx, 4(%eax)
	.loc 2 16 0
	movl	8(%ebp), %eax
	movl	$0, (%eax)
	.loc 2 17 0
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	.loc 2 18 0
	popl	%ebp
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	initlock, .-initlock
	.section	.rodata
.LC0:
	.string	"acquire"
	.text
	.globl	acquire
	.type	acquire, @function
acquire:
.LFB21:
	.loc 2 26 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 27 0
	call	pushcli
.LVL5:
	.loc 2 28 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	holding
.LVL6:
	testl	%eax, %eax
	je	.L9
	.loc 2 29 0
	movl	$.LC0, (%esp)
	call	panic
.LVL7:
.L9:
	.loc 2 34 0
	nop
.L10:
	.loc 2 34 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	xchg
.LVL8:
	testl	%eax, %eax
	jne	.L10
	.loc 2 38 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	%gs:0, %edx
	movl	%edx, 8(%eax)
	.loc 2 39 0
	movl	8(%ebp), %eax
	addl	$12, %eax
	movl	%eax, 4(%esp)
	leal	8(%ebp), %eax
.LVL9:
	movl	%eax, (%esp)
	call	getcallerpcs
.LVL10:
	.loc 2 40 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL11:
	ret
	.cfi_endproc
.LFE21:
	.size	acquire, .-acquire
	.section	.rodata
.LC1:
	.string	"release"
	.text
	.globl	release
	.type	release, @function
release:
.LFB22:
	.loc 2 45 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 46 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	holding
.LVL13:
	testl	%eax, %eax
	jne	.L12
	.loc 2 47 0
	movl	$.LC1, (%esp)
	call	panic
.LVL14:
.L12:
	.loc 2 49 0
	movl	8(%ebp), %eax
	movl	$0, 12(%eax)
	.loc 2 50 0
	movl	8(%ebp), %eax
	movl	$0, 8(%eax)
	.loc 2 61 0
	movl	8(%ebp), %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	xchg
.LVL15:
	.loc 2 63 0
	call	popcli
.LVL16:
	.loc 2 64 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	release, .-release
	.globl	getcallerpcs
	.type	getcallerpcs, @function
getcallerpcs:
.LFB23:
	.loc 2 69 0
	.cfi_startproc
.LVL17:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 2 73 0
	movl	8(%ebp), %eax
	subl	$8, %eax
	movl	%eax, -4(%ebp)
.LVL18:
	.loc 2 74 0
	movl	$0, -8(%ebp)
.LVL19:
	jmp	.L14
.LVL20:
.L16:
	.loc 2 75 0
	cmpl	$0, -4(%ebp)
	je	.L15
	.loc 2 75 0 is_stmt 0 discriminator 1
	cmpl	$2147483647, -4(%ebp)
	jbe	.L15
	cmpl	$-1, -4(%ebp)
	je	.L15
	.loc 2 77 0 is_stmt 1
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%eax, %edx
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%edx)
	.loc 2 78 0
	movl	-4(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
.LVL21:
	.loc 2 74 0
	addl	$1, -8(%ebp)
.LVL22:
.L14:
	.loc 2 74 0 is_stmt 0 discriminator 1
	cmpl	$9, -8(%ebp)
	jle	.L16
.L15:
	.loc 2 80 0 is_stmt 1
	jmp	.L17
.L18:
	.loc 2 81 0 discriminator 2
	movl	-8(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	12(%ebp), %eax
	addl	%edx, %eax
	movl	$0, (%eax)
	.loc 2 80 0 discriminator 2
	addl	$1, -8(%ebp)
.LVL23:
.L17:
	.loc 2 80 0 is_stmt 0 discriminator 1
	cmpl	$9, -8(%ebp)
	jle	.L18
	.loc 2 82 0 is_stmt 1
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	getcallerpcs, .-getcallerpcs
	.globl	holding
	.type	holding, @function
holding:
.LFB24:
	.loc 2 87 0
	.cfi_startproc
.LVL24:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	.loc 2 88 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	je	.L20
	.loc 2 88 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	%gs:0, %eax
	cmpl	%eax, %edx
	jne	.L20
	.loc 2 88 0 discriminator 3
	movl	$1, %eax
	jmp	.L21
.L20:
	.loc 2 88 0 discriminator 2
	movl	$0, %eax
.L21:
	.loc 2 89 0 is_stmt 1 discriminator 4
	popl	%ebp
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	holding, .-holding
	.globl	pushcli
	.type	pushcli, @function
pushcli:
.LFB25:
	.loc 2 98 0
	.cfi_startproc
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 2 101 0
	call	readeflags
.LVL25:
	movl	%eax, -4(%ebp)
.LVL26:
	.loc 2 102 0
	call	cli
.LVL27:
	.loc 2 103 0
	movl	%gs:0, %edx
	movl	172(%edx), %eax
	leal	1(%eax), %ecx
	movl	%ecx, 172(%edx)
	testl	%eax, %eax
	jne	.L23
	.loc 2 104 0
	movl	%gs:0, %eax
	movl	-4(%ebp), %edx
	andl	$512, %edx
	movl	%edx, 176(%eax)
.L23:
	.loc 2 105 0
	leave
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL28:
	ret
	.cfi_endproc
.LFE25:
	.size	pushcli, .-pushcli
	.section	.rodata
.LC2:
	.string	"popcli - interruptible"
.LC3:
	.string	"popcli"
	.text
	.globl	popcli
	.type	popcli, @function
popcli:
.LFB26:
	.loc 2 109 0
	.cfi_startproc
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 110 0
	call	readeflags
.LVL29:
	andl	$512, %eax
	testl	%eax, %eax
	je	.L26
	.loc 2 111 0
	movl	$.LC2, (%esp)
	call	panic
.LVL30:
.L26:
	.loc 2 112 0
	movl	%gs:0, %eax
	movl	172(%eax), %edx
	subl	$1, %edx
	movl	%edx, 172(%eax)
	movl	172(%eax), %eax
	testl	%eax, %eax
	jns	.L27
	.loc 2 113 0
	movl	$.LC3, (%esp)
	call	panic
.LVL31:
.L27:
	.loc 2 114 0
	movl	%gs:0, %eax
	movl	172(%eax), %eax
	testl	%eax, %eax
	jne	.L25
	.loc 2 114 0 is_stmt 0 discriminator 1
	movl	%gs:0, %eax
	movl	176(%eax), %eax
	testl	%eax, %eax
	je	.L25
	.loc 2 115 0 is_stmt 1
	call	sti
.LVL32:
.L25:
	.loc 2 116 0
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	popcli, .-popcli
.Letext0:
	.file 3 "types.h"
	.file 4 "mmu.h"
	.file 5 "proc.h"
	.file 6 "spinlock.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xa74
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF73
	.byte	0x1
	.long	.LASF74
	.long	.LASF75
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x3
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x3
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x3
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x3
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.long	.LASF16
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x1cb
	.uleb128 0x5
	.string	"edi"
	.byte	0x1
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x1
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebp"
	.byte	0x1
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF7
	.byte	0x1
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"ebx"
	.byte	0x1
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.string	"edx"
	.byte	0x1
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"ecx"
	.byte	0x1
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.string	"eax"
	.byte	0x1
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.string	"gs"
	.byte	0x1
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF8
	.byte	0x1
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x5
	.string	"fs"
	.byte	0x1
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF9
	.byte	0x1
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x5
	.string	"es"
	.byte	0x1
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.long	.LASF10
	.byte	0x1
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x5
	.string	"ds"
	.byte	0x1
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x6
	.long	.LASF11
	.byte	0x1
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x6
	.long	.LASF12
	.byte	0x1
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x5
	.string	"err"
	.byte	0x1
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.string	"eip"
	.byte	0x1
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x5
	.string	"cs"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x6
	.long	.LASF13
	.byte	0x1
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x6
	.long	.LASF14
	.byte	0x1
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x5
	.string	"esp"
	.byte	0x1
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.string	"ss"
	.byte	0x1
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF15
	.byte	0x1
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x4
	.long	.LASF17
	.byte	0x8
	.byte	0x4
	.byte	0x34
	.long	0x2ae
	.uleb128 0x7
	.long	.LASF18
	.byte	0x4
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF20
	.byte	0x4
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF21
	.byte	0x4
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"s"
	.byte	0x4
	.byte	0x39
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"dpl"
	.byte	0x4
	.byte	0x3a
	.long	0x25
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"p"
	.byte	0x4
	.byte	0x3b
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF22
	.byte	0x4
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"avl"
	.byte	0x4
	.byte	0x3d
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF23
	.byte	0x4
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"db"
	.byte	0x4
	.byte	0x3f
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"g"
	.byte	0x4
	.byte	0x40
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF24
	.byte	0x4
	.byte	0x41
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x4
	.long	.LASF25
	.byte	0x68
	.byte	0x4
	.byte	0x97
	.long	0x4b9
	.uleb128 0x6
	.long	.LASF26
	.byte	0x4
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF27
	.byte	0x4
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ss0"
	.byte	0x4
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF8
	.byte	0x4
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF28
	.byte	0x4
	.byte	0x9c
	.long	0x4b9
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"ss1"
	.byte	0x4
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF9
	.byte	0x4
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x6
	.long	.LASF29
	.byte	0x4
	.byte	0x9f
	.long	0x4b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"ss2"
	.byte	0x4
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF10
	.byte	0x4
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x5
	.string	"cr3"
	.byte	0x4
	.byte	0xa2
	.long	0x4bf
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.string	"eip"
	.byte	0x4
	.byte	0xa3
	.long	0x4b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF14
	.byte	0x4
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.string	"eax"
	.byte	0x4
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"ecx"
	.byte	0x4
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x5
	.string	"edx"
	.byte	0x4
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x5
	.string	"ebx"
	.byte	0x4
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.string	"esp"
	.byte	0x4
	.byte	0xa9
	.long	0x4b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x5
	.string	"ebp"
	.byte	0x4
	.byte	0xaa
	.long	0x4b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.string	"esi"
	.byte	0x4
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x5
	.string	"edi"
	.byte	0x4
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.string	"es"
	.byte	0x4
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF11
	.byte	0x4
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x5
	.string	"cs"
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x5
	.string	"ss"
	.byte	0x4
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.long	.LASF15
	.byte	0x4
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x5
	.string	"ds"
	.byte	0x4
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.long	.LASF30
	.byte	0x4
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x5
	.string	"fs"
	.byte	0x4
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.long	.LASF31
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x5
	.string	"gs"
	.byte	0x4
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.long	.LASF32
	.byte	0x4
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x5
	.string	"ldt"
	.byte	0x4
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.long	.LASF33
	.byte	0x4
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x5
	.string	"t"
	.byte	0x4
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.long	.LASF34
	.byte	0x4
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x25
	.uleb128 0xa
	.byte	0x4
	.uleb128 0xb
	.string	"cpu"
	.byte	0xbc
	.byte	0x5
	.byte	0x5
	.long	0x54f
	.uleb128 0x5
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF35
	.byte	0x5
	.byte	0x7
	.long	0x5a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ts"
	.byte	0x5
	.byte	0x8
	.long	0x2ae
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"gdt"
	.byte	0x5
	.byte	0x9
	.long	0x5a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.long	.LASF36
	.byte	0x5
	.byte	0xa
	.long	0x5bf
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x6
	.long	.LASF37
	.byte	0x5
	.byte	0xb
	.long	0x5c4
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x6
	.long	.LASF38
	.byte	0x5
	.byte	0xc
	.long	0x5c4
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x5
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x5cb
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x6
	.long	.LASF39
	.byte	0x5
	.byte	0x10
	.long	0x692
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF40
	.byte	0x14
	.byte	0x5
	.byte	0x2c
	.long	0x5a2
	.uleb128 0x5
	.string	"edi"
	.byte	0x5
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x5
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebx"
	.byte	0x5
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"ebp"
	.byte	0x5
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"eip"
	.byte	0x5
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x54f
	.uleb128 0xc
	.long	0x1cb
	.long	0x5b8
	.uleb128 0xd
	.long	0x5b8
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF41
	.uleb128 0xe
	.long	0x25
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x4
	.long	0x4c1
	.uleb128 0x4
	.long	.LASF39
	.byte	0x7c
	.byte	0x5
	.byte	0x37
	.long	0x692
	.uleb128 0x5
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF42
	.byte	0x5
	.byte	0x39
	.long	0x6c9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF43
	.byte	0x5
	.byte	0x3a
	.long	0x6cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF44
	.byte	0x5
	.byte	0x3b
	.long	0x698
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0x5c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF45
	.byte	0x5
	.byte	0x3d
	.long	0x692
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"tf"
	.byte	0x5
	.byte	0x3e
	.long	0x6dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF40
	.byte	0x5
	.byte	0x3f
	.long	0x5a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.long	.LASF46
	.byte	0x5
	.byte	0x40
	.long	0x4bf
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF47
	.byte	0x5
	.byte	0x41
	.long	0x5c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF48
	.byte	0x5
	.byte	0x42
	.long	0x6e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"cwd"
	.byte	0x5
	.byte	0x43
	.long	0x704
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.long	.LASF49
	.byte	0x5
	.byte	0x44
	.long	0x70a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5d1
	.uleb128 0x10
	.long	.LASF76
	.byte	0x4
	.byte	0x5
	.byte	0x34
	.long	0x6c9
	.uleb128 0x11
	.long	.LASF50
	.sleb128 0
	.uleb128 0x11
	.long	.LASF51
	.sleb128 1
	.uleb128 0x11
	.long	.LASF52
	.sleb128 2
	.uleb128 0x11
	.long	.LASF53
	.sleb128 3
	.uleb128 0x11
	.long	.LASF54
	.sleb128 4
	.uleb128 0x11
	.long	.LASF55
	.sleb128 5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5b
	.uleb128 0x9
	.byte	0x4
	.long	0x6d5
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF56
	.uleb128 0x9
	.byte	0x4
	.long	0x66
	.uleb128 0xc
	.long	0x6f2
	.long	0x6f2
	.uleb128 0xd
	.long	0x5b8
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x6f8
	.uleb128 0x12
	.long	.LASF57
	.byte	0x1
	.uleb128 0x12
	.long	.LASF58
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x6fe
	.uleb128 0xc
	.long	0x6d5
	.long	0x71a
	.uleb128 0xd
	.long	0x5b8
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF59
	.byte	0x34
	.byte	0x6
	.byte	0x2
	.long	0x75f
	.uleb128 0x6
	.long	.LASF60
	.byte	0x6
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF49
	.byte	0x6
	.byte	0x6
	.long	0x6cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"cpu"
	.byte	0x6
	.byte	0x7
	.long	0x5cb
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"pcs"
	.byte	0x6
	.byte	0x8
	.long	0x75f
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0xc
	.long	0x25
	.long	0x76f
	.uleb128 0xd
	.long	0x5b8
	.byte	0x9
	.byte	0
	.uleb128 0x13
	.long	.LASF61
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.long	0x25
	.long	.LFB10
	.long	.LFE10
	.long	.LLST0
	.byte	0x1
	.long	0x79a
	.uleb128 0x14
	.long	.LASF14
	.byte	0x1
	.byte	0x61
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x15
	.string	"cli"
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.long	.LFB12
	.long	.LFE12
	.long	.LLST1
	.byte	0x1
	.uleb128 0x15
	.string	"sti"
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.long	.LFB13
	.long	.LFE13
	.long	.LLST2
	.byte	0x1
	.uleb128 0x13
	.long	.LASF62
	.byte	0x1
	.byte	0x79
	.byte	0x1
	.long	0x25
	.long	.LFB14
	.long	.LFE14
	.long	.LLST3
	.byte	0x1
	.long	0x80b
	.uleb128 0x16
	.long	.LASF63
	.byte	0x1
	.byte	0x79
	.long	0x80b
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.long	.LASF64
	.byte	0x1
	.byte	0x79
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.long	.LASF65
	.byte	0x1
	.byte	0x7b
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5bf
	.uleb128 0x17
	.byte	0x1
	.long	.LASF66
	.byte	0x2
	.byte	0xd
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST4
	.byte	0x1
	.long	0x847
	.uleb128 0x18
	.string	"lk"
	.byte	0x2
	.byte	0xd
	.long	0x847
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.long	.LASF49
	.byte	0x2
	.byte	0xd
	.long	0x6cf
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x71a
	.uleb128 0x17
	.byte	0x1
	.long	.LASF67
	.byte	0x2
	.byte	0x19
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST5
	.byte	0x1
	.long	0x8c5
	.uleb128 0x19
	.string	"lk"
	.byte	0x2
	.byte	0x19
	.long	0x847
	.long	.LLST6
	.uleb128 0x1a
	.long	.LVL5
	.long	0x9bd
	.uleb128 0x1a
	.long	.LVL6
	.long	0x990
	.uleb128 0x1b
	.long	.LVL7
	.long	0xa67
	.long	0x89f
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0x1b
	.long	.LVL8
	.long	0x7c4
	.long	0x8b3
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1d
	.long	.LVL10
	.long	0x940
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 8
	.byte	0
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF68
	.byte	0x2
	.byte	0x2c
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST7
	.byte	0x1
	.long	0x940
	.uleb128 0x18
	.string	"lk"
	.byte	0x2
	.byte	0x2c
	.long	0x847
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.long	.LVL13
	.long	0x990
	.long	0x902
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x1b
	.long	.LVL14
	.long	0xa67
	.long	0x91a
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x1b
	.long	.LVL15
	.long	0x7c4
	.long	0x936
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1a
	.long	.LVL16
	.long	0x9f9
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF69
	.byte	0x2
	.byte	0x44
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST8
	.byte	0x1
	.long	0x990
	.uleb128 0x18
	.string	"v"
	.byte	0x2
	.byte	0x44
	.long	0x4bf
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x18
	.string	"pcs"
	.byte	0x2
	.byte	0x44
	.long	0x4b9
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1e
	.string	"ebp"
	.byte	0x2
	.byte	0x46
	.long	0x4b9
	.long	.LLST9
	.uleb128 0x1f
	.string	"i"
	.byte	0x2
	.byte	0x47
	.long	0x5c4
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF77
	.byte	0x2
	.byte	0x56
	.byte	0x1
	.long	0x5c4
	.long	.LFB24
	.long	.LFE24
	.long	.LLST10
	.byte	0x1
	.long	0x9bd
	.uleb128 0x16
	.long	.LASF70
	.byte	0x2
	.byte	0x56
	.long	0x847
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF71
	.byte	0x2
	.byte	0x61
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST11
	.byte	0x1
	.long	0x9f9
	.uleb128 0x21
	.long	.LASF14
	.byte	0x2
	.byte	0x63
	.long	0x5c4
	.long	.LLST12
	.uleb128 0x1a
	.long	.LVL25
	.long	0x76f
	.uleb128 0x1a
	.long	.LVL27
	.long	0x79a
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF72
	.byte	0x2
	.byte	0x6c
	.byte	0x1
	.long	.LFB26
	.long	.LFE26
	.long	.LLST13
	.byte	0x1
	.long	0xa56
	.uleb128 0x1a
	.long	.LVL29
	.long	0x76f
	.uleb128 0x1b
	.long	.LVL30
	.long	0xa67
	.long	0xa34
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x1b
	.long	.LVL31
	.long	0xa67
	.long	0xa4c
	.uleb128 0x1c
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x1a
	.long	.LVL32
	.long	0x7af
	.byte	0
	.uleb128 0x22
	.string	"cpu"
	.byte	0x5
	.byte	0x1e
	.long	.LASF78
	.long	0x5cb
	.byte	0x1
	.byte	0x1
	.uleb128 0x23
	.byte	0x1
	.long	.LASF79
	.byte	0x7
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.long	0x6cf
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x1c
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x21
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
	.uleb128 0x22
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x24
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
	.long	.LFB10-.Ltext0
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
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB12-.Ltext0
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
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB13-.Ltext0
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
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB14-.Ltext0
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
	.long	.LFE14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LVL4-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	.LVL9-.Ltext0
	.long	.LVL10-1-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL10-1-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LVL11-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 0
	.long	0
	.long	0
.LLST7:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST8:
	.long	.LFB23-.Ltext0
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
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LVL18-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL20-.Ltext0
	.long	.LVL21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL22-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	0
	.long	0
.LLST10:
	.long	.LFB24-.Ltext0
	.long	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI24-.Ltext0
	.long	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI25-.Ltext0
	.long	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI26-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LFB25-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI27-.Ltext0
	.long	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI28-.Ltext0
	.long	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI29-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL26-.Ltext0
	.long	.LVL27-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-1-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -4
	.long	.LVL28-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	0
	.long	0
.LLST13:
	.long	.LFB26-.Ltext0
	.long	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI30-.Ltext0
	.long	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI31-.Ltext0
	.long	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI32-.Ltext0
	.long	.LFE26-.Ltext0
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
.LASF65:
	.string	"result"
.LASF61:
	.string	"readeflags"
.LASF51:
	.string	"EMBRYO"
.LASF58:
	.string	"inode"
.LASF53:
	.string	"RUNNABLE"
.LASF44:
	.string	"state"
.LASF78:
	.string	"%gs:0"
.LASF77:
	.string	"holding"
.LASF68:
	.string	"release"
.LASF19:
	.string	"base_15_0"
.LASF41:
	.string	"sizetype"
.LASF14:
	.string	"eflags"
.LASF55:
	.string	"ZOMBIE"
.LASF23:
	.string	"rsv1"
.LASF79:
	.string	"panic"
.LASF17:
	.string	"segdesc"
.LASF66:
	.string	"initlock"
.LASF0:
	.string	"uint"
.LASF57:
	.string	"file"
.LASF29:
	.string	"esp2"
.LASF73:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF67:
	.string	"acquire"
.LASF47:
	.string	"killed"
.LASF69:
	.string	"getcallerpcs"
.LASF72:
	.string	"popcli"
.LASF20:
	.string	"base_23_16"
.LASF46:
	.string	"chan"
.LASF1:
	.string	"ushort"
.LASF9:
	.string	"padding2"
.LASF10:
	.string	"padding3"
.LASF11:
	.string	"padding4"
.LASF6:
	.string	"pde_t"
.LASF15:
	.string	"padding6"
.LASF32:
	.string	"padding9"
.LASF8:
	.string	"padding1"
.LASF24:
	.string	"base_31_24"
.LASF16:
	.string	"trapframe"
.LASF4:
	.string	"uchar"
.LASF13:
	.string	"padding5"
.LASF71:
	.string	"pushcli"
.LASF45:
	.string	"parent"
.LASF31:
	.string	"padding8"
.LASF18:
	.string	"lim_15_0"
.LASF26:
	.string	"link"
.LASF52:
	.string	"SLEEPING"
.LASF48:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF30:
	.string	"padding7"
.LASF64:
	.string	"newval"
.LASF34:
	.string	"iomb"
.LASF39:
	.string	"proc"
.LASF21:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF40:
	.string	"context"
.LASF54:
	.string	"RUNNING"
.LASF36:
	.string	"started"
.LASF43:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF27:
	.string	"esp0"
.LASF28:
	.string	"esp1"
.LASF56:
	.string	"char"
.LASF60:
	.string	"locked"
.LASF70:
	.string	"lock"
.LASF63:
	.string	"addr"
.LASF50:
	.string	"UNUSED"
.LASF33:
	.string	"padding10"
.LASF38:
	.string	"intena"
.LASF35:
	.string	"scheduler"
.LASF25:
	.string	"taskstate"
.LASF59:
	.string	"spinlock"
.LASF22:
	.string	"lim_19_16"
.LASF74:
	.string	"spinlock.c"
.LASF75:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF49:
	.string	"name"
.LASF7:
	.string	"oesp"
.LASF76:
	.string	"procstate"
.LASF42:
	.string	"pgdir"
.LASF37:
	.string	"ncli"
.LASF12:
	.string	"trapno"
.LASF62:
	.string	"xchg"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
