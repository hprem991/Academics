	.file	"proc.c"
	.text
.Ltext0:
	.type	readeflags, @function
readeflags:
.LFB12:
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
.LFE12:
	.size	readeflags, .-readeflags
	.type	sti, @function
sti:
.LFB15:
	.loc 1 116 0
	.cfi_startproc
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	.loc 1 117 0
#APP
# 117 "x86.h" 1
	sti
# 0 "" 2
	.loc 1 118 0
#NO_APP
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	sti, .-sti
	.type	halt, @function
halt:
.LFB19:
	.loc 1 149 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	.loc 1 150 0
#APP
# 150 "x86.h" 1
	hlt
# 0 "" 2
	.loc 1 151 0
#NO_APP
	popl	%ebp
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE19:
	.size	halt, .-halt
	.comm	ptable,7988,32
	.local	initproc
	.comm	initproc,4,4
	.globl	nextpid
	.data
	.align 4
	.type	nextpid, @object
	.size	nextpid, 4
nextpid:
	.long	1
	.section	.rodata
.LC0:
	.string	"ptable"
	.text
	.globl	pinit
	.type	pinit, @function
pinit:
.LFB20:
	.file 2 "proc.c"
	.loc 2 25 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 26 0
	movl	$.LC0, 4(%esp)
	movl	$ptable, (%esp)
	call	initlock
.LVL1:
	.loc 2 27 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE20:
	.size	pinit, .-pinit
	.type	allocproc, @function
allocproc:
.LFB21:
	.loc 2 36 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 40 0
	movl	$ptable, (%esp)
	call	acquire
.LVL2:
	.loc 2 41 0
	movl	$ptable+52, -12(%ebp)
.LVL3:
	jmp	.L7
.L10:
	.loc 2 42 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	.L8
	.loc 2 43 0
	nop
.L9:
	.loc 2 48 0
	movl	-12(%ebp), %eax
	movl	$1, 12(%eax)
	.loc 2 49 0
	movl	nextpid, %eax
	leal	1(%eax), %edx
	movl	%edx, nextpid
	movl	-12(%ebp), %edx
	movl	%eax, 16(%edx)
	.loc 2 50 0
	movl	$ptable, (%esp)
	call	release
.LVL4:
	.loc 2 53 0
	call	kalloc
.LVL5:
	movl	-12(%ebp), %edx
	movl	%eax, 8(%edx)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	testl	%eax, %eax
	jne	.L12
	jmp	.L13
.L8:
	.loc 2 41 0
	addl	$124, -12(%ebp)
.LVL6:
.L7:
	.loc 2 41 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -12(%ebp)
	jb	.L10
	.loc 2 44 0 is_stmt 1
	movl	$ptable, (%esp)
	call	release
.LVL7:
	.loc 2 45 0
	movl	$0, %eax
	jmp	.L11
.L13:
	.loc 2 54 0
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	.loc 2 55 0
	movl	$0, %eax
	jmp	.L11
.L12:
	.loc 2 57 0
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	addl	$4096, %eax
	movl	%eax, -16(%ebp)
.LVL8:
	.loc 2 60 0
	subl	$76, -16(%ebp)
.LVL9:
	.loc 2 61 0
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 24(%eax)
	.loc 2 65 0
	subl	$4, -16(%ebp)
.LVL10:
	.loc 2 66 0
	movl	$trapret, %edx
	movl	-16(%ebp), %eax
	movl	%edx, (%eax)
	.loc 2 68 0
	subl	$20, -16(%ebp)
