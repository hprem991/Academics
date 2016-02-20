	.file	"vm.c"
	.text
.Ltext0:
	.type	lgdt, @function
lgdt:
.LFB7:
	.file 1 "x86.h"
	.loc 1 64 0
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
	.loc 1 67 0
	movl	12(%ebp), %eax
	subl	$1, %eax
	movw	%ax, -6(%ebp)
	.loc 1 68 0
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 69 0
	movl	8(%ebp), %eax
	shrl	$16, %eax
	movw	%ax, -2(%ebp)
	.loc 1 71 0
	leal	-6(%ebp), %eax
#APP
# 71 "x86.h" 1
	lgdt (%eax)
# 0 "" 2
	.loc 1 72 0
#NO_APP
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	lgdt, .-lgdt
	.type	ltr, @function
ltr:
.LFB9:
	.loc 1 90 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 91 0
	movzwl	-4(%ebp), %eax
#APP
# 91 "x86.h" 1
	ltr %ax
# 0 "" 2
	.loc 1 92 0
#NO_APP
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	ltr, .-ltr
	.type	loadgs, @function
loadgs:
.LFB11:
	.loc 1 104 0
	.cfi_startproc
.LVL2:
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$4, %esp
	movl	8(%ebp), %eax
	movw	%ax, -4(%ebp)
	.loc 1 105 0
	movzwl	-4(%ebp), %eax
#APP
# 105 "x86.h" 1
	movw %ax, %gs
# 0 "" 2
	.loc 1 106 0
#NO_APP
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	loadgs, .-loadgs
	.type	lcr3, @function
lcr3:
.LFB16:
	.loc 1 143 0
	.cfi_startproc
.LVL3:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	.loc 1 144 0
	movl	8(%ebp), %eax
#APP
# 144 "x86.h" 1
	movl %eax,%cr3
# 0 "" 2
	.loc 1 145 0
#NO_APP
	popl	%ebp
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	lcr3, .-lcr3
	.type	v2p, @function
v2p:
.LFB18:
	.file 2 "memlayout.h"
	.loc 2 13 0
	.cfi_startproc
.LVL4:
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	.loc 2 13 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE18:
	.size	v2p, .-v2p
	.type	p2v, @function
p2v:
.LFB19:
	.loc 2 14 0
	.cfi_startproc
.LVL5:
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	.loc 2 14 0
	movl	8(%ebp), %eax
	addl	$-2147483648, %eax
	popl	%ebp
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	p2v, .-p2v
	.comm	kpgdir,4,4
	.comm	gdt,56,32
	.globl	seginit
	.type	seginit, @function
seginit:
.LFB20:
	.file 3 "vm.c"
	.loc 3 18 0
	.cfi_startproc
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
	.loc 3 25 0
	call	cpunum
.LVL6:
	imull	$188, %eax, %eax
	addl	$cpus, %eax
	movl	%eax, -12(%ebp)
