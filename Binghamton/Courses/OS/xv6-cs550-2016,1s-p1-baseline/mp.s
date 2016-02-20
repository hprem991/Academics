	.file	"mp.c"
	.text
.Ltext0:
	.type	p2v, @function
p2v:
.LFB1:
	.file 1 "memlayout.h"
	.loc 1 14 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	.loc 1 14 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	p2v, .-p2v
	.type	inb, @function
inb:
.LFB2:
	.file 2 "x86.h"
	.loc 2 5 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	.loc 2 8 0
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
#APP
# 8 "x86.h" 1
	in %dx,%al
# 0 "" 2
#NO_APP
	movb	%al, -1(%ebp)
.LVL2:
	.loc 2 9 0
	movzbl	-1(%ebp), %eax
	.loc 2 10 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	inb, .-inb
	.type	outb, @function
outb:
.LFB4:
	.loc 2 23 0
	.cfi_startproc
.LVL3:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	12(%ebp), %eax
	movw	%dx, -4(%ebp)
	movb	%al, -8(%ebp)
	.loc 2 24 0
	movzbl	-8(%ebp), %eax
	movzwl	-4(%ebp), %edx
#APP
# 24 "x86.h" 1
	out %al,%dx
# 0 "" 2
	.loc 2 25 0
#NO_APP
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	outb, .-outb
	.comm	cpus,1504,32
	.local	bcpu
	.comm	bcpu,4,4
	.comm	ismp,4,4
	.comm	ncpu,4,4
	.comm	ioapicid,1,1
	.globl	mpbcpu
	.type	mpbcpu, @function
mpbcpu:
.LFB20:
	.file 3 "mp.c"
	.loc 3 22 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 3 23 0
	movl	bcpu, %eax
	movl	%eax, %edx
	movl	$cpus, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	sarl	$2, %eax
	imull	$1736263375, %eax, %eax
	.loc 3 24 0
	popl	%ebp
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	mpbcpu, .-mpbcpu
	.type	sum, @function
sum:
.LFB21:
	.loc 3 28 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 3 31 0
	movl	$0, -8(%ebp)
.LVL5:
	.loc 3 32 0
	movl	$0, -4(%ebp)
.LVL6:
	jmp	.L9
.LVL7:
.L10:
	.loc 3 33 0 discriminator 2
	movl	-4(%ebp), %edx
	movl	8(%ebp), %eax
.LVL8:
	addl	%edx, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	addl	%eax, -8(%ebp)
.LVL9:
	.loc 3 32 0 discriminator 2
	addl	$1, -4(%ebp)
