	.file	"ide.c"
	.text
.Ltext0:
	.type	inb, @function
inb:
.LFB2:
	.file 1 "x86.h"
	.loc 1 5 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	movl	8(%ebp), %eax
	movw	%ax, -20(%ebp)
	.loc 1 8 0
	movzwl	-20(%ebp), %eax
	movl	%eax, %edx
#APP
# 8 "x86.h" 1
	in %dx,%al
# 0 "" 2
#NO_APP
	movb	%al, -1(%ebp)
.LVL1:
	.loc 1 9 0
	movzbl	-1(%ebp), %eax
	.loc 1 10 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	inb, .-inb
	.type	insl, @function
insl:
.LFB3:
	.loc 1 14 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%ebx
	.cfi_offset 7, -12
	.cfi_offset 3, -16
	.loc 1 15 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	%ecx, %ebx
	movl	%ebx, %edi
	movl	%eax, %ecx
#APP
# 15 "x86.h" 1
	cld; rep insl
# 0 "" 2
.LVL3:
#NO_APP
	movl	%ecx, %eax
	movl	%edi, %ebx
	movl	%ebx, 12(%ebp)
	movl	%eax, 16(%ebp)
.LVL4:
	.loc 1 19 0
	popl	%ebx
	.cfi_restore 3
.LVL5:
	popl	%edi
	.cfi_restore 7
.LVL6:
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	insl, .-insl
	.type	outb, @function
outb:
.LFB4:
	.loc 1 23 0
	.cfi_startproc
.LVL7:
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
	.loc 1 24 0
	movzbl	-8(%ebp), %eax
	movzwl	-4(%ebp), %edx
#APP
# 24 "x86.h" 1
	out %al,%dx
# 0 "" 2
	.loc 1 25 0
#NO_APP
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	outb, .-outb
	.type	outsl, @function
outsl:
.LFB6:
	.loc 1 35 0
	.cfi_startproc
.LVL8:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	pushl	%esi
	pushl	%ebx
	.cfi_offset 6, -12
	.cfi_offset 3, -16
	.loc 1 36 0
	movl	8(%ebp), %edx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	%ecx, %ebx
	movl	%ebx, %esi
	movl	%eax, %ecx
#APP
# 36 "x86.h" 1
	cld; rep outsl
# 0 "" 2
.LVL9:
#NO_APP
	movl	%ecx, %eax
	movl	%esi, %ebx
	movl	%ebx, 12(%ebp)
	movl	%eax, 16(%ebp)
.LVL10:
	.loc 1 40 0
	popl	%ebx
	.cfi_restore 3
.LVL11:
	popl	%esi
	.cfi_restore 6
.LVL12:
	popl	%ebp
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	outsl, .-outsl
	.local	idelock
	.comm	idelock,52,32
	.local	idequeue
	.comm	idequeue,4,4
	.local	havedisk1
	.comm	havedisk1,4,4
	.type	idewait, @function
idewait:
.LFB20:
	.file 2 "ide.c"
	.loc 2 37 0
	.cfi_startproc
.LVL13:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$20, %esp
	.loc 2 40 0
	nop
.L7:
	.loc 2 40 0 is_stmt 0 discriminator 1
	movl	$503, (%esp)
	call	inb
.LVL14:
	movzbl	%al, %eax
	movl	%eax, -4(%ebp)
.LVL15:
	movl	-4(%ebp), %eax
	andl	$192, %eax
.LVL16:
	cmpl	$64, %eax
	jne	.L7
	.loc 2 42 0 is_stmt 1
	cmpl	$0, 8(%ebp)
	je	.L8
	.loc 2 42 0 is_stmt 0 discriminator 1
	movl	-4(%ebp), %eax
	andl	$33, %eax
	testl	%eax, %eax
	je	.L8
	.loc 2 43 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L9
.L8:
	.loc 2 44 0
	movl	$0, %eax
.L9:
	.loc 2 45 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	idewait, .-idewait
	.section	.rodata
.LC0:
	.string	"ide"
	.text
	.globl	ideinit
	.type	ideinit, @function
ideinit:
.LFB21:
	.loc 2 49 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 52 0
	movl	$.LC0, 4(%esp)
	movl	$idelock, (%esp)
	call	initlock
.LVL17:
	.loc 2 53 0
	movl	$14, (%esp)
	call	picenable
.LVL18:
	.loc 2 54 0
	movl	ncpu, %eax
	subl	$1, %eax
	movl	%eax, 4(%esp)
	movl	$14, (%esp)
	call	ioapicenable
.LVL19:
	.loc 2 55 0
	movl	$0, (%esp)
	call	idewait