.LVL7:
	.loc 3 26 0
	movl	-12(%ebp), %eax
	movw	$-1, 120(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 122(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 124(%eax)
	movl	-12(%ebp), %eax
	movzbl	125(%eax), %edx
	andl	$-16, %edx
	orl	$10, %edx
	movb	%dl, 125(%eax)
	movl	-12(%ebp), %eax
.LVL8:
	movzbl	125(%eax), %edx
	orl	$16, %edx
	movb	%dl, 125(%eax)
.LVL9:
	movl	-12(%ebp), %eax
	movzbl	125(%eax), %edx
	andl	$-97, %edx
	movb	%dl, 125(%eax)
	movl	-12(%ebp), %eax
	movzbl	125(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 125(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	orl	$15, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	orl	$64, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movzbl	126(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 126(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 127(%eax)
	.loc 3 27 0
	movl	-12(%ebp), %eax
	movw	$-1, 128(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 130(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 132(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	orl	$16, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	andl	$-97, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	133(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 133(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	orl	$15, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	orl	$64, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movzbl	134(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 134(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 135(%eax)
	.loc 3 28 0
	movl	-12(%ebp), %eax
	movw	$-1, 144(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 146(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 148(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	andl	$-16, %edx
	orl	$10, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	orl	$16, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	orl	$96, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	149(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 149(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	orl	$15, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	orl	$64, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movzbl	150(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 150(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 151(%eax)
	.loc 3 29 0
	movl	-12(%ebp), %eax
	movw	$-1, 152(%eax)
	movl	-12(%ebp), %eax
	movw	$0, 154(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 156(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	andl	$-16, %edx
	orl	$2, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	orl	$16, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	orl	$96, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	157(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 157(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	orl	$15, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	andl	$-33, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	orl	$64, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movzbl	158(%eax), %edx
	orl	$-128, %edx
	movb	%dl, 158(%eax)
	movl	-12(%ebp), %eax
	movb	$0, 159(%eax)
	.loc 3 32 0
	movl	-12(%ebp), %eax
	addl	$180, %eax
	movl	%eax, %ebx
	movl	-12(%ebp), %eax
	addl	$180, %eax
	shrl	$16, %eax
	movl	%eax, %ecx
	movl	-12(%ebp), %eax
	addl	$180, %eax
	shrl	$24, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movw	$0, 136(%eax)
	movl	-12(%ebp), %eax
	movw	%bx, 138(%eax)
	movl	-12(%ebp), %eax
	movb	%cl, 140(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %ecx
	andl	$-16, %ecx
	orl	$2, %ecx
	movb	%cl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %ecx
	orl	$16, %ecx
	movb	%cl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %ecx
	andl	$-97, %ecx
	movb	%cl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	141(%eax), %ecx
	orl	$-128, %ecx
	movb	%cl, 141(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %ecx
	andl	$-16, %ecx
	movb	%cl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %ecx
	andl	$-17, %ecx
	movb	%cl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %ecx
	andl	$-33, %ecx
	movb	%cl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %ecx
	orl	$64, %ecx
	movb	%cl, 142(%eax)
	movl	-12(%ebp), %eax
	movzbl	142(%eax), %ecx
	orl	$-128, %ecx
	movb	%cl, 142(%eax)
	movl	-12(%ebp), %eax
	movb	%dl, 143(%eax)
	.loc 3 34 0
	movl	-12(%ebp), %eax
	addl	$112, %eax
	movl	$56, 4(%esp)
	movl	%eax, (%esp)
	call	lgdt
.LVL10:
	.loc 3 35 0
	movl	$24, (%esp)
	call	loadgs
.LVL11:
	.loc 3 38 0
	movl	-12(%ebp), %eax
	movl	%eax, %gs:0
	.loc 3 39 0
	movl	$0, %gs:4
	.loc 3 40 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	seginit, .-seginit
	.type	walkpgdir, @function
walkpgdir:
.LFB21:
	.loc 3 47 0
	.cfi_startproc
.LVL12:
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 51 0
	movl	12(%ebp), %eax
	shrl	$22, %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL13:
	.loc 3 52 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
.LVL14:
	andl	$1, %eax
	testl	%eax, %eax
	je	.L11
	.loc 3 53 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, (%esp)
	call	p2v
.LVL15:
	movl	%eax, -12(%ebp)
.LVL16:
	jmp	.L12
.LVL17:
.L11:
	.loc 3 55 0
	cmpl	$0, 16(%ebp)
	je	.L13
	.loc 3 55 0 is_stmt 0 discriminator 1
	call	kalloc
.LVL18:
	movl	%eax, -12(%ebp)
.LVL19:
	cmpl	$0, -12(%ebp)
	jne	.L14
.LVL20:
.L13:
	.loc 3 56 0 is_stmt 1
	movl	$0, %eax
	jmp	.L15
.LVL21:
.L14:
	.loc 3 58 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
	movl	-12(%ebp), %eax
.LVL22:
	movl	%eax, (%esp)
	call	memset
.LVL23:
	.loc 3 62 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	v2p
.LVL24:
	orl	$7, %eax
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
.L12:
	.loc 3 64 0
	movl	12(%ebp), %eax
	shrl	$12, %eax
	andl	$1023, %eax
	leal	0(,%eax,4), %edx
	movl	-12(%ebp), %eax
	addl	%edx, %eax
.LVL25:
.L15:
	.loc 3 65 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE21:
	.size	walkpgdir, .-walkpgdir
	.section	.rodata
.LC0:
	.string	"remap"
	.text
	.type	mappages, @function
mappages:
.LFB22:
	.loc 3 72 0
	.cfi_startproc
.LVL26:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 76 0
	movl	12(%ebp), %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL27:
	.loc 3 77 0
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
.LVL28:
	addl	%edx, %eax
	subl	$1, %eax
	andl	$-4096, %eax
	movl	%eax, -16(%ebp)
.LVL29:
.L22:
	.loc 3 79 0
	movl	$1, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	walkpgdir
.LVL30:
	movl	%eax, -20(%ebp)
.LVL31:
	cmpl	$0, -20(%ebp)
	jne	.L17
	.loc 3 80 0
	movl	$-1, %eax
.LVL32:
	jmp	.L18
.LVL33:
.L17:
	.loc 3 81 0
	movl	-20(%ebp), %eax
.LVL34:
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L19
	.loc 3 82 0
	movl	$.LC0, (%esp)
	call	panic
.LVL35:
.L19:
	.loc 3 83 0
	movl	24(%ebp), %eax
	orl	20(%ebp), %eax
	orl	$1, %eax
	movl	%eax, %edx
	movl	-20(%ebp), %eax
	movl	%edx, (%eax)
	.loc 3 84 0
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jne	.L20
	.loc 3 85 0
	nop
	.loc 3 89 0
	movl	$0, %eax
	jmp	.L18
.L20:
	.loc 3 86 0
	addl	$4096, -12(%ebp)
	.loc 3 87 0
	addl	$4096, 20(%ebp)
	.loc 3 88 0
	jmp	.L22
.L18:
	.loc 3 90 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE22:
	.size	mappages, .-mappages
	.data
	.align 32
	.type	kmap, @object
	.size	kmap, 64
kmap:
	.long	-2147483648
	.long	0
	.long	1048576
	.long	2
	.long	-2146435072
	.long	1048576
	.long	data-2147483648
	.long	0
	.long	data
	.long	data-2147483648
	.long	234881024
	.long	2
	.long	-33554432
	.long	-33554432
	.long	0
	.long	2
	.section	.rodata
.LC1:
	.string	"PHYSTOP too high"
	.text
	.globl	setupkvm
	.type	setupkvm, @function
setupkvm:
.LFB23:
	.loc 3 130 0
	.cfi_startproc
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$52, %esp
	.cfi_offset 3, -12
	.loc 3 134 0
	call	kalloc
.LVL36:
	movl	%eax, -16(%ebp)
.LVL37:
	cmpl	$0, -16(%ebp)
	jne	.L24
	.loc 3 135 0
	movl	$0, %eax
.LVL38:
	jmp	.L25
.LVL39:
.L24:
	.loc 3 136 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
	movl	-16(%ebp), %eax
.LVL40:
	movl	%eax, (%esp)
	call	memset
.LVL41:
	.loc 3 137 0
	movl	$234881024, (%esp)
	call	p2v
.LVL42:
	cmpl	$-33554432, %eax
	jbe	.L26
	.loc 3 138 0
	movl	$.LC1, (%esp)
	call	panic
.LVL43:
.L26:
	.loc 3 139 0
	movl	$kmap, -12(%ebp)
.LVL44:
	jmp	.L27
.L29:
	.loc 3 140 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %ecx
	movl	-12(%ebp), %eax
	movl	4(%eax), %edx
	movl	-12(%ebp), %eax
	movl	8(%eax), %ebx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	subl	%eax, %ebx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	movl	%ecx, 16(%esp)
	movl	%edx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	mappages
.LVL45:
	testl	%eax, %eax
	jns	.L28
	.loc 3 142 0
	movl	$0, %eax
	jmp	.L25
.L28:
	.loc 3 139 0
	addl	$16, -12(%ebp)
.L27:
	.loc 3 139 0 is_stmt 0 discriminator 1
	cmpl	$kmap+64, -12(%ebp)
	jb	.L29
	.loc 3 143 0 is_stmt 1
	movl	-16(%ebp), %eax
.LVL46:
.L25:
	.loc 3 144 0
	addl	$52, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL47:
	ret
	.cfi_endproc
.LFE23:
	.size	setupkvm, .-setupkvm
	.globl	kvmalloc
	.type	kvmalloc, @function
kvmalloc:
.LFB24:
	.loc 3 150 0
	.cfi_startproc
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 3 151 0
	call	setupkvm
.LVL48:
	movl	%eax, kpgdir
	.loc 3 152 0
	call	switchkvm
.LVL49:
	.loc 3 153 0
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE24:
	.size	kvmalloc, .-kvmalloc
	.globl	switchkvm
	.type	switchkvm, @function
switchkvm:
.LFB25:
	.loc 3 159 0
	.cfi_startproc
	pushl	%ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI34:
	.cfi_def_cfa_register 5
	subl	$4, %esp
	.loc 3 160 0
	movl	kpgdir, %eax
	movl	%eax, (%esp)
	call	v2p
.LVL50:
	movl	%eax, (%esp)
	call	lcr3
.LVL51:
	.loc 3 161 0
	leave
.LCFI35:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE25:
	.size	switchkvm, .-switchkvm
	.section	.rodata
.LC2:
	.string	"switchuvm: no pgdir"
	.text
	.globl	switchuvm
	.type	switchuvm, @function
switchuvm:
.LFB26:
	.loc 3 166 0
	.cfi_startproc
.LVL52:
	pushl	%ebp
.LCFI36:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI37:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	.loc 3 167 0
	call	pushcli
.LVL53:
	.loc 3 168 0
	movl	%gs:0, %eax
	movl	%gs:0, %edx
	addl	$8, %edx
	movl	%edx, %ebx
	movl	%gs:0, %edx
	addl	$8, %edx
	shrl	$16, %edx
	movl	%edx, %ecx
	movl	%gs:0, %edx
	addl	$8, %edx
	shrl	$24, %edx
	movw	$103, 160(%eax)
	movw	%bx, 162(%eax)
	movb	%cl, 164(%eax)
	movzbl	165(%eax), %ecx
	andl	$-16, %ecx
	orl	$9, %ecx
	movb	%cl, 165(%eax)
	movzbl	165(%eax), %ecx
	orl	$16, %ecx
	movb	%cl, 165(%eax)
	movzbl	165(%eax), %ecx
	andl	$-97, %ecx
	movb	%cl, 165(%eax)
	movzbl	165(%eax), %ecx
	orl	$-128, %ecx
	movb	%cl, 165(%eax)
	movzbl	166(%eax), %ecx
	andl	$-16, %ecx
	movb	%cl, 166(%eax)
	movzbl	166(%eax), %ecx
	andl	$-17, %ecx
	movb	%cl, 166(%eax)
	movzbl	166(%eax), %ecx
	andl	$-33, %ecx
	movb	%cl, 166(%eax)
	movzbl	166(%eax), %ecx
	orl	$64, %ecx
	movb	%cl, 166(%eax)
	movzbl	166(%eax), %ecx
	andl	$127, %ecx
	movb	%cl, 166(%eax)
	movb	%dl, 167(%eax)
	.loc 3 169 0
	movl	%gs:0, %eax
	movzbl	165(%eax), %edx
	andl	$-17, %edx
	movb	%dl, 165(%eax)
	.loc 3 170 0
	movl	%gs:0, %eax
	movw	$16, 16(%eax)
	.loc 3 171 0
	movl	%gs:0, %eax
	movl	%gs:4, %edx
	movl	8(%edx), %edx
	addl	$4096, %edx
	movl	%edx, 12(%eax)
	.loc 3 172 0
	movl	$48, (%esp)
	call	ltr
.LVL54:
	.loc 3 173 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L33
	.loc 3 174 0
	movl	$.LC2, (%esp)
	call	panic
.LVL55:
.L33:
	.loc 3 175 0
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	v2p
.LVL56:
	movl	%eax, (%esp)
	call	lcr3
.LVL57:
	.loc 3 176 0
	call	popcli
.LVL58:
	.loc 3 177 0
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI38:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE26:
	.size	switchuvm, .-switchuvm
	.section	.rodata
.LC3:
	.string	"inituvm: more than a page"
	.text
	.globl	inituvm
	.type	inituvm, @function
inituvm:
.LFB27:
	.loc 3 183 0
	.cfi_startproc
.LVL59:
	pushl	%ebp
.LCFI39:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI40:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 3 186 0
	cmpl	$4095, 16(%ebp)
	jbe	.L35
	.loc 3 187 0
	movl	$.LC3, (%esp)
	call	panic
.LVL60:
.L35:
	.loc 3 188 0
	call	kalloc
.LVL61:
	movl	%eax, -12(%ebp)
.LVL62:
	.loc 3 189 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
.LVL63:
	.loc 3 190 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	v2p
.LVL64:
	movl	$6, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	mappages
.LVL65:
	.loc 3 191 0
	movl	16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
.LVL66:
	.loc 3 192 0
	leave
.LCFI41:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE27:
	.size	inituvm, .-inituvm
	.section	.rodata
	.align 4
.LC4:
	.string	"loaduvm: addr must be page aligned"
.LC5:
	.string	"loaduvm: address should exist"
	.text
	.globl	loaduvm
	.type	loaduvm, @function
loaduvm:
.LFB28:
	.loc 3 198 0
	.cfi_startproc
.LVL67:
	pushl	%ebp
.LCFI42:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI43:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$36, %esp
	.cfi_offset 3, -12
	.loc 3 202 0
	movl	12(%ebp), %eax
	andl	$4095, %eax
	testl	%eax, %eax
	je	.L37
	.loc 3 203 0
	movl	$.LC4, (%esp)
	call	panic
.LVL68:
.L37:
	.loc 3 204 0
	movl	$0, -12(%ebp)
.LVL69:
	jmp	.L38
.LVL70:
.L44:
	.loc 3 205 0
	movl	-12(%ebp), %eax
.LVL71:
	movl	12(%ebp), %edx
	addl	%edx, %eax
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	walkpgdir
.LVL72:
	movl	%eax, -20(%ebp)
.LVL73:
	cmpl	$0, -20(%ebp)
	jne	.L39
	.loc 3 206 0
	movl	$.LC5, (%esp)
	call	panic
.LVL74:
.L39:
	.loc 3 207 0
	movl	-20(%ebp), %eax
.LVL75:
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -24(%ebp)
.LVL76:
	.loc 3 208 0
	movl	-12(%ebp), %eax
.LVL77:
	movl	24(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	cmpl	$4095, %eax
	ja	.L40
	.loc 3 209 0
	movl	-12(%ebp), %eax
	movl	24(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -16(%ebp)
.LVL78:
	jmp	.L41
.LVL79:
.L40:
	.loc 3 211 0
	movl	$4096, -16(%ebp)
.LVL80:
.L41:
	.loc 3 212 0
	movl	-12(%ebp), %eax
	movl	20(%ebp), %edx
	leal	(%edx,%eax), %ebx
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	p2v
.LVL81:
	movl	-16(%ebp), %edx
	movl	%edx, 12(%esp)
	movl	%ebx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	readi
.LVL82:
	cmpl	-16(%ebp), %eax
	je	.L42
	.loc 3 213 0
	movl	$-1, %eax
	jmp	.L43
.L42:
	.loc 3 204 0
	addl	$4096, -12(%ebp)
.LVL83:
.L38:
	.loc 3 204 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	24(%ebp), %eax
	jb	.L44
	.loc 3 215 0 is_stmt 1
	movl	$0, %eax
.L43:
	.loc 3 216 0
	addl	$36, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI44:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE28:
	.size	loaduvm, .-loaduvm
	.section	.rodata
.LC6:
	.string	"allocuvm out of memory\n"
	.text
	.globl	allocuvm
	.type	allocuvm, @function
allocuvm:
.LFB29:
	.loc 3 222 0
	.cfi_startproc
.LVL84:
	pushl	%ebp
.LCFI45:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI46:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 3 226 0
	movl	16(%ebp), %eax
	testl	%eax, %eax
	jns	.L46
	.loc 3 227 0
	movl	$0, %eax
	jmp	.L47
.L46:
	.loc 3 228 0
	movl	16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jnb	.L48
	.loc 3 229 0
	movl	12(%ebp), %eax
	jmp	.L47
.L48:
	.loc 3 231 0
	movl	12(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL85:
	.loc 3 232 0
	jmp	.L49
.L51:
	.loc 3 233 0
	call	kalloc
.LVL86:
	movl	%eax, -16(%ebp)
.LVL87:
	.loc 3 234 0
	cmpl	$0, -16(%ebp)
	jne	.L50
	.loc 3 235 0
	movl	$.LC6, (%esp)
	call	cprintf
.LVL88:
	.loc 3 236 0
	movl	12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	deallocuvm
.LVL89:
	.loc 3 237 0
	movl	$0, %eax
	jmp	.L47
.LVL90:
.L50:
	.loc 3 239 0
	movl	$4096, 8(%esp)
	movl	$0, 4(%esp)
	movl	-16(%ebp), %eax
.LVL91:
	movl	%eax, (%esp)
	call	memset
.LVL92:
	.loc 3 240 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	v2p
.LVL93:
	movl	-12(%ebp), %edx
	movl	$6, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$4096, 8(%esp)
	movl	%edx, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	mappages
.LVL94:
	.loc 3 232 0
	addl	$4096, -12(%ebp)
.LVL95:
.L49:
	.loc 3 232 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	16(%ebp), %eax
	jb	.L51
	.loc 3 242 0 is_stmt 1
	movl	16(%ebp), %eax
.LVL96:
.L47:
	.loc 3 243 0
	leave
.LCFI47:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	allocuvm, .-allocuvm
	.section	.rodata
.LC7:
	.string	"kfree"
	.text
	.globl	deallocuvm
	.type	deallocuvm, @function
deallocuvm:
.LFB30:
	.loc 3 251 0
	.cfi_startproc
.LVL97:
	pushl	%ebp
.LCFI48:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI49:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 255 0
	movl	16(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L53
	.loc 3 256 0
	movl	12(%ebp), %eax
	jmp	.L54
.L53:
	.loc 3 258 0
	movl	16(%ebp), %eax
	addl	$4095, %eax
	andl	$-4096, %eax
	movl	%eax, -12(%ebp)
.LVL98:
	.loc 3 259 0
	jmp	.L55
.L59:
	.loc 3 260 0
	movl	-12(%ebp), %eax
.LVL99:
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	walkpgdir
.LVL100:
	movl	%eax, -16(%ebp)
.LVL101:
	.loc 3 261 0
	cmpl	$0, -16(%ebp)
	jne	.L56
	.loc 3 262 0
	addl	$4190208, -12(%ebp)
	jmp	.L57
.L56:
	.loc 3 263 0
	movl	-16(%ebp), %eax
.LVL102:
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L57
.LBB2:
	.loc 3 264 0
	movl	-16(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -20(%ebp)
.LVL103:
	.loc 3 265 0
	cmpl	$0, -20(%ebp)
	jne	.L58
	.loc 3 266 0
	movl	$.LC7, (%esp)
	call	panic
.LVL104:
.L58:
	.loc 3 267 0
	movl	-20(%ebp), %eax
.LVL105:
	movl	%eax, (%esp)
	call	p2v
.LVL106:
	movl	%eax, -24(%ebp)
.LVL107:
	.loc 3 268 0
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	kfree
.LVL108:
	.loc 3 269 0
	movl	-16(%ebp), %eax
	movl	$0, (%eax)
.LVL109:
.L57:
.LBE2:
	.loc 3 259 0
	addl	$4096, -12(%ebp)
.LVL110:
.L55:
	.loc 3 259 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L59
	.loc 3 272 0 is_stmt 1
	movl	16(%ebp), %eax
.LVL111:
.L54:
	.loc 3 273 0
	leave
.LCFI50:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	deallocuvm, .-deallocuvm
	.section	.rodata
.LC8:
	.string	"freevm: no pgdir"
	.text
	.globl	freevm
	.type	freevm, @function
freevm:
.LFB31:
	.loc 3 279 0
	.cfi_startproc
.LVL112:
	pushl	%ebp
.LCFI51:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI52:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 282 0
	cmpl	$0, 8(%ebp)
	jne	.L61
	.loc 3 283 0
	movl	$.LC8, (%esp)
	call	panic
.LVL113:
.L61:
	.loc 3 284 0
	movl	$0, 8(%esp)
	movl	$-2147483648, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	deallocuvm
.LVL114:
	.loc 3 285 0
	movl	$0, -12(%ebp)
.LVL115:
	jmp	.L62
.L64:
	.loc 3 286 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L63
.LBB3:
	.loc 3 287 0
	movl	-12(%ebp), %eax
	leal	0(,%eax,4), %edx
	movl	8(%ebp), %eax
	addl	%edx, %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, (%esp)
	call	p2v
.LVL116:
	movl	%eax, -16(%ebp)
.LVL117:
	.loc 3 288 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	kfree
.LVL118:
.L63:
.LBE3:
	.loc 3 285 0
	addl	$1, -12(%ebp)
.L62:
	.loc 3 285 0 is_stmt 0 discriminator 1
	cmpl	$1023, -12(%ebp)
	jbe	.L64
	.loc 3 291 0 is_stmt 1
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	kfree
.LVL119:
	.loc 3 292 0
	leave
.LCFI53:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	freevm, .-freevm
	.section	.rodata
.LC9:
	.string	"clearpteu"
	.text
	.globl	clearpteu
	.type	clearpteu, @function
clearpteu:
.LFB32:
	.loc 3 298 0
	.cfi_startproc
.LVL120:
	pushl	%ebp
.LCFI54:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI55:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 301 0
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	walkpgdir
.LVL121:
	movl	%eax, -12(%ebp)
.LVL122:
	.loc 3 302 0
	cmpl	$0, -12(%ebp)
	jne	.L66
	.loc 3 303 0
	movl	$.LC9, (%esp)
	call	panic
.LVL123:
.L66:
	.loc 3 304 0
	movl	-12(%ebp), %eax
.LVL124:
	movl	(%eax), %eax
	andl	$-5, %eax
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	.loc 3 305 0
	leave
.LCFI56:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	clearpteu, .-clearpteu
	.section	.rodata
.LC10:
	.string	"copyuvm: pte should exist"
.LC11:
	.string	"copyuvm: page not present"
	.text
	.globl	copyuvm
	.type	copyuvm, @function
copyuvm:
.LFB33:
	.loc 3 311 0
	.cfi_startproc
.LVL125:
	pushl	%ebp
.LCFI57:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI58:
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$68, %esp
	.cfi_offset 3, -12
	.loc 3 317 0
	call	setupkvm
.LVL126:
	movl	%eax, -16(%ebp)
.LVL127:
	cmpl	$0, -16(%ebp)
	jne	.L68
	.loc 3 318 0
	movl	$0, %eax
.LVL128:
	jmp	.L69
.LVL129:
.L68:
	.loc 3 319 0
	movl	$0, -12(%ebp)
.LVL130:
	jmp	.L70
.LVL131:
.L76:
	.loc 3 320 0
	movl	-12(%ebp), %eax
.LVL132:
	movl	$0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	walkpgdir
.LVL133:
	movl	%eax, -20(%ebp)
.LVL134:
	cmpl	$0, -20(%ebp)
	jne	.L71
	.loc 3 321 0
	movl	$.LC10, (%esp)
	call	panic
.LVL135:
.L71:
	.loc 3 322 0
	movl	-20(%ebp), %eax
.LVL136:
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L72
	.loc 3 323 0
	movl	$.LC11, (%esp)
	call	panic
.LVL137:
.L72:
	.loc 3 324 0
	movl	-20(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -24(%ebp)
.LVL138:
	.loc 3 325 0
	movl	-20(%ebp), %eax
.LVL139:
	movl	(%eax), %eax
	andl	$4095, %eax
	movl	%eax, -28(%ebp)
.LVL140:
	.loc 3 326 0
	call	kalloc
.LVL141:
	movl	%eax, -32(%ebp)
.LVL142:
	cmpl	$0, -32(%ebp)
	jne	.L73
	.loc 3 327 0
	jmp	.L74
.L73:
	.loc 3 328 0
	movl	-24(%ebp), %eax
.LVL143:
	movl	%eax, (%esp)
	call	p2v
.LVL144:
	movl	$4096, 8(%esp)
	movl	%eax, 4(%esp)
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	memmove
.LVL145:
	.loc 3 329 0
	movl	-28(%ebp), %ebx
	movl	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	v2p
.LVL146:
	movl	-12(%ebp), %edx
	movl	%ebx, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$4096, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	mappages
.LVL147:
	testl	%eax, %eax
	jns	.L75
	.loc 3 330 0
	jmp	.L74
.L75:
	.loc 3 319 0
	addl	$4096, -12(%ebp)
.LVL148:
.L70:
	.loc 3 319 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	12(%ebp), %eax
	jb	.L76
	.loc 3 332 0 is_stmt 1
	movl	-16(%ebp), %eax
	jmp	.L69
.LVL149:
.L74:
	.loc 3 335 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	freevm
.LVL150:
	.loc 3 336 0
	movl	$0, %eax
.LVL151:
.L69:
	.loc 3 337 0
	addl	$68, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
.LCFI59:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	copyuvm, .-copyuvm
	.globl	uva2ka
	.type	uva2ka, @function
uva2ka:
.LFB34:
	.loc 3 343 0
	.cfi_startproc
.LVL152:
	pushl	%ebp
.LCFI60:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI61:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 346 0
	movl	$0, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	walkpgdir
.LVL153:
	movl	%eax, -12(%ebp)
.LVL154:
	.loc 3 347 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
.LVL155:
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L78
	.loc 3 348 0
	movl	$0, %eax
	jmp	.L79
.L78:
	.loc 3 349 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$4, %eax
	testl	%eax, %eax
	jne	.L80
	.loc 3 350 0
	movl	$0, %eax
	jmp	.L79
.L80:
	.loc 3 351 0
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, (%esp)
	call	p2v
.LVL156:
.L79:
	.loc 3 352 0
	leave
.LCFI62:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	uva2ka, .-uva2ka
	.globl	copyout
	.type	copyout, @function
copyout:
.LFB35:
	.loc 3 359 0
	.cfi_startproc
.LVL157:
	pushl	%ebp
.LCFI63:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI64:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 3 363 0
	movl	16(%ebp), %eax
	movl	%eax, -12(%ebp)
.LVL158:
	.loc 3 364 0
	jmp	.L82
.LVL159:
.L86:
	.loc 3 365 0
	movl	12(%ebp), %eax
	andl	$-4096, %eax
	movl	%eax, -20(%ebp)
.LVL160:
	.loc 3 366 0
	movl	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
.LVL161:
	movl	%eax, (%esp)
	call	uva2ka
.LVL162:
	movl	%eax, -24(%ebp)
.LVL163:
	.loc 3 367 0
	cmpl	$0, -24(%ebp)
	jne	.L83
	.loc 3 368 0
	movl	$-1, %eax
.LVL164:
	jmp	.L84
.LVL165:
.L83:
	.loc 3 369 0
	movl	12(%ebp), %eax
.LVL166:
	movl	-20(%ebp), %edx
	subl	%eax, %edx
	movl	%edx, %eax
	addl	$4096, %eax
	movl	%eax, -16(%ebp)
.LVL167:
	.loc 3 370 0
	movl	-16(%ebp), %eax
	cmpl	20(%ebp), %eax
	jbe	.L85
	.loc 3 371 0
	movl	20(%ebp), %eax
.LVL168:
	movl	%eax, -16(%ebp)
.LVL169:
.L85:
	.loc 3 372 0
	movl	-20(%ebp), %eax
	movl	12(%ebp), %edx
	subl	%eax, %edx
	movl	-24(%ebp), %eax
	addl	%eax, %edx
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	memmove
.LVL170:
	.loc 3 373 0
	movl	-16(%ebp), %eax
	subl	%eax, 20(%ebp)
	.loc 3 374 0
	movl	-16(%ebp), %eax
	addl	%eax, -12(%ebp)
	.loc 3 375 0
	movl	-20(%ebp), %eax
	addl	$4096, %eax
	movl	%eax, 12(%ebp)
.LVL171:
.L82:
	.loc 3 364 0 discriminator 1
	cmpl	$0, 20(%ebp)
	jne	.L86
	.loc 3 377 0
	movl	$0, %eax
.L84:
	.loc 3 378 0
	leave
.LCFI65:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE35:
	.size	copyout, .-copyout
.Letext0:
	.file 4 "types.h"
	.file 5 "mmu.h"
	.file 6 "proc.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x15b0
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF106
	.byte	0x1
	.long	.LASF107
	.long	.LASF108
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
	.byte	0x5
	.byte	0x34
	.long	0x2ae
	.uleb128 0x7
	.long	.LASF18
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
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
	.byte	0x5
	.byte	0x41
	.long	0x25
	.byte	0x4
	.byte	0x8
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0
	.uleb128 0x2
	.long	.LASF25
	.byte	0x5
	.byte	0x94
	.long	0x25
	.uleb128 0x4
	.long	.LASF26
	.byte	0x68
	.byte	0x5
	.byte	0x97
	.long	0x4c4
	.uleb128 0x6
	.long	.LASF27
	.byte	0x5
	.byte	0x98
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF28
	.byte	0x5
	.byte	0x99
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ss0"
	.byte	0x5
	.byte	0x9a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF8
	.byte	0x5
	.byte	0x9b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x6
	.long	.LASF29
	.byte	0x5
	.byte	0x9c
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"ss1"
	.byte	0x5
	.byte	0x9d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF9
	.byte	0x5
	.byte	0x9e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x6
	.long	.LASF30
	.byte	0x5
	.byte	0x9f
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"ss2"
	.byte	0x5
	.byte	0xa0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF10
	.byte	0x5
	.byte	0xa1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1a
	.uleb128 0x5
	.string	"cr3"
	.byte	0x5
	.byte	0xa2
	.long	0x4ca
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.string	"eip"
	.byte	0x5
	.byte	0xa3
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF14
	.byte	0x5
	.byte	0xa4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.string	"eax"
	.byte	0x5
	.byte	0xa5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"ecx"
	.byte	0x5
	.byte	0xa6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0x5
	.string	"edx"
	.byte	0x5
	.byte	0xa7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x5
	.string	"ebx"
	.byte	0x5
	.byte	0xa8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.uleb128 0x5
	.string	"esp"
	.byte	0x5
	.byte	0xa9
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x5
	.string	"ebp"
	.byte	0x5
	.byte	0xaa
	.long	0x4c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x3c
	.uleb128 0x5
	.string	"esi"
	.byte	0x5
	.byte	0xab
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x5
	.string	"edi"
	.byte	0x5
	.byte	0xac
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x44
	.uleb128 0x5
	.string	"es"
	.byte	0x5
	.byte	0xad
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x6
	.long	.LASF11
	.byte	0x5
	.byte	0xae
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4a
	.uleb128 0x5
	.string	"cs"
	.byte	0x5
	.byte	0xaf
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4c
	.uleb128 0x6
	.long	.LASF13
	.byte	0x5
	.byte	0xb0
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4e
	.uleb128 0x5
	.string	"ss"
	.byte	0x5
	.byte	0xb1
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x6
	.long	.LASF15
	.byte	0x5
	.byte	0xb2
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x52
	.uleb128 0x5
	.string	"ds"
	.byte	0x5
	.byte	0xb3
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x54
	.uleb128 0x6
	.long	.LASF31
	.byte	0x5
	.byte	0xb4
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x56
	.uleb128 0x5
	.string	"fs"
	.byte	0x5
	.byte	0xb5
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x6
	.long	.LASF32
	.byte	0x5
	.byte	0xb6
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5a
	.uleb128 0x5
	.string	"gs"
	.byte	0x5
	.byte	0xb7
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5c
	.uleb128 0x6
	.long	.LASF33
	.byte	0x5
	.byte	0xb8
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5e
	.uleb128 0x5
	.string	"ldt"
	.byte	0x5
	.byte	0xb9
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x6
	.long	.LASF34
	.byte	0x5
	.byte	0xba
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x62
	.uleb128 0x5
	.string	"t"
	.byte	0x5
	.byte	0xbb
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x64
	.uleb128 0x6
	.long	.LASF35
	.byte	0x5
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
	.byte	0x6
	.byte	0x5
	.long	0x55a
	.uleb128 0x5
	.string	"id"
	.byte	0x6
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF36
	.byte	0x6
	.byte	0x7
	.long	0x5ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ts"
	.byte	0x6
	.byte	0x8
	.long	0x2b9
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"gdt"
	.byte	0x6
	.byte	0x9
	.long	0x5b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x6
	.long	.LASF37
	.byte	0x6
	.byte	0xa
	.long	0x5ca
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x6
	.long	.LASF38
	.byte	0x6
	.byte	0xb
	.long	0x5cf
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x6
	.long	.LASF39
	.byte	0x6
	.byte	0xc
	.long	0x5cf
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x5
	.string	"cpu"
	.byte	0x6
	.byte	0xf
	.long	0x5d6
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x6
	.long	.LASF40
	.byte	0x6
	.byte	0x10
	.long	0x69d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.byte	0
	.uleb128 0x4
	.long	.LASF41
	.byte	0x14
	.byte	0x6
	.byte	0x2c
	.long	0x5ad
	.uleb128 0x5
	.string	"edi"
	.byte	0x6
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"esi"
	.byte	0x6
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.string	"ebx"
	.byte	0x6
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.string	"ebp"
	.byte	0x6
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"eip"
	.byte	0x6
	.byte	0x31
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x55a
	.uleb128 0xc
	.long	0x1cb
	.long	0x5c3
	.uleb128 0xd
	.long	0x5c3
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
	.long	0x4cc
	.uleb128 0x4
	.long	.LASF40
	.byte	0x7c
	.byte	0x6
	.byte	0x37
	.long	0x69d
	.uleb128 0x5
	.string	"sz"
	.byte	0x6
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF43
	.byte	0x6
	.byte	0x39
	.long	0x6d4
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF44
	.byte	0x6
	.byte	0x3a
	.long	0x6da
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF45
	.byte	0x6
	.byte	0x3b
	.long	0x6a3
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.string	"pid"
	.byte	0x6
	.byte	0x3c
	.long	0x5cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.long	.LASF46
	.byte	0x6
	.byte	0x3d
	.long	0x69d
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.string	"tf"
	.byte	0x6
	.byte	0x3e
	.long	0x6e7
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x6
	.long	.LASF41
	.byte	0x6
	.byte	0x3f
	.long	0x5ad
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x6
	.long	.LASF47
	.byte	0x6
	.byte	0x40
	.long	0x4ca
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x6
	.long	.LASF48
	.byte	0x6
	.byte	0x41
	.long	0x5cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x6
	.long	.LASF49
	.byte	0x6
	.byte	0x42
	.long	0x6ed
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x5
	.string	"cwd"
	.byte	0x6
	.byte	0x43
	.long	0x70f
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x6
	.long	.LASF50
	.byte	0x6
	.byte	0x44
	.long	0x715
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5dc
	.uleb128 0x10
	.long	.LASF109
	.byte	0x4
	.byte	0x6
	.byte	0x34
	.long	0x6d4
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
	.long	0x6e0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF57
	.uleb128 0x9
	.byte	0x4
	.long	0x66
	.uleb128 0xc
	.long	0x6fd
	.long	0x6fd
	.uleb128 0xd
	.long	0x5c3
	.byte	0xf
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x703
	.uleb128 0x12
	.long	.LASF58
	.byte	0x1
	.uleb128 0x12
	.long	.LASF59
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x709
	.uleb128 0xc
	.long	0x6e0
	.long	0x725
	.uleb128 0xd
	.long	0x5c3
	.byte	0xf
	.byte	0
	.uleb128 0x4
	.long	.LASF60
	.byte	0x10
	.byte	0x3
	.byte	0x73
	.long	0x76a
	.uleb128 0x6
	.long	.LASF61
	.byte	0x3
	.byte	0x74
	.long	0x4ca
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF62
	.byte	0x3
	.byte	0x75
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF63
	.byte	0x3
	.byte	0x76
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.long	.LASF64
	.byte	0x3
	.byte	0x77
	.long	0x5cf
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.byte	0
	.uleb128 0x13
	.long	.LASF66
	.byte	0x1
	.byte	0x3f
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST0
	.byte	0x1
	.long	0x7ab
	.uleb128 0x14
	.string	"p"
	.byte	0x1
	.byte	0x3f
	.long	0x7ab
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF65
	.byte	0x1
	.byte	0x3f
	.long	0x5cf
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x16
	.string	"pd"
	.byte	0x1
	.byte	0x41
	.long	0x7c1
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x1cb
	.uleb128 0xc
	.long	0x37
	.long	0x7c1
	.uleb128 0xd
	.long	0x5c3
	.byte	0x2
	.byte	0
	.uleb128 0xe
	.long	0x7b1
	.uleb128 0x17
	.string	"ltr"
	.byte	0x1
	.byte	0x59
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST1
	.byte	0x1
	.long	0x7ee
	.uleb128 0x14
	.string	"sel"
	.byte	0x1
	.byte	0x59
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.long	.LASF67
	.byte	0x1
	.byte	0x67
	.byte	0x1
	.long	.LFB11
	.long	.LFE11
	.long	.LLST2
	.byte	0x1
	.long	0x814
	.uleb128 0x14
	.string	"v"
	.byte	0x1
	.byte	0x67
	.long	0x37
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x13
	.long	.LASF68
	.byte	0x1
	.byte	0x8e
	.byte	0x1
	.long	.LFB16
	.long	.LFE16
	.long	.LLST3
	.byte	0x1
	.long	0x83c
	.uleb128 0x14
	.string	"val"
	.byte	0x1
	.byte	0x8e
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.string	"v2p"
	.byte	0x2
	.byte	0xd
	.byte	0x1
	.long	0x25
	.long	.LFB18
	.long	.LFE18
	.long	.LLST4
	.byte	0x1
	.long	0x866
	.uleb128 0x14
	.string	"a"
	.byte	0x2
	.byte	0xd
	.long	0x4ca
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x18
	.string	"p2v"
	.byte	0x2
	.byte	0xe
	.byte	0x1
	.long	0x4ca
	.long	.LFB19
	.long	.LFE19
	.long	.LLST5
	.byte	0x1
	.long	0x890
	.uleb128 0x14
	.string	"a"
	.byte	0x2
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF74
	.byte	0x3
	.byte	0x11
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST6
	.byte	0x1
	.long	0x8f0
	.uleb128 0x1a
	.string	"c"
	.byte	0x3
	.byte	0x13
	.long	0x5d6
	.long	.LLST7
	.uleb128 0x1b
	.long	.LVL6
	.long	0x14df
	.uleb128 0x1c
	.long	.LVL10
	.long	0x76a
	.long	0x8df
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x8
	.byte	0x38
	.byte	0
	.uleb128 0x1e
	.long	.LVL11
	.long	0x7ee
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x48
	.byte	0
	.byte	0
	.uleb128 0x1f
	.long	.LASF69
	.byte	0x3
	.byte	0x2e
	.byte	0x1
	.long	0x99d
	.long	.LFB21
	.long	.LFE21
	.long	.LLST8
	.byte	0x1
	.long	0x99d
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0x2e
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"va"
	.byte	0x3
	.byte	0x2e
	.long	0x9a3
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF70
	.byte	0x3
	.byte	0x2e
	.long	0x5cf
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"pde"
	.byte	0x3
	.byte	0x30
	.long	0x6d4
	.long	.LLST9
	.uleb128 0x20
	.long	.LASF71
	.byte	0x3
	.byte	0x31
	.long	0x99d
	.long	.LLST10
	.uleb128 0x1b
	.long	.LVL15
	.long	0x866
	.uleb128 0x1b
	.long	.LVL18
	.long	0x14ed
	.uleb128 0x1c
	.long	.LVL23
	.long	0x14fb
	.long	0x98a
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x1e
	.long	.LVL24
	.long	0x83c
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2ae
	.uleb128 0x9
	.byte	0x4
	.long	0x9a9
	.uleb128 0x21
	.uleb128 0x1f
	.long	.LASF72
	.byte	0x3
	.byte	0x47
	.byte	0x1
	.long	0x5cf
	.long	.LFB22
	.long	.LFE22
	.long	.LLST11
	.byte	0x1
	.long	0xa6e
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0x47
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x14
	.string	"va"
	.byte	0x3
	.byte	0x47
	.long	0x4ca
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF65
	.byte	0x3
	.byte	0x47
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x14
	.string	"pa"
	.byte	0x3
	.byte	0x47
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x15
	.long	.LASF64
	.byte	0x3
	.byte	0x47
	.long	0x5cf
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.string	"a"
	.byte	0x3
	.byte	0x49
	.long	0x6da
	.long	.LLST12
	.uleb128 0x22
	.long	.LASF73
	.byte	0x3
	.byte	0x49
	.long	0x6da
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1a
	.string	"pte"
	.byte	0x3
	.byte	0x4a
	.long	0x99d
	.long	.LLST13
	.uleb128 0x1c
	.long	.LVL30
	.long	0x8f0
	.long	0xa59
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x1e
	.long	.LVL35
	.long	0x151d
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF80
	.byte	0x3
	.byte	0x81
	.byte	0x1
	.long	0x6d4
	.long	.LFB23
	.long	.LFE23
	.long	.LLST14
	.byte	0x1
	.long	0xb1d
	.uleb128 0x20
	.long	.LASF43
	.byte	0x3
	.byte	0x83
	.long	0x6d4
	.long	.LLST15
	.uleb128 0x1a
	.string	"k"
	.byte	0x3
	.byte	0x84
	.long	0xb1d
	.long	.LLST16
	.uleb128 0x1b
	.long	.LVL36
	.long	0x14ed
	.uleb128 0x1c
	.long	.LVL41
	.long	0x14fb
	.long	0xad5
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x1c
	.long	.LVL42
	.long	0x866
	.long	0xaeb
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x4c
	.byte	0x47
	.byte	0x24
	.byte	0
	.uleb128 0x1c
	.long	.LVL43
	.long	0x151d
	.long	0xb03
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x1e
	.long	.LVL45
	.long	0x9aa
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x725
	.uleb128 0x19
	.byte	0x1
	.long	.LASF75
	.byte	0x3
	.byte	0x95
	.byte	0x1
	.long	.LFB24
	.long	.LFE24
	.long	.LLST17
	.byte	0x1
	.long	0xb50
	.uleb128 0x1b
	.long	.LVL48
	.long	0xa6e
	.uleb128 0x1b
	.long	.LVL49
	.long	0xb50
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF76
	.byte	0x3
	.byte	0x9e
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST18
	.byte	0x1
	.long	0xb7d
	.uleb128 0x1b
	.long	.LVL50
	.long	0x83c
	.uleb128 0x1b
	.long	.LVL51
	.long	0x814
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF77
	.byte	0x3
	.byte	0xa5
	.byte	0x1
	.long	.LFB26
	.long	.LFE26
	.long	.LLST19
	.byte	0x1
	.long	0xbf5
	.uleb128 0x14
	.string	"p"
	.byte	0x3
	.byte	0xa5
	.long	0x69d
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.long	.LVL53
	.long	0x1531
	.uleb128 0x1c
	.long	.LVL54
	.long	0x7c6
	.long	0xbc1
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x8
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.long	.LVL55
	.long	0x151d
	.long	0xbd9
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x1b
	.long	.LVL56
	.long	0x83c
	.uleb128 0x1b
	.long	.LVL57
	.long	0x814
	.uleb128 0x1b
	.long	.LVL58
	.long	0x153b
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF78
	.byte	0x3
	.byte	0xb6
	.byte	0x1
	.long	.LFB27
	.long	.LFE27
	.long	.LLST20
	.byte	0x1
	.long	0xcef
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xb6
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF79
	.byte	0x3
	.byte	0xb6
	.long	0x6da
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.string	"sz"
	.byte	0x3
	.byte	0xb6
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"mem"
	.byte	0x3
	.byte	0xb8
	.long	0x6da
	.long	.LLST21
	.uleb128 0x1c
	.long	.LVL60
	.long	0x151d
	.long	0xc5f
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x1b
	.long	.LVL61
	.long	0x14ed
	.uleb128 0x1c
	.long	.LVL63
	.long	0x14fb
	.long	0xc8c
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x1c
	.long	.LVL64
	.long	0x83c
	.long	0xca2
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.long	.LVL65
	.long	0x9aa
	.long	0xccc
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x1
	.byte	0x36
	.byte	0
	.uleb128 0x1e
	.long	.LVL66
	.long	0x1545
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF81
	.byte	0x3
	.byte	0xc5
	.byte	0x1
	.long	0x5cf
	.long	.LFB28
	.long	.LFE28
	.long	.LLST22
	.byte	0x1
	.long	0xe18
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xc5
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF82
	.byte	0x3
	.byte	0xc5
	.long	0x6da
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x14
	.string	"ip"
	.byte	0x3
	.byte	0xc5
	.long	0x70f
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x15
	.long	.LASF83
	.byte	0x3
	.byte	0xc5
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x14
	.string	"sz"
	.byte	0x3
	.byte	0xc5
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0x1a
	.string	"i"
	.byte	0x3
	.byte	0xc7
	.long	0x25
	.long	.LLST23
	.uleb128 0x1a
	.string	"pa"
	.byte	0x3
	.byte	0xc7
	.long	0x25
	.long	.LLST24
	.uleb128 0x1a
	.string	"n"
	.byte	0x3
	.byte	0xc7
	.long	0x25
	.long	.LLST25
	.uleb128 0x1a
	.string	"pte"
	.byte	0x3
	.byte	0xc8
	.long	0x99d
	.long	.LLST26
	.uleb128 0x1c
	.long	.LVL68
	.long	0x151d
	.long	0xda0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0x1c
	.long	.LVL72
	.long	0x8f0
	.long	0xdc8
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x7
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0x22
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.long	.LVL74
	.long	0x151d
	.long	0xde0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC5
	.byte	0
	.uleb128 0x1c
	.long	.LVL81
	.long	0x866
	.long	0xdf6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0
	.uleb128 0x1e
	.long	.LVL82
	.long	0x1567
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF84
	.byte	0x3
	.byte	0xdd
	.byte	0x1
	.long	0x5cf
	.long	.LFB29
	.long	.LFE29
	.long	.LLST27
	.byte	0x1
	.long	0xf26
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xdd
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF85
	.byte	0x3
	.byte	0xdd
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF86
	.byte	0x3
	.byte	0xdd
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"mem"
	.byte	0x3
	.byte	0xdf
	.long	0x6da
	.long	.LLST28
	.uleb128 0x1a
	.string	"a"
	.byte	0x3
	.byte	0xe0
	.long	0x25
	.long	.LLST29
	.uleb128 0x1b
	.long	.LVL86
	.long	0x14ed
	.uleb128 0x1c
	.long	.LVL88
	.long	0x158e
	.long	0xe9d
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC6
	.byte	0
	.uleb128 0x1c
	.long	.LVL89
	.long	0xf26
	.long	0xec3
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 8
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.long	.LVL92
	.long	0x14fb
	.long	0xee7
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x1c
	.long	.LVL93
	.long	0x83c
	.long	0xefd
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x1e
	.long	.LVL94
	.long	0x9aa
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x1
	.byte	0x36
	.byte	0
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF87
	.byte	0x3
	.byte	0xfa
	.byte	0x1
	.long	0x5cf
	.long	.LFB30
	.long	.LFE30
	.long	.LLST30
	.byte	0x1
	.long	0x1015
	.uleb128 0x15
	.long	.LASF43
	.byte	0x3
	.byte	0xfa
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x15
	.long	.LASF85
	.byte	0x3
	.byte	0xfa
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x15
	.long	.LASF86
	.byte	0x3
	.byte	0xfa
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1a
	.string	"pte"
	.byte	0x3
	.byte	0xfc
	.long	0x99d
	.long	.LLST31
	.uleb128 0x1a
	.string	"a"
	.byte	0x3
	.byte	0xfd
	.long	0x25
	.long	.LLST32
	.uleb128 0x1a
	.string	"pa"
	.byte	0x3
	.byte	0xfd
	.long	0x25
	.long	.LLST33
	.uleb128 0x24
	.long	.LBB2
	.long	.LBE2
	.long	0xff4
	.uleb128 0x25
	.string	"v"
	.byte	0x3
	.value	0x10b
	.long	0x6da
	.long	.LLST34
	.uleb128 0x1c
	.long	.LVL104
	.long	0x151d
	.long	0xfcb
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC7
	.byte	0
	.uleb128 0x1c
	.long	.LVL106
	.long	0x866
	.long	0xfe1
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x1e
	.long	.LVL108
	.long	0x15a3
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LVL100
	.long	0x8f0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF88
	.byte	0x3
	.value	0x116
	.byte	0x1
	.long	.LFB31
	.long	.LFE31
	.long	.LLST35
	.byte	0x1
	.long	0x10d3
	.uleb128 0x27
	.long	.LASF43
	.byte	0x3
	.value	0x116
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x28
	.string	"i"
	.byte	0x3
	.value	0x118
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x24
	.long	.LBB3
	.long	.LBE3
	.long	0x1083
	.uleb128 0x25
	.string	"v"
	.byte	0x3
	.value	0x11f
	.long	0x6da
	.long	.LLST36
	.uleb128 0x1b
	.long	.LVL116
	.long	0x866
	.uleb128 0x1e
	.long	.LVL118
	.long	0x15a3
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.long	.LVL113
	.long	0x151d
	.long	0x109b
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC8
	.byte	0
	.uleb128 0x1c
	.long	.LVL114
	.long	0xf26
	.long	0x10c0
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x4
	.byte	0x40
	.byte	0x4b
	.byte	0x24
	.byte	0x1f
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.long	.LVL119
	.long	0x15a3
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF89
	.byte	0x3
	.value	0x129
	.byte	0x1
	.long	.LFB32
	.long	.LFE32
	.long	.LLST37
	.byte	0x1
	.long	0x1155
	.uleb128 0x27
	.long	.LASF43
	.byte	0x3
	.value	0x129
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x29
	.string	"uva"
	.byte	0x3
	.value	0x129
	.long	0x6da
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x25
	.string	"pte"
	.byte	0x3
	.value	0x12b
	.long	0x99d
	.long	.LLST38
	.uleb128 0x1c
	.long	.LVL121
	.long	0x8f0
	.long	0x1140
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1e
	.long	.LVL123
	.long	0x151d
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC9
	.byte	0
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF90
	.byte	0x3
	.value	0x136
	.byte	0x1
	.long	0x6d4
	.long	.LFB33
	.long	.LFE33
	.long	.LLST39
	.byte	0x1
	.long	0x12e8
	.uleb128 0x27
	.long	.LASF43
	.byte	0x3
	.value	0x136
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x29
	.string	"sz"
	.byte	0x3
	.value	0x136
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x25
	.string	"d"
	.byte	0x3
	.value	0x138
	.long	0x6d4
	.long	.LLST40
	.uleb128 0x25
	.string	"pte"
	.byte	0x3
	.value	0x139
	.long	0x99d
	.long	.LLST41
	.uleb128 0x25
	.string	"pa"
	.byte	0x3
	.value	0x13a
	.long	0x25
	.long	.LLST42
	.uleb128 0x25
	.string	"i"
	.byte	0x3
	.value	0x13a
	.long	0x25
	.long	.LLST43
	.uleb128 0x2b
	.long	.LASF91
	.byte	0x3
	.value	0x13a
	.long	0x25
	.long	.LLST44
	.uleb128 0x25
	.string	"mem"
	.byte	0x3
	.value	0x13b
	.long	0x6da
	.long	.LLST45
	.uleb128 0x2c
	.string	"bad"
	.byte	0x3
	.value	0x14e
	.long	.L74
	.uleb128 0x1b
	.long	.LVL126
	.long	0xa6e
	.uleb128 0x1c
	.long	.LVL133
	.long	0x8f0
	.long	0x1225
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1c
	.long	.LVL135
	.long	0x151d
	.long	0x123d
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC10
	.byte	0
	.uleb128 0x1c
	.long	.LVL137
	.long	0x151d
	.long	0x1255
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC11
	.byte	0
	.uleb128 0x1b
	.long	.LVL141
	.long	0x14ed
	.uleb128 0x1c
	.long	.LVL144
	.long	0x866
	.long	0x1274
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.long	.LVL145
	.long	0x1545
	.long	0x1292
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.byte	0
	.uleb128 0x1c
	.long	.LVL146
	.long	0x83c
	.long	0x12a8
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -40
	.byte	0x6
	.byte	0
	.uleb128 0x1c
	.long	.LVL147
	.long	0x9aa
	.long	0x12d5
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0xa
	.value	0x1000
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 16
	.byte	0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x1e
	.long	.LVL150
	.long	0x1015
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF92
	.byte	0x3
	.value	0x156
	.byte	0x1
	.long	0x6da
	.long	.LFB34
	.long	.LFE34
	.long	.LLST46
	.byte	0x1
	.long	0x1363
	.uleb128 0x27
	.long	.LASF43
	.byte	0x3
	.value	0x156
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x29
	.string	"uva"
	.byte	0x3
	.value	0x156
	.long	0x6da
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x25
	.string	"pte"
	.byte	0x3
	.value	0x158
	.long	0x99d
	.long	.LLST47
	.uleb128 0x1c
	.long	.LVL153
	.long	0x8f0
	.long	0x1359
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1b
	.long	.LVL156
	.long	0x866
	.byte	0
	.uleb128 0x2a
	.byte	0x1
	.long	.LASF93
	.byte	0x3
	.value	0x166
	.byte	0x1
	.long	0x5cf
	.long	.LFB35
	.long	.LFE35
	.long	.LLST48
	.byte	0x1
	.long	0x1443
	.uleb128 0x27
	.long	.LASF43
	.byte	0x3
	.value	0x166
	.long	0x6d4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2d
	.string	"va"
	.byte	0x3
	.value	0x166
	.long	0x25
	.long	.LLST49
	.uleb128 0x29
	.string	"p"
	.byte	0x3
	.value	0x166
	.long	0x4ca
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x29
	.string	"len"
	.byte	0x3
	.value	0x166
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x25
	.string	"buf"
	.byte	0x3
	.value	0x168
	.long	0x6da
	.long	.LLST50
	.uleb128 0x25
	.string	"pa0"
	.byte	0x3
	.value	0x168
	.long	0x6da
	.long	.LLST51
	.uleb128 0x25
	.string	"n"
	.byte	0x3
	.value	0x169
	.long	0x25
	.long	.LLST52
	.uleb128 0x25
	.string	"va0"
	.byte	0x3
	.value	0x169
	.long	0x25
	.long	.LLST53
	.uleb128 0x1c
	.long	.LVL162
	.long	0x12e8
	.long	0x1418
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0
	.uleb128 0x1e
	.long	.LVL170
	.long	0x1545
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0xb
	.byte	0x91
	.sleb128 -32
	.byte	0x6
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0x22
	.byte	0x91
	.sleb128 -28
	.byte	0x6
	.byte	0x1c
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1d
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x725
	.long	0x1453
	.uleb128 0xd
	.long	0x5c3
	.byte	0x3
	.byte	0
	.uleb128 0x22
	.long	.LASF60
	.byte	0x3
	.byte	0x78
	.long	0x1443
	.byte	0x5
	.byte	0x3
	.long	kmap
	.uleb128 0xc
	.long	0x4cc
	.long	0x1474
	.uleb128 0xd
	.long	0x5c3
	.byte	0x7
	.byte	0
	.uleb128 0x2e
	.long	.LASF94
	.byte	0x6
	.byte	0x13
	.long	0x1464
	.byte	0x1
	.byte	0x1
	.uleb128 0x2f
	.string	"cpu"
	.byte	0x6
	.byte	0x1e
	.long	.LASF110
	.long	0x5d6
	.byte	0x1
	.byte	0x1
	.uleb128 0x30
	.long	.LASF40
	.byte	0x6
	.byte	0x1f
	.long	.LASF111
	.long	0x69d
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.long	0x6e0
	.long	0x14ae
	.uleb128 0x31
	.byte	0
	.uleb128 0x2e
	.long	.LASF95
	.byte	0x3
	.byte	0xa
	.long	0x14a3
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	.LASF96
	.byte	0x3
	.byte	0xb
	.long	0x6d4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	kpgdir
	.uleb128 0x33
	.string	"gdt"
	.byte	0x3
	.byte	0xc
	.long	0x5b3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	gdt
	.uleb128 0x34
	.byte	0x1
	.long	.LASF97
	.byte	0x7
	.byte	0x4c
	.byte	0x1
	.long	0x5cf
	.byte	0x1
	.uleb128 0x34
	.byte	0x1
	.long	.LASF98
	.byte	0x7
	.byte	0x42
	.byte	0x1
	.long	0x6da
	.byte	0x1
	.uleb128 0x35
	.byte	0x1
	.long	.LASF101
	.byte	0x7
	.byte	0x89
	.byte	0x1
	.long	0x4ca
	.byte	0x1
	.long	0x151d
	.uleb128 0x36
	.long	0x4ca
	.uleb128 0x36
	.long	0x5cf
	.uleb128 0x36
	.long	0x25
	.byte	0
	.uleb128 0x37
	.byte	0x1
	.long	.LASF104
	.byte	0x7
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0x1531
	.uleb128 0x36
	.long	0x6da
	.byte	0
	.uleb128 0x38
	.byte	0x1
	.long	.LASF99
	.byte	0x7
	.byte	0x83
	.byte	0x1
	.byte	0x1
	.uleb128 0x38
	.byte	0x1
	.long	.LASF100
	.byte	0x7
	.byte	0x84
	.byte	0x1
	.byte	0x1
	.uleb128 0x35
	.byte	0x1
	.long	.LASF102
	.byte	0x7
	.byte	0x88
	.byte	0x1
	.long	0x4ca
	.byte	0x1
	.long	0x1567
	.uleb128 0x36
	.long	0x4ca
	.uleb128 0x36
	.long	0x9a3
	.uleb128 0x36
	.long	0x25
	.byte	0
	.uleb128 0x35
	.byte	0x1
	.long	.LASF103
	.byte	0x7
	.byte	0x33
	.byte	0x1
	.long	0x5cf
	.byte	0x1
	.long	0x158e
	.uleb128 0x36
	.long	0x70f
	.uleb128 0x36
	.long	0x6da
	.uleb128 0x36
	.long	0x25
	.uleb128 0x36
	.long	0x25
	.byte	0
	.uleb128 0x37
	.byte	0x1
	.long	.LASF105
	.byte	0x7
	.byte	0x14
	.byte	0x1
	.byte	0x1
	.long	0x15a3
	.uleb128 0x36
	.long	0x6da
	.uleb128 0x39
	.byte	0
	.uleb128 0x3a
	.byte	0x1
	.long	.LASF112
	.byte	0x7
	.byte	0x43
	.byte	0x1
	.byte	0x1
	.uleb128 0x36
	.long	0x6da
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x26
	.byte	0
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
	.uleb128 0x2
	.uleb128 0xa
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
	.uleb128 0x24
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
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x32
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
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
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
	.uleb128 0x36
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x37
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
	.uleb128 0x38
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
	.uleb128 0x39
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x3a
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
	.long	.LFB7-.Ltext0
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
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB9-.Ltext0
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
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB11-.Ltext0
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
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST3:
	.long	.LFB16-.Ltext0
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
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST4:
	.long	.LFB18-.Ltext0
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
	.long	.LFE18-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST5:
	.long	.LFB19-.Ltext0
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
	.long	.LFE19-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST6:
	.long	.LFB20-.Ltext0
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
	.long	.LFE20-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST7:
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST8:
	.long	.LFB21-.Ltext0
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
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST9:
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST10:
	.long	.LVL16-.Ltext0
	.long	.LVL17-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL19-.Ltext0
	.long	.LVL20-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL22-.Ltext0
	.long	.LVL25-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST11:
	.long	.LFB22-.Ltext0
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
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST12:
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL28-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST13:
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL33-.Ltext0
	.long	.LVL34-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL34-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST14:
	.long	.LFB23-.Ltext0
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
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST15:
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL38-.Ltext0
	.long	.LVL39-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL39-.Ltext0
	.long	.LVL40-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL40-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL47-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST16:
	.long	.LVL44-.Ltext0
	.long	.LVL46-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST17:
	.long	.LFB24-.Ltext0
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
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST18:
	.long	.LFB25-.Ltext0
	.long	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI33-.Ltext0
	.long	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI34-.Ltext0
	.long	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI35-.Ltext0
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST19:
	.long	.LFB26-.Ltext0
	.long	.LCFI36-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI36-.Ltext0
	.long	.LCFI37-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI37-.Ltext0
	.long	.LCFI38-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI38-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST20:
	.long	.LFB27-.Ltext0
	.long	.LCFI39-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI39-.Ltext0
	.long	.LCFI40-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI40-.Ltext0
	.long	.LCFI41-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI41-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LVL62-.Ltext0
	.long	.LVL63-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL63-1-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST22:
	.long	.LFB28-.Ltext0
	.long	.LCFI42-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI42-.Ltext0
	.long	.LCFI43-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI43-.Ltext0
	.long	.LCFI44-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI44-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST23:
	.long	.LVL69-.Ltext0
	.long	.LVL70-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL70-.Ltext0
	.long	.LVL71-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL71-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST24:
	.long	.LVL76-.Ltext0
	.long	.LVL77-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL77-.Ltext0
	.long	.LVL83-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST25:
	.long	.LVL78-.Ltext0
	.long	.LVL79-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL80-.Ltext0
	.long	.LVL83-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST26:
	.long	.LVL73-.Ltext0
	.long	.LVL74-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL74-1-.Ltext0
	.long	.LVL74-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL74-.Ltext0
	.long	.LVL75-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL75-.Ltext0
	.long	.LVL83-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST27:
	.long	.LFB29-.Ltext0
	.long	.LCFI45-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI45-.Ltext0
	.long	.LCFI46-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI46-.Ltext0
	.long	.LCFI47-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI47-.Ltext0
	.long	.LFE29-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST28:
	.long	.LVL87-.Ltext0
	.long	.LVL88-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL88-1-.Ltext0
	.long	.LVL90-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL90-.Ltext0
	.long	.LVL91-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL91-.Ltext0
	.long	.LVL95-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST29:
	.long	.LVL85-.Ltext0
	.long	.LVL86-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL86-1-.Ltext0
	.long	.LVL96-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST30:
	.long	.LFB30-.Ltext0
	.long	.LCFI48-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI48-.Ltext0
	.long	.LCFI49-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI49-.Ltext0
	.long	.LCFI50-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI50-.Ltext0
	.long	.LFE30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST31:
	.long	.LVL101-.Ltext0
	.long	.LVL102-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL102-.Ltext0
	.long	.LVL110-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST32:
	.long	.LVL98-.Ltext0
	.long	.LVL99-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL99-.Ltext0
	.long	.LVL111-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST33:
	.long	.LVL103-.Ltext0
	.long	.LVL104-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL104-1-.Ltext0
	.long	.LVL104-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL104-.Ltext0
	.long	.LVL105-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL105-.Ltext0
	.long	.LVL109-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST34:
	.long	.LVL107-.Ltext0
	.long	.LVL108-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL108-1-.Ltext0
	.long	.LVL109-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST35:
	.long	.LFB31-.Ltext0
	.long	.LCFI51-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI51-.Ltext0
	.long	.LCFI52-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI52-.Ltext0
	.long	.LCFI53-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI53-.Ltext0
	.long	.LFE31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST36:
	.long	.LVL117-.Ltext0
	.long	.LVL118-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL118-1-.Ltext0
	.long	.LVL118-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST37:
	.long	.LFB32-.Ltext0
	.long	.LCFI54-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI54-.Ltext0
	.long	.LCFI55-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI55-.Ltext0
	.long	.LCFI56-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI56-.Ltext0
	.long	.LFE32-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST38:
	.long	.LVL122-.Ltext0
	.long	.LVL123-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL123-1-.Ltext0
	.long	.LVL123-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL123-.Ltext0
	.long	.LVL124-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL124-.Ltext0
	.long	.LFE32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST39:
	.long	.LFB33-.Ltext0
	.long	.LCFI57-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI57-.Ltext0
	.long	.LCFI58-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI58-.Ltext0
	.long	.LCFI59-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI59-.Ltext0
	.long	.LFE33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST40:
	.long	.LVL127-.Ltext0
	.long	.LVL128-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL128-.Ltext0
	.long	.LVL129-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL129-.Ltext0
	.long	.LVL131-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL131-.Ltext0
	.long	.LFE33-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST41:
	.long	.LVL134-.Ltext0
	.long	.LVL135-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL135-1-.Ltext0
	.long	.LVL135-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL135-.Ltext0
	.long	.LVL136-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL136-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	.LVL149-.Ltext0
	.long	.LVL151-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -28
	.long	0
	.long	0
.LLST42:
	.long	.LVL138-.Ltext0
	.long	.LVL139-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL139-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL149-.Ltext0
	.long	.LVL151-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST43:
	.long	.LVL130-.Ltext0
	.long	.LVL131-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL131-.Ltext0
	.long	.LVL132-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL132-.Ltext0
	.long	.LVL151-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST44:
	.long	.LVL140-.Ltext0
	.long	.LVL141-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL141-1-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	.LVL149-.Ltext0
	.long	.LVL151-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -36
	.long	0
	.long	0
.LLST45:
	.long	.LVL142-.Ltext0
	.long	.LVL143-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL143-.Ltext0
	.long	.LVL148-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	.LVL149-.Ltext0
	.long	.LVL151-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST46:
	.long	.LFB34-.Ltext0
	.long	.LCFI60-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI60-.Ltext0
	.long	.LCFI61-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI61-.Ltext0
	.long	.LCFI62-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI62-.Ltext0
	.long	.LFE34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST47:
	.long	.LVL154-.Ltext0
	.long	.LVL155-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL155-.Ltext0
	.long	.LFE34-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST48:
	.long	.LFB35-.Ltext0
	.long	.LCFI63-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI63-.Ltext0
	.long	.LCFI64-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI64-.Ltext0
	.long	.LCFI65-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI65-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST49:
	.long	.LVL157-.Ltext0
	.long	.LVL171-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	.LVL171-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 4
	.long	0
	.long	0
.LLST50:
	.long	.LVL158-.Ltext0
	.long	.LVL159-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL159-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST51:
	.long	.LVL163-.Ltext0
	.long	.LVL164-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL164-.Ltext0
	.long	.LVL165-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	.LVL165-.Ltext0
	.long	.LVL166-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL166-.Ltext0
	.long	.LVL171-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -32
	.long	0
	.long	0
.LLST52:
	.long	.LVL167-.Ltext0
	.long	.LVL168-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL168-.Ltext0
	.long	.LVL171-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST53:
	.long	.LVL160-.Ltext0
	.long	.LVL161-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL161-.Ltext0
	.long	.LVL171-.Ltext0
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
.LASF52:
	.string	"EMBRYO"
.LASF76:
	.string	"switchkvm"
.LASF61:
	.string	"virt"
.LASF36:
	.string	"scheduler"
.LASF106:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF23:
	.string	"rsv1"
.LASF21:
	.string	"type"
.LASF18:
	.string	"lim_15_0"
.LASF37:
	.string	"started"
.LASF82:
	.string	"addr"
.LASF64:
	.string	"perm"
.LASF69:
	.string	"walkpgdir"
.LASF87:
	.string	"deallocuvm"
.LASF97:
	.string	"cpunum"
.LASF53:
	.string	"SLEEPING"
.LASF78:
	.string	"inituvm"
.LASF77:
	.string	"switchuvm"
.LASF75:
	.string	"kvmalloc"
.LASF46:
	.string	"parent"
.LASF45:
	.string	"state"
.LASF70:
	.string	"alloc"
.LASF88:
	.string	"freevm"
.LASF109:
	.string	"procstate"
.LASF67:
	.string	"loadgs"
.LASF100:
	.string	"popcli"
.LASF27:
	.string	"link"
.LASF110:
	.string	"%gs:0"
.LASF104:
	.string	"panic"
.LASF111:
	.string	"%gs:4"
.LASF6:
	.string	"pde_t"
.LASF107:
	.string	"vm.c"
.LASF86:
	.string	"newsz"
.LASF93:
	.string	"copyout"
.LASF40:
	.string	"proc"
.LASF7:
	.string	"oesp"
.LASF66:
	.string	"lgdt"
.LASF112:
	.string	"kfree"
.LASF90:
	.string	"copyuvm"
.LASF50:
	.string	"name"
.LASF54:
	.string	"RUNNABLE"
.LASF99:
	.string	"pushcli"
.LASF35:
	.string	"iomb"
.LASF65:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF28:
	.string	"esp0"
.LASF29:
	.string	"esp1"
.LASF30:
	.string	"esp2"
.LASF73:
	.string	"last"
.LASF49:
	.string	"ofile"
.LASF19:
	.string	"base_15_0"
.LASF96:
	.string	"kpgdir"
.LASF74:
	.string	"seginit"
.LASF43:
	.string	"pgdir"
.LASF51:
	.string	"UNUSED"
.LASF8:
	.string	"padding1"
.LASF9:
	.string	"padding2"
.LASF10:
	.string	"padding3"
.LASF11:
	.string	"padding4"
.LASF13:
	.string	"padding5"
.LASF15:
	.string	"padding6"
.LASF31:
	.string	"padding7"
.LASF32:
	.string	"padding8"
.LASF33:
	.string	"padding9"
.LASF16:
	.string	"trapframe"
.LASF42:
	.string	"sizetype"
.LASF12:
	.string	"trapno"
.LASF56:
	.string	"ZOMBIE"
.LASF62:
	.string	"phys_start"
.LASF1:
	.string	"ushort"
.LASF14:
	.string	"eflags"
.LASF25:
	.string	"pte_t"
.LASF26:
	.string	"taskstate"
.LASF108:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF79:
	.string	"init"
.LASF105:
	.string	"cprintf"
.LASF72:
	.string	"mappages"
.LASF0:
	.string	"uint"
.LASF85:
	.string	"oldsz"
.LASF59:
	.string	"inode"
.LASF44:
	.string	"kstack"
.LASF22:
	.string	"lim_19_16"
.LASF5:
	.string	"unsigned char"
.LASF84:
	.string	"allocuvm"
.LASF24:
	.string	"base_31_24"
.LASF58:
	.string	"file"
.LASF39:
	.string	"intena"
.LASF20:
	.string	"base_23_16"
.LASF55:
	.string	"RUNNING"
.LASF47:
	.string	"chan"
.LASF57:
	.string	"char"
.LASF17:
	.string	"segdesc"
.LASF98:
	.string	"kalloc"
.LASF2:
	.string	"unsigned int"
.LASF68:
	.string	"lcr3"
.LASF71:
	.string	"pgtab"
.LASF89:
	.string	"clearpteu"
.LASF83:
	.string	"offset"
.LASF95:
	.string	"data"
.LASF92:
	.string	"uva2ka"
.LASF41:
	.string	"context"
.LASF34:
	.string	"padding10"
.LASF103:
	.string	"readi"
.LASF101:
	.string	"memset"
.LASF81:
	.string	"loaduvm"
.LASF38:
	.string	"ncli"
.LASF102:
	.string	"memmove"
.LASF4:
	.string	"uchar"
.LASF91:
	.string	"flags"
.LASF63:
	.string	"phys_end"
.LASF80:
	.string	"setupkvm"
.LASF94:
	.string	"cpus"
.LASF48:
	.string	"killed"
.LASF60:
	.string	"kmap"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