.LVL10:
.L9:
	.loc 3 32 0 is_stmt 0 discriminator 1
	movl	-4(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	.L10
	.loc 3 34 0 is_stmt 1
	movl	-8(%ebp), %eax
	.loc 3 35 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	sum, .-sum
	.section	.rodata
.LC0:
	.string	"_MP_"
	.text
	.type	mpsearch1, @function
mpsearch1:
.LFB22:
	.loc 3 40 0
	.cfi_startproc
.LVL11:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 43 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	p2v
.LVL12:
	movl	%eax, -16(%ebp)
.LVL13:
	.loc 3 44 0
	movl	12(%ebp), %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
.LVL14:
	movl	%eax, -20(%ebp)
.LVL15:
	.loc 3 45 0
	movl	-16(%ebp), %eax
.LVL16:
	movl	%eax, -12(%ebp)
.LVL17:
	jmp	.L13
.LVL18:
.L16:
	.loc 3 46 0
	movl	$4, 8(%esp)
	movl	$.LC0, 4(%esp)
	movl	-12(%ebp), %eax
.LVL19:
	movl	%eax, (%esp)
	call	memcmp
.LVL20:
	testl	%eax, %eax
	jne	.L14
	.loc 3 46 0 is_stmt 0 discriminator 1
	movl	$16, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	sum
.LVL21:
	testb	%al, %al
	jne	.L14
	.loc 3 47 0 is_stmt 1
	movl	-12(%ebp), %eax
	jmp	.L15
.L14:
	.loc 3 45 0
	addl	$16, -12(%ebp)
.L13:
	.loc 3 45 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	.L16
	.loc 3 48 0 is_stmt 1
	movl	$0, %eax
.L15:
	.loc 3 49 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	mpsearch1, .-mpsearch1
	.type	mpsearch, @function
mpsearch:
.LFB23:
	.loc 3 58 0
	.cfi_startproc
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 63 0
	movl	$-2147482624, -12(%ebp)
.LVL22:
	.loc 3 64 0
	movl	-12(%ebp), %eax
	addl	$15, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	$14, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	orl	%edx, %eax
	sall	$4, %eax
	movl	%eax, -16(%ebp)
.LVL23:
	cmpl	$0, -16(%ebp)
	je	.L18
	.loc 3 65 0
	movl	$1024, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	mpsearch1
.LVL24:
	movl	%eax, -20(%ebp)
.LVL25:
	cmpl	$0, -20(%ebp)
	je	.L19
	.loc 3 66 0
	movl	-20(%ebp), %eax
	jmp	.L20
.LVL26:
.L18:
	.loc 3 68 0
	movl	-12(%ebp), %eax
.LVL27:
	addl	$20, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	sall	$8, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	addl	$19, %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	orl	%edx, %eax
	sall	$10, %eax
	movl	%eax, -16(%ebp)
.LVL28:
	.loc 3 69 0
	movl	-16(%ebp), %eax
	subl	$1024, %eax
.LVL29:
	movl	$1024, 4(%esp)
	movl	%eax, (%esp)
	call	mpsearch1
.LVL30:
	movl	%eax, -20(%ebp)
.LVL31:
	cmpl	$0, -20(%ebp)
	je	.L19
	.loc 3 70 0
	movl	-20(%ebp), %eax
	jmp	.L20
.L19:
	.loc 3 72 0
	movl	$65536, 4(%esp)
	movl	$983040, (%esp)
	call	mpsearch1
.LVL32:
.L20:
	.loc 3 73 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL33:
	ret
	.cfi_endproc
.LFE23:
	.size	mpsearch, .-mpsearch
	.section	.rodata
.LC1:
	.string	"PCMP"
	.text
	.type	mpconfig, @function
mpconfig:
.LFB24:
	.loc 3 82 0
	.cfi_startproc
.LVL34:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 86 0
	call	mpsearch
.LVL35:
	movl	%eax, -12(%ebp)
.LVL36:
	cmpl	$0, -12(%ebp)
	je	.L22
	.loc 3 86 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
.LVL37:
	testl	%eax, %eax
	jne	.L23
.L22:
	.loc 3 87 0 is_stmt 1
	movl	$0, %eax
	jmp	.L24
.L23:
	.loc 3 88 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	p2v
.LVL38:
	movl	%eax, -16(%ebp)
.LVL39:
	.loc 3 89 0
	movl	$4, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	memcmp
.LVL40:
	testl	%eax, %eax
	je	.L25
	.loc 3 90 0
	movl	$0, %eax
	jmp	.L24
.L25:
	.loc 3 91 0
	movl	-16(%ebp), %eax
	movzbl	6(%eax), %eax
	cmpb	$1, %al
	je	.L26
	.loc 3 91 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movzbl	6(%eax), %eax
	cmpb	$4, %al
	je	.L26
	.loc 3 92 0 is_stmt 1
	movl	$0, %eax
	jmp	.L24
.L26:
	.loc 3 93 0
	movl	-16(%ebp), %eax
	movzwl	4(%eax), %eax
	movzwl	%ax, %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	sum
.LVL41:
	testb	%al, %al
	je	.L27
	.loc 3 94 0
	movl	$0, %eax
	jmp	.L24
.L27:
	.loc 3 95 0
	movl	8(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	.loc 3 96 0
	movl	-16(%ebp), %eax
.LVL42:
.L24:
	.loc 3 97 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	mpconfig, .-mpconfig
	.section	.rodata
.LC2:
	.string	"mpinit: ncpu=%d apicid=%d\n"
	.align 4
.LC3:
	.string	"mpinit: unknown config type %x\n"
	.text
	.globl	mpinit
	.type	mpinit, @function
mpinit:
.LFB25:
	.loc 3 101 0
	.cfi_startproc
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 3 108 0
	movl	$cpus, bcpu
	.loc 3 109 0
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	mpconfig
.LVL43:
	movl	%eax, -16(%ebp)
.LVL44:
	cmpl	$0, -16(%ebp)
	jne	.L29
	.loc 3 110 0
	jmp	.L28
.L29:
	.loc 3 111 0
	movl	$1, ismp
	.loc 3 112 0
	movl	-16(%ebp), %eax
.LVL45:
	movl	36(%eax), %eax
	movl	%eax, lapic
	.loc 3 113 0
	movl	-16(%ebp), %eax
	addl	$44, %eax
	movl	%eax, -12(%ebp)
.LVL46:
	movl	-16(%ebp), %eax
.LVL47:
	movzwl	4(%eax), %eax
	movzwl	%ax, %edx
	movl	-16(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -20(%ebp)
.LVL48:
	jmp	.L31
.LVL49:
.L39:
	.loc 3 114 0
	movl	-12(%ebp), %eax
.LVL50:
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	cmpl	$4, %eax
	ja	.L32
	movl	.L34(,%eax,4), %eax
	jmp	*%eax
	.section	.rodata
	.align 4
	.align 4
.L34:
	.long	.L33
	.long	.L35
	.long	.L36
	.long	.L35
	.long	.L35
	.text
.L33:
	.loc 3 116 0
	movl	-12(%ebp), %eax
	movl	%eax, -24(%ebp)
.LVL51:
	.loc 3 117 0
	movl	-24(%ebp), %eax
	movzbl	1(%eax), %eax
.LVL52:
	movzbl	%al, %edx
	movl	ncpu, %eax
	cmpl	%eax, %edx
	je	.L37
	.loc 3 118 0
	movl	-24(%ebp), %eax
	movzbl	1(%eax), %eax
	movzbl	%al, %edx
	movl	ncpu, %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC2, (%esp)
	call	cprintf
.LVL53:
	.loc 3 119 0
	movl	$0, ismp
.L37:
	.loc 3 121 0
	movl	-24(%ebp), %eax
	movzbl	3(%eax), %eax
	movzbl	%al, %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L38
	.loc 3 122 0
	movl	ncpu, %eax
	imull	$188, %eax, %eax
	addl	$cpus, %eax
	movl	%eax, bcpu
.L38:
	.loc 3 123 0
	movl	ncpu, %edx
	movl	ncpu, %eax
	imull	$188, %edx, %edx
	addl	$cpus, %edx
	movb	%al, (%edx)
	.loc 3 124 0
	movl	ncpu, %eax
	addl	$1, %eax
	movl	%eax, ncpu
	.loc 3 125 0
	addl	$20, -12(%ebp)
.LVL54:
	.loc 3 126 0
	jmp	.L31
.LVL55:
.L36:
	.loc 3 128 0
	movl	-12(%ebp), %eax
	movl	%eax, -28(%ebp)
.LVL56:
	.loc 3 129 0
	movl	-28(%ebp), %eax
	movzbl	1(%eax), %eax
.LVL57:
	movb	%al, ioapicid
	.loc 3 130 0
	addl	$8, -12(%ebp)
.LVL58:
	.loc 3 131 0
	jmp	.L31
.LVL59:
.L35:
	.loc 3 135 0
	addl	$8, -12(%ebp)
.LVL60:
	.loc 3 136 0
	jmp	.L31
.L32:
	.loc 3 138 0
	movl	-12(%ebp), %eax
	movzbl	(%eax), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$.LC3, (%esp)
	call	cprintf
.LVL61:
	.loc 3 139 0
	movl	$0, ismp
.L31:
	.loc 3 113 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	-20(%ebp), %eax
	jb	.L39
	.loc 3 142 0
	movl	ismp, %eax
	testl	%eax, %eax
	jne	.L40
	.loc 3 144 0
	movl	$1, ncpu
	.loc 3 145 0
	movl	$0, lapic
	.loc 3 146 0
	movb	$0, ioapicid
	.loc 3 147 0
	jmp	.L28
.L40:
	.loc 3 150 0
	movl	-32(%ebp), %eax
	movzbl	12(%eax), %eax
	testb	%al, %al
	je	.L28
	.loc 3 153 0
	movl	$112, 4(%esp)
	movl	$34, (%esp)
	call	outb
.LVL62:
	.loc 3 154 0
	movl	$35, (%esp)
	call	inb
.LVL63:
	orl	$1, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$35, (%esp)
	call	outb
.LVL64:
.L28:
	.loc 3 156 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL65:
	ret
	.cfi_endproc
.LFE25:
	.size	mpinit, .-mpinit
.Letext0:
	.file 4 "types.h"
	.file 5 "mp.h"
	.file 6 "mmu.h"
	.file 7 "proc.h"
	.file 8 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe0c
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF95
	.byte	0x1
	.long	.LASF96
	.long	.LASF97
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x4
	.byte	0x1
	.long	0x30
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x4
	.byte	0x2
	.long	0x42
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x4
	.byte	0x3
	.long	0x54
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.long	.LASF6
	.byte	0x4
	.byte	0x4
	.long	0x25
	.uleb128 0x4
	.string	"mp"
	.byte	0x10
	.byte	0x5
	.byte	0x3
	.long	0xe2
	.uleb128 0x5
	.long	.LASF7
	.byte	0x5
	.byte	0x4
	.long	0xe2
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF8
	.byte	0x5
	.byte	0x5
	.long	0xf9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF9
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF10
	.byte	0x5
	.byte	0x7
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x5
	.long	.LASF11
	.byte	0x5
	.byte	0x8
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x5
	.long	.LASF12
	.byte	0x5
	.byte	0x9
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0x5
	.long	.LASF13
	.byte	0x5
	.byte	0xa
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF14
	.byte	0x5
	.byte	0xb
	.long	0xfb
	.byte	0x2
	.byte	0x23
	.uleb128 0xd
	.byte	0
	.uleb128 0x6
	.long	0x49
	.long	0xf2
	.uleb128 0x7
	.long	0xf2
	.byte	0x3
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF15
	.uleb128 0x8
	.byte	0x4
	.uleb128 0x6
	.long	0x49
	.long	0x10b
	.uleb128 0x7
	.long	0xf2
	.byte	0x2
	.byte	0
	.uleb128 0x9
	.long	.LASF16
	.byte	0x2c
	.byte	0x5
	.byte	0xe
	.long	0x1c0
	.uleb128 0x5
	.long	.LASF7
	.byte	0x5
	.byte	0xf
	.long	0xe2
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF9
	.byte	0x5
	.byte	0x10
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF17
	.byte	0x5
	.byte	0x11
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0x5
	.long	.LASF11
	.byte	0x5
	.byte	0x12
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.uleb128 0x5
	.long	.LASF18
	.byte	0x5
	.byte	0x13
	.long	0x1c0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF19
	.byte	0x5
	.byte	0x14
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.long	.LASF20
	.byte	0x5
	.byte	0x15
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF21
	.byte	0x5
	.byte	0x16
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x5
	.long	.LASF22
	.byte	0x5
	.byte	0x17
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF23
	.byte	0x5
	.byte	0x18
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.long	.LASF24
	.byte	0x5
	.byte	0x19
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x5
	.long	.LASF14
	.byte	0x5
	.byte	0x1a
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2b
	.byte	0
	.uleb128 0x6
	.long	0x49
	.long	0x1d0
	.uleb128 0x7
	.long	0xf2
	.byte	0x13
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x25
	.uleb128 0x9
	.long	.LASF25
	.byte	0x14
	.byte	0x5
	.byte	0x1d
	.long	0x245
	.uleb128 0x5
	.long	.LASF12
	.byte	0x5
	.byte	0x1e
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF26
	.byte	0x5
	.byte	0x1f
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x5
	.long	.LASF17
	.byte	0x5
	.byte	0x20
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.long	.LASF27
	.byte	0x5
	.byte	0x21
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x5
	.long	.LASF7
	.byte	0x5
	.byte	0x23
	.long	0xe2
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF28
	.byte	0x5
	.byte	0x24
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF14
	.byte	0x5
	.byte	0x25
	.long	0x245
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x6
	.long	0x49
	.long	0x255
	.uleb128 0x7
	.long	0xf2
	.byte	0x7
	.byte	0
	.uleb128 0x9
	.long	.LASF29
	.byte	0x8
	.byte	0x5
	.byte	0x28
	.long	0x2a8
	.uleb128 0x5
	.long	.LASF12
	.byte	0x5
	.byte	0x29
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF30
	.byte	0x5
	.byte	0x2a
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x5
	.long	.LASF17
	.byte	0x5
	.byte	0x2b
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x5
	.long	.LASF27
	.byte	0x5
	.byte	0x2c
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x5
	.long	.LASF31
	.byte	0x5
	.byte	0x2d
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x9
	.long	.LASF32
	.byte	0x4c
	.byte	0x2
	.byte	0x9c
	.long	0x40d
	.uleb128 0xb
	.string	"edi"
	.byte	0x2
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.string	"esi"
	.byte	0x2
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.string	"ebp"
	.byte	0x2
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF33
	.byte	0x2
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.string	"ebx"
	.byte	0x2
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xb
	.string	"edx"
	.byte	0x2
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xb
	.string	"ecx"
	.byte	0x2
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xb
	.string	"eax"
	.byte	0x2
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xb
	.string	"gs"
	.byte	0x2
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF34
	.byte	0x2
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0xb
	.string	"fs"
	.byte	0x2
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF35
	.byte	0x2
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0xb
	.string	"es"
	.byte	0x2
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.long	.LASF36
	.byte	0x2
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0xb
	.string	"ds"
	.byte	0x2
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x5
	.long	.LASF37
	.byte	0x2
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x5
	.long	.LASF38
	.byte	0x2
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xb
	.string	"err"
	.byte	0x2
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xb
	.string	"eip"
	.byte	0x2
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xb
	.string	"cs"
	.byte	0x2
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.long	.LASF39
	.byte	0x2
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x5
	.long	.LASF40
	.byte	0x2
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xb
	.string	"esp"
	.byte	0x2
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xb
	.string	"ss"
	.byte	0x2
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x5
	.long	.LASF41
	.byte	0x2
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x9
	.long	.LASF42
	.byte	0x8
	.byte	0x6
	.byte	0x34
	.long	0x4f0
	.uleb128 0xc
	.long	.LASF43
	.byte	0x6
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xc
	.long	.LASF44
	.byte	0x6
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xc
	.long	.LASF45
	.byte	0x6
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.long	.LASF12
	.byte	0x6
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.string	"s"
	.byte	0x6
	.byte	0x39
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.string	"dpl"
	.byte	0x6
	.byte	0x3a
	.long	0x25
	.byte	0x4
	.byte	0x2
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.string	"p"
	.byte	0x6
	.byte	0x3b
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.long	.LASF46
	.byte	0x6
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.string	"avl"
	.byte	0x6
	.byte	0x3d
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.long	.LASF47
	.byte	0x6
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.string	"db"
	.byte	0x6
	.byte	0x3f
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.string	"g"
	.byte	0x6
	.byte	0x40
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.long	.LASF48
	.byte	0x6
	.byte	0x41
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x9
	.long	.LASF49
	.byte	0x68
	.byte	0x6
	.byte	0x97
	.long	0x6fb
	.uleb128 0x5
	.long	.LASF50
	.byte	0x6
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF51
	.byte	0x6
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.string	"ss0"
	.byte	0x6
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF34
	.byte	0x6
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x5
	.long	.LASF52
	.byte	0x6
	.byte	0x9c
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.string	"ss1"
	.byte	0x6
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF35
	.byte	0x6
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.long	.LASF53
	.byte	0x6
	.byte	0x9f
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xb
	.string	"ss2"
	.byte	0x6
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF36
	.byte	0x6
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0xb
	.string	"cr3"
	.byte	0x6
	.byte	0xa2
	.long	0xf9
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xb
	.string	"eip"
	.byte	0x6
	.byte	0xa3
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF40
	.byte	0x6
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0xb
	.string	"eax"
	.byte	0x6
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xb
	.string	"ecx"
	.byte	0x6
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xb
	.string	"edx"
	.byte	0x6
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xb
	.string	"ebx"
	.byte	0x6
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0xb
	.string	"esp"
	.byte	0x6
	.byte	0xa9
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xb
	.string	"ebp"
	.byte	0x6
	.byte	0xaa
	.long	0x1d0
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0xb
	.string	"esi"
	.byte	0x6
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0xb
	.string	"edi"
	.byte	0x6
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0xb
	.string	"es"
	.byte	0x6
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x5
	.long	.LASF37
	.byte	0x6
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0xb
	.string	"cs"
	.byte	0x6
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x5
	.long	.LASF39
	.byte	0x6
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0xb
	.string	"ss"
	.byte	0x6
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x5
	.long	.LASF41
	.byte	0x6
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0xb
	.string	"ds"
	.byte	0x6
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x5
	.long	.LASF54
	.byte	0x6
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0xb
	.string	"fs"
	.byte	0x6
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x5
	.long	.LASF55
	.byte	0x6
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0xb
	.string	"gs"
	.byte	0x6
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x5
	.long	.LASF56
	.byte	0x6
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0xb
	.string	"ldt"
	.byte	0x6
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x5
	.long	.LASF57
	.byte	0x6
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0xb
	.string	"t"
	.byte	0x6
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x5
	.long	.LASF58
	.byte	0x6
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x66
	.byte	0
	.uleb128 0x4
	.string	"cpu"
	.byte	0xbc
	.byte	0x7
	.byte	0x5
	.long	0x789
	.uleb128 0xb
	.string	"id"
	.byte	0x7
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF59
	.byte	0x7
	.byte	0x7
	.long	0x7dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.string	"ts"
	.byte	0x7
	.byte	0x8
	.long	0x4f0
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.string	"gdt"
	.byte	0x7
	.byte	0x9
	.long	0x7e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x5
	.long	.LASF60
	.byte	0x7
	.byte	0xa
	.long	0x7f2
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x5
	.long	.LASF61
	.byte	0x7
	.byte	0xb
	.long	0x7f7
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x5
	.long	.LASF62
	.byte	0x7
	.byte	0xc
	.long	0x7f7
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0xb
	.string	"cpu"
	.byte	0x7
	.byte	0xf
	.long	0x7fe
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x5
	.long	.LASF63
	.byte	0x7
	.byte	0x10
	.long	0x8c5
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x9
	.long	.LASF64
	.byte	0x14
	.byte	0x7
	.byte	0x2c
	.long	0x7dc
	.uleb128 0xb
	.string	"edi"
	.byte	0x7
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0xb
	.string	"esi"
	.byte	0x7
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xb
	.string	"ebx"
	.byte	0x7
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xb
	.string	"ebp"
	.byte	0x7
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.string	"eip"
	.byte	0x7
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x789
	.uleb128 0x6
	.long	0x40d
	.long	0x7f2
	.uleb128 0x7
	.long	0xf2
	.byte	0x6
	.byte	0
	.uleb128 0xe
	.long	0x25
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xa
	.byte	0x4
	.long	0x6fb
	.uleb128 0x9
	.long	.LASF63
	.byte	0x7c
	.byte	0x7
	.byte	0x37
	.long	0x8c5
	.uleb128 0xb
	.string	"sz"
	.byte	0x7
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF65
	.byte	0x7
	.byte	0x39
	.long	0x8fc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF66
	.byte	0x7
	.byte	0x3a
	.long	0x902
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF67
	.byte	0x7
	.byte	0x3b
	.long	0x8cb
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xb
	.string	"pid"
	.byte	0x7
	.byte	0x3c
	.long	0x7f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF68
	.byte	0x7
	.byte	0x3d
	.long	0x8c5
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xb
	.string	"tf"
	.byte	0x7
	.byte	0x3e
	.long	0x90f
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF64
	.byte	0x7
	.byte	0x3f
	.long	0x7dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.long	.LASF69
	.byte	0x7
	.byte	0x40
	.long	0xf9
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF70
	.byte	0x7
	.byte	0x41
	.long	0x7f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF71
	.byte	0x7
	.byte	0x42
	.long	0x915
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xb
	.string	"cwd"
	.byte	0x7
	.byte	0x43
	.long	0x937
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x5
	.long	.LASF72
	.byte	0x7
	.byte	0x44
	.long	0x93d
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x804
	.uleb128 0x10
	.long	.LASF98
	.byte	0x4
	.byte	0x7
	.byte	0x34
	.long	0x8fc
	.uleb128 0x11
	.long	.LASF73
	.sleb128 0
	.uleb128 0x11
	.long	.LASF74
	.sleb128 1
	.uleb128 0x11
	.long	.LASF75
	.sleb128 2
	.uleb128 0x11
	.long	.LASF76
	.sleb128 3
	.uleb128 0x11
	.long	.LASF77
	.sleb128 4
	.uleb128 0x11
	.long	.LASF78
	.sleb128 5
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x5b
	.uleb128 0xa
	.byte	0x4
	.long	0x908
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF79
	.uleb128 0xa
	.byte	0x4
	.long	0x2a8
	.uleb128 0x6
	.long	0x925
	.long	0x925
	.uleb128 0x7
	.long	0xf2
	.byte	0xf
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x92b
	.uleb128 0x12
	.long	.LASF80
	.byte	0x1
	.uleb128 0x12
	.long	.LASF81
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.long	0x931
	.uleb128 0x6
	.long	0x908
	.long	0x94d
	.uleb128 0x7
	.long	0xf2
	.byte	0xf
	.byte	0
	.uleb128 0x13
	.string	"p2v"
	.byte	0x1
	.byte	0xe
	.byte	0x1
	.long	0xf9
	.long	.LFB1
	.long	.LFE1
	.long	.LLST0
	.byte	0x1
	.long	0x977
	.uleb128 0x14
	.string	"a"
	.byte	0x1
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.string	"inb"
	.byte	0x2
	.byte	0x4
	.byte	0x1
	.long	0x49
	.long	.LFB2
	.long	.LFE2
	.long	.LLST1
	.byte	0x1
	.long	0x9b0
	.uleb128 0x15
	.long	.LASF82
	.byte	0x2
	.byte	0x4
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.long	.LASF83
	.byte	0x2
	.byte	0x6
	.long	0x49
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x17
	.long	.LASF99
	.byte	0x2
	.byte	0x16
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST2
	.byte	0x1
	.long	0x9e6
	.uleb128 0x15
	.long	.LASF82
	.byte	0x2
	.byte	0x16
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF83
	.byte	0x2
	.byte	0x16
	.long	0x49
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF100
	.byte	0x3
	.byte	0x15
	.byte	0x1
	.long	0x7f7
	.long	.LFB20
	.long	.LFE20
	.long	.LLST3
	.byte	0x1
	.uleb128 0x13
	.string	"sum"
	.byte	0x3
	.byte	0x1b
	.byte	0x1
	.long	0x49
	.long	.LFB21
	.long	.LFE21
	.long	.LLST4
	.byte	0x1
	.long	0xa55
	.uleb128 0x15
	.long	.LASF31
	.byte	0x3
	.byte	0x1b
	.long	0xa55
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"len"
	.byte	0x3
	.byte	0x1b
	.long	0x7f7
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.string	"i"
	.byte	0x3
	.byte	0x1d
	.long	0x7f7
	.long	.LLST5
	.uleb128 0x1a
	.string	"sum"
	.byte	0x3
	.byte	0x1d
	.long	0x7f7
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x49
	.uleb128 0x1b
	.long	.LASF84
	.byte	0x3
	.byte	0x27
	.byte	0x1
	.long	0xb10
	.long	.LFB22
	.long	.LFE22
	.long	.LLST6
	.byte	0x1
	.long	0xb10
	.uleb128 0x14
	.string	"a"
	.byte	0x3
	.byte	0x27
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"len"
	.byte	0x3
	.byte	0x27
	.long	0x7f7
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x19
	.string	"e"
	.byte	0x3
	.byte	0x29
	.long	0xa55
	.long	.LLST7
	.uleb128 0x19
	.string	"p"
	.byte	0x3
	.byte	0x29
	.long	0xa55
	.long	.LLST8
	.uleb128 0x1c
	.long	.LASF31
	.byte	0x3
	.byte	0x29
	.long	0xa55
	.long	.LLST9
	.uleb128 0x1d
	.long	.LVL12
	.long	0x94d
	.long	0xad1
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x1d
	.long	.LVL20
	.long	0xdd5
	.long	0xaf7
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x34
	.byte	0
	.uleb128 0x1f
	.long	.LVL21
	.long	0xa00
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x40
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x66
	.uleb128 0x1b
	.long	.LASF85
	.byte	0x3
	.byte	0x39
	.byte	0x1
	.long	0xb10
	.long	.LFB23
	.long	.LFE23
	.long	.LLST10
	.byte	0x1
	.long	0xbb8
	.uleb128 0x19
	.string	"bda"
	.byte	0x3
	.byte	0x3b
	.long	0xa55
	.long	.LLST11
	.uleb128 0x19
	.string	"p"
	.byte	0x3
	.byte	0x3c
	.long	0x25
	.long	.LLST12
	.uleb128 0x19
	.string	"mp"
	.byte	0x3
	.byte	0x3d
	.long	0xb10
	.long	.LLST13
	.uleb128 0x1d
	.long	.LVL24
	.long	0xa5b
	.long	0xb7b
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0xa
	.value	0x400
	.byte	0
	.uleb128 0x1d
	.long	.LVL30
	.long	0xa5b
	.long	0xb9d
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x7
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0xa
	.value	0x400
	.byte	0x1c
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0xa
	.value	0x400
	.byte	0
	.uleb128 0x1f
	.long	.LVL32
	.long	0xa5b
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x4e
	.byte	0x3f
	.byte	0x24
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	.LASF86
	.byte	0x3
	.byte	0x51
	.byte	0x1
	.long	0xc4b
	.long	.LFB24
	.long	.LFE24
	.long	.LLST14
	.byte	0x1
	.long	0xc4b
	.uleb128 0x14
	.string	"pmp"
	.byte	0x3
	.byte	0x51
	.long	0xc51
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LASF87
	.byte	0x3
	.byte	0x53
	.long	0xc4b
	.long	.LLST15
	.uleb128 0x19
	.string	"mp"
	.byte	0x3
	.byte	0x54
	.long	0xb10
	.long	.LLST16
	.uleb128 0x20
	.long	.LVL35
	.long	0xb16
	.uleb128 0x20
	.long	.LVL38
	.long	0x94d
	.uleb128 0x1d
	.long	.LVL40
	.long	0xdd5
	.long	0xc38
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x34
	.byte	0
	.uleb128 0x1f
	.long	.LVL41
	.long	0xa00
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x10b
	.uleb128 0xa
	.byte	0x4
	.long	0xb10
	.uleb128 0x21
	.byte	0x1
	.long	.LASF101
	.byte	0x3
	.byte	0x64
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST17
	.byte	0x1
	.long	0xd4d
	.uleb128 0x19
	.string	"p"
	.byte	0x3
	.byte	0x66
	.long	0xa55
	.long	.LLST18
	.uleb128 0x19
	.string	"e"
	.byte	0x3
	.byte	0x66
	.long	0xa55
	.long	.LLST19
	.uleb128 0x1a
	.string	"mp"
	.byte	0x3
	.byte	0x67
	.long	0xb10
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF87
	.byte	0x3
	.byte	0x68
	.long	0xc4b
	.long	.LLST20
	.uleb128 0x1c
	.long	.LASF63
	.byte	0x3
	.byte	0x69
	.long	0xd4d
	.long	.LLST21
	.uleb128 0x1c
	.long	.LASF88
	.byte	0x3
	.byte	0x6a
	.long	0xd53
	.long	.LLST22
	.uleb128 0x1d
	.long	.LVL43
	.long	0xbb8
	.long	0xcda
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 -32
	.byte	0
	.uleb128 0x1d
	.long	.LVL53
	.long	0xdfe
	.long	0xcf2
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x1d
	.long	.LVL61
	.long	0xdfe
	.long	0xd0a
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x1d
	.long	.LVL62
	.long	0x9b0
	.long	0xd26
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x8
	.byte	0x22
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x70
	.byte	0
	.uleb128 0x1d
	.long	.LVL63
	.long	0x977
	.long	0xd3b
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x8
	.byte	0x23
	.byte	0
	.uleb128 0x1f
	.long	.LVL64
	.long	0x9b0
	.uleb128 0x1e
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x8
	.byte	0x23
	.byte	0
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0x1d6
	.uleb128 0xa
	.byte	0x4
	.long	0x255
	.uleb128 0x16
	.long	.LASF89
	.byte	0x3
	.byte	0xf
	.long	0x7fe
	.byte	0x5
	.byte	0x3
	.long	bcpu
	.uleb128 0x22
	.long	.LASF90
	.byte	0x3
	.byte	0x12
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ioapicid
	.uleb128 0x23
	.long	.LASF91
	.byte	0x8
	.byte	0x4d
	.long	0xd89
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.byte	0x4
	.long	0x7f2
	.uleb128 0x22
	.long	.LASF92
	.byte	0x3
	.byte	0x10
	.long	0x7f7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ismp
	.uleb128 0x6
	.long	0x6fb
	.long	0xdb1
	.uleb128 0x7
	.long	0xf2
	.byte	0x7
	.byte	0
	.uleb128 0x22
	.long	.LASF93
	.byte	0x3
	.byte	0xe
	.long	0xda1
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	cpus
	.uleb128 0x22
	.long	.LASF94
	.byte	0x3
	.byte	0x11
	.long	0x7f7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ncpu
	.uleb128 0x24
	.byte	0x1
	.long	.LASF102
	.byte	0x8
	.byte	0x87
	.byte	0x1
	.long	0x7f7
	.byte	0x1
	.long	0xdf7
	.uleb128 0x25
	.long	0xdf7
	.uleb128 0x25
	.long	0xdf7
	.uleb128 0x25
	.long	0x25
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.long	0xdfd
	.uleb128 0x26
	.uleb128 0x27
	.byte	0x1
	.long	.LASF103
	.byte	0x8
	.byte	0x14
	.byte	0x1
	.byte	0x1
	.uleb128 0x25
	.long	0x902
	.uleb128 0x28
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
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
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB1-.Ltext0
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
	.long	.LFE1-.Ltext0
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
	.long	.LFB4-.Ltext0
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
	.long	.LFE4-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -16
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	0
	.long	0
.LLST6:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST8:
	.long	.LVL17-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL18-.Ltext0
	.long	.LVL19-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST9:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST10:
	.long	.LFB23-.Ltext0
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
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST11:
	.long	.LVL22-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL33-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST12:
	.long	.LVL23-.Ltext0
	.long	.LVL24-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL24-1-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL29-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL33-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST13:
	.long	.LVL25-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL31-.Ltext0
	.long	.LVL32-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL32-1-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	.LVL33-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST14:
	.long	.LFB24-.Ltext0
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
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST15:
	.long	.LVL39-.Ltext0
	.long	.LVL40-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL40-1-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST16:
	.long	.LVL36-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL37-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST17:
	.long	.LFB25-.Ltext0
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
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST18:
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL47-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL50-.Ltext0
	.long	.LVL64-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST19:
	.long	.LVL48-.Ltext0
	.long	.LVL49-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL49-.Ltext0
	.long	.LVL64-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	0
	.long	0
.LLST20:
	.long	.LVL44-.Ltext0
	.long	.LVL45-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL45-.Ltext0
	.long	.LVL65-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL65-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST21:
	.long	.LVL51-.Ltext0
	.long	.LVL52-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL52-.Ltext0
	.long	.LVL54-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL54-.Ltext0
	.long	.LVL55-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -24
	.long	0
	.long	0
.LLST22:
	.long	.LVL56-.Ltext0
	.long	.LVL57-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL58-.Ltext0
	.long	.LVL59-.Ltext0
	.value	0x2
	.byte	0x75
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
.LASF17:
	.string	"version"
.LASF93:
	.string	"cpus"
.LASF81:
	.string	"inode"
.LASF76:
	.string	"RUNNABLE"
.LASF79:
	.string	"char"
.LASF44:
	.string	"base_15_0"
.LASF67:
	.string	"state"
.LASF91:
	.string	"lapic"
.LASF20:
	.string	"oemlength"
.LASF26:
	.string	"apicid"
.LASF15:
	.string	"sizetype"
.LASF40:
	.string	"eflags"
.LASF78:
	.string	"ZOMBIE"
.LASF47:
	.string	"rsv1"
.LASF100:
	.string	"mpbcpu"
.LASF42:
	.string	"segdesc"
.LASF83:
	.string	"data"
.LASF0:
	.string	"uint"
.LASF75:
	.string	"SLEEPING"
.LASF80:
	.string	"file"
.LASF52:
	.string	"esp1"
.LASF29:
	.string	"mpioapic"
.LASF95:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF11:
	.string	"checksum"
.LASF99:
	.string	"outb"
.LASF23:
	.string	"xlength"
.LASF70:
	.string	"killed"
.LASF84:
	.string	"mpsearch1"
.LASF22:
	.string	"lapicaddr"
.LASF69:
	.string	"chan"
.LASF1:
	.string	"ushort"
.LASF35:
	.string	"padding2"
.LASF36:
	.string	"padding3"
.LASF37:
	.string	"padding4"
.LASF6:
	.string	"pde_t"
.LASF41:
	.string	"padding6"
.LASF31:
	.string	"addr"
.LASF34:
	.string	"padding1"
.LASF48:
	.string	"base_31_24"
.LASF32:
	.string	"trapframe"
.LASF4:
	.string	"uchar"
.LASF16:
	.string	"mpconf"
.LASF68:
	.string	"parent"
.LASF55:
	.string	"padding8"
.LASF43:
	.string	"lim_15_0"
.LASF21:
	.string	"entry"
.LASF9:
	.string	"length"
.LASF39:
	.string	"padding5"
.LASF71:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF54:
	.string	"padding7"
.LASF102:
	.string	"memcmp"
.LASF56:
	.string	"padding9"
.LASF58:
	.string	"iomb"
.LASF27:
	.string	"flags"
.LASF13:
	.string	"imcrp"
.LASF28:
	.string	"feature"
.LASF12:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF64:
	.string	"context"
.LASF19:
	.string	"oemtable"
.LASF77:
	.string	"RUNNING"
.LASF60:
	.string	"started"
.LASF66:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF87:
	.string	"conf"
.LASF51:
	.string	"esp0"
.LASF96:
	.string	"mp.c"
.LASF50:
	.string	"link"
.LASF59:
	.string	"scheduler"
.LASF92:
	.string	"ismp"
.LASF86:
	.string	"mpconfig"
.LASF18:
	.string	"product"
.LASF25:
	.string	"mpproc"
.LASF73:
	.string	"UNUSED"
.LASF63:
	.string	"proc"
.LASF57:
	.string	"padding10"
.LASF82:
	.string	"port"
.LASF90:
	.string	"ioapicid"
.LASF53:
	.string	"esp2"
.LASF45:
	.string	"base_23_16"
.LASF62:
	.string	"intena"
.LASF8:
	.string	"physaddr"
.LASF49:
	.string	"taskstate"
.LASF94:
	.string	"ncpu"
.LASF103:
	.string	"cprintf"
.LASF46:
	.string	"lim_19_16"
.LASF7:
	.string	"signature"
.LASF97:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF72:
	.string	"name"
.LASF101:
	.string	"mpinit"
.LASF24:
	.string	"xchecksum"
.LASF33:
	.string	"oesp"
.LASF98:
	.string	"procstate"
.LASF74:
	.string	"EMBRYO"
.LASF30:
	.string	"apicno"
.LASF65:
	.string	"pgdir"
.LASF85:
	.string	"mpsearch"
.LASF14:
	.string	"reserved"
.LASF10:
	.string	"specrev"
.LASF61:
	.string	"ncli"
.LASF89:
	.string	"bcpu"
.LASF38:
	.string	"trapno"
.LASF88:
	.string	"ioapic"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