.LVL11:
	.loc 2 69 0
	movl	-12(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, 28(%eax)
	.loc 2 70 0
	movl	-12(%ebp), %eax
	movl	28(%eax), %eax
	movl	$20, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
.LVL12:
	.loc 2 71 0
	movl	-12(%ebp), %eax
	movl	28(%eax), %eax
	movl	$forkret, %edx
	movl	%edx, 16(%eax)
	.loc 2 73 0
	movl	-12(%ebp), %eax
.LVL13:
.L11:
	.loc 2 74 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL14:
	ret
	.cfi_endproc
.LFE21:
	.size	allocproc, .-allocproc
	.section	.rodata
.LC1:
	.string	"userinit: out of memory?"
.LC2:
	.string	"initcode"
.LC3:
	.string	"/"
	.text
	.globl	userinit
	.type	userinit, @function
userinit:
.LFB22:
	.loc 2 80 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 84 0
	call	allocproc
.LVL15:
	movl	%eax, -12(%ebp)
.LVL16:
	.loc 2 85 0
	movl	-12(%ebp), %eax
	movl	%eax, initproc
	.loc 2 86 0
	call	setupkvm
.LVL17:
	movl	-12(%ebp), %edx
	movl	%eax, 4(%edx)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L15
	.loc 2 87 0
	movl	$.LC1, (%esp)
	call	panic
.LVL18:
.L15:
	.loc 2 88 0
	movl	$_binary_initcode_size, %edx
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%edx, 8(%esp)
	movl	$_binary_initcode_start, 4(%esp)
	movl	%eax, (%esp)
	call	inituvm
.LVL19:
	.loc 2 89 0
	movl	-12(%ebp), %eax
	movl	$4096, (%eax)
	.loc 2 90 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	$76, 8(%esp)
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	memset
.LVL20:
	.loc 2 91 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movw	$35, 60(%eax)
	.loc 2 92 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movw	$43, 44(%eax)
	.loc 2 93 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	24(%edx), %edx
	movzwl	44(%edx), %edx
	movw	%dx, 40(%eax)
	.loc 2 94 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	-12(%ebp), %edx
	movl	24(%edx), %edx
	movzwl	44(%edx), %edx
	movw	%dx, 72(%eax)
	.loc 2 95 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	$512, 64(%eax)
	.loc 2 96 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	$4096, 68(%eax)
	.loc 2 97 0
	movl	-12(%ebp), %eax
	movl	24(%eax), %eax
	movl	$0, 56(%eax)
	.loc 2 99 0
	movl	-12(%ebp), %eax
	addl	$108, %eax
	movl	$16, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	%eax, (%esp)
	call	safestrcpy
.LVL21:
	.loc 2 100 0
	movl	$.LC3, (%esp)
	call	namei
.LVL22:
	movl	-12(%ebp), %edx
	movl	%eax, 104(%edx)
	.loc 2 102 0
	movl	-12(%ebp), %eax
	movl	$3, 12(%eax)
	.loc 2 103 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL23:
	ret
	.cfi_endproc
.LFE22:
	.size	userinit, .-userinit
	.globl	growproc
	.type	growproc, @function
growproc:
.LFB23:
	.loc 2 109 0
	.cfi_startproc
.LVL24:
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 112 0
	movl	%gs:4, %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL25:
	.loc 2 113 0
	cmpl	$0, 8(%ebp)
	jle	.L17
	.loc 2 114 0
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	addl	%eax, %edx
	movl	%gs:4, %eax
.LVL26:
	movl	4(%eax), %eax
.LVL27:
	movl	%edx, 8(%esp)
.LVL28:
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	allocuvm
.LVL29:
	movl	%eax, -12(%ebp)
.LVL30:
	cmpl	$0, -12(%ebp)
	jne	.L18
	.loc 2 115 0
	movl	$-1, %eax
.LVL31:
	jmp	.L19
.LVL32:
.L17:
	.loc 2 116 0
	cmpl	$0, 8(%ebp)
	jns	.L18
	.loc 2 117 0
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
.LVL33:
	addl	%eax, %edx
	movl	%gs:4, %eax
	movl	4(%eax), %eax
	movl	%edx, 8(%esp)
.LVL34:
	movl	-12(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	deallocuvm
.LVL35:
	movl	%eax, -12(%ebp)
.LVL36:
	cmpl	$0, -12(%ebp)
	jne	.L18
	.loc 2 118 0
	movl	$-1, %eax
.LVL37:
	jmp	.L19
.LVL38:
.L18:
	.loc 2 120 0
	movl	%gs:4, %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	.loc 2 121 0
	movl	%gs:4, %eax
	movl	%eax, (%esp)
	call	switchuvm
.LVL39:
	.loc 2 122 0
	movl	$0, %eax
.L19:
	.loc 2 123 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE23:
	.size	growproc, .-growproc
	.globl	fork
	.type	fork, @function
fork:
.LFB24:
	.loc 2 130 0
	.cfi_startproc
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	.cfi_offset 7, -12
	.cfi_offset 6, -16
	.cfi_offset 3, -20
	.loc 2 135 0
	call	allocproc
.LVL40:
	movl	%eax, -32(%ebp)
.LVL41:
	cmpl	$0, -32(%ebp)
	jne	.L21
	.loc 2 136 0
	movl	$-1, %eax
.LVL42:
	jmp	.L22
.LVL43:
.L21:
	.loc 2 139 0
	movl	%gs:4, %eax
.LVL44:
	movl	(%eax), %edx
	movl	%gs:4, %eax
	movl	4(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	copyuvm
.LVL45:
	movl	-32(%ebp), %edx
	movl	%eax, 4(%edx)
	movl	-32(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	.L23
	.loc 2 140 0
	movl	-32(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, (%esp)
	call	kfree
.LVL46:
	.loc 2 141 0
	movl	-32(%ebp), %eax
	movl	$0, 8(%eax)
	.loc 2 142 0
	movl	-32(%ebp), %eax
	movl	$0, 12(%eax)
	.loc 2 143 0
	movl	$-1, %eax
	jmp	.L22
.L23:
	.loc 2 145 0
	movl	%gs:4, %eax
	movl	(%eax), %edx
	movl	-32(%ebp), %eax
	movl	%edx, (%eax)
	.loc 2 146 0
	movl	%gs:4, %edx
	movl	-32(%ebp), %eax
	movl	%edx, 20(%eax)
	.loc 2 147 0
	movl	-32(%ebp), %eax
	movl	24(%eax), %edx
	movl	%gs:4, %eax
	movl	24(%eax), %eax
	movl	%eax, %ebx
	movl	$19, %eax
	movl	%edx, %edi
	movl	%ebx, %esi
	movl	%eax, %ecx
	rep movsl
	.loc 2 150 0
	movl	-32(%ebp), %eax
	movl	24(%eax), %eax
	movl	$0, 28(%eax)
	.loc 2 152 0
	movl	$0, -28(%ebp)
.LVL47:
	jmp	.L24
.LVL48:
.L26:
	.loc 2 153 0
	movl	%gs:4, %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	movl	8(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L25
	.loc 2 154 0
	movl	%gs:4, %eax
	movl	-28(%ebp), %edx
	addl	$8, %edx
	movl	8(%eax,%edx,4), %eax
	movl	%eax, (%esp)
	call	filedup
.LVL49:
	movl	-32(%ebp), %edx
	movl	-28(%ebp), %ecx
	addl	$8, %ecx
	movl	%eax, 8(%edx,%ecx,4)
.L25:
	.loc 2 152 0
	addl	$1, -28(%ebp)
.L24:
	.loc 2 152 0 is_stmt 0 discriminator 1
	cmpl	$15, -28(%ebp)
	jle	.L26
	.loc 2 155 0 is_stmt 1
	movl	%gs:4, %eax
	movl	104(%eax), %eax
	movl	%eax, (%esp)
	call	idup
.LVL50:
	movl	-32(%ebp), %edx
	movl	%eax, 104(%edx)
	.loc 2 157 0
	movl	%gs:4, %eax
	leal	108(%eax), %edx
	movl	-32(%ebp), %eax
	addl	$108, %eax
	movl	$16, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	safestrcpy
.LVL51:
	.loc 2 159 0
	movl	-32(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -36(%ebp)
.LVL52:
	.loc 2 162 0
	movl	$ptable, (%esp)
	call	acquire
.LVL53:
	.loc 2 163 0
	movl	-32(%ebp), %eax
	movl	$3, 12(%eax)
	.loc 2 164 0
	movl	$ptable, (%esp)
	call	release
.LVL54:
	.loc 2 166 0
	movl	-36(%ebp), %eax
.LVL55:
.L22:
	.loc 2 167 0
	addl	$44, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%esi
	.cfi_restore 6
	popl	%edi
	.cfi_restore 7
	popl	%ebp
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL56:
	ret
	.cfi_endproc
.LFE24:
	.size	fork, .-fork
	.section	.rodata
.LC4:
	.string	"init exiting"
.LC5:
	.string	"zombie exit"
	.text
	.globl	exit
	.type	exit, @function
exit:
.LFB25:
	.loc 2 174 0
	.cfi_startproc
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 178 0
	movl	%gs:4, %edx
	movl	initproc, %eax
	cmpl	%eax, %edx
	jne	.L28
	.loc 2 179 0
	movl	$.LC4, (%esp)
	call	panic
.LVL57:
.L28:
	.loc 2 182 0
	movl	$0, -16(%ebp)
.LVL58:
	jmp	.L29
.L31:
	.loc 2 183 0
	movl	%gs:4, %eax
	movl	-16(%ebp), %edx
	addl	$8, %edx
	movl	8(%eax,%edx,4), %eax
	testl	%eax, %eax
	je	.L30
	.loc 2 184 0
	movl	%gs:4, %eax
	movl	-16(%ebp), %edx
	addl	$8, %edx
	movl	8(%eax,%edx,4), %eax
	movl	%eax, (%esp)
	call	fileclose
.LVL59:
	.loc 2 185 0
	movl	%gs:4, %eax
	movl	-16(%ebp), %edx
	addl	$8, %edx
	movl	$0, 8(%eax,%edx,4)
.L30:
	.loc 2 182 0
	addl	$1, -16(%ebp)
.L29:
	.loc 2 182 0 is_stmt 0 discriminator 1
	cmpl	$15, -16(%ebp)
	jle	.L31
	.loc 2 189 0 is_stmt 1
	call	begin_op
.LVL60:
	.loc 2 190 0
	movl	%gs:4, %eax
	movl	104(%eax), %eax
	movl	%eax, (%esp)
	call	iput
.LVL61:
	.loc 2 191 0
	call	end_op
.LVL62:
	.loc 2 192 0
	movl	%gs:4, %eax
	movl	$0, 104(%eax)
	.loc 2 194 0
	movl	$ptable, (%esp)
	call	acquire
.LVL63:
	.loc 2 197 0
	movl	%gs:4, %eax
	movl	20(%eax), %eax
	movl	%eax, (%esp)
	call	wakeup1
.LVL64:
	.loc 2 200 0
	movl	$ptable+52, -12(%ebp)
.LVL65:
	jmp	.L32
.L34:
	.loc 2 201 0
	movl	-12(%ebp), %eax
	movl	20(%eax), %edx
	movl	%gs:4, %eax
	cmpl	%eax, %edx
	jne	.L33
	.loc 2 202 0
	movl	initproc, %edx
	movl	-12(%ebp), %eax
	movl	%edx, 20(%eax)
	.loc 2 203 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$5, %eax
	jne	.L33
	.loc 2 204 0
	movl	initproc, %eax
	movl	%eax, (%esp)
	call	wakeup1
.LVL66:
.L33:
	.loc 2 200 0
	addl	$124, -12(%ebp)
.L32:
	.loc 2 200 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -12(%ebp)
	jb	.L34
	.loc 2 209 0 is_stmt 1
	movl	%gs:4, %eax
	movl	$5, 12(%eax)
	.loc 2 210 0
	call	sched
.LVL67:
	.loc 2 211 0
	movl	$.LC5, (%esp)
	call	panic
.LVL68:
	.cfi_endproc
.LFE25:
	.size	exit, .-exit
	.globl	wait
	.type	wait, @function
wait:
.LFB26:
	.loc 2 218 0
	.cfi_startproc
	pushl	%ebp
.LCFI26:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI27:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 222 0
	movl	$ptable, (%esp)
	call	acquire
.LVL69:
.L43:
	.loc 2 225 0
	movl	$0, -16(%ebp)
.LVL70:
	.loc 2 226 0
	movl	$ptable+52, -12(%ebp)
.LVL71:
	jmp	.L36
.L40:
	.loc 2 227 0
	movl	-12(%ebp), %eax
	movl	20(%eax), %edx
	movl	%gs:4, %eax
	cmpl	%eax, %edx
	je	.L37
	.loc 2 228 0
	jmp	.L38
.L37:
	.loc 2 229 0
	movl	$1, -16(%ebp)
.LVL72:
	.loc 2 230 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$5, %eax
	jne	.L38
	.loc 2 232 0
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	movl	%eax, -20(%ebp)
.LVL73:
	.loc 2 233 0
	movl	-12(%ebp), %eax
.LVL74:
	movl	8(%eax), %eax
.LVL75:
	movl	%eax, (%esp)
.LVL76:
	call	kfree
.LVL77:
	.loc 2 234 0
	movl	-12(%ebp), %eax
	movl	$0, 8(%eax)
	.loc 2 235 0
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	freevm
.LVL78:
	.loc 2 236 0
	movl	-12(%ebp), %eax
	movl	$0, 12(%eax)
	.loc 2 237 0
	movl	-12(%ebp), %eax
	movl	$0, 16(%eax)
	.loc 2 238 0
	movl	-12(%ebp), %eax
	movl	$0, 20(%eax)
	.loc 2 239 0
	movl	-12(%ebp), %eax
	movb	$0, 108(%eax)
	.loc 2 240 0
	movl	-12(%ebp), %eax
	movl	$0, 36(%eax)
	.loc 2 241 0
	movl	$ptable, (%esp)
	call	release
.LVL79:
	.loc 2 242 0
	movl	-20(%ebp), %eax
	jmp	.L39
.LVL80:
.L38:
	.loc 2 226 0
	addl	$124, -12(%ebp)
.LVL81:
.L36:
	.loc 2 226 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -12(%ebp)
	jb	.L40
	.loc 2 247 0 is_stmt 1
	cmpl	$0, -16(%ebp)
	je	.L41
	.loc 2 247 0 is_stmt 0 discriminator 1
	movl	%gs:4, %eax
	movl	36(%eax), %eax
	testl	%eax, %eax
	je	.L42
.L41:
	.loc 2 248 0 is_stmt 1
	movl	$ptable, (%esp)
	call	release
.LVL82:
	.loc 2 249 0
	movl	$-1, %eax
	jmp	.L39
.L42:
	.loc 2 253 0
	movl	%gs:4, %eax
	movl	$ptable, 4(%esp)
	movl	%eax, (%esp)
	call	sleep
.LVL83:
	.loc 2 254 0
	jmp	.L43
.L39:
	.loc 2 255 0
	leave
.LCFI28:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL84:
	ret
	.cfi_endproc
.LFE26:
	.size	wait, .-wait
	.globl	scheduler
	.type	scheduler, @function
scheduler:
.LFB27:
	.loc 2 267 0
	.cfi_startproc
	pushl	%ebp
.LCFI29:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI30:
	.cfi_def_cfa_register 5
	subl	$40, %esp
.L50:
	.loc 2 273 0
	call	sti
.LVL85:
	.loc 2 276 0
	movl	$ptable, (%esp)
	call	acquire
.LVL86:
	.loc 2 277 0
	movl	$0, -16(%ebp)
.LVL87:
	movl	$ptable+52, -12(%ebp)
.LVL88:
	jmp	.L45
.L48:
	.loc 2 278 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$3, %eax
	je	.L46
	.loc 2 279 0
	jmp	.L47
.L46:
	.loc 2 284 0
	movl	$1, -16(%ebp)
.LVL89:
	.loc 2 285 0
	movl	-12(%ebp), %eax
	movl	%eax, %gs:4
	.loc 2 286 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	switchuvm
.LVL90:
	.loc 2 287 0
	movl	-12(%ebp), %eax
	movl	$4, 12(%eax)
	.loc 2 288 0
	movl	%gs:4, %eax
	movl	28(%eax), %eax
	movl	%gs:0, %edx
	addl	$4, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	swtch
.LVL91:
	.loc 2 289 0
	call	switchkvm
.LVL92:
	.loc 2 293 0
	movl	$0, %gs:4
.L47:
	.loc 2 277 0
	addl	$124, -12(%ebp)
.L45:
	.loc 2 277 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -12(%ebp)
	jb	.L48
	.loc 2 295 0 is_stmt 1
	movl	$ptable, (%esp)
	call	release
.LVL93:
	.loc 2 297 0
	cmpl	$0, -16(%ebp)
	jne	.L49
	.loc 2 298 0
	call	halt
.LVL94:
	.loc 2 300 0
	jmp	.L50
.L49:
	jmp	.L50
	.cfi_endproc
.LFE27:
	.size	scheduler, .-scheduler
	.section	.rodata
.LC6:
	.string	"sched ptable.lock"
.LC7:
	.string	"sched locks"
.LC8:
	.string	"sched running"
.LC9:
	.string	"sched interruptible"
	.text
	.globl	sched
	.type	sched, @function
sched:
.LFB28:
	.loc 2 307 0
	.cfi_startproc
	pushl	%ebp
.LCFI31:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI32:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 310 0
	movl	$ptable, (%esp)
	call	holding
.LVL95:
	testl	%eax, %eax
	jne	.L52
	.loc 2 311 0
	movl	$.LC6, (%esp)
	call	panic
.LVL96:
.L52:
	.loc 2 312 0
	movl	%gs:0, %eax
	movl	172(%eax), %eax
	cmpl	$1, %eax
	je	.L53
	.loc 2 313 0
	movl	$.LC7, (%esp)
	call	panic
.LVL97:
.L53:
	.loc 2 314 0
	movl	%gs:4, %eax
	movl	12(%eax), %eax
	cmpl	$4, %eax
	jne	.L54
	.loc 2 315 0
	movl	$.LC8, (%esp)
	call	panic
.LVL98:
.L54:
	.loc 2 316 0
	call	readeflags
.LVL99:
	andl	$512, %eax
	testl	%eax, %eax
	je	.L55
	.loc 2 317 0
	movl	$.LC9, (%esp)
	call	panic
.LVL100:
.L55:
	.loc 2 318 0
	movl	%gs:0, %eax
	movl	176(%eax), %eax
	movl	%eax, -12(%ebp)
.LVL101:
	.loc 2 319 0
	movl	%gs:0, %eax
.LVL102:
	movl	4(%eax), %eax
.LVL103:
	movl	%gs:4, %edx
	addl	$28, %edx
	movl	%eax, 4(%esp)
.LVL104:
	movl	%edx, (%esp)
	call	swtch
.LVL105:
	.loc 2 320 0
	movl	%gs:0, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 176(%eax)
	.loc 2 321 0
	leave
.LCFI33:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL106:
	ret
	.cfi_endproc
.LFE28:
	.size	sched, .-sched
	.globl	yield
	.type	yield, @function
yield:
.LFB29:
	.loc 2 326 0
	.cfi_startproc
	pushl	%ebp
.LCFI34:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI35:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 327 0
	movl	$ptable, (%esp)
	call	acquire
.LVL107:
	.loc 2 328 0
	movl	%gs:4, %eax
	movl	$3, 12(%eax)
	.loc 2 329 0
	call	sched
.LVL108:
	.loc 2 330 0
	movl	$ptable, (%esp)
	call	release
.LVL109:
	.loc 2 331 0
	leave
.LCFI36:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE29:
	.size	yield, .-yield
	.globl	forkret
	.type	forkret, @function
forkret:
.LFB30:
	.loc 2 337 0
	.cfi_startproc
	pushl	%ebp
.LCFI37:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI38:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 340 0
	movl	$ptable, (%esp)
	call	release
.LVL110:
	.loc 2 342 0
	movl	first.1546, %eax
	testl	%eax, %eax
	je	.L57
	.loc 2 346 0
	movl	$0, first.1546
	.loc 2 347 0
	movl	$1, (%esp)
	call	iinit
.LVL111:
	.loc 2 348 0
	movl	$1, (%esp)
	call	initlog
.LVL112:
.L57:
	.loc 2 352 0
	leave
.LCFI39:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE30:
	.size	forkret, .-forkret
	.section	.rodata
.LC10:
	.string	"sleep"
.LC11:
	.string	"sleep without lk"
	.text
	.globl	sleep
	.type	sleep, @function
sleep:
.LFB31:
	.loc 2 358 0
	.cfi_startproc
.LVL113:
	pushl	%ebp
.LCFI40:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI41:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 359 0
	movl	%gs:4, %eax
	testl	%eax, %eax
	jne	.L60
	.loc 2 360 0
	movl	$.LC10, (%esp)
	call	panic
.LVL114:
.L60:
	.loc 2 362 0
	cmpl	$0, 12(%ebp)
	jne	.L61
	.loc 2 363 0
	movl	$.LC11, (%esp)
	call	panic
.LVL115:
.L61:
	.loc 2 371 0
	cmpl	$ptable, 12(%ebp)
	je	.L62
	.loc 2 372 0
	movl	$ptable, (%esp)
	call	acquire
.LVL116:
	.loc 2 373 0
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	release
.LVL117:
.L62:
	.loc 2 377 0
	movl	%gs:4, %eax
	movl	8(%ebp), %edx
	movl	%edx, 32(%eax)
	.loc 2 378 0
	movl	%gs:4, %eax
	movl	$2, 12(%eax)
	.loc 2 379 0
	call	sched
.LVL118:
	.loc 2 382 0
	movl	%gs:4, %eax
	movl	$0, 32(%eax)
	.loc 2 385 0
	cmpl	$ptable, 12(%ebp)
	je	.L59
	.loc 2 386 0
	movl	$ptable, (%esp)
	call	release
.LVL119:
	.loc 2 387 0
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	acquire
.LVL120:
.L59:
	.loc 2 389 0
	leave
.LCFI42:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE31:
	.size	sleep, .-sleep
	.type	wakeup1, @function
wakeup1:
.LFB32:
	.loc 2 396 0
	.cfi_startproc
.LVL121:
	pushl	%ebp
.LCFI43:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI44:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 2 399 0
	movl	$ptable+52, -4(%ebp)
.LVL122:
	jmp	.L65
.L67:
	.loc 2 400 0
	movl	-4(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$2, %eax
	jne	.L66
	.loc 2 400 0 is_stmt 0 discriminator 1
	movl	-4(%ebp), %eax
	movl	32(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	.L66
	.loc 2 401 0 is_stmt 1
	movl	-4(%ebp), %eax
	movl	$3, 12(%eax)
.L66:
	.loc 2 399 0
	addl	$124, -4(%ebp)
.LVL123:
.L65:
	.loc 2 399 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -4(%ebp)
	jb	.L67
	.loc 2 402 0 is_stmt 1
	leave
.LCFI45:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE32:
	.size	wakeup1, .-wakeup1
	.globl	wakeup
	.type	wakeup, @function
wakeup:
.LFB33:
	.loc 2 407 0
	.cfi_startproc
.LVL124:
	pushl	%ebp
.LCFI46:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI47:
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 2 408 0
	movl	$ptable, (%esp)
	call	acquire
.LVL125:
	.loc 2 409 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	wakeup1
.LVL126:
	.loc 2 410 0
	movl	$ptable, (%esp)
	call	release
.LVL127:
	.loc 2 411 0
	leave
.LCFI48:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE33:
	.size	wakeup, .-wakeup
	.globl	kill
	.type	kill, @function
kill:
.LFB34:
	.loc 2 418 0
	.cfi_startproc
.LVL128:
	pushl	%ebp
.LCFI49:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI50:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 2 421 0
	movl	$ptable, (%esp)
	call	acquire
.LVL129:
	.loc 2 422 0
	movl	$ptable+52, -12(%ebp)
.LVL130:
	jmp	.L70
.L74:
	.loc 2 423 0
	movl	-12(%ebp), %eax
	movl	16(%eax), %eax
	cmpl	8(%ebp), %eax
	jne	.L71
	.loc 2 424 0
	movl	-12(%ebp), %eax
	movl	$1, 36(%eax)
	.loc 2 426 0
	movl	-12(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$2, %eax
	jne	.L72
	.loc 2 427 0
	movl	-12(%ebp), %eax
	movl	$3, 12(%eax)
.L72:
	.loc 2 428 0
	movl	$ptable, (%esp)
	call	release
.LVL131:
	.loc 2 429 0
	movl	$0, %eax
	jmp	.L73
.L71:
	.loc 2 422 0
	addl	$124, -12(%ebp)
.LVL132:
.L70:
	.loc 2 422 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -12(%ebp)
	jb	.L74
	.loc 2 432 0 is_stmt 1
	movl	$ptable, (%esp)
	call	release
.LVL133:
	.loc 2 433 0
	movl	$-1, %eax
.L73:
	.loc 2 434 0
	leave
.LCFI51:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE34:
	.size	kill, .-kill
	.section	.rodata
.LC12:
	.string	"???"
.LC13:
	.string	"%d %s %s"
.LC14:
	.string	" %p"
.LC15:
	.string	"\n"
	.text
	.globl	procdump
	.type	procdump, @function
procdump:
.LFB35:
	.loc 2 442 0
	.cfi_startproc
	pushl	%ebp
.LCFI52:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI53:
	.cfi_def_cfa_register 5
	subl	$88, %esp
	.loc 2 456 0
	movl	$ptable+52, -16(%ebp)
.LVL134:
	jmp	.L76
.L84:
	.loc 2 457 0
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	testl	%eax, %eax
	jne	.L77
	.loc 2 458 0
	jmp	.L78
.L77:
	.loc 2 459 0
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$5, %eax
	ja	.L79
	.loc 2 459 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	movl	states.1571(,%eax,4), %eax
	testl	%eax, %eax
	je	.L79
	.loc 2 460 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	movl	states.1571(,%eax,4), %eax
	movl	%eax, -20(%ebp)
.LVL135:
	jmp	.L80
.LVL136:
.L79:
	.loc 2 462 0
	movl	$.LC12, -20(%ebp)
.LVL137:
.L80:
	.loc 2 463 0
	movl	-16(%ebp), %eax
	leal	108(%eax), %edx
	movl	-16(%ebp), %eax
	movl	16(%eax), %eax
	movl	%edx, 12(%esp)
	movl	-20(%ebp), %edx
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	$.LC13, (%esp)
	call	cprintf
.LVL138:
	.loc 2 464 0
	movl	-16(%ebp), %eax
	movl	12(%eax), %eax
	cmpl	$2, %eax
	jne	.L81
	.loc 2 465 0
	movl	-16(%ebp), %eax
	movl	28(%eax), %eax
	movl	12(%eax), %eax
	addl	$8, %eax
	leal	-60(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	getcallerpcs
.LVL139:
	.loc 2 466 0
	movl	$0, -12(%ebp)
.LVL140:
	jmp	.L82
.L83:
	.loc 2 467 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	-60(%ebp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$.LC14, (%esp)
	call	cprintf
.LVL141:
	.loc 2 466 0 discriminator 1
	addl	$1, -12(%ebp)
.L82:
	cmpl	$9, -12(%ebp)
	jg	.L81
	.loc 2 466 0 is_stmt 0 discriminator 2
	movl	-12(%ebp), %eax
	movl	-60(%ebp,%eax,4), %eax
	testl	%eax, %eax
	jne	.L83
.LVL142:
.L81:
	.loc 2 469 0 is_stmt 1
	movl	$.LC15, (%esp)
	call	cprintf
.LVL143:
.L78:
	.loc 2 456 0
	addl	$124, -16(%ebp)
.L76:
	.loc 2 456 0 is_stmt 0 discriminator 1
	cmpl	$ptable+7988, -16(%ebp)
	jb	.L84
	.loc 2 471 0 is_stmt 1
	leave
.LCFI54:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL144:
	ret
	.cfi_endproc
.LFE35:
	.size	procdump, .-procdump
	.data
	.align 4
	.type	first.1546, @object
	.size	first.1546, 4
first.1546:
	.long	1
	.section	.rodata
.LC16:
	.string	"unused"
.LC17:
	.string	"embryo"
.LC18:
	.string	"sleep "
.LC19:
	.string	"runble"
.LC20:
	.string	"run   "
.LC21:
	.string	"zombie"
	.data
	.align 4
	.type	states.1571, @object
	.size	states.1571, 24
states.1571:
	.long	.LC16
	.long	.LC17
	.long	.LC18
	.long	.LC19
	.long	.LC20
	.long	.LC21
	.text
.Letext0:
	.file 3 "types.h"
	.file 4 "mmu.h"
	.file 5 "proc.h"
	.file 6 "spinlock.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1466
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF113
	.byte	0x1
	.long	.LASF114
	.long	.LASF115
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
	.byte	0x4c
	.byte	0x1
	.byte	0x9c
	.long	0x4c1
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
	.long	.LASF33
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
	.long	.LASF34
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
	.uleb128 0xb
	.string	"cpu"
	.byte	0xbc
	.byte	0x5
	.byte	0x5
	.long	0x54f
	.uleb128 0x8
	.string	"id"
	.byte	0x5
	.byte	0x6
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF35
	.byte	0x5
	.byte	0x7
	.long	0x5a2
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
	.long	0x5a8
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x7
	.long	.LASF36
	.byte	0x5
	.byte	0xa
	.long	0x5bf
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x7
	.long	.LASF37
	.byte	0x5
	.byte	0xb
	.long	0x5c4
	.byte	0x3
	.byte	0x23
	.uleb128 0xac
	.uleb128 0x7
	.long	.LASF38
	.byte	0x5
	.byte	0xc
	.long	0x5c4
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x8
	.string	"cpu"
	.byte	0x5
	.byte	0xf
	.long	0x5cb
	.byte	0x3
	.byte	0x23
	.uleb128 0xb4
	.uleb128 0x7
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
	.long	0x54f
	.uleb128 0xc
	.long	0x66
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
	.uleb128 0x8
	.string	"sz"
	.byte	0x5
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF42
	.byte	0x5
	.byte	0x39
	.long	0x6c9
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x7
	.long	.LASF43
	.byte	0x5
	.byte	0x3a
	.long	0x6cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x7
	.long	.LASF44
	.byte	0x5
	.byte	0x3b
	.long	0x698
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x8
	.string	"pid"
	.byte	0x5
	.byte	0x3c
	.long	0x5c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x7
	.long	.LASF45
	.byte	0x5
	.byte	0x3d
	.long	0x692
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
	.long	.LASF40
	.byte	0x5
	.byte	0x3f
	.long	0x5a2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x7
	.long	.LASF46
	.byte	0x5
	.byte	0x40
	.long	0x35a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x7
	.long	.LASF47
	.byte	0x5
	.byte	0x41
	.long	0x5c4
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x7
	.long	.LASF48
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
	.long	.LASF116
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
	.long	0x35c
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
	.uleb128 0x7
	.long	.LASF60
	.byte	0x6
	.byte	0x3
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF49
	.byte	0x6
	.byte	0x6
	.long	0x6cf
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x8
	.string	"cpu"
	.byte	0x6
	.byte	0x7
	.long	0x5cb
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
	.long	0x5b8
	.byte	0x9
	.byte	0
	.uleb128 0x13
	.value	0x1f34
	.byte	0x2
	.byte	0xa
	.long	0x795
	.uleb128 0x7
	.long	.LASF61
	.byte	0x2
	.byte	0xb
	.long	0x71a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x7
	.long	.LASF39
	.byte	0x2
	.byte	0xc
	.long	0x795
	.byte	0x2
	.byte	0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0xc
	.long	0x5d1
	.long	0x7a5
	.uleb128 0xd
	.long	0x5b8
	.byte	0x3f
	.byte	0
	.uleb128 0x14
	.long	.LASF62
	.byte	0x1
	.byte	0x5f
	.byte	0x1
	.long	0x25
	.long	.LFB12
	.long	.LFE12
	.long	.LLST0
	.byte	0x1
	.long	0x7d0
	.uleb128 0x15
	.long	.LASF23
	.byte	0x1
	.byte	0x61
	.long	0x25
	.byte	0x1
	.byte	0x50
	.byte	0
	.uleb128 0x16
	.string	"sti"
	.byte	0x1
	.byte	0x73
	.byte	0x1
	.long	.LFB15
	.long	.LFE15
	.long	.LLST1
	.byte	0x1
	.uleb128 0x17
	.long	.LASF117
	.byte	0x1
	.byte	0x94
	.long	.LFB19
	.long	.LFE19
	.long	.LLST2
	.byte	0x1
	.uleb128 0x18
	.byte	0x1
	.long	.LASF64
	.byte	0x2
	.byte	0x18
	.byte	0x1
	.long	.LFB20
	.long	.LFE20
	.long	.LLST3
	.byte	0x1
	.long	0x832
	.uleb128 0x19
	.long	.LVL1
	.long	0x11cd
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF63
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.long	0x692
	.long	.LFB21
	.long	.LFE21
	.long	.LLST4
	.byte	0x1
	.long	0x8e5
	.uleb128 0x1b
	.string	"p"
	.byte	0x2
	.byte	0x25
	.long	0x692
	.long	.LLST5
	.uleb128 0x1b
	.string	"sp"
	.byte	0x2
	.byte	0x26
	.long	0x6cf
	.long	.LLST6
	.uleb128 0x1c
	.long	.LASF118
	.byte	0x2
	.byte	0x2f
	.long	.L9
	.uleb128 0x1d
	.long	.LVL2
	.long	0x11e6
	.long	0x88d
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL4
	.long	0x11fa
	.long	0x8a5
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1e
	.long	.LVL5
	.long	0x120e
	.uleb128 0x1d
	.long	.LVL7
	.long	0x11fa
	.long	0x8c6
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x19
	.long	.LVL12
	.long	0x121c
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x44
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF65
	.byte	0x2
	.byte	0x4f
	.byte	0x1
	.long	.LFB22
	.long	.LFE22
	.long	.LLST7
	.byte	0x1
	.long	0x9b1
	.uleb128 0x1b
	.string	"p"
	.byte	0x2
	.byte	0x51
	.long	0x692
	.long	.LLST8
	.uleb128 0x1f
	.long	.LASF66
	.byte	0x2
	.byte	0x52
	.long	0x9b1
	.byte	0x1
	.byte	0x1
	.uleb128 0x1f
	.long	.LASF67
	.byte	0x2
	.byte	0x52
	.long	0x9b1
	.byte	0x1
	.byte	0x1
	.uleb128 0x1e
	.long	.LVL15
	.long	0x832
	.uleb128 0x1e
	.long	.LVL17
	.long	0x123e
	.uleb128 0x1d
	.long	.LVL18
	.long	0x124c
	.long	0x950
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x1e
	.long	.LVL19
	.long	0x1260
	.uleb128 0x1d
	.long	.LVL20
	.long	0x121c
	.long	0x974
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x8
	.byte	0x4c
	.byte	0
	.uleb128 0x1d
	.long	.LVL21
	.long	0x127e
	.long	0x99c
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x19
	.long	.LVL22
	.long	0x12ab
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x6d5
	.long	0x9bc
	.uleb128 0x20
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF68
	.byte	0x2
	.byte	0x6c
	.byte	0x1
	.long	0x5c4
	.long	.LFB23
	.long	.LFE23
	.long	.LLST9
	.byte	0x1
	.long	0xa42
	.uleb128 0x22
	.string	"n"
	.byte	0x2
	.byte	0x6c
	.long	0x5c4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.string	"sz"
	.byte	0x2
	.byte	0x6e
	.long	0x25
	.long	.LLST10
	.uleb128 0x1d
	.long	.LVL29
	.long	0x12c3
	.long	0xa16
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x7
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0x22
	.byte	0
	.uleb128 0x1d
	.long	.LVL35
	.long	0x12e5
	.long	0xa38
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x7
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0x22
	.byte	0
	.uleb128 0x1e
	.long	.LVL39
	.long	0x1307
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF69
	.byte	0x2
	.byte	0x81
	.byte	0x1
	.long	0x5c4
	.long	.LFB24
	.long	.LFE24
	.long	.LLST11
	.byte	0x1
	.long	0xb02
	.uleb128 0x1b
	.string	"i"
	.byte	0x2
	.byte	0x83
	.long	0x5c4
	.long	.LLST12
	.uleb128 0x1b
	.string	"pid"
	.byte	0x2
	.byte	0x83
	.long	0x5c4
	.long	.LLST13
	.uleb128 0x1b
	.string	"np"
	.byte	0x2
	.byte	0x84
	.long	0x692
	.long	.LLST14
	.uleb128 0x1e
	.long	.LVL40
	.long	0x832
	.uleb128 0x1e
	.long	.LVL45
	.long	0x131b
	.uleb128 0x1e
	.long	.LVL46
	.long	0x1338
	.uleb128 0x1e
	.long	.LVL49
	.long	0x134c
	.uleb128 0x1e
	.long	.LVL50
	.long	0x1364
	.uleb128 0x1d
	.long	.LVL51
	.long	0x127e
	.long	0xad5
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x75
	.sleb128 -32
	.byte	0x6
	.byte	0x23
	.uleb128 0x6c
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x1d
	.long	.LVL53
	.long	0x11e6
	.long	0xaed
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x19
	.long	.LVL54
	.long	0x11fa
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.byte	0
	.uleb128 0x18
	.byte	0x1
	.long	.LASF70
	.byte	0x2
	.byte	0xad
	.byte	0x1
	.long	.LFB25
	.long	.LFE25
	.long	.LLST15
	.byte	0x1
	.long	0xbb9
	.uleb128 0x23
	.string	"p"
	.byte	0x2
	.byte	0xaf
	.long	0x692
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x23
	.string	"fd"
	.byte	0x2
	.byte	0xb0
	.long	0x5c4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1d
	.long	.LVL57
	.long	0x124c
	.long	0xb4d
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0x1e
	.long	.LVL59
	.long	0x137c
	.uleb128 0x1e
	.long	.LVL60
	.long	0x1390
	.uleb128 0x1e
	.long	.LVL61
	.long	0x139f
	.uleb128 0x1e
	.long	.LVL62
	.long	0x13b3
	.uleb128 0x1d
	.long	.LVL63
	.long	0x11e6
	.long	0xb89
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1e
	.long	.LVL64
	.long	0xf54
	.uleb128 0x1e
	.long	.LVL66
	.long	0xf54
	.uleb128 0x1e
	.long	.LVL67
	.long	0xd13
	.uleb128 0x19
	.long	.LVL68
	.long	0x124c
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC5
	.byte	0
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF71
	.byte	0x2
	.byte	0xd9
	.byte	0x1
	.long	0x5c4
	.long	.LFB26
	.long	.LFE26
	.long	.LLST16
	.byte	0x1
	.long	0xc71
	.uleb128 0x1b
	.string	"p"
	.byte	0x2
	.byte	0xdb
	.long	0x692
	.long	.LLST17
	.uleb128 0x24
	.long	.LASF72
	.byte	0x2
	.byte	0xdc
	.long	0x5c4
	.long	.LLST18
	.uleb128 0x1b
	.string	"pid"
	.byte	0x2
	.byte	0xdc
	.long	0x5c4
	.long	.LLST19
	.uleb128 0x1d
	.long	.LVL69
	.long	0x11e6
	.long	0xc1a
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1e
	.long	.LVL77
	.long	0x1338
	.uleb128 0x1e
	.long	.LVL78
	.long	0x13c2
	.uleb128 0x1d
	.long	.LVL79
	.long	0x11fa
	.long	0xc44
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL82
	.long	0x11fa
	.long	0xc5c
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x19
	.long	.LVL83
	.long	0xe84
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF35
	.byte	0x2
	.value	0x10a
	.byte	0x1
	.long	.LFB27
	.long	.LFE27
	.long	.LLST20
	.byte	0x1
	.long	0xd13
	.uleb128 0x26
	.string	"p"
	.byte	0x2
	.value	0x10c
	.long	0x692
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x26
	.string	"ran"
	.byte	0x2
	.value	0x10d
	.long	0x5c4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x1e
	.long	.LVL85
	.long	0x7d0
	.uleb128 0x1d
	.long	.LVL86
	.long	0x11e6
	.long	0xcc9
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL90
	.long	0x1307
	.long	0xcdf
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x1e
	.long	.LVL91
	.long	0x13d6
	.uleb128 0x1e
	.long	.LVL92
	.long	0x13f5
	.uleb128 0x1d
	.long	.LVL93
	.long	0x11fa
	.long	0xd09
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1e
	.long	.LVL94
	.long	0x7e5
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF73
	.byte	0x2
	.value	0x132
	.byte	0x1
	.long	.LFB28
	.long	.LFE28
	.long	.LLST21
	.byte	0x1
	.long	0xdc9
	.uleb128 0x27
	.long	.LASF38
	.byte	0x2
	.value	0x134
	.long	0x5c4
	.long	.LLST22
	.uleb128 0x1d
	.long	.LVL95
	.long	0x13ff
	.long	0xd56
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL96
	.long	0x124c
	.long	0xd6e
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC6
	.byte	0
	.uleb128 0x1d
	.long	.LVL97
	.long	0x124c
	.long	0xd86
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC7
	.byte	0
	.uleb128 0x1d
	.long	.LVL98
	.long	0x124c
	.long	0xd9e
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC8
	.byte	0
	.uleb128 0x1e
	.long	.LVL99
	.long	0x7a5
	.uleb128 0x1d
	.long	.LVL100
	.long	0x124c
	.long	0xdbf
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC9
	.byte	0
	.uleb128 0x1e
	.long	.LVL105
	.long	0x13d6
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF74
	.byte	0x2
	.value	0x145
	.byte	0x1
	.long	.LFB29
	.long	.LFE29
	.long	.LLST23
	.byte	0x1
	.long	0xe1a
	.uleb128 0x1d
	.long	.LVL107
	.long	0x11e6
	.long	0xdfc
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1e
	.long	.LVL108
	.long	0xd13
	.uleb128 0x19
	.long	.LVL109
	.long	0x11fa
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF75
	.byte	0x2
	.value	0x150
	.byte	0x1
	.long	.LFB30
	.long	.LFE30
	.long	.LLST24
	.byte	0x1
	.long	0xe84
	.uleb128 0x28
	.long	.LASF76
	.byte	0x2
	.value	0x152
	.long	0x5c4
	.byte	0x5
	.byte	0x3
	.long	first.1546
	.uleb128 0x1d
	.long	.LVL110
	.long	0x11fa
	.long	0xe5f
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL111
	.long	0x1417
	.long	0xe73
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x19
	.long	.LVL112
	.long	0x142b
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF77
	.byte	0x2
	.value	0x165
	.byte	0x1
	.long	.LFB31
	.long	.LFE31
	.long	.LLST25
	.byte	0x1
	.long	0xf4e
	.uleb128 0x29
	.long	.LASF46
	.byte	0x2
	.value	0x165
	.long	0x35a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x2a
	.string	"lk"
	.byte	0x2
	.value	0x165
	.long	0xf4e
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1d
	.long	.LVL114
	.long	0x124c
	.long	0xed4
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC10
	.byte	0
	.uleb128 0x1d
	.long	.LVL115
	.long	0x124c
	.long	0xeec
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC11
	.byte	0
	.uleb128 0x1d
	.long	.LVL116
	.long	0x11e6
	.long	0xf04
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL117
	.long	0x11fa
	.long	0xf1a
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.uleb128 0x1e
	.long	.LVL118
	.long	0xd13
	.uleb128 0x1d
	.long	.LVL119
	.long	0x11fa
	.long	0xf3b
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x19
	.long	.LVL120
	.long	0x11e6
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x71a
	.uleb128 0x2b
	.long	.LASF119
	.byte	0x2
	.value	0x18b
	.byte	0x1
	.long	.LFB32
	.long	.LFE32
	.long	.LLST26
	.byte	0x1
	.long	0xf8b
	.uleb128 0x29
	.long	.LASF46
	.byte	0x2
	.value	0x18b
	.long	0x35a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.string	"p"
	.byte	0x2
	.value	0x18d
	.long	0x692
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF78
	.byte	0x2
	.value	0x196
	.byte	0x1
	.long	.LFB33
	.long	.LFE33
	.long	.LLST27
	.byte	0x1
	.long	0xff8
	.uleb128 0x29
	.long	.LASF46
	.byte	0x2
	.value	0x196
	.long	0x35a
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1d
	.long	.LVL125
	.long	0x11e6
	.long	0xfcd
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL126
	.long	0xf54
	.long	0xfe3
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0
	.uleb128 0x19
	.long	.LVL127
	.long	0x11fa
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.byte	0
	.uleb128 0x2c
	.byte	0x1
	.long	.LASF79
	.byte	0x2
	.value	0x1a1
	.byte	0x1
	.long	0x5c4
	.long	.LFB34
	.long	.LFE34
	.long	.LLST28
	.byte	0x1
	.long	0x1078
	.uleb128 0x2a
	.string	"pid"
	.byte	0x2
	.value	0x1a1
	.long	0x5c4
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x26
	.string	"p"
	.byte	0x2
	.value	0x1a3
	.long	0x692
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LVL129
	.long	0x11e6
	.long	0x104b
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x1d
	.long	.LVL131
	.long	0x11fa
	.long	0x1063
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.uleb128 0x19
	.long	.LVL133
	.long	0x11fa
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	ptable
	.byte	0
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF80
	.byte	0x2
	.value	0x1b9
	.byte	0x1
	.long	.LFB35
	.long	.LFE35
	.long	.LLST29
	.byte	0x1
	.long	0x114c
	.uleb128 0x28
	.long	.LASF81
	.byte	0x2
	.value	0x1bb
	.long	0x114c
	.byte	0x5
	.byte	0x3
	.long	states.1571
	.uleb128 0x2d
	.string	"i"
	.byte	0x2
	.value	0x1c3
	.long	0x5c4
	.long	.LLST30
	.uleb128 0x2d
	.string	"p"
	.byte	0x2
	.value	0x1c4
	.long	0x692
	.long	.LLST31
	.uleb128 0x27
	.long	.LASF44
	.byte	0x2
	.value	0x1c5
	.long	0x6cf
	.long	.LLST32
	.uleb128 0x26
	.string	"pc"
	.byte	0x2
	.value	0x1c6
	.long	0x75f
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1d
	.long	.LVL138
	.long	0x143f
	.long	0x110a
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC13
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x75
	.sleb128 -20
	.byte	0x6
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x5
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x1d
	.long	.LVL139
	.long	0x1454
	.long	0x111f
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -60
	.byte	0
	.uleb128 0x1d
	.long	.LVL141
	.long	0x143f
	.long	0x1137
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC14
	.byte	0
	.uleb128 0x19
	.long	.LVL143
	.long	0x143f
	.uleb128 0x1a
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC15
	.byte	0
	.byte	0
	.uleb128 0xc
	.long	0x6cf
	.long	0x115c
	.uleb128 0xd
	.long	0x5b8
	.byte	0x5
	.byte	0
	.uleb128 0x15
	.long	.LASF82
	.byte	0x2
	.byte	0xf
	.long	0x692
	.byte	0x5
	.byte	0x3
	.long	initproc
	.uleb128 0x2e
	.string	"cpu"
	.byte	0x5
	.byte	0x1e
	.long	.LASF120
	.long	0x5cb
	.byte	0x1
	.byte	0x1
	.uleb128 0x2f
	.long	.LASF39
	.byte	0x5
	.byte	0x1f
	.long	.LASF121
	.long	0x692
	.byte	0x1
	.byte	0x1
	.uleb128 0x30
	.long	.LASF83
	.byte	0x2
	.byte	0xd
	.long	0x76f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ptable
	.uleb128 0x30
	.long	.LASF84
	.byte	0x2
	.byte	0x11
	.long	0x5c4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	nextpid
	.uleb128 0x1f
	.long	.LASF66
	.byte	0x2
	.byte	0x52
	.long	0x9b1
	.byte	0x1
	.byte	0x1
	.uleb128 0x1f
	.long	.LASF67
	.byte	0x2
	.byte	0x52
	.long	0x9b1
	.byte	0x1
	.byte	0x1
	.uleb128 0x31
	.byte	0x1
	.long	.LASF85
	.byte	0x7
	.byte	0x81
	.byte	0x1
	.byte	0x1
	.long	0x11e6
	.uleb128 0x32
	.long	0xf4e
	.uleb128 0x32
	.long	0x6cf
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF86
	.byte	0x7
	.byte	0x7e
	.byte	0x1
	.byte	0x1
	.long	0x11fa
	.uleb128 0x32
	.long	0xf4e
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF87
	.byte	0x7
	.byte	0x82
	.byte	0x1
	.byte	0x1
	.long	0x120e
	.uleb128 0x32
	.long	0xf4e
	.byte	0
	.uleb128 0x33
	.byte	0x1
	.long	.LASF88
	.byte	0x7
	.byte	0x42
	.byte	0x1
	.long	0x6cf
	.byte	0x1
	.uleb128 0x34
	.byte	0x1
	.long	.LASF92
	.byte	0x7
	.byte	0x89
	.byte	0x1
	.long	0x35a
	.byte	0x1
	.long	0x123e
	.uleb128 0x32
	.long	0x35a
	.uleb128 0x32
	.long	0x5c4
	.uleb128 0x32
	.long	0x25
	.byte	0
	.uleb128 0x33
	.byte	0x1
	.long	.LASF89
	.byte	0x7
	.byte	0xa9
	.byte	0x1
	.long	0x6c9
	.byte	0x1
	.uleb128 0x31
	.byte	0x1
	.long	.LASF90
	.byte	0x7
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0x1260
	.uleb128 0x32
	.long	0x6cf
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF91
	.byte	0x7
	.byte	0xae
	.byte	0x1
	.byte	0x1
	.long	0x127e
	.uleb128 0x32
	.long	0x6c9
	.uleb128 0x32
	.long	0x6cf
	.uleb128 0x32
	.long	0x25
	.byte	0
	.uleb128 0x34
	.byte	0x1
	.long	.LASF93
	.byte	0x7
	.byte	0x8a
	.byte	0x1
	.long	0x6cf
	.byte	0x1
	.long	0x12a0
	.uleb128 0x32
	.long	0x6cf
	.uleb128 0x32
	.long	0x12a0
	.uleb128 0x32
	.long	0x5c4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x12a6
	.uleb128 0x35
	.long	0x6d5
	.uleb128 0x34
	.byte	0x1
	.long	.LASF94
	.byte	0x7
	.byte	0x31
	.byte	0x1
	.long	0x704
	.byte	0x1
	.long	0x12c3
	.uleb128 0x32
	.long	0x6cf
	.byte	0
	.uleb128 0x34
	.byte	0x1
	.long	.LASF95
	.byte	0x7
	.byte	0xab
	.byte	0x1
	.long	0x5c4
	.byte	0x1
	.long	0x12e5
	.uleb128 0x32
	.long	0x6c9
	.uleb128 0x32
	.long	0x25
	.uleb128 0x32
	.long	0x25
	.byte	0
	.uleb128 0x34
	.byte	0x1
	.long	.LASF96
	.byte	0x7
	.byte	0xac
	.byte	0x1
	.long	0x5c4
	.byte	0x1
	.long	0x1307
	.uleb128 0x32
	.long	0x6c9
	.uleb128 0x32
	.long	0x25
	.uleb128 0x32
	.long	0x25
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF97
	.byte	0x7
	.byte	0xb1
	.byte	0x1
	.byte	0x1
	.long	0x131b
	.uleb128 0x32
	.long	0x692
	.byte	0
	.uleb128 0x34
	.byte	0x1
	.long	.LASF98
	.byte	0x7
	.byte	0xb0
	.byte	0x1
	.long	0x6c9
	.byte	0x1
	.long	0x1338
	.uleb128 0x32
	.long	0x6c9
	.uleb128 0x32
	.long	0x25
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF99
	.byte	0x7
	.byte	0x43
	.byte	0x1
	.byte	0x1
	.long	0x134c
	.uleb128 0x32
	.long	0x6cf
	.byte	0
	.uleb128 0x34
	.byte	0x1
	.long	.LASF100
	.byte	0x7
	.byte	0x1e
	.byte	0x1
	.long	0x6f2
	.byte	0x1
	.long	0x1364
	.uleb128 0x32
	.long	0x6f2
	.byte	0
	.uleb128 0x34
	.byte	0x1
	.long	.LASF101
	.byte	0x7
	.byte	0x29
	.byte	0x1
	.long	0x704
	.byte	0x1
	.long	0x137c
	.uleb128 0x32
	.long	0x704
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF102
	.byte	0x7
	.byte	0x1d
	.byte	0x1
	.byte	0x1
	.long	0x1390
	.uleb128 0x32
	.long	0x6f2
	.byte	0
	.uleb128 0x36
	.byte	0x1
	.long	.LASF104
	.byte	0x7
	.byte	0x56
	.byte	0x1
	.long	0x139f
	.uleb128 0x37
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF103
	.byte	0x7
	.byte	0x2c
	.byte	0x1
	.byte	0x1
	.long	0x13b3
	.uleb128 0x32
	.long	0x704
	.byte	0
	.uleb128 0x36
	.byte	0x1
	.long	.LASF105
	.byte	0x7
	.byte	0x57
	.byte	0x1
	.long	0x13c2
	.uleb128 0x37
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF106
	.byte	0x7
	.byte	0xad
	.byte	0x1
	.byte	0x1
	.long	0x13d6
	.uleb128 0x32
	.long	0x6c9
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF107
	.byte	0x7
	.byte	0x7b
	.byte	0x1
	.byte	0x1
	.long	0x13ef
	.uleb128 0x32
	.long	0x13ef
	.uleb128 0x32
	.long	0x5a2
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x5a2
	.uleb128 0x38
	.byte	0x1
	.long	.LASF122
	.byte	0x7
	.byte	0xb2
	.byte	0x1
	.byte	0x1
	.uleb128 0x34
	.byte	0x1
	.long	.LASF108
	.byte	0x7
	.byte	0x80
	.byte	0x1
	.long	0x5c4
	.byte	0x1
	.long	0x1417
	.uleb128 0x32
	.long	0xf4e
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF109
	.byte	0x7
	.byte	0x2a
	.byte	0x1
	.byte	0x1
	.long	0x142b
	.uleb128 0x32
	.long	0x5c4
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF110
	.byte	0x7
	.byte	0x54
	.byte	0x1
	.byte	0x1
	.long	0x143f
	.uleb128 0x32
	.long	0x5c4
	.byte	0
	.uleb128 0x31
	.byte	0x1
	.long	.LASF111
	.byte	0x7
	.byte	0x14
	.byte	0x1
	.byte	0x1
	.long	0x1454
	.uleb128 0x32
	.long	0x6cf
	.uleb128 0x37
	.byte	0
	.uleb128 0x39
	.byte	0x1
	.long	.LASF112
	.byte	0x7
	.byte	0x7f
	.byte	0x1
	.byte	0x1
	.uleb128 0x32
	.long	0x35a
	.uleb128 0x32
	.long	0x354
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x21
	.byte	0
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x2c
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
	.uleb128 0x2d
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
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
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
	.uleb128 0x32
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x35
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x36
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
	.uleb128 0x37
	.uleb128 0x18
	.byte	0
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
	.long	.LFB12-.Ltext0
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
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LFB15-.Ltext0
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
	.long	.LFE15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST2:
	.long	.LFB19-.Ltext0
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
	.long	.LFE19-.Ltext0
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
	.long	.LVL3-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL14-.Ltext0
	.long	.LFE21-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST6:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL9-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST7:
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
.LLST8:
	.long	.LVL16-.Ltext0
	.long	.LVL17-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL17-1-.Ltext0
	.long	.LVL23-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL23-.Ltext0
	.long	.LFE22-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST9:
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
.LLST10:
	.long	.LVL25-.Ltext0
	.long	.LVL26-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 0
	.long	.LVL28-.Ltext0
	.long	.LVL30-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL34-.Ltext0
	.long	.LVL36-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL36-.Ltext0
	.long	.LVL37-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL37-.Ltext0
	.long	.LFE23-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST11:
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
.LLST12:
	.long	.LVL47-.Ltext0
	.long	.LVL48-.Ltext0
	.value	0x1
	.byte	0x51
	.long	.LVL48-.Ltext0
	.long	.LVL55-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -28
	.long	0
	.long	0
.LLST13:
	.long	.LVL52-.Ltext0
	.long	.LVL53-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL53-1-.Ltext0
	.long	.LVL55-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -36
	.long	0
	.long	0
.LLST14:
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -32
	.long	.LVL43-.Ltext0
	.long	.LVL44-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL44-.Ltext0
	.long	.LVL56-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -32
	.long	.LVL56-.Ltext0
	.long	.LFE24-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -40
	.long	0
	.long	0
.LLST15:
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
	.long	.LFE25-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST16:
	.long	.LFB26-.Ltext0
	.long	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI26-.Ltext0
	.long	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI27-.Ltext0
	.long	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI28-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST17:
	.long	.LVL71-.Ltext0
	.long	.LVL84-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL84-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST18:
	.long	.LVL70-.Ltext0
	.long	.LVL84-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL84-.Ltext0
	.long	.LFE26-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST19:
	.long	.LVL73-.Ltext0
	.long	.LVL74-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL74-.Ltext0
	.long	.LVL75-.Ltext0
	.value	0x2
	.byte	0x70
	.sleb128 16
	.long	.LVL75-.Ltext0
	.long	.LVL76-.Ltext0
	.value	0x5
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x10
	.long	.LVL76-.Ltext0
	.long	.LVL80-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	0
	.long	0
.LLST20:
	.long	.LFB27-.Ltext0
	.long	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI29-.Ltext0
	.long	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI30-.Ltext0
	.long	.LFE27-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	0
	.long	0
.LLST21:
	.long	.LFB28-.Ltext0
	.long	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI31-.Ltext0
	.long	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI32-.Ltext0
	.long	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI33-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST22:
	.long	.LVL101-.Ltext0
	.long	.LVL102-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL102-.Ltext0
	.long	.LVL103-.Ltext0
	.value	0x3
	.byte	0x70
	.sleb128 176
	.long	.LVL104-.Ltext0
	.long	.LVL106-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL106-.Ltext0
	.long	.LFE28-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST23:
	.long	.LFB29-.Ltext0
	.long	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI34-.Ltext0
	.long	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI35-.Ltext0
	.long	.LCFI36-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI36-.Ltext0
	.long	.LFE29-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST24:
	.long	.LFB30-.Ltext0
	.long	.LCFI37-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI37-.Ltext0
	.long	.LCFI38-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI38-.Ltext0
	.long	.LCFI39-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI39-.Ltext0
	.long	.LFE30-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST25:
	.long	.LFB31-.Ltext0
	.long	.LCFI40-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI40-.Ltext0
	.long	.LCFI41-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI41-.Ltext0
	.long	.LCFI42-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI42-.Ltext0
	.long	.LFE31-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST26:
	.long	.LFB32-.Ltext0
	.long	.LCFI43-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI43-.Ltext0
	.long	.LCFI44-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI44-.Ltext0
	.long	.LCFI45-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI45-.Ltext0
	.long	.LFE32-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST27:
	.long	.LFB33-.Ltext0
	.long	.LCFI46-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI46-.Ltext0
	.long	.LCFI47-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI47-.Ltext0
	.long	.LCFI48-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI48-.Ltext0
	.long	.LFE33-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST28:
	.long	.LFB34-.Ltext0
	.long	.LCFI49-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI49-.Ltext0
	.long	.LCFI50-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI50-.Ltext0
	.long	.LCFI51-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI51-.Ltext0
	.long	.LFE34-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST29:
	.long	.LFB35-.Ltext0
	.long	.LCFI52-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	.LCFI52-.Ltext0
	.long	.LCFI53-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 8
	.long	.LCFI53-.Ltext0
	.long	.LCFI54-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 8
	.long	.LCFI54-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST30:
	.long	.LVL140-.Ltext0
	.long	.LVL142-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST31:
	.long	.LVL134-.Ltext0
	.long	.LVL144-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	.LVL144-.Ltext0
	.long	.LFE35-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST32:
	.long	.LVL135-.Ltext0
	.long	.LVL136-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL137-.Ltext0
	.long	.LVL143-.Ltext0
	.value	0x2
	.byte	0x75
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
.LASF91:
	.string	"inituvm"
.LASF107:
	.string	"swtch"
.LASF62:
	.string	"readeflags"
.LASF51:
	.string	"EMBRYO"
.LASF58:
	.string	"inode"
.LASF53:
	.string	"RUNNABLE"
.LASF44:
	.string	"state"
.LASF120:
	.string	"%gs:0"
.LASF81:
	.string	"states"
.LASF104:
	.string	"begin_op"
.LASF87:
	.string	"release"
.LASF121:
	.string	"%gs:4"
.LASF8:
	.string	"base_15_0"
.LASF41:
	.string	"sizetype"
.LASF23:
	.string	"eflags"
.LASF55:
	.string	"ZOMBIE"
.LASF63:
	.string	"allocproc"
.LASF99:
	.string	"kfree"
.LASF12:
	.string	"rsv1"
.LASF90:
	.string	"panic"
.LASF14:
	.string	"segdesc"
.LASF85:
	.string	"initlock"
.LASF89:
	.string	"setupkvm"
.LASF0:
	.string	"uint"
.LASF110:
	.string	"initlog"
.LASF57:
	.string	"file"
.LASF80:
	.string	"procdump"
.LASF105:
	.string	"end_op"
.LASF113:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF69:
	.string	"fork"
.LASF78:
	.string	"wakeup"
.LASF86:
	.string	"acquire"
.LASF68:
	.string	"growproc"
.LASF83:
	.string	"ptable"
.LASF47:
	.string	"killed"
.LASF101:
	.string	"idup"
.LASF122:
	.string	"switchkvm"
.LASF98:
	.string	"copyuvm"
.LASF71:
	.string	"wait"
.LASF111:
	.string	"cprintf"
.LASF64:
	.string	"pinit"
.LASF16:
	.string	"link"
.LASF9:
	.string	"base_23_16"
.LASF46:
	.string	"chan"
.LASF82:
	.string	"initproc"
.LASF93:
	.string	"safestrcpy"
.LASF112:
	.string	"getcallerpcs"
.LASF66:
	.string	"_binary_initcode_start"
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
.LASF119:
	.string	"wakeup1"
.LASF13:
	.string	"base_31_24"
.LASF4:
	.string	"uchar"
.LASF97:
	.string	"switchuvm"
.LASF25:
	.string	"padding5"
.LASF61:
	.string	"lock"
.LASF75:
	.string	"forkret"
.LASF45:
	.string	"parent"
.LASF28:
	.string	"padding8"
.LASF7:
	.string	"lim_15_0"
.LASF52:
	.string	"SLEEPING"
.LASF48:
	.string	"ofile"
.LASF5:
	.string	"unsigned char"
.LASF27:
	.string	"padding7"
.LASF79:
	.string	"kill"
.LASF114:
	.string	"proc.c"
.LASF106:
	.string	"freevm"
.LASF31:
	.string	"iomb"
.LASF39:
	.string	"proc"
.LASF10:
	.string	"type"
.LASF72:
	.string	"havekids"
.LASF2:
	.string	"unsigned int"
.LASF65:
	.string	"userinit"
.LASF40:
	.string	"context"
.LASF102:
	.string	"fileclose"
.LASF77:
	.string	"sleep"
.LASF54:
	.string	"RUNNING"
.LASF36:
	.string	"started"
.LASF43:
	.string	"kstack"
.LASF3:
	.string	"short unsigned int"
.LASF84:
	.string	"nextpid"
.LASF17:
	.string	"esp0"
.LASF19:
	.string	"esp1"
.LASF21:
	.string	"esp2"
.LASF56:
	.string	"char"
.LASF60:
	.string	"locked"
.LASF117:
	.string	"halt"
.LASF94:
	.string	"namei"
.LASF96:
	.string	"deallocuvm"
.LASF50:
	.string	"UNUSED"
.LASF30:
	.string	"padding10"
.LASF74:
	.string	"yield"
.LASF70:
	.string	"exit"
.LASF67:
	.string	"_binary_initcode_size"
.LASF100:
	.string	"filedup"
.LASF38:
	.string	"intena"
.LASF118:
	.string	"found"
.LASF35:
	.string	"scheduler"
.LASF15:
	.string	"taskstate"
.LASF59:
	.string	"spinlock"
.LASF11:
	.string	"lim_19_16"
.LASF109:
	.string	"iinit"
.LASF92:
	.string	"memset"
.LASF95:
	.string	"allocuvm"
.LASF115:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF73:
	.string	"sched"
.LASF49:
	.string	"name"
.LASF103:
	.string	"iput"
.LASF33:
	.string	"oesp"
.LASF32:
	.string	"trapframe"
.LASF116:
	.string	"procstate"
.LASF42:
	.string	"pgdir"
.LASF108:
	.string	"holding"
.LASF37:
	.string	"ncli"
.LASF34:
	.string	"trapno"
.LASF76:
	.string	"first"
.LASF88:
	.string	"kalloc"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