.LVL20:
	.loc 2 58 0
	movl	$240, 4(%esp)
	movl	$502, (%esp)
	call	outb
.LVL21:
	.loc 2 59 0
	movl	$0, -12(%ebp)
.LVL22:
	jmp	.L11
.L14:
	.loc 2 60 0
	movl	$503, (%esp)
	call	inb
.LVL23:
	testb	%al, %al
	je	.L12
	.loc 2 61 0
	movl	$1, havedisk1
	.loc 2 62 0
	jmp	.L13
.L12:
	.loc 2 59 0
	addl	$1, -12(%ebp)
.L11:
	.loc 2 59 0 is_stmt 0 discriminator 1
	cmpl	$999, -12(%ebp)
	jle	.L14
.L13:
	.loc 2 67 0 is_stmt 1
	movl	$224, 4(%esp)
	movl	$502, (%esp)
	call	outb
.LVL24:
	.loc 2 68 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL25:
	ret
	.cfi_endproc
.LFE21:
	.size	ideinit, .-ideinit
	.section	.rodata
.LC1:
	.string	"idestart"
.LC2:
	.string	"incorrect blockno"
	.text
	.type	idestart, @function
idestart:
.LFB22:
	.loc 2 73 0
	.cfi_startproc
.LVL26:
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 74 0
	cmpl	$0, 8(%ebp)
	jne	.L16
	.loc 2 75 0
	movl	$.LC1, (%esp)
	call	panic
.LVL27:
.L16:
	.loc 2 76 0
	movl	8(%ebp), %eax
	movl	8(%eax), %eax
	cmpl	$999, %eax
	jbe	.L17
	.loc 2 77 0
	movl	$.LC2, (%esp)
	call	panic
.LVL28:
.L17:
	.loc 2 78 0
	movl	$1, -12(%ebp)
.LVL29:
	.loc 2 79 0
	movl	8(%ebp), %eax
	movl	8(%eax), %edx
	movl	-12(%ebp), %eax
	imull	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL30:
	.loc 2 81 0
	cmpl	$7, -12(%ebp)
	jle	.L18
	.loc 2 81 0 is_stmt 0 discriminator 1
	movl	$.LC1, (%esp)
	call	panic
.LVL31:
.L18:
	.loc 2 83 0 is_stmt 1
	movl	$0, (%esp)
	call	idewait
.LVL32:
	.loc 2 84 0
	movl	$0, 4(%esp)
	movl	$1014, (%esp)
	call	outb
