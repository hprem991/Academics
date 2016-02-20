	.file	"trap.c"
	.text
.Ltext0:
	.type	lidt, @function
lidt:
.LFB10:
	.file 1 "x86.h"
	.loc 1 78 0
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
	.loc 1 81 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -6(%ebp)
	.loc 1 82 0
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 83 0
	movl	8(%ebp), %eax
	shrl	$16, %eax
	movw	%ax, -2(%ebp)
	.loc 1 85 0
	leal	-6(%ebp), %eax
#APP
# 85 "x86.h" 1
	lidt (%eax)
# 0 "" 2
	.loc 1 86 0
#NO_APP
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	lidt, .-lidt
	.type	rcr2, @function
rcr2:
.LFB17:
	.loc 1 135 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 137 0
#APP
# 137 "x86.h" 1
	movl %cr2,%eax
# 0 "" 2
#NO_APP
	movl	%eax, -4(%ebp)
.LVL1:
	.loc 1 138 0
	movl	-4(%ebp), %eax
	.loc 1 139 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE17:
	.size	rcr2, .-rcr2
	.comm	idt,2048,32
	.comm	tickslock,52,32
	.comm	ticks,4,4
	.section	.rodata
.LC0:
	.string	"time"
	.text
	.globl	tvinit
	.type	tvinit, @function
tvinit:
.LFB20:
	.file 2 "trap.c"
	.loc 2 19 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 22 0
	movl	$0, -12(%ebp)
.LVL2:
	jmp	.L5
.L6:
	.loc 2 23 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	vectors(,%eax,4), %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movw	%dx, idt(,%eax,8)
	movl	-12(%ebp), %eax
	movw	$8, idt+2(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+4(,%eax,8), %edx
	andl	$-32, %edx
	movb	%dl, idt+4(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+4(,%eax,8), %edx
	andl	$31, %edx
	movb	%dl, idt+4(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	andl	$-16, %edx
	orl	$14, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	andl	$-17, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	andl	$-97, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movzbl	idt+5(,%eax,8), %edx
	orl	$-128, %edx
	movb	%dl, idt+5(,%eax,8)
	movl	-12(%ebp), %eax
	movl	vectors(,%eax,4), %eax
	shrl	$16, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movw	%dx, idt+6(,%eax,8)
	.loc 2 22 0 discriminator 2
	addl	$1, -12(%ebp)
.LVL3:
.L5:
	.loc 2 22 0 is_stmt 0 discriminator 1
	cmpl	$255, -12(%ebp)
	jle	.L6
	.loc 2 24 0 is_stmt 1
	movl	vectors+256, %eax
	movw	%ax, idt+512
	movw	$8, idt+514
	movzbl	idt+516, %eax
	andl	$-32, %eax
	movb	%al, idt+516
	movzbl	idt+516, %eax
	andl	$31, %eax
	movb	%al, idt+516
	movzbl	idt+517, %eax
	orl	$15, %eax
	movb	%al, idt+517
	movzbl	idt+517, %eax
	andl	$-17, %eax
	movb	%al, idt+517
	movzbl	idt+517, %eax
	orl	$96, %eax
	movb	%al, idt+517
	movzbl	idt+517, %eax
	orl	$-128, %eax
	movb	%al, idt+517
	movl	vectors+256, %eax
	shrl	$16, %eax
	movw	%ax, idt+518
	.loc 2 26 0
	movl	$.LC0, 4(%esp)
	movl	$tickslock, (%esp)
	call	initlock
.LVL4:
	.loc 2 27 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL5:
	ret
	.cfi_endproc
.LFE20:
	.size	tvinit, .-tvinit
	.globl	idtinit
	.type	idtinit, @function
idtinit:
.LFB21:
	.loc 2 31 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 2 32 0
	movl	$2048, 4(%esp)
	movl	$idt, (%esp)
	call	lidt
.LVL6:
	.loc 2 33 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	idtinit, .-idtinit
	.section	.rodata
	.align 4
.LC1:
	.string	"cpu%d: spurious interrupt at %x:%x\n"
	.align 4
.LC2:
	.string	"unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n"
.LC3:
	.string	"trap"
	.align 4
.LC4:
	.string	"pid %d %s: trap %d err %d on cpu %d eip 0x%x addr 0x%x--kill proc\n"
	.text
	.globl	trap
	.type	trap, @function
trap:
.LFB22:
	.loc 2 38 0
	.cfi_startproc
.LVL7:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 2 39 0
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$64, %eax
	jne	.L9
	.loc 2 40 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L10
	.loc 2 41 0
	call	exit
.LVL8:
.L10:
	.loc 2 42 0
	movl	%gs:4, %eax
	movl	8(%ebp), %edx
	movl	%edx, 24(%eax)
	.loc 2 43 0
	call	syscall
.LVL9:
	.loc 2 44 0
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L11
	.loc 2 45 0
	call	exit
.LVL10:
	.loc 2 46 0
	jmp	.L8
.L11:
	jmp	.L8
.L9:
	.loc 2 49 0
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	subl	$32, %eax
	cmpl	$31, %eax
	ja	.L13
	movl	.L15(,%eax,4), %eax
	jmp	*%eax
	.section	.rodata
	.align 4
	.align 4
.L15:
	.long	.L14
	.long	.L16
	.long	.L13
	.long	.L13
	.long	.L17
	.long	.L13
	.long	.L13
	.long	.L18
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L19
	.long	.L27
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L13
	.long	.L18
	.text
.L14:
	.loc 2 51 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	testb	%al, %al
	jne	.L21
	.loc 2 52 0
	movl	$tickslock, (%esp)
	call	acquire
.LVL11:
	.loc 2 53 0
	movl	ticks, %eax
	addl	$1, %eax
	movl	%eax, ticks
	.loc 2 54 0
	movl	$ticks, (%esp)
	call	wakeup
.LVL12:
	.loc 2 55 0
	movl	$tickslock, (%esp)
	call	release
.LVL13:
.L21:
	.loc 2 57 0
	call	lapiceoi
.LVL14:
	.loc 2 58 0
	jmp	.L22
.L19:
	.loc 2 60 0
	call	ideintr
.LVL15:
	.loc 2 61 0
	call	lapiceoi
.LVL16:
	.loc 2 62 0
	jmp	.L22
.L16:
	.loc 2 67 0
	call	kbdintr
.LVL17:
	.loc 2 68 0
	call	lapiceoi
.LVL18:
	.loc 2 69 0
	jmp	.L22
.L17:
	.loc 2 71 0
	call	uartintr
.LVL19:
	.loc 2 72 0
	call	lapiceoi
.LVL20:
	.loc 2 73 0
	jmp	.L22
.L18:
	.loc 2 76 0
	movl	8(%ebp), %eax
	movl	56(%eax), %ecx
	.loc 2 77 0
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	.loc 2 76 0
	movzwl	%ax, %edx
	.loc 2 77 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	.loc 2 76 0
	movzbl	%al, %eax
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC1, (%esp)
	call	cprintf
.LVL21:
	.loc 2 78 0
	call	lapiceoi
.LVL22:
	.loc 2 79 0
	jmp	.L22
.L13:
	.loc 2 83 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L23
	.loc 2 83 0 is_stmt 0 discriminator 1
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	movzwl	%ax, %eax
	andl	$3, %eax
	testl	%eax, %eax
	jne	.L24
.L23:
	.loc 2 85 0 is_stmt 1
	call	rcr2
.LVL23:
	movl	8(%ebp), %edx
	movl	56(%edx), %ebx
	.loc 2 86 0
	movl	%gs:0, %edx
	movzbl	(%edx), %edx
	.loc 2 85 0
	movzbl	%dl, %ecx
	movl	8(%ebp), %edx
	movl	48(%edx), %edx
	movl	%eax, 16(%esp)
	movl	%ebx, 12(%esp)
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	$.LC2, (%esp)
	call	cprintf
.LVL24:
	.loc 2 87 0
	movl	$.LC3, (%esp)
	call	panic
.LVL25:
.L24:
	.loc 2 90 0
	call	rcr2
.LVL26:
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	56(%eax), %edi
	.loc 2 92 0
	movl	%gs:0, %eax
	movzbl	(%eax), %eax
	.loc 2 90 0
	movzbl	%al, %esi
	movl	8(%ebp), %eax
	movl	52(%eax), %ebx
	movl	8(%ebp), %eax
	movl	48(%eax), %ecx
	.loc 2 92 0
	movl	%gs:4, %eax
	addl	$108, %eax
	movl	%eax, -28(%ebp)
	movl	%gs:4, %eax
	.loc 2 90 0
	movl	16(%eax), %eax
	movl	%edx, 28(%esp)
	movl	%edi, 24(%esp)
	movl	%esi, 20(%esp)
	movl	%ebx, 16(%esp)
	movl	%ecx, 12(%esp)
	movl	-28(%ebp), %esi
	movl	%esi, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC4, (%esp)
	call	cprintf
.LVL27:
	.loc 2 94 0
	movl	%gs:4, %eax
	movl	$1, 36(%eax)
	jmp	.L22
.L27:
	.loc 2 65 0
	nop
.L22:
	.loc 2 100 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L25
	.loc 2 100 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L25
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	movzwl	%ax, %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	.L25
	.loc 2 101 0 is_stmt 1
	call	exit
.LVL28:
.L25:
	.loc 2 105 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L26
	.loc 2 105 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	12(%eax), %eax
	cmpl	$4, %eax
	jne	.L26
	movl	8(%ebp), %eax
	movl	48(%eax), %eax
	cmpl	$32, %eax
	jne	.L26
	.loc 2 106 0 is_stmt 1
	call	yield
.LVL29:
.L26:
	.loc 2 109 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	je	.L8
	.loc 2 109 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L8
	movl	8(%ebp), %eax
	movzwl	60(%eax), %eax
	movzwl	%ax, %eax
	andl	$3, %eax
	cmpl	$3, %eax
	jne	.L8
	.loc 2 110 0 is_stmt 1
	call	exit
.LVL30:
.L8:
	.loc 2 111 0
	addl	$60, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	trap, .-trap
.Letext0:
	.file 3 "types.h"
	.file 4 "mmu.h"
	.file 5 "proc.h"
	.file 6 "spinlock.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xbd7
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF85
	.byte	0x1
	.long	.LASF86
	.long	.LASF87
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
	.uleb128 0x4
	.long	.LASF32
	.byte	0x8
	.byte	0x4
	.byte	0xc1
	.long	0x3fd
	.uleb128 0x5
	.long	.LASF33
	.byte	0x4
	.byte	0xc2
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"cs"
	.byte	0x4
	.byte	0xc3
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF34
	.byte	0x4
	.byte	0xc4
	.long	0x25
	.byte	0x4
	.byte	0x5
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF12
	.byte	0x4
	.byte	0xc5
	.long	0x25
	.byte	0x4
	.byte	0x3
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF10
	.byte	0x4
	.byte	0xc6
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
	.byte	0xc7
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
	.byte	0xc8
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
	.byte	0xc9
	.long	0x25
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF35
	.byte	0x4
	.byte	0xca
	.long	0x25
	.byte	0x4
	.byte	0x10
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0xb
	.string	"cpu"
	.byte	0xbc
	.byte	0x5
	.byte	0x5
	.long	0x48b
	.uleb128 0x8
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF36
	.byte	0x5
	.byte	0x7
	.long	0x4de
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
	.long	0x4e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x7
	.long	.LASF37
	.byte	0x5
	.byte	0xa
	.long	0x4fb
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x7
	.long	.LASF38
	.byte	0x5
	.byte	0xb
	.long	0x500
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x7
	.long	.LASF39
	.byte	0x5
	.byte	0xc
	.long	0x500
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x507
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x7
	.long	.LASF40
	.byte	0x5
	.byte	0x10
	.long	0x5ce
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF41
	.byte	0x14
	.byte	0x5
	.byte	0x2c
	.long	0x4de
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
	.long	0x48b
	.uleb128 0xc
	.long	0x66
	.long	0x4f4
	.uleb128 0xd
	.long	0x4f4
	.byte	0x6
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF42
	.uleb128 0xe
	.long	0x25
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x9
	.byte	0x4
	.long	0x3fd
	.uleb128 0x4
	.long	.LASF40
	.byte	0x7c
	.byte	0x5
	.byte	0x37
	.long	0x5ce
	.uleb128 0x8
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF43
	.byte	0x5
	.byte	0x39
	.long	0x605
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF44
	.byte	0x5
	.byte	0x3a
	.long	0x60b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF45
	.byte	0x5
	.byte	0x3b
	.long	0x5d4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0x500
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF46
	.byte	0x5
	.byte	0x3d
	.long	0x5ce
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x8
	.string	"tf"
	.byte	0x5
	.byte	0x3e
	.long	0x77d
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x7
	.long	.LASF41
	.byte	0x5
	.byte	0x3f
	.long	0x4de
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.long	.LASF47
	.byte	0x5
	.byte	0x40
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF48
	.byte	0x5
	.byte	0x41
	.long	0x500
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF49
	.byte	0x5
	.byte	0x42
	.long	0x783
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x8
	.string	"cwd"
	.byte	0x5
	.byte	0x43
	.long	0x7a5
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x7
	.long	.LASF50
	.byte	0x5
	.byte	0x44
	.long	0x7ab
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x50d
	.uleb128 0x10
	.long	.LASF88
	.byte	0x4
	.byte	0x5
	.byte	0x34
	.long	0x605
	.uleb128 0x11
	.long	.LASF51
	.sleb128 0
	.uleb128 0x11
	.long	.LASF52
	.sleb128 1
	.uleb128 0x11
	.long	.LASF53
	.sleb128 2
	.uleb128 0x11
	.long	.LASF54
	.sleb128 3
	.uleb128 0x11
	.long	.LASF55
	.sleb128 4
	.uleb128 0x11
	.long	.LASF56
	.sleb128 5
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5b
	.uleb128 0x9
	.byte	0x4
	.long	0x611
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF57
	.uleb128 0x4
	.long	.LASF58
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x77d
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
	.long	.LASF59
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
	.long	.LASF60
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
	.long	0x618
	.uleb128 0xc
	.long	0x793
	.long	0x793
	.uleb128 0xd
	.long	0x4f4
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x799
	.uleb128 0x12
	.long	.LASF61
	.byte	0x1
	.uleb128 0x12
	.long	.LASF62
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x79f
	.uleb128 0xc
	.long	0x611
	.long	0x7bb
	.uleb128 0xd
	.long	0x4f4
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF63
	.byte	0x34
	.byte	0x6
	.byte	0x2
	.long	0x800
	.uleb128 0x7
	.long	.LASF64
	.byte	0x6
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF50
	.byte	0x6
	.byte	0x6
	.long	0x60b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"cpu"
	.byte	0x6
	.byte	0x7
	.long	0x507
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x8
	.string	"pcs"
	.byte	0x6
	.byte	0x8
	.long	0x800
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0xc
	.long	0x25
	.long	0x810
	.uleb128 0xd
	.long	0x4f4
	.byte	0x9
	.byte	0
	.uleb128 0x13
	.long	.LASF89
	.byte	0x1
	.byte	0x4d
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST0
	.byte	0x1
	.long	0x851
	.uleb128 0x14
	.string	"p"
	.byte	0x1
	.byte	0x4d
	.long	0x851
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF65
	.byte	0x1
	.byte	0x4d
	.long	0x500
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.string	"pd"
	.byte	0x1
	.byte	0x4f
	.long	0x867
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x35c
	.uleb128 0xc
	.long	0x37
	.long	0x867
	.uleb128 0xd
	.long	0x4f4
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.long	0x857
	.uleb128 0x17
	.long	.LASF90
	.byte	0x1
	.byte	0x86
	.byte	0x1
	.long	0x25
	.long	.LFB17
	.long	.LFE17
	.long	.LLST1
	.byte	0x1
	.long	0x897
	.uleb128 0x16
	.string	"val"
	.byte	0x1
	.byte	0x88
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF66
	.byte	0x2
	.byte	0x12
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST2
	.byte	0x1
	.long	0x8dd
	.uleb128 0x19
	.string	"i"
	.byte	0x2
	.byte	0x14
	.long	0x500
	.long	.LLST3
	.uleb128 0x1a
	.long	.LVL4
	.long	0xb10
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	tickslock
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF67
	.byte	0x2
	.byte	0x1e
	.byte	0x1
	.long	.LFB21
	.long	.LFE21
	.long	.LLST4
	.byte	0x1
	.long	0x914
	.uleb128 0x1a
	.long	.LVL6
	.long	0x810
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	idt
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0xa
	.value	0x800
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF68
	.byte	0x2
	.byte	0x25
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST5
	.byte	0x1
	.long	0xa90
	.uleb128 0x14
	.string	"tf"
	.byte	0x2
	.byte	0x25
	.long	0x77d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1c
	.long	.LVL8
	.long	0xb2f
	.uleb128 0x1c
	.long	.LVL9
	.long	0xb39
	.uleb128 0x1c
	.long	.LVL10
	.long	0xb2f
	.uleb128 0x1d
	.long	.LVL11
	.long	0xb43
	.long	0x96e
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	tickslock
	.byte	0
	.uleb128 0x1d
	.long	.LVL12
	.long	0xb57
	.long	0x986
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ticks
	.byte	0
	.uleb128 0x1d
	.long	.LVL13
	.long	0xb6b
	.long	0x99e
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	tickslock
	.byte	0
	.uleb128 0x1c
	.long	.LVL14
	.long	0xb7f
	.uleb128 0x1c
	.long	.LVL15
	.long	0xb89
	.uleb128 0x1c
	.long	.LVL16
	.long	0xb7f
	.uleb128 0x1c
	.long	.LVL17
	.long	0xb93
	.uleb128 0x1c
	.long	.LVL18
	.long	0xb7f
	.uleb128 0x1c
	.long	.LVL19
	.long	0xb9d
	.uleb128 0x1c
	.long	.LVL20
	.long	0xb7f
	.uleb128 0x1d
	.long	.LVL21
	.long	0xba7
	.long	0x9f5
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x1c
	.long	.LVL22
	.long	0xb7f
	.uleb128 0x1c
	.long	.LVL23
	.long	0x86c
	.uleb128 0x1d
	.long	.LVL24
	.long	0xba7
	.long	0xa26
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1d
	.long	.LVL25
	.long	0xbbc
	.long	0xa3e
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x1c
	.long	.LVL26
	.long	0x86c
	.uleb128 0x1d
	.long	.LVL27
	.long	0xba7
	.long	0xa74
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x76
	.sleb128 0
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1b
	.byte	0x2
	.byte	0x74
	.sleb128 24
	.byte	0x2
	.byte	0x77
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.long	.LVL28
	.long	0xb2f
	.uleb128 0x1c
	.long	.LVL29
	.long	0xbd0
	.uleb128 0x1c
	.long	.LVL30
	.long	0xb2f
	.byte	0
	.uleb128 0x1e
	.long	.LASF69
	.byte	0x2
	.byte	0xf
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ticks
	.uleb128 0x1e
	.long	.LASF70
	.byte	0x2
	.byte	0xe
	.long	0x7bb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	tickslock
	.uleb128 0x1f
	.string	"cpu"
	.byte	0x5
	.byte	0x1e
	.long	.LASF91
	.long	0x507
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.long	.LASF40
	.byte	0x5
	.byte	0x1f
	.long	.LASF92
	.long	0x5ce
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x35c
	.long	0xae6
	.uleb128 0xd
	.long	0x4f4
	.byte	0xff
	.byte	0
	.uleb128 0x21
	.string	"idt"
	.byte	0x2
	.byte	0xc
	.long	0xad6
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	idt
	.uleb128 0xc
	.long	0x25
	.long	0xb03
	.uleb128 0x22
	.byte	0
	.uleb128 0x23
	.long	.LASF71
	.byte	0x2
	.byte	0xd
	.long	0xaf8
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.byte	0x1
	.long	.LASF74
	.byte	0x7
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.long	0xb29
	.uleb128 0x25
	.long	0xb29
	.uleb128 0x25
	.long	0x60b
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x7bb
	.uleb128 0x26
	.byte	0x1
	.long	.LASF72
	.byte	0x7
	.byte	0x6c
	.byte	0x1
	.byte	0x1
	.uleb128 0x26
	.byte	0x1
	.long	.LASF73
	.byte	0x7
	.byte	0x95
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.byte	0x1
	.long	.LASF75
	.byte	0x7
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0xb57
	.uleb128 0x25
	.long	0xb29
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF76
	.byte	0x7
	.byte	0x77
	.byte	0x1
	.byte	0x1
	.long	0xb6b
	.uleb128 0x25
	.long	0x35a
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF77
	.byte	0x7
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.long	0xb7f
	.uleb128 0x25
	.long	0xb29
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF78
	.byte	0x7
	.byte	0x4e
	.byte	0x1
	.byte	0x1
	.uleb128 0x26
	.byte	0x1
	.long	.LASF79
	.byte	0x7
	.byte	0x39
	.byte	0x1
	.byte	0x1
	.uleb128 0x26
	.byte	0x1
	.long	.LASF80
	.byte	0x7
	.byte	0x48
	.byte	0x1
	.byte	0x1
	.uleb128 0x26
	.byte	0x1
	.long	.LASF81
	.byte	0x7
	.byte	0xa2
	.byte	0x1
	.byte	0x1
	.uleb128 0x24
	.byte	0x1
	.long	.LASF82
	.byte	0x7
	.byte	0x14
	.byte	0x1
	.byte	0x1
	.long	0xbbc
	.uleb128 0x25
	.long	0x60b
	.uleb128 0x27
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF83
	.byte	0x7
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0xbd0
	.uleb128 0x25
	.long	0x60b
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF84
	.byte	0x7
	.byte	0x78
	.byte	0x1
	.byte	0x1
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x20
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
	.uleb128 0x21
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x21
	.byte	0
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
	.uleb128 0x27
	.uleb128 0x18
	.byte	0
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
	.long	.LFB17-.Ltext0
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
	.long	.LFE17-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LVL2-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL5-.Ltext0
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST4:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
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
.LASF69:
	.string	"ticks"
.LASF52:
	.string	"EMBRYO"
.LASF62:
	.string	"inode"
.LASF54:
	.string	"RUNNABLE"
.LASF45:
	.string	"state"
.LASF91:
	.string	"%gs:0"
.LASF77:
	.string	"release"
.LASF92:
	.string	"%gs:4"
.LASF66:
	.string	"tvinit"
.LASF8:
	.string	"base_15_0"
.LASF42:
	.string	"sizetype"
.LASF23:
	.string	"eflags"
.LASF58:
	.string	"trapframe"
.LASF12:
	.string	"rsv1"
.LASF83:
	.string	"panic"
.LASF14:
	.string	"segdesc"
.LASF74:
	.string	"initlock"
.LASF71:
	.string	"vectors"
.LASF0:
	.string	"uint"
.LASF61:
	.string	"file"
.LASF85:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF76:
	.string	"wakeup"
.LASF75:
	.string	"acquire"
.LASF48:
	.string	"killed"
.LASF82:
	.string	"cprintf"
.LASF16:
	.string	"link"
.LASF9:
	.string	"base_23_16"
.LASF47:
	.string	"chan"
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
.LASF33:
	.string	"off_15_0"
.LASF13:
	.string	"base_31_24"
.LASF4:
	.string	"uchar"
.LASF25:
	.string	"padding5"
.LASF46:
	.string	"parent"
.LASF28:
	.string	"padding8"
.LASF7:
	.string	"lim_15_0"
.LASF53:
	.string	"SLEEPING"
.LASF78:
	.string	"lapiceoi"
.LASF49:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF27:
	.string	"padding7"
.LASF68:
	.string	"trap"
.LASF31:
	.string	"iomb"
.LASF40:
	.string	"proc"
.LASF65:
	.string	"size"
.LASF10:
	.string	"type"
.LASF2:
	.string	"unsigned int"
.LASF34:
	.string	"args"
.LASF41:
	.string	"context"
.LASF55:
	.string	"RUNNING"
.LASF73:
	.string	"syscall"
.LASF37:
	.string	"started"
.LASF44:
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
.LASF57:
	.string	"char"
.LASF64:
	.string	"locked"
.LASF32:
	.string	"gatedesc"
.LASF89:
	.string	"lidt"
.LASF70:
	.string	"tickslock"
.LASF51:
	.string	"UNUSED"
.LASF30:
	.string	"padding10"
.LASF84:
	.string	"yield"
.LASF35:
	.string	"off_31_16"
.LASF60:
	.string	"trapno"
.LASF39:
	.string	"intena"
.LASF36:
	.string	"scheduler"
.LASF15:
	.string	"taskstate"
.LASF81:
	.string	"uartintr"
.LASF63:
	.string	"spinlock"
.LASF11:
	.string	"lim_19_16"
.LASF72:
	.string	"exit"
.LASF86:
	.string	"trap.c"
.LASF80:
	.string	"kbdintr"
.LASF50:
	.string	"name"
.LASF59:
	.string	"oesp"
.LASF88:
	.string	"procstate"
.LASF90:
	.string	"rcr2"
.LASF43:
	.string	"pgdir"
.LASF87:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF67:
	.string	"idtinit"
.LASF38:
	.string	"ncli"
.LASF56:
	.string	"ZOMBIE"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