.LVL33:
	.loc 2 85 0
	movl	-12(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$498, (%esp)
	call	outb
.LVL34:
	.loc 2 86 0
	movl	-16(%ebp), %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$499, (%esp)
	call	outb
.LVL35:
	.loc 2 87 0
	movl	-16(%ebp), %eax
	sarl	$8, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$500, (%esp)
	call	outb
.LVL36:
	.loc 2 88 0
	movl	-16(%ebp), %eax
	sarl	$16, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$501, (%esp)
	call	outb
.LVL37:
	.loc 2 89 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	andl	$1, %eax
	sall	$4, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	sarl	$24, %eax
	andl	$15, %eax
	orl	%edx, %eax
	orl	$-32, %eax
	movzbl	%al, %eax
	movl	%eax, 4(%esp)
	movl	$502, (%esp)
	call	outb
.LVL38:
	.loc 2 90 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$4, %eax
	testl	%eax, %eax
	je	.L19
	.loc 2 91 0
	movl	$48, 4(%esp)
	movl	$503, (%esp)
	call	outb
.LVL39:
	.loc 2 92 0
	movl	8(%ebp), %eax
	addl	$24, %eax
	movl	$128, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$496, (%esp)
	call	outsl
.LVL40:
	jmp	.L15
.L19:
	.loc 2 94 0
	movl	$32, 4(%esp)
	movl	$503, (%esp)
	call	outb
.LVL41:
.L15:
	.loc 2 96 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	idestart, .-idestart
	.globl	ideintr
	.type	ideintr, @function
ideintr:
.LFB23:
	.loc 2 101 0
	.cfi_startproc
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 105 0
	movl	$idelock, (%esp)
	call	acquire
.LVL42:
	.loc 2 106 0
	movl	idequeue, %eax
	movl	%eax, -12(%ebp)
.LVL43:
	cmpl	$0, -12(%ebp)
	jne	.L22
	.loc 2 107 0
	movl	$idelock, (%esp)
	call	release
.LVL44:
	.loc 2 109 0
	jmp	.L21
.LVL45:
.L22:
	.loc 2 111 0
	movl	-12(%ebp), %eax
.LVL46:
	movl	20(%eax), %eax
	movl	%eax, idequeue
.LVL47:
	.loc 2 114 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$4, %eax
	testl	%eax, %eax
	jne	.L24
	.loc 2 114 0 is_stmt 0 discriminator 1
	movl	$1, (%esp)
	call	idewait
.LVL48:
	testl	%eax, %eax
	js	.L24
	.loc 2 115 0 is_stmt 1
	movl	-12(%ebp), %eax
	addl	$24, %eax
	movl	$128, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$496, (%esp)
	call	insl
.LVL49:
.L24:
	.loc 2 118 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	orl	$2, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 2 119 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$-5, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 2 120 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	wakeup
.LVL50:
	.loc 2 123 0
	movl	idequeue, %eax
	testl	%eax, %eax
	je	.L25
	.loc 2 124 0
	movl	idequeue, %eax
	movl	%eax, (%esp)
	call	idestart
.LVL51:
.L25:
	.loc 2 126 0
	movl	$idelock, (%esp)
	call	release
.LVL52:
.L21:
	.loc 2 127 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL53:
	ret
	.cfi_endproc
.LFE23:
	.size	ideintr, .-ideintr
	.section	.rodata
.LC3:
	.string	"iderw: buf not busy"
.LC4:
	.string	"iderw: nothing to do"
.LC5:
	.string	"iderw: ide disk 1 not present"
	.text
	.globl	iderw
	.type	iderw, @function
iderw:
.LFB24:
	.loc 2 135 0
	.cfi_startproc
.LVL54:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 138 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L27
	.loc 2 139 0
	movl	$.LC3, (%esp)
	call	panic
.LVL55:
.L27:
	.loc 2 140 0
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$6, %eax
	cmpl	$2, %eax
	jne	.L28
	.loc 2 141 0
	movl	$.LC4, (%esp)
	call	panic
.LVL56:
.L28:
	.loc 2 142 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	je	.L29
	.loc 2 142 0 is_stmt 0 discriminator 1
	movl	havedisk1, %eax
	testl	%eax, %eax
	jne	.L29
	.loc 2 143 0 is_stmt 1
	movl	$.LC5, (%esp)
	call	panic
.LVL57:
.L29:
	.loc 2 145 0
	movl	$idelock, (%esp)
	call	acquire
.LVL58:
	.loc 2 148 0
	movl	8(%ebp), %eax
	movl	$0, 20(%eax)
	.loc 2 149 0
	movl	$idequeue, -12(%ebp)
.LVL59:
	jmp	.L30
.L31:
	.loc 2 149 0 is_stmt 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	addl	$20, %eax
	movl	%eax, -12(%ebp)
.LVL60:
.L30:
	.loc 2 149 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	.L31
	.loc 2 151 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	.loc 2 154 0
	movl	idequeue, %eax
	cmpl	8(%ebp), %eax
	jne	.L32
	.loc 2 155 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	idestart
.LVL61:
	.loc 2 158 0
	jmp	.L33
.L32:
	jmp	.L33
.L34:
	.loc 2 159 0
	movl	$idelock, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	sleep
.LVL62:
.L33:
	.loc 2 158 0 discriminator 1
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	andl	$6, %eax
	cmpl	$2, %eax
	jne	.L34
	.loc 2 162 0
	movl	$idelock, (%esp)
	call	release
.LVL63:
	.loc 2 163 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	iderw, .-iderw
.Letext0:
	.file 3 "types.h"
	.file 4 "mmu.h"
	.file 5 "proc.h"
	.file 6 "spinlock.h"
	.file 7 "buf.h"
	.file 8 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xe6a
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF91
	.byte	0x1
	.long	.LASF92
	.long	.LASF93
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
	.long	.LASF14
	.byte	0x8
	.byte	0x4
	.byte	0x34
	.long	0x149
	.uleb128 0x5
	.long	.LASF7
	.byte	0x4
	.byte	0x35
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF8
	.byte	0x4
	.byte	0x36
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF9
	.byte	0x4
	.byte	0x37
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF10
	.byte	0x4
	.byte	0x38
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
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
	.uleb128 0x6
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
	.uleb128 0x6
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
	.uleb128 0x5
	.long	.LASF11
	.byte	0x4
	.byte	0x3c
	.long	0x25
	.byte	0x4
	.byte	0x4
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
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
	.uleb128 0x5
	.long	.LASF12
	.byte	0x4
	.byte	0x3e
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
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
	.uleb128 0x6
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
	.uleb128 0x5
	.long	.LASF13
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
	.long	.LASF15
	.byte	0x68
	.byte	0x4
	.byte	0x97
	.long	0x354
	.uleb128 0x7
	.long	.LASF16
	.byte	0x4
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF17
	.byte	0x4
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ss0"
	.byte	0x4
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF18
	.byte	0x4
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x7
	.long	.LASF19
	.byte	0x4
	.byte	0x9c
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ss1"
	.byte	0x4
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF20
	.byte	0x4
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x7
	.long	.LASF21
	.byte	0x4
	.byte	0x9f
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ss2"
	.byte	0x4
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF22
	.byte	0x4
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x8
	.string	"cr3"
	.byte	0x4
	.byte	0xa2
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"eip"
	.byte	0x4
	.byte	0xa3
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF23
	.byte	0x4
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x8
	.string	"eax"
	.byte	0x4
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"ecx"
	.byte	0x4
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x8
	.string	"edx"
	.byte	0x4
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"ebx"
	.byte	0x4
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"esp"
	.byte	0x4
	.byte	0xa9
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"ebp"
	.byte	0x4
	.byte	0xaa
	.long	0x354
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x8
	.string	"esi"
	.byte	0x4
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"edi"
	.byte	0x4
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"es"
	.byte	0x4
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF24
	.byte	0x4
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x8
	.string	"cs"
	.byte	0x4
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x4
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x8
	.string	"ss"
	.byte	0x4
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x7
	.long	.LASF26
	.byte	0x4
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x8
	.string	"ds"
	.byte	0x4
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x7
	.long	.LASF27
	.byte	0x4
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x8
	.string	"fs"
	.byte	0x4
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x7
	.long	.LASF28
	.byte	0x4
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x8
	.string	"gs"
	.byte	0x4
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x7
	.long	.LASF29
	.byte	0x4
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x8
	.string	"ldt"
	.byte	0x4
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x7
	.long	.LASF30
	.byte	0x4
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x8
	.string	"t"
	.byte	0x4
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x7
	.long	.LASF31
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
	.long	0x3ea
	.uleb128 0x8
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF32
	.byte	0x5
	.byte	0x7
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ts"
	.byte	0x5
	.byte	0x8
	.long	0x149
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"gdt"
	.byte	0x5
	.byte	0x9
	.long	0x443
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x7
	.long	.LASF33
	.byte	0x5
	.byte	0xa
	.long	0x45a
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x7
	.long	.LASF34
	.byte	0x5
	.byte	0xb
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x7
	.long	.LASF35
	.byte	0x5
	.byte	0xc
	.long	0x45f
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x466
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x7
	.long	.LASF36
	.byte	0x5
	.byte	0x10
	.long	0x52d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF37
	.byte	0x14
	.byte	0x5
	.byte	0x2c
	.long	0x43d
	.uleb128 0x8
	.string	"edi"
	.byte	0x5
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x5
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebx"
	.byte	0x5
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"ebp"
	.byte	0x5
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
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
	.long	0x3ea
	.uleb128 0xc
	.long	0x66
	.long	0x453
	.uleb128 0xd
	.long	0x453
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF38
	.uleb128 0xe
	.long	0x25
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x4
	.long	0x35c
	.uleb128 0x4
	.long	.LASF36
	.byte	0x7c
	.byte	0x5
	.byte	0x37
	.long	0x52d
	.uleb128 0x8
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF39
	.byte	0x5
	.byte	0x39
	.long	0x564
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF40
	.byte	0x5
	.byte	0x3a
	.long	0x56a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF41
	.byte	0x5
	.byte	0x3b
	.long	0x533
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF42
	.byte	0x5
	.byte	0x3d
	.long	0x52d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"tf"
	.byte	0x5
	.byte	0x3e
	.long	0x6dc
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF37
	.byte	0x5
	.byte	0x3f
	.long	0x43d
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.long	.LASF43
	.byte	0x5
	.byte	0x40
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF44
	.byte	0x5
	.byte	0x41
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF45
	.byte	0x5
	.byte	0x42
	.long	0x6e2
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"cwd"
	.byte	0x5
	.byte	0x43
	.long	0x704
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x7
	.long	.LASF46
	.byte	0x5
	.byte	0x44
	.long	0x70a
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x46c
	.uleb128 0x10
	.long	.LASF94
	.byte	0x4
	.byte	0x5
	.byte	0x34
	.long	0x564
	.uleb128 0x11
	.long	.LASF47
	.sleb128 0
	.uleb128 0x11
	.long	.LASF48
	.sleb128 1
	.uleb128 0x11
	.long	.LASF49
	.sleb128 2
	.uleb128 0x11
	.long	.LASF50
	.sleb128 3
	.uleb128 0x11
	.long	.LASF51
	.sleb128 4
	.uleb128 0x11
	.long	.LASF52
	.sleb128 5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5b
	.uleb128 0x9
	.byte	0x4
	.long	0x570
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF53
	.uleb128 0x4
	.long	.LASF54
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x6dc
	.uleb128 0x8
	.string	"edi"
	.byte	0x1
	.byte	0x9e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"esi"
	.byte	0x1
	.byte	0x9f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"ebp"
	.byte	0x1
	.byte	0xa0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF55
	.byte	0x1
	.byte	0xa1
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"ebx"
	.byte	0x1
	.byte	0xa2
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x8
	.string	"edx"
	.byte	0x1
	.byte	0xa3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"ecx"
	.byte	0x1
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x8
	.string	"eax"
	.byte	0x1
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x8
	.string	"gs"
	.byte	0x1
	.byte	0xa8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF18
	.byte	0x1
	.byte	0xa9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x22
	.uleb128 0x8
	.string	"fs"
	.byte	0x1
	.byte	0xaa
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF20
	.byte	0x1
	.byte	0xab
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x26
	.uleb128 0x8
	.string	"es"
	.byte	0x1
	.byte	0xac
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x7
	.long	.LASF22
	.byte	0x1
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2a
	.uleb128 0x8
	.string	"ds"
	.byte	0x1
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x7
	.long	.LASF24
	.byte	0x1
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x2e
	.uleb128 0x7
	.long	.LASF56
	.byte	0x1
	.byte	0xb0
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x8
	.string	"err"
	.byte	0x1
	.byte	0xb3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x8
	.string	"eip"
	.byte	0x1
	.byte	0xb4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x8
	.string	"cs"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x7
	.long	.LASF25
	.byte	0x1
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3e
	.uleb128 0x7
	.long	.LASF23
	.byte	0x1
	.byte	0xb7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x8
	.string	"esp"
	.byte	0x1
	.byte	0xba
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x8
	.string	"ss"
	.byte	0x1
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x7
	.long	.LASF26
	.byte	0x1
	.byte	0xbc
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x577
	.uleb128 0xc
	.long	0x6f2
	.long	0x6f2
	.uleb128 0xd
	.long	0x453
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
	.long	0x570
	.long	0x71a
	.uleb128 0xd
	.long	0x453
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF59
	.byte	0x34
	.byte	0x6
	.byte	0x2
	.long	0x75f
	.uleb128 0x7
	.long	.LASF60
	.byte	0x6
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF46
	.byte	0x6
	.byte	0x6
	.long	0x56a
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"cpu"
	.byte	0x6
	.byte	0x7
	.long	0x466
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
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
	.long	0x453
	.byte	0x9
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF61
	.uleb128 0x13
	.string	"buf"
	.value	0x218
	.byte	0x7
	.byte	0x1
	.long	0x7e6
	.uleb128 0x7
	.long	.LASF62
	.byte	0x7
	.byte	0x2
	.long	0x45f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x8
	.string	"dev"
	.byte	0x7
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF63
	.byte	0x7
	.byte	0x4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF64
	.byte	0x7
	.byte	0x5
	.long	0x7e6
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x7
	.long	.LASF65
	.byte	0x7
	.byte	0x6
	.long	0x7e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF66
	.byte	0x7
	.byte	0x7
	.long	0x7e6
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x7
	.long	.LASF67
	.byte	0x7
	.byte	0x8
	.long	0x7ec
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x776
	.uleb128 0xc
	.long	0x49
	.long	0x7fd
	.uleb128 0x14
	.long	0x453
	.value	0x1ff
	.byte	0
	.uleb128 0x15
	.string	"inb"
	.byte	0x1
	.byte	0x4
	.byte	0x1
	.long	0x49
	.long	.LFB2
	.long	.LFE2
	.long	.LLST0
	.byte	0x1
	.long	0x836
	.uleb128 0x16
	.long	.LASF68
	.byte	0x1
	.byte	0x4
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF67
	.byte	0x1
	.byte	0x6
	.long	0x49
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.long	.LASF70
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST1
	.byte	0x1
	.long	0x87c
	.uleb128 0x16
	.long	.LASF68
	.byte	0x1
	.byte	0xd
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.long	.LASF69
	.byte	0x1
	.byte	0xd
	.long	0x35a
	.long	.LLST2
	.uleb128 0x1a
	.string	"cnt"
	.byte	0x1
	.byte	0xd
	.long	0x45f
	.long	.LLST3
	.byte	0
	.uleb128 0x18
	.long	.LASF71
	.byte	0x1
	.byte	0x16
	.byte	0x1
	.long	.LFB4
	.long	.LFE4
	.long	.LLST4
	.byte	0x1
	.long	0x8b2
	.uleb128 0x16
	.long	.LASF68
	.byte	0x1
	.byte	0x16
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x16
	.long	.LASF67
	.byte	0x1
	.byte	0x16
	.long	0x49
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x18
	.long	.LASF72
	.byte	0x1
	.byte	0x22
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.long	.LLST5
	.byte	0x1
	.long	0x8f8
	.uleb128 0x16
	.long	.LASF68
	.byte	0x1
	.byte	0x22
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x19
	.long	.LASF69
	.byte	0x1
	.byte	0x22
	.long	0x8f8
	.long	.LLST6
	.uleb128 0x1a
	.string	"cnt"
	.byte	0x1
	.byte	0x22
	.long	0x45f
	.long	.LLST7
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x8fe
	.uleb128 0x1b
	.uleb128 0x1c
	.long	.LASF73
	.byte	0x2
	.byte	0x24
	.byte	0x1
	.long	0x45f
	.long	.LFB20
	.long	.LFE20
	.long	.LLST8
	.byte	0x1
	.long	0x94a
	.uleb128 0x16
	.long	.LASF74
	.byte	0x2
	.byte	0x24
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.string	"r"
	.byte	0x2
	.byte	0x26
	.long	0x45f
	.long	.LLST9
	.uleb128 0x1e
	.long	.LVL14
	.long	0x7fd
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f7
	.byte	0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF78
	.byte	0x2
	.byte	0x30
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST10
	.byte	0x1
	.long	0xa1c
	.uleb128 0x1d
	.string	"i"
	.byte	0x2
	.byte	0x32
	.long	0x45f
	.long	.LLST11
	.uleb128 0x21
	.long	.LVL17
	.long	0xdbc
	.long	0x993
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idelock
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0x21
	.long	.LVL18
	.long	0xddb
	.long	0x9a7
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x21
	.long	.LVL19
	.long	0xdef
	.long	0x9bb
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x3e
	.byte	0
	.uleb128 0x21
	.long	.LVL20
	.long	0x8ff
	.long	0x9cf
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x21
	.long	.LVL21
	.long	0x87c
	.long	0x9ec
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f6
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0xf0
	.byte	0
	.uleb128 0x21
	.long	.LVL23
	.long	0x7fd
	.long	0xa02
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f7
	.byte	0
	.uleb128 0x1e
	.long	.LVL24
	.long	0x87c
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f6
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0xe0
	.byte	0
	.byte	0
	.uleb128 0x18
	.long	.LASF75
	.byte	0x2
	.byte	0x48
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST12
	.byte	0x1
	.long	0xbd2
	.uleb128 0x22
	.string	"b"
	.byte	0x2
	.byte	0x48
	.long	0x7e6
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x17
	.long	.LASF76
	.byte	0x2
	.byte	0x4e
	.long	0x45f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x23
	.long	.LASF77
	.byte	0x2
	.byte	0x4f
	.long	0x45f
	.long	.LLST13
	.uleb128 0x21
	.long	.LVL27
	.long	0xe08
	.long	0xa76
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x21
	.long	.LVL28
	.long	0xe08
	.long	0xa8e
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x21
	.long	.LVL31
	.long	0xe08
	.long	0xaa6
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x21
	.long	.LVL32
	.long	0x8ff
	.long	0xaba
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x21
	.long	.LVL33
	.long	0x87c
	.long	0xad6
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x3f6
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x21
	.long	.LVL34
	.long	0x87c
	.long	0xaf8
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f2
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 -20
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.uleb128 0x21
	.long	.LVL35
	.long	0x87c
	.long	0xb1a
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f3
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 -24
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.uleb128 0x21
	.long	.LVL36
	.long	0x87c
	.long	0xb3c
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f4
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 -23
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.uleb128 0x21
	.long	.LVL37
	.long	0x87c
	.long	0xb5e
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f5
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 -22
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0
	.uleb128 0x21
	.long	.LVL38
	.long	0x87c
	.long	0xb74
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f6
	.byte	0
	.uleb128 0x21
	.long	.LVL39
	.long	0x87c
	.long	0xb91
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f7
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x30
	.byte	0
	.uleb128 0x21
	.long	.LVL40
	.long	0x8b2
	.long	0xbb8
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f0
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x1e
	.long	.LVL41
	.long	0x87c
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f7
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF79
	.byte	0x2
	.byte	0x64
	.byte	0x1
	.long	.LFB23
	.long	.LFE23
	.long	.LLST14
	.byte	0x1
	.long	0xc98
	.uleb128 0x1d
	.string	"b"
	.byte	0x2
	.byte	0x66
	.long	0x7e6
	.long	.LLST15
	.uleb128 0x21
	.long	.LVL42
	.long	0xe1c
	.long	0xc11
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idelock
	.byte	0
	.uleb128 0x21
	.long	.LVL44
	.long	0xe30
	.long	0xc29
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idelock
	.byte	0
	.uleb128 0x21
	.long	.LVL48
	.long	0x8ff
	.long	0xc3d
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x21
	.long	.LVL49
	.long	0x836
	.long	0xc64
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0xa
	.value	0x1f0
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x21
	.long	.LVL50
	.long	0xe44
	.long	0xc7a
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x24
	.long	.LVL51
	.long	0xa1c
	.uleb128 0x1e
	.long	.LVL52
	.long	0xe30
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idelock
	.byte	0
	.byte	0
	.uleb128 0x20
	.byte	0x1
	.long	.LASF80
	.byte	0x2
	.byte	0x86
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST16
	.byte	0x1
	.long	0xd76
	.uleb128 0x22
	.string	"b"
	.byte	0x2
	.byte	0x86
	.long	0x7e6
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x25
	.string	"pp"
	.byte	0x2
	.byte	0x88
	.long	0xd76
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x21
	.long	.LVL55
	.long	0xe08
	.long	0xce3
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x21
	.long	.LVL56
	.long	0xe08
	.long	0xcfb
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0x21
	.long	.LVL57
	.long	0xe08
	.long	0xd13
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC5
	.byte	0
	.uleb128 0x21
	.long	.LVL58
	.long	0xe1c
	.long	0xd2b
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idelock
	.byte	0
	.uleb128 0x21
	.long	.LVL61
	.long	0xa1c
	.long	0xd41
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x21
	.long	.LVL62
	.long	0xe58
	.long	0xd61
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	idelock
	.byte	0
	.uleb128 0x1e
	.long	.LVL63
	.long	0xe30
	.uleb128 0x1f
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idelock
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x7e6
	.uleb128 0x17
	.long	.LASF81
	.byte	0x2
	.byte	0x1c
	.long	0x71a
	.byte	0x5
	.byte	0x3
	.long	idelock
	.uleb128 0x17
	.long	.LASF82
	.byte	0x2
	.byte	0x1d
	.long	0x7e6
	.byte	0x5
	.byte	0x3
	.long	idequeue
	.uleb128 0x17
	.long	.LASF83
	.byte	0x2
	.byte	0x1f
	.long	0x45f
	.byte	0x5
	.byte	0x3
	.long	havedisk1
	.uleb128 0x26
	.long	.LASF95
	.byte	0x5
	.byte	0x14
	.long	0x45f
	.byte	0x1
	.byte	0x1
	.uleb128 0x27
	.byte	0x1
	.long	.LASF84
	.byte	0x8
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.long	0xdd5
	.uleb128 0x28
	.long	0xdd5
	.uleb128 0x28
	.long	0x56a
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x71a
	.uleb128 0x27
	.byte	0x1
	.long	.LASF85
	.byte	0x8
	.byte	0x60
	.byte	0x1
	.byte	0x1
	.long	0xdef
	.uleb128 0x28
	.long	0x45f
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF86
	.byte	0x8
	.byte	0x3d
	.byte	0x1
	.byte	0x1
	.long	0xe08
	.uleb128 0x28
	.long	0x45f
	.uleb128 0x28
	.long	0x45f
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF87
	.byte	0x8
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0xe1c
	.uleb128 0x28
	.long	0x56a
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF88
	.byte	0x8
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0xe30
	.uleb128 0x28
	.long	0xdd5
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF89
	.byte	0x8
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.long	0xe44
	.uleb128 0x28
	.long	0xdd5
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF90
	.byte	0x8
	.byte	0x77
	.byte	0x1
	.byte	0x1
	.long	0xe58
	.uleb128 0x28
	.long	0x35a
	.byte	0
	.uleb128 0x29
	.byte	0x1
	.long	.LASF96
	.byte	0x8
	.byte	0x74
	.byte	0x1
	.byte	0x1
	.uleb128 0x28
	.long	0x35a
	.uleb128 0x28
	.long	0xdd5
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
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x19
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
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
	.uleb128 0x22
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.long	.LFB2-.Ltext0
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
	.long	.LFE2-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB3-.Ltext0
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
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x1
	.byte	0x53
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x57
	.long	.LVL6-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
	.long	.LVL4-.Ltext0
	.long	.LFE3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST4:
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
.LLST5:
	.long	.LFB6-.Ltext0
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
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL10-.Ltext0
	.long	.LVL11-.Ltext0
	.value	0x1
	.byte	0x53
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.value	0x1
	.byte	0x56
	.long	.LVL12-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 8
	.long	.LVL10-.Ltext0
	.long	.LFE6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	0
	.long	0
.LLST8:
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
.LLST9:
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -12
	.long	0
	.long	0
.LLST10:
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
.LLST11:
	.long	.LVL22-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL25-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST12:
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
.LLST13:
	.long	.LVL30-.Ltext0
	.long	.LVL31-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL31-1-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL31-.Ltext0
	.long	.LVL32-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL32-1-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST14:
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
.LLST15:
	.long	.LVL43-.Ltext0
	.long	.LVL44-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL44-1-.Ltext0
	.long	.LVL45-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x5
	.byte	0x3
	.long	idequeue
	.long	.LVL47-.Ltext0
	.long	.LVL53-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL53-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST16:
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
.LASF48:
	.string	"EMBRYO"
.LASF58:
	.string	"inode"
.LASF50:
	.string	"RUNNABLE"
.LASF74:
	.string	"checkerr"
.LASF41:
	.string	"state"
.LASF82:
	.string	"idequeue"
.LASF61:
	.string	"short int"
.LASF8:
	.string	"base_15_0"
.LASF38:
	.string	"sizetype"
.LASF23:
	.string	"eflags"
.LASF54:
	.string	"trapframe"
.LASF12:
	.string	"rsv1"
.LASF87:
	.string	"panic"
.LASF14:
	.string	"segdesc"
.LASF67:
	.string	"data"
.LASF0:
	.string	"uint"
.LASF57:
	.string	"file"
.LASF91:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF85:
	.string	"picenable"
.LASF71:
	.string	"outb"
.LASF76:
	.string	"sector_per_block"
.LASF44:
	.string	"killed"
.LASF77:
	.string	"sector"
.LASF70:
	.string	"insl"
.LASF16:
	.string	"link"
.LASF62:
	.string	"flags"
.LASF9:
	.string	"base_23_16"
.LASF43:
	.string	"chan"
.LASF86:
	.string	"ioapicenable"
.LASF1:
	.string	"ushort"
.LASF20:
	.string	"padding2"
.LASF22:
	.string	"padding3"
.LASF24:
	.string	"padding4"
.LASF6:
	.string	"pde_t"
.LASF26:
	.string	"padding6"
.LASF29:
	.string	"padding9"
.LASF18:
	.string	"padding1"
.LASF83:
	.string	"havedisk1"
.LASF13:
	.string	"base_31_24"
.LASF4:
	.string	"uchar"
.LASF25:
	.string	"padding5"
.LASF95:
	.string	"ncpu"
.LASF42:
	.string	"parent"
.LASF28:
	.string	"padding8"
.LASF7:
	.string	"lim_15_0"
.LASF63:
	.string	"blockno"
.LASF49:
	.string	"SLEEPING"
.LASF45:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF27:
	.string	"padding7"
.LASF31:
	.string	"iomb"
.LASF36:
	.string	"proc"
.LASF66:
	.string	"qnext"
.LASF10:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF37:
	.string	"context"
.LASF96:
	.string	"sleep"
.LASF51:
	.string	"RUNNING"
.LASF33:
	.string	"started"
.LASF40:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF79:
	.string	"ideintr"
.LASF17:
	.string	"esp0"
.LASF19:
	.string	"esp1"
.LASF21:
	.string	"esp2"
.LASF53:
	.string	"char"
.LASF60:
	.string	"locked"
.LASF69:
	.string	"addr"
.LASF78:
	.string	"ideinit"
.LASF47:
	.string	"UNUSED"
.LASF81:
	.string	"idelock"
.LASF30:
	.string	"padding10"
.LASF90:
	.string	"wakeup"
.LASF68:
	.string	"port"
.LASF56:
	.string	"trapno"
.LASF92:
	.string	"ide.c"
.LASF89:
	.string	"release"
.LASF35:
	.string	"intena"
.LASF32:
	.string	"scheduler"
.LASF15:
	.string	"taskstate"
.LASF59:
	.string	"spinlock"
.LASF11:
	.string	"lim_19_16"
.LASF93:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF46:
	.string	"name"
.LASF55:
	.string	"oesp"
.LASF94:
	.string	"procstate"
.LASF88:
	.string	"acquire"
.LASF73:
	.string	"idewait"
.LASF39:
	.string	"pgdir"
.LASF84:
	.string	"initlock"
.LASF64:
	.string	"prev"
.LASF75:
	.string	"idestart"
.LASF34:
	.string	"ncli"
.LASF65:
	.string	"next"
.LASF52:
	.string	"ZOMBIE"
.LASF72:
	.string	"outsl"
.LASF80:
	.string	"iderw"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
