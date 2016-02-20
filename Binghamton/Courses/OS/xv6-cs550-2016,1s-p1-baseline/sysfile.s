	.file	"sysfile.c"
	.text
.Ltext0:
	.type	argfd, @function
argfd:
.LFB0:
	.file 1 "sysfile.c"
	.loc 1 21 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 25 0
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	argint
.LVL1:
	testl	%eax, %eax
	jns	.L2
	.loc 1 26 0
	movl	$-1, %eax
	jmp	.L8
.L2:
	.loc 1 27 0
	movl	-16(%ebp), %eax
	testl	%eax, %eax
	js	.L4
	.loc 1 27 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	cmpl	$15, %eax
	jg	.L4
	movl	%gs:4, %eax
	movl	-16(%ebp), %edx
	addl	$8, %edx
	movl	8(%eax,%edx,4), %eax
	movl	%eax, -12(%ebp)
.LVL2:
	cmpl	$0, -12(%ebp)
	jne	.L5
.LVL3:
.L4:
	.loc 1 28 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L8
.LVL4:
.L5:
	.loc 1 29 0
	cmpl	$0, 12(%ebp)
	je	.L6
	.loc 1 30 0
	movl	-16(%ebp), %edx
	movl	12(%ebp), %eax
.LVL5:
	movl	%edx, (%eax)
.LVL6:
.L6:
	.loc 1 31 0
	cmpl	$0, 16(%ebp)
	je	.L7
	.loc 1 32 0
	movl	16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
.L7:
	.loc 1 33 0
	movl	$0, %eax
.LVL7:
.L8:
	.loc 1 34 0
	leave
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	argfd, .-argfd
	.type	fdalloc, @function
fdalloc:
.LFB1:
	.loc 1 40 0
	.cfi_startproc
.LVL8:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	subl	$16, %esp
	.loc 1 43 0
	movl	$0, -4(%ebp)
.LVL9:
	jmp	.L10
.L13:
	.loc 1 44 0
	movl	%gs:4, %eax
	movl	-4(%ebp), %edx
	addl	$8, %edx
	movl	8(%eax,%edx,4), %eax
	testl	%eax, %eax
	jne	.L11
	.loc 1 45 0
	movl	%gs:4, %eax
	movl	-4(%ebp), %edx
	leal	8(%edx), %ecx
	movl	8(%ebp), %edx
	movl	%edx, 8(%eax,%ecx,4)
	.loc 1 46 0
	movl	-4(%ebp), %eax
	jmp	.L12
.L11:
	.loc 1 43 0
	addl	$1, -4(%ebp)
.LVL10:
.L10:
	.loc 1 43 0 is_stmt 0 discriminator 1
	cmpl	$15, -4(%ebp)
	jle	.L13
	.loc 1 49 0 is_stmt 1
	movl	$-1, %eax
.L12:
	.loc 1 50 0
	leave
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	fdalloc, .-fdalloc
	.globl	sys_dup
	.type	sys_dup, @function
sys_dup:
.LFB2:
	.loc 1 54 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 58 0
	leal	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	argfd
.LVL11:
	testl	%eax, %eax
	jns	.L15
	.loc 1 59 0
	movl	$-1, %eax
	jmp	.L18
.L15:
	.loc 1 60 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	fdalloc
.LVL12:
	movl	%eax, -12(%ebp)
.LVL13:
	cmpl	$0, -12(%ebp)
	jns	.L17
	.loc 1 61 0
	movl	$-1, %eax
.LVL14:
	jmp	.L18
.LVL15:
.L17:
	.loc 1 62 0
	movl	-16(%ebp), %eax
.LVL16:
	movl	%eax, (%esp)
	call	filedup
.LVL17:
	.loc 1 63 0
	movl	-12(%ebp), %eax
.LVL18:
.L18:
	.loc 1 64 0
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	sys_dup, .-sys_dup
	.globl	sys_read
	.type	sys_read, @function
sys_read:
.LFB3:
	.loc 1 68 0
	.cfi_startproc
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 73 0
	leal	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	argfd
.LVL19:
	testl	%eax, %eax
	js	.L20
	.loc 1 73 0 is_stmt 0 discriminator 1
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	argint
.LVL20:
	testl	%eax, %eax
	js	.L20
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argptr
.LVL21:
	testl	%eax, %eax
	jns	.L21
.L20:
	.loc 1 74 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L23
.L21:
	.loc 1 75 0
	movl	-16(%ebp), %ecx
	movl	-20(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fileread
.LVL22:
.L23:
	.loc 1 76 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	sys_read, .-sys_read
	.globl	sys_write
	.type	sys_write, @function
sys_write:
.LFB4:
	.loc 1 80 0
	.cfi_startproc
	pushl	%ebp
.LCFI12:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI13:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 85 0
	leal	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	argfd
.LVL23:
	testl	%eax, %eax
	js	.L25
	.loc 1 85 0 is_stmt 0 discriminator 1
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	argint
.LVL24:
	testl	%eax, %eax
	js	.L25
	movl	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argptr
.LVL25:
	testl	%eax, %eax
	jns	.L26
.L25:
	.loc 1 86 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L28
.L26:
	.loc 1 87 0
	movl	-16(%ebp), %ecx
	movl	-20(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%ecx, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	filewrite
.LVL26:
.L28:
	.loc 1 88 0
	leave
.LCFI14:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	sys_write, .-sys_write
	.globl	sys_close
	.type	sys_close, @function
sys_close:
.LFB5:
	.loc 1 92 0
	.cfi_startproc
	pushl	%ebp
.LCFI15:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI16:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 96 0
	leal	-16(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argfd
.LVL27:
	testl	%eax, %eax
	jns	.L30
	.loc 1 97 0
	movl	$-1, %eax
	jmp	.L32
.L30:
	.loc 1 98 0
	movl	%gs:4, %eax
	movl	-12(%ebp), %edx
	addl	$8, %edx
	movl	$0, 8(%eax,%edx,4)
	.loc 1 99 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	fileclose
.LVL28:
	.loc 1 100 0
	movl	$0, %eax
.L32:
	.loc 1 101 0
	leave
.LCFI17:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	sys_close, .-sys_close
	.globl	sys_fstat
	.type	sys_fstat, @function
sys_fstat:
.LFB6:
	.loc 1 105 0
	.cfi_startproc
	pushl	%ebp
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI19:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 109 0
	leal	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	$0, 4(%esp)
	movl	$0, (%esp)
	call	argfd
.LVL29:
	testl	%eax, %eax
	js	.L34
	.loc 1 109 0 is_stmt 0 discriminator 1
	movl	$20, 8(%esp)
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argptr
.LVL30:
	testl	%eax, %eax
	jns	.L35
.L34:
	.loc 1 110 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L37
.L35:
	.loc 1 111 0
	movl	-16(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	filestat
.LVL31:
.L37:
	.loc 1 112 0
	leave
.LCFI20:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	sys_fstat, .-sys_fstat
	.globl	sys_link
	.type	sys_link, @function
sys_link:
.LFB7:
	.loc 1 117 0
	.cfi_startproc
	pushl	%ebp
.LCFI21:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI22:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 121 0
	leal	-40(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL32:
	testl	%eax, %eax
	js	.L39
	.loc 1 121 0 is_stmt 0 discriminator 1
	leal	-36(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argstr
.LVL33:
	testl	%eax, %eax
	jns	.L40
.L39:
	.loc 1 122 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L48
.L40:
	.loc 1 124 0
	call	begin_op
.LVL34:
	.loc 1 125 0
	movl	-40(%ebp), %eax
	movl	%eax, (%esp)
	call	namei
.LVL35:
	movl	%eax, -12(%ebp)
.LVL36:
	cmpl	$0, -12(%ebp)
	jne	.L42
	.loc 1 126 0
	call	end_op
.LVL37:
	.loc 1 127 0
	movl	$-1, %eax
	jmp	.L48
.LVL38:
.L42:
	.loc 1 130 0
	movl	-12(%ebp), %eax
.LVL39:
	movl	%eax, (%esp)
	call	ilock
.LVL40:
	.loc 1 131 0
	movl	-12(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	jne	.L43
	.loc 1 132 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL41:
	.loc 1 133 0
	call	end_op
.LVL42:
	.loc 1 134 0
	movl	$-1, %eax
	jmp	.L48
.L43:
	.loc 1 137 0
	movl	-12(%ebp), %eax
	movzwl	22(%eax), %eax
	leal	1(%eax), %edx
	movl	-12(%ebp), %eax
	movw	%dx, 22(%eax)
	.loc 1 138 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iupdate
.LVL43:
	.loc 1 139 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlock
.LVL44:
	.loc 1 141 0
	movl	-36(%ebp), %eax
	leal	-30(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	nameiparent
.LVL45:
	movl	%eax, -16(%ebp)
.LVL46:
	cmpl	$0, -16(%ebp)
	jne	.L44
	.loc 1 142 0
	jmp	.L45
.L44:
	.loc 1 143 0
	movl	-16(%ebp), %eax
.LVL47:
	movl	%eax, (%esp)
	call	ilock
.LVL48:
	.loc 1 144 0
	movl	-16(%ebp), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	(%eax), %eax
	cmpl	%eax, %edx
	jne	.L46
	.loc 1 144 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	leal	-30(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	dirlink
.LVL49:
	testl	%eax, %eax
	jns	.L47
.L46:
	.loc 1 145 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL50:
	.loc 1 146 0
	jmp	.L45
.L47:
	.loc 1 148 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL51:
	.loc 1 149 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iput
.LVL52:
	.loc 1 151 0
	call	end_op
.LVL53:
	.loc 1 153 0
	movl	$0, %eax
	jmp	.L48
.L45:
	.loc 1 156 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	ilock
.LVL54:
	.loc 1 157 0
	movl	-12(%ebp), %eax
	movzwl	22(%eax), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	movw	%dx, 22(%eax)
	.loc 1 158 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iupdate
.LVL55:
	.loc 1 159 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL56:
	.loc 1 160 0
	call	end_op
.LVL57:
	.loc 1 161 0
	movl	$-1, %eax
.LVL58:
.L48:
	.loc 1 162 0
	leave
.LCFI23:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	sys_link, .-sys_link
	.section	.rodata
.LC0:
	.string	"isdirempty: readi"
	.text
	.type	isdirempty, @function
isdirempty:
.LFB8:
	.loc 1 167 0
	.cfi_startproc
.LVL59:
	pushl	%ebp
.LCFI24:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI25:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 171 0
	movl	$32, -12(%ebp)
.LVL60:
	jmp	.L50
.LVL61:
.L54:
	.loc 1 172 0
	movl	-12(%ebp), %eax
	movl	$16, 12(%esp)
	movl	%eax, 8(%esp)
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	readi
.LVL62:
	cmpl	$16, %eax
	je	.L51
	.loc 1 173 0
	movl	$.LC0, (%esp)
	call	panic
.LVL63:
.L51:
	.loc 1 174 0
	movzwl	-28(%ebp), %eax
	testw	%ax, %ax
	je	.L52
	.loc 1 175 0
	movl	$0, %eax
	jmp	.L55
.L52:
	.loc 1 171 0
	movl	-12(%ebp), %eax
	addl	$16, %eax
	movl	%eax, -12(%ebp)
.LVL64:
.L50:
	.loc 1 171 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %edx
	movl	8(%ebp), %eax
	movl	24(%eax), %eax
	cmpl	%eax, %edx
	jb	.L54
	.loc 1 177 0 is_stmt 1
	movl	$1, %eax
.L55:
	.loc 1 178 0
	leave
.LCFI26:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	isdirempty, .-isdirempty
	.section	.rodata
.LC1:
	.string	"."
.LC2:
	.string	".."
.LC3:
	.string	"unlink: nlink < 1"
.LC4:
	.string	"unlink: writei"
	.text
	.globl	sys_unlink
	.type	sys_unlink, @function
sys_unlink:
.LFB9:
	.loc 1 183 0
	.cfi_startproc
	pushl	%ebp
.LCFI27:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI28:
	.cfi_def_cfa_register 5
	subl	$72, %esp
	.loc 1 189 0
	leal	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL65:
	testl	%eax, %eax
	jns	.L57
	.loc 1 190 0
	movl	$-1, %eax
	jmp	.L66
.L57:
	.loc 1 192 0
	call	begin_op
.LVL66:
	.loc 1 193 0
	movl	-52(%ebp), %eax
	leal	-46(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	nameiparent
.LVL67:
	movl	%eax, -12(%ebp)
.LVL68:
	cmpl	$0, -12(%ebp)
	jne	.L59
	.loc 1 194 0
	call	end_op
.LVL69:
	.loc 1 195 0
	movl	$-1, %eax
	jmp	.L66
.LVL70:
.L59:
	.loc 1 198 0
	movl	-12(%ebp), %eax
.LVL71:
	movl	%eax, (%esp)
	call	ilock
.LVL72:
	.loc 1 201 0
	movl	$.LC1, 4(%esp)
	leal	-46(%ebp), %eax
	movl	%eax, (%esp)
	call	namecmp
.LVL73:
	testl	%eax, %eax
	je	.L60
	.loc 1 201 0 is_stmt 0 discriminator 1
	movl	$.LC2, 4(%esp)
	leal	-46(%ebp), %eax
	movl	%eax, (%esp)
	call	namecmp
.LVL74:
	testl	%eax, %eax
	je	.L60
	.loc 1 204 0 is_stmt 1
	leal	-56(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-46(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	dirlookup
.LVL75:
	movl	%eax, -16(%ebp)
.LVL76:
	cmpl	$0, -16(%ebp)
	jne	.L61
	.loc 1 205 0
	jmp	.L60
.L61:
	.loc 1 206 0
	movl	-16(%ebp), %eax
.LVL77:
	movl	%eax, (%esp)
	call	ilock
.LVL78:
	.loc 1 208 0
	movl	-16(%ebp), %eax
	movzwl	22(%eax), %eax
	testw	%ax, %ax
	jg	.L62
	.loc 1 209 0
	movl	$.LC3, (%esp)
	call	panic
.LVL79:
.L62:
	.loc 1 210 0
	movl	-16(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	jne	.L63
	.loc 1 210 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	isdirempty
.LVL80:
	testl	%eax, %eax
	jne	.L63
	.loc 1 211 0 is_stmt 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL81:
	.loc 1 212 0
	jmp	.L60
.L63:
	.loc 1 215 0
	movl	$16, 8(%esp)
	movl	$0, 4(%esp)
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
.LVL82:
	.loc 1 216 0
	movl	-56(%ebp), %eax
	movl	$16, 12(%esp)
	movl	%eax, 8(%esp)
	leal	-32(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	writei
.LVL83:
	cmpl	$16, %eax
	je	.L64
	.loc 1 217 0
	movl	$.LC4, (%esp)
	call	panic
.LVL84:
.L64:
	.loc 1 218 0
	movl	-16(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	jne	.L65
	.loc 1 219 0
	movl	-12(%ebp), %eax
	movzwl	22(%eax), %eax
	leal	-1(%eax), %edx
	movl	-12(%ebp), %eax
	movw	%dx, 22(%eax)
	.loc 1 220 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iupdate
.LVL85:
.L65:
	.loc 1 222 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL86:
	.loc 1 224 0
	movl	-16(%ebp), %eax
	movzwl	22(%eax), %eax
	leal	-1(%eax), %edx
	movl	-16(%ebp), %eax
	movw	%dx, 22(%eax)
	.loc 1 225 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iupdate
.LVL87:
	.loc 1 226 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL88:
	.loc 1 228 0
	call	end_op
.LVL89:
	.loc 1 230 0
	movl	$0, %eax
	jmp	.L66
.LVL90:
.L60:
	.loc 1 233 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL91:
	.loc 1 234 0
	call	end_op
.LVL92:
	.loc 1 235 0
	movl	$-1, %eax
.LVL93:
.L66:
	.loc 1 236 0
	leave
.LCFI29:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	sys_unlink, .-sys_unlink
	.section	.rodata
.LC5:
	.string	"create: ialloc"
.LC6:
	.string	"create dots"
.LC7:
	.string	"create: dirlink"
	.text
	.type	create, @function
create:
.LFB10:
	.loc 1 240 0
	.cfi_startproc
.LVL94:
	pushl	%ebp
.LCFI30:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI31:
	.cfi_def_cfa_register 5
	subl	$72, %esp
	movl	12(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	20(%ebp), %eax
	movw	%cx, -44(%ebp)
	movw	%dx, -48(%ebp)
	movw	%ax, -52(%ebp)
	.loc 1 245 0
	leal	-34(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	nameiparent
.LVL95:
	movl	%eax, -12(%ebp)
.LVL96:
	cmpl	$0, -12(%ebp)
	jne	.L68
	.loc 1 246 0
	movl	$0, %eax
.LVL97:
	jmp	.L76
.LVL98:
.L68:
	.loc 1 247 0
	movl	-12(%ebp), %eax
.LVL99:
	movl	%eax, (%esp)
	call	ilock
.LVL100:
	.loc 1 249 0
	leal	-20(%ebp), %eax
	movl	%eax, 8(%esp)
	leal	-34(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	dirlookup
.LVL101:
	movl	%eax, -16(%ebp)
.LVL102:
	cmpl	$0, -16(%ebp)
	je	.L70
	.loc 1 250 0
	movl	-12(%ebp), %eax
.LVL103:
	movl	%eax, (%esp)
	call	iunlockput
.LVL104:
	.loc 1 251 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	ilock
.LVL105:
	.loc 1 252 0
	cmpw	$2, -44(%ebp)
	jne	.L71
	.loc 1 252 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$2, %ax
	jne	.L71
	.loc 1 253 0 is_stmt 1
	movl	-16(%ebp), %eax
	jmp	.L76
.L71:
	.loc 1 254 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL106:
	.loc 1 255 0
	movl	$0, %eax
	jmp	.L76
.LVL107:
.L70:
	.loc 1 258 0
	movswl	-44(%ebp), %edx
	movl	-12(%ebp), %eax
.LVL108:
	movl	(%eax), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	ialloc
.LVL109:
	movl	%eax, -16(%ebp)
.LVL110:
	cmpl	$0, -16(%ebp)
	jne	.L72
	.loc 1 259 0
	movl	$.LC5, (%esp)
	call	panic
.LVL111:
.L72:
	.loc 1 261 0
	movl	-16(%ebp), %eax
.LVL112:
	movl	%eax, (%esp)
	call	ilock
.LVL113:
	.loc 1 262 0
	movl	-16(%ebp), %eax
	movzwl	-48(%ebp), %edx
	movw	%dx, 18(%eax)
	.loc 1 263 0
	movl	-16(%ebp), %eax
	movzwl	-52(%ebp), %edx
	movw	%dx, 20(%eax)
	.loc 1 264 0
	movl	-16(%ebp), %eax
	movw	$1, 22(%eax)
	.loc 1 265 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	iupdate
.LVL114:
	.loc 1 267 0
	cmpw	$1, -44(%ebp)
	jne	.L73
	.loc 1 268 0
	movl	-12(%ebp), %eax
	movzwl	22(%eax), %eax
	leal	1(%eax), %edx
	movl	-12(%ebp), %eax
	movw	%dx, 22(%eax)
	.loc 1 269 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iupdate
.LVL115:
	.loc 1 271 0
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC1, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	dirlink
.LVL116:
	testl	%eax, %eax
	js	.L74
	.loc 1 271 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	movl	$.LC2, 4(%esp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	dirlink
.LVL117:
	testl	%eax, %eax
	jns	.L73
.L74:
	.loc 1 272 0 is_stmt 1
	movl	$.LC6, (%esp)
	call	panic
.LVL118:
.L73:
	.loc 1 275 0
	movl	-16(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, 8(%esp)
	leal	-34(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	dirlink
.LVL119:
	testl	%eax, %eax
	jns	.L75
	.loc 1 276 0
	movl	$.LC7, (%esp)
	call	panic
.LVL120:
.L75:
	.loc 1 278 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL121:
	.loc 1 280 0
	movl	-16(%ebp), %eax
.LVL122:
.L76:
	.loc 1 281 0
	leave
.LCFI32:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE10:
	.size	create, .-create
	.globl	sys_open
	.type	sys_open, @function
sys_open:
.LFB11:
	.loc 1 285 0
	.cfi_startproc
	pushl	%ebp
.LCFI33:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI34:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 291 0
	leal	-24(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL123:
	testl	%eax, %eax
	js	.L78
	.loc 1 291 0 is_stmt 0 discriminator 1
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argint
.LVL124:
	testl	%eax, %eax
	jns	.L79
.L78:
	.loc 1 292 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L90
.L79:
	.loc 1 294 0
	call	begin_op
.LVL125:
	.loc 1 296 0
	movl	-28(%ebp), %eax
	andl	$512, %eax
	testl	%eax, %eax
	je	.L81
	.loc 1 297 0
	movl	-24(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$2, 4(%esp)
	movl	%eax, (%esp)
	call	create
.LVL126:
	movl	%eax, -12(%ebp)
.LVL127:
	.loc 1 298 0
	cmpl	$0, -12(%ebp)
	jne	.L82
	.loc 1 299 0
	call	end_op
.LVL128:
	.loc 1 300 0
	movl	$-1, %eax
	jmp	.L90
.LVL129:
.L81:
	.loc 1 303 0
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	namei
.LVL130:
	movl	%eax, -12(%ebp)
.LVL131:
	cmpl	$0, -12(%ebp)
	jne	.L83
	.loc 1 304 0
	call	end_op
.LVL132:
	.loc 1 305 0
	movl	$-1, %eax
	jmp	.L90
.LVL133:
.L83:
	.loc 1 307 0
	movl	-12(%ebp), %eax
.LVL134:
	movl	%eax, (%esp)
	call	ilock
.LVL135:
	.loc 1 308 0
	movl	-12(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	jne	.L82
	.loc 1 308 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
	testl	%eax, %eax
	je	.L82
	.loc 1 309 0 is_stmt 1
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL136:
	.loc 1 310 0
	call	end_op
.LVL137:
	.loc 1 311 0
	movl	$-1, %eax
	jmp	.L90
.L82:
	.loc 1 315 0
	call	filealloc
.LVL138:
	movl	%eax, -16(%ebp)
.LVL139:
	cmpl	$0, -16(%ebp)
	je	.L84
	.loc 1 315 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	fdalloc
.LVL140:
	movl	%eax, -20(%ebp)
.LVL141:
	cmpl	$0, -20(%ebp)
	jns	.L85
.LVL142:
.L84:
	.loc 1 316 0 is_stmt 1
	cmpl	$0, -16(%ebp)
	je	.L86
	.loc 1 317 0
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	fileclose
.LVL143:
.L86:
	.loc 1 318 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL144:
	.loc 1 319 0
	call	end_op
.LVL145:
	.loc 1 320 0
	movl	$-1, %eax
	jmp	.L90
.LVL146:
.L85:
	.loc 1 322 0
	movl	-12(%ebp), %eax
.LVL147:
	movl	%eax, (%esp)
	call	iunlock
.LVL148:
	.loc 1 323 0
	call	end_op
.LVL149:
	.loc 1 325 0
	movl	-16(%ebp), %eax
	movl	$2, (%eax)
	.loc 1 326 0
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 16(%eax)
	.loc 1 327 0
	movl	-16(%ebp), %eax
	movl	$0, 20(%eax)
	.loc 1 328 0
	movl	-28(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	sete	%al
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movb	%dl, 8(%eax)
	.loc 1 329 0
	movl	-28(%ebp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L87
	.loc 1 329 0 is_stmt 0 discriminator 2
	movl	-28(%ebp), %eax
	andl	$2, %eax
	testl	%eax, %eax
	je	.L88
.L87:
	.loc 1 329 0 discriminator 1
	movl	$1, %eax
	jmp	.L89
.L88:
	.loc 1 329 0 discriminator 3
	movl	$0, %eax
.L89:
	.loc 1 329 0 discriminator 4
	movl	%eax, %edx
	movl	-16(%ebp), %eax
	movb	%dl, 9(%eax)
	.loc 1 330 0 is_stmt 1 discriminator 4
	movl	-20(%ebp), %eax
.LVL150:
.L90:
	.loc 1 331 0
	leave
.LCFI35:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	sys_open, .-sys_open
	.globl	sys_mkdir
	.type	sys_mkdir, @function
sys_mkdir:
.LFB12:
	.loc 1 335 0
	.cfi_startproc
	pushl	%ebp
.LCFI36:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI37:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 339 0
	call	begin_op
.LVL151:
	.loc 1 340 0
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL152:
	testl	%eax, %eax
	js	.L92
	.loc 1 340 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movl	$0, 12(%esp)
	movl	$0, 8(%esp)
	movl	$1, 4(%esp)
	movl	%eax, (%esp)
	call	create
.LVL153:
	movl	%eax, -12(%ebp)
.LVL154:
	cmpl	$0, -12(%ebp)
	jne	.L93
.LVL155:
.L92:
	.loc 1 341 0 is_stmt 1
	call	end_op
.LVL156:
	.loc 1 342 0
	movl	$-1, %eax
	jmp	.L95
.LVL157:
.L93:
	.loc 1 344 0
	movl	-12(%ebp), %eax
.LVL158:
	movl	%eax, (%esp)
	call	iunlockput
.LVL159:
	.loc 1 345 0
	call	end_op
.LVL160:
	.loc 1 346 0
	movl	$0, %eax
.LVL161:
.L95:
	.loc 1 347 0
	leave
.LCFI38:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE12:
	.size	sys_mkdir, .-sys_mkdir
	.globl	sys_mknod
	.type	sys_mknod, @function
sys_mknod:
.LFB13:
	.loc 1 351 0
	.cfi_startproc
	pushl	%ebp
.LCFI39:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI40:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 357 0
	call	begin_op
.LVL162:
	.loc 1 358 0
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL163:
	movl	%eax, -12(%ebp)
.LVL164:
	cmpl	$0, -12(%ebp)
	js	.L97
	.loc 1 359 0 discriminator 1
	leal	-24(%ebp), %eax
.LVL165:
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argint
.LVL166:
	.loc 1 358 0 discriminator 1
	testl	%eax, %eax
	js	.L97
	.loc 1 360 0
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$2, (%esp)
	call	argint
.LVL167:
	.loc 1 359 0
	testl	%eax, %eax
	js	.L97
	.loc 1 361 0
	movl	-28(%ebp), %eax
	movswl	%ax, %ecx
	movl	-24(%ebp), %eax
	movswl	%ax, %edx
	movl	-20(%ebp), %eax
	.loc 1 360 0
	movl	%ecx, 12(%esp)
	movl	%edx, 8(%esp)
	movl	$3, 4(%esp)
	movl	%eax, (%esp)
	call	create
.LVL168:
	movl	%eax, -16(%ebp)
.LVL169:
	cmpl	$0, -16(%ebp)
	jne	.L98
.LVL170:
.L97:
	.loc 1 362 0
	call	end_op
.LVL171:
	.loc 1 363 0
	movl	$-1, %eax
	jmp	.L100
.LVL172:
.L98:
	.loc 1 365 0
	movl	-16(%ebp), %eax
.LVL173:
	movl	%eax, (%esp)
	call	iunlockput
.LVL174:
	.loc 1 366 0
	call	end_op
.LVL175:
	.loc 1 367 0
	movl	$0, %eax
.LVL176:
.L100:
	.loc 1 368 0
	leave
.LCFI41:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
.LVL177:
	ret
	.cfi_endproc
.LFE13:
	.size	sys_mknod, .-sys_mknod
	.globl	sys_chdir
	.type	sys_chdir, @function
sys_chdir:
.LFB14:
	.loc 1 372 0
	.cfi_startproc
	pushl	%ebp
.LCFI42:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI43:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 376 0
	call	begin_op
.LVL178:
	.loc 1 377 0
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL179:
	testl	%eax, %eax
	js	.L102
	.loc 1 377 0 is_stmt 0 discriminator 1
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	namei
.LVL180:
	movl	%eax, -12(%ebp)
.LVL181:
	cmpl	$0, -12(%ebp)
	jne	.L103
.LVL182:
.L102:
	.loc 1 378 0 is_stmt 1
	call	end_op
.LVL183:
	.loc 1 379 0
	movl	$-1, %eax
	jmp	.L106
.LVL184:
.L103:
	.loc 1 381 0
	movl	-12(%ebp), %eax
.LVL185:
	movl	%eax, (%esp)
	call	ilock
.LVL186:
	.loc 1 382 0
	movl	-12(%ebp), %eax
	movzwl	16(%eax), %eax
	cmpw	$1, %ax
	je	.L105
	.loc 1 383 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlockput
.LVL187:
	.loc 1 384 0
	call	end_op
.LVL188:
	.loc 1 385 0
	movl	$-1, %eax
	jmp	.L106
.L105:
	.loc 1 387 0
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	iunlock
.LVL189:
	.loc 1 388 0
	movl	%gs:4, %eax
	movl	104(%eax), %eax
	movl	%eax, (%esp)
	call	iput
.LVL190:
	.loc 1 389 0
	call	end_op
.LVL191:
	.loc 1 390 0
	movl	%gs:4, %eax
	movl	-12(%ebp), %edx
	movl	%edx, 104(%eax)
	.loc 1 391 0
	movl	$0, %eax
.LVL192:
.L106:
	.loc 1 392 0
	leave
.LCFI44:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE14:
	.size	sys_chdir, .-sys_chdir
	.globl	sys_exec
	.type	sys_exec, @function
sys_exec:
.LFB15:
	.loc 1 396 0
	.cfi_startproc
	pushl	%ebp
.LCFI45:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI46:
	.cfi_def_cfa_register 5
	subl	$168, %esp
	.loc 1 401 0
	leal	-16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argstr
.LVL193:
	testl	%eax, %eax
	js	.L108
	.loc 1 401 0 is_stmt 0 discriminator 1
	leal	-148(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$1, (%esp)
	call	argint
.LVL194:
	testl	%eax, %eax
	jns	.L109
.L108:
	.loc 1 402 0 is_stmt 1
	movl	$-1, %eax
	jmp	.L117
.L109:
	.loc 1 404 0
	movl	$128, 8(%esp)
	movl	$0, 4(%esp)
	leal	-144(%ebp), %eax
	movl	%eax, (%esp)
	call	memset
.LVL195:
	.loc 1 405 0
	movl	$0, -12(%ebp)
.LVL196:
.L116:
	.loc 1 406 0
	movl	-12(%ebp), %eax
	cmpl	$31, %eax
	jbe	.L111
	.loc 1 407 0
	movl	$-1, %eax
	jmp	.L117
.LVL197:
.L111:
	.loc 1 408 0
	movl	-12(%ebp), %eax
.LVL198:
	sall	$2, %eax
	movl	%eax, %edx
	movl	-148(%ebp), %eax
	addl	%eax, %edx
	leal	-152(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	fetchint
.LVL199:
	testl	%eax, %eax
	jns	.L112
	.loc 1 409 0
	movl	$-1, %eax
	jmp	.L117
.L112:
	.loc 1 410 0
	movl	-152(%ebp), %eax
	testl	%eax, %eax
	jne	.L113
	.loc 1 411 0
	movl	-12(%ebp), %eax
	movl	$0, -144(%ebp,%eax,4)
	.loc 1 412 0
	nop
	.loc 1 417 0
	movl	-16(%ebp), %eax
	leal	-144(%ebp), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	exec
.LVL200:
	jmp	.L117
.L113:
	.loc 1 414 0
	leal	-144(%ebp), %eax
	movl	-12(%ebp), %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	-152(%ebp), %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	fetchstr
.LVL201:
	testl	%eax, %eax
	jns	.L115
	.loc 1 415 0
	movl	$-1, %eax
	jmp	.L117
.L115:
	.loc 1 405 0
	addl	$1, -12(%ebp)
	.loc 1 416 0
	jmp	.L116
.LVL202:
.L117:
	.loc 1 418 0
	leave
.LCFI47:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE15:
	.size	sys_exec, .-sys_exec
	.globl	sys_pipe
	.type	sys_pipe, @function
sys_pipe:
.LFB16:
	.loc 1 422 0
	.cfi_startproc
	pushl	%ebp
.LCFI48:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI49:
	.cfi_def_cfa_register 5
	subl	$56, %esp
	.loc 1 427 0
	movl	$8, 8(%esp)
	leal	-20(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	argptr
.LVL203:
	testl	%eax, %eax
	jns	.L119
	.loc 1 428 0
	movl	$-1, %eax
	jmp	.L125
.L119:
	.loc 1 429 0
	leal	-28(%ebp), %eax
	movl	%eax, 4(%esp)
	leal	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	pipealloc
.LVL204:
	testl	%eax, %eax
	jns	.L121
	.loc 1 430 0
	movl	$-1, %eax
	jmp	.L125
.L121:
	.loc 1 431 0
	movl	$-1, -12(%ebp)
.LVL205:
	.loc 1 432 0
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	fdalloc
.LVL206:
	movl	%eax, -12(%ebp)
.LVL207:
	cmpl	$0, -12(%ebp)
	js	.L122
	.loc 1 432 0 is_stmt 0 discriminator 1
	movl	-28(%ebp), %eax
.LVL208:
	movl	%eax, (%esp)
	call	fdalloc
.LVL209:
	movl	%eax, -16(%ebp)
.LVL210:
	cmpl	$0, -16(%ebp)
	jns	.L123
.LVL211:
.L122:
	.loc 1 433 0 is_stmt 1
	cmpl	$0, -12(%ebp)
	js	.L124
	.loc 1 434 0
	movl	%gs:4, %eax
	movl	-12(%ebp), %edx
	addl	$8, %edx
	movl	$0, 8(%eax,%edx,4)
.L124:
	.loc 1 435 0
	movl	-24(%ebp), %eax
	movl	%eax, (%esp)
	call	fileclose
.LVL212:
	.loc 1 436 0
	movl	-28(%ebp), %eax
	movl	%eax, (%esp)
	call	fileclose
.LVL213:
	.loc 1 437 0
	movl	$-1, %eax
	jmp	.L125
.LVL214:
.L123:
	.loc 1 439 0
	movl	-20(%ebp), %eax
.LVL215:
	movl	-12(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 440 0
	movl	-20(%ebp), %eax
	leal	4(%eax), %edx
	movl	-16(%ebp), %eax
	movl	%eax, (%edx)
	.loc 1 441 0
	movl	$0, %eax
.LVL216:
.L125:
	.loc 1 442 0
	leave
.LCFI50:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE16:
	.size	sys_pipe, .-sys_pipe
.Letext0:
	.file 2 "types.h"
	.file 3 "stat.h"
	.file 4 "proc.h"
	.file 5 "file.h"
	.file 6 "fs.h"
	.file 7 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1795
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
	.long	.LASF10
	.byte	0x14
	.byte	0x3
	.byte	0x5
	.long	0xae
	.uleb128 0x5
	.long	.LASF6
	.byte	0x3
	.byte	0x6
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"dev"
	.byte	0x3
	.byte	0x7
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ino"
	.byte	0x3
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF7
	.byte	0x3
	.byte	0x9
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF8
	.byte	0x3
	.byte	0xa
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF9
	.uleb128 0x7
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x8
	.byte	0x4
	.long	0x25
	.uleb128 0x9
	.byte	0x4
	.uleb128 0x4
	.long	.LASF11
	.byte	0x14
	.byte	0x4
	.byte	0x2c
	.long	0x117
	.uleb128 0x6
	.string	"edi"
	.byte	0x4
	.byte	0x2d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"esi"
	.byte	0x4
	.byte	0x2e
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ebx"
	.byte	0x4
	.byte	0x2f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x6
	.string	"ebp"
	.byte	0x4
	.byte	0x30
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
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
	.long	0xc4
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF12
	.uleb128 0x4
	.long	.LASF13
	.byte	0x7c
	.byte	0x4
	.byte	0x37
	.long	0x1e5
	.uleb128 0x6
	.string	"sz"
	.byte	0x4
	.byte	0x38
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF14
	.byte	0x4
	.byte	0x39
	.long	0x21c
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF15
	.byte	0x4
	.byte	0x3a
	.long	0x222
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF16
	.byte	0x4
	.byte	0x3b
	.long	0x1eb
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"pid"
	.byte	0x4
	.byte	0x3c
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF17
	.byte	0x4
	.byte	0x3d
	.long	0x1e5
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x6
	.string	"tf"
	.byte	0x4
	.byte	0x3e
	.long	0x235
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF11
	.byte	0x4
	.byte	0x3f
	.long	0x117
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x5
	.long	.LASF18
	.byte	0x4
	.byte	0x40
	.long	0xc2
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x5
	.long	.LASF19
	.byte	0x4
	.byte	0x41
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x24
	.uleb128 0x5
	.long	.LASF20
	.byte	0x4
	.byte	0x42
	.long	0x23b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x6
	.string	"cwd"
	.byte	0x4
	.byte	0x43
	.long	0x358
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x5
	.long	.LASF21
	.byte	0x4
	.byte	0x44
	.long	0x35e
	.byte	0x2
	.byte	0x23
	.uleb128 0x6c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x124
	.uleb128 0xa
	.long	.LASF98
	.byte	0x4
	.byte	0x4
	.byte	0x34
	.long	0x21c
	.uleb128 0xb
	.long	.LASF22
	.sleb128 0
	.uleb128 0xb
	.long	.LASF23
	.sleb128 1
	.uleb128 0xb
	.long	.LASF24
	.sleb128 2
	.uleb128 0xb
	.long	.LASF25
	.sleb128 3
	.uleb128 0xb
	.long	.LASF26
	.sleb128 4
	.uleb128 0xb
	.long	.LASF27
	.sleb128 5
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x50
	.uleb128 0x8
	.byte	0x4
	.long	0x228
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF28
	.uleb128 0xc
	.long	.LASF43
	.byte	0x1
	.uleb128 0x8
	.byte	0x4
	.long	0x22f
	.uleb128 0xd
	.long	0x24b
	.long	0x24b
	.uleb128 0xe
	.long	0x11d
	.byte	0xf
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x251
	.uleb128 0x4
	.long	.LASF29
	.byte	0x18
	.byte	0x5
	.byte	0x1
	.long	0x2bf
	.uleb128 0x5
	.long	.LASF6
	.byte	0x5
	.byte	0x2
	.long	0x3b7
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.string	"ref"
	.byte	0x5
	.byte	0x3
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x5
	.long	.LASF30
	.byte	0x5
	.byte	0x4
	.long	0x228
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF31
	.byte	0x5
	.byte	0x5
	.long	0x228
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x5
	.long	.LASF32
	.byte	0x5
	.byte	0x6
	.long	0x3d8
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x6
	.string	"ip"
	.byte	0x5
	.byte	0x7
	.long	0x358
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x6
	.string	"off"
	.byte	0x5
	.byte	0x8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.byte	0
	.uleb128 0x4
	.long	.LASF33
	.byte	0x50
	.byte	0x5
	.byte	0xd
	.long	0x358
	.uleb128 0x6
	.string	"dev"
	.byte	0x5
	.byte	0xe
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF34
	.byte	0x5
	.byte	0xf
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.string	"ref"
	.byte	0x5
	.byte	0x10
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x5
	.long	.LASF35
	.byte	0x5
	.byte	0x11
	.long	0xb5
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x5
	.long	.LASF6
	.byte	0x5
	.byte	0x13
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x5
	.long	.LASF36
	.byte	0x5
	.byte	0x14
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x5
	.long	.LASF37
	.byte	0x5
	.byte	0x15
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x5
	.long	.LASF7
	.byte	0x5
	.byte	0x16
	.long	0xae
	.byte	0x2
	.byte	0x23
	.uleb128 0x16
	.uleb128 0x5
	.long	.LASF8
	.byte	0x5
	.byte	0x17
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x5
	.long	.LASF38
	.byte	0x5
	.byte	0x18
	.long	0x36e
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x2bf
	.uleb128 0xd
	.long	0x228
	.long	0x36e
	.uleb128 0xe
	.long	0x11d
	.byte	0xf
	.byte	0
	.uleb128 0xd
	.long	0x25
	.long	0x37e
	.uleb128 0xe
	.long	0x11d
	.byte	0xc
	.byte	0
	.uleb128 0x4
	.long	.LASF39
	.byte	0x10
	.byte	0x6
	.byte	0x34
	.long	0x3a7
	.uleb128 0x5
	.long	.LASF34
	.byte	0x6
	.byte	0x35
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.long	.LASF21
	.byte	0x6
	.byte	0x36
	.long	0x3a7
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0
	.uleb128 0xd
	.long	0x228
	.long	0x3b7
	.uleb128 0xe
	.long	0x11d
	.byte	0xd
	.byte	0
	.uleb128 0xf
	.byte	0x4
	.byte	0x5
	.byte	0x2
	.long	0x3d2
	.uleb128 0xb
	.long	.LASF40
	.sleb128 0
	.uleb128 0xb
	.long	.LASF41
	.sleb128 1
	.uleb128 0xb
	.long	.LASF42
	.sleb128 2
	.byte	0
	.uleb128 0xc
	.long	.LASF32
	.byte	0x1
	.uleb128 0x8
	.byte	0x4
	.long	0x3d2
	.uleb128 0x10
	.long	.LASF44
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.long	0xb5
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0x456
	.uleb128 0x11
	.string	"n"
	.byte	0x1
	.byte	0x14
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x11
	.string	"pfd"
	.byte	0x1
	.byte	0x14
	.long	0x456
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.string	"pf"
	.byte	0x1
	.byte	0x14
	.long	0x45c
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x12
	.string	"fd"
	.byte	0x1
	.byte	0x16
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.string	"f"
	.byte	0x1
	.byte	0x17
	.long	0x24b
	.long	.LLST1
	.uleb128 0x14
	.long	.LVL1
	.long	0x1467
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0xb5
	.uleb128 0x8
	.byte	0x4
	.long	0x24b
	.uleb128 0x10
	.long	.LASF45
	.byte	0x1
	.byte	0x27
	.byte	0x1
	.long	0xb5
	.long	.LFB1
	.long	.LFE1
	.long	.LLST2
	.byte	0x1
	.long	0x499
	.uleb128 0x11
	.string	"f"
	.byte	0x1
	.byte	0x27
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"fd"
	.byte	0x1
	.byte	0x29
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF46
	.byte	0x1
	.byte	0x35
	.byte	0x1
	.long	0xb5
	.long	.LFB2
	.long	.LFE2
	.long	.LLST3
	.byte	0x1
	.long	0x505
	.uleb128 0x12
	.string	"f"
	.byte	0x1
	.byte	0x37
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.string	"fd"
	.byte	0x1
	.byte	0x38
	.long	0xb5
	.long	.LLST4
	.uleb128 0x17
	.long	.LVL11
	.long	0x3de
	.long	0x4f2
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.long	.LVL12
	.long	0x462
	.uleb128 0x18
	.long	.LVL17
	.long	0x1484
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF47
	.byte	0x1
	.byte	0x43
	.byte	0x1
	.long	0xb5
	.long	.LFB3
	.long	.LFE3
	.long	.LLST5
	.byte	0x1
	.long	0x5a8
	.uleb128 0x12
	.string	"f"
	.byte	0x1
	.byte	0x45
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.string	"n"
	.byte	0x1
	.byte	0x46
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"p"
	.byte	0x1
	.byte	0x47
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.long	.LVL19
	.long	0x3de
	.long	0x568
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.long	.LVL20
	.long	0x1467
	.long	0x583
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.long	.LVL21
	.long	0x149c
	.long	0x59e
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.long	.LVL22
	.long	0x14c4
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF48
	.byte	0x1
	.byte	0x4f
	.byte	0x1
	.long	0xb5
	.long	.LFB4
	.long	.LFE4
	.long	.LLST6
	.byte	0x1
	.long	0x64b
	.uleb128 0x12
	.string	"f"
	.byte	0x1
	.byte	0x51
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.string	"n"
	.byte	0x1
	.byte	0x52
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x12
	.string	"p"
	.byte	0x1
	.byte	0x53
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x17
	.long	.LVL23
	.long	0x3de
	.long	0x60b
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.long	.LVL24
	.long	0x1467
	.long	0x626
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.long	.LVL25
	.long	0x149c
	.long	0x641
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.byte	0
	.uleb128 0x18
	.long	.LVL26
	.long	0x14e6
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF49
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.long	0xb5
	.long	.LFB5
	.long	.LFE5
	.long	.LLST7
	.byte	0x1
	.long	0x6ae
	.uleb128 0x12
	.string	"fd"
	.byte	0x1
	.byte	0x5d
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.string	"f"
	.byte	0x1
	.byte	0x5e
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LVL27
	.long	0x3de
	.long	0x6a4
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.long	.LVL28
	.long	0x1508
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF50
	.byte	0x1
	.byte	0x68
	.byte	0x1
	.long	0xb5
	.long	.LFB6
	.long	.LFE6
	.long	.LLST8
	.byte	0x1
	.long	0x731
	.uleb128 0x12
	.string	"f"
	.byte	0x1
	.byte	0x6a
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x12
	.string	"st"
	.byte	0x1
	.byte	0x6b
	.long	0x731
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.long	.LVL29
	.long	0x3de
	.long	0x706
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.long	.LVL30
	.long	0x149c
	.long	0x727
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x44
	.byte	0
	.uleb128 0x18
	.long	.LVL31
	.long	0x151c
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x5b
	.uleb128 0x16
	.byte	0x1
	.long	.LASF51
	.byte	0x1
	.byte	0x74
	.byte	0x1
	.long	0xb5
	.long	.LFB7
	.long	.LFE7
	.long	.LLST9
	.byte	0x1
	.long	0x937
	.uleb128 0x19
	.long	.LASF21
	.byte	0x1
	.byte	0x76
	.long	0x3a7
	.byte	0x2
	.byte	0x91
	.sleb128 -38
	.uleb128 0x12
	.string	"new"
	.byte	0x1
	.byte	0x76
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x12
	.string	"old"
	.byte	0x1
	.byte	0x76
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x13
	.string	"dp"
	.byte	0x1
	.byte	0x77
	.long	0x358
	.long	.LLST10
	.uleb128 0x13
	.string	"ip"
	.byte	0x1
	.byte	0x77
	.long	0x358
	.long	.LLST11
	.uleb128 0x1a
	.string	"bad"
	.byte	0x1
	.byte	0x9b
	.long	.L45
	.uleb128 0x17
	.long	.LVL32
	.long	0x1539
	.long	0x7c1
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -40
	.byte	0
	.uleb128 0x17
	.long	.LVL33
	.long	0x1539
	.long	0x7dc
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -36
	.byte	0
	.uleb128 0x18
	.long	.LVL34
	.long	0x1556
	.uleb128 0x18
	.long	.LVL35
	.long	0x1565
	.uleb128 0x18
	.long	.LVL37
	.long	0x157d
	.uleb128 0x17
	.long	.LVL40
	.long	0x158c
	.long	0x80d
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL41
	.long	0x15a0
	.long	0x823
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL42
	.long	0x157d
	.uleb128 0x17
	.long	.LVL43
	.long	0x15b4
	.long	0x842
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL44
	.long	0x15c8
	.long	0x858
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL45
	.long	0x15dc
	.long	0x86d
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -30
	.byte	0
	.uleb128 0x17
	.long	.LVL48
	.long	0x158c
	.long	0x883
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL49
	.long	0x15f9
	.long	0x8a0
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -30
	.byte	0
	.uleb128 0x17
	.long	.LVL50
	.long	0x15a0
	.long	0x8b6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL51
	.long	0x15a0
	.long	0x8cc
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL52
	.long	0x161b
	.long	0x8e2
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL53
	.long	0x157d
	.uleb128 0x17
	.long	.LVL54
	.long	0x158c
	.long	0x901
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL55
	.long	0x15b4
	.long	0x917
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL56
	.long	0x15a0
	.long	0x92d
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL57
	.long	0x157d
	.byte	0
	.uleb128 0x10
	.long	.LASF52
	.byte	0x1
	.byte	0xa6
	.byte	0x1
	.long	0xb5
	.long	.LFB8
	.long	.LFE8
	.long	.LLST12
	.byte	0x1
	.long	0x9bd
	.uleb128 0x11
	.string	"dp"
	.byte	0x1
	.byte	0xa6
	.long	0x358
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x13
	.string	"off"
	.byte	0x1
	.byte	0xa8
	.long	0xb5
	.long	.LLST13
	.uleb128 0x12
	.string	"de"
	.byte	0x1
	.byte	0xa9
	.long	0x37e
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x17
	.long	.LVL62
	.long	0x162f
	.long	0x9a8
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x14
	.long	.LVL63
	.long	0x1656
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF53
	.byte	0x1
	.byte	0xb6
	.byte	0x1
	.long	0xb5
	.long	.LFB9
	.long	.LFE9
	.long	.LLST14
	.byte	0x1
	.long	0xc2a
	.uleb128 0x13
	.string	"ip"
	.byte	0x1
	.byte	0xb8
	.long	0x358
	.long	.LLST15
	.uleb128 0x13
	.string	"dp"
	.byte	0x1
	.byte	0xb8
	.long	0x358
	.long	.LLST16
	.uleb128 0x12
	.string	"de"
	.byte	0x1
	.byte	0xb9
	.long	0x37e
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.long	.LASF21
	.byte	0x1
	.byte	0xba
	.long	0x3a7
	.byte	0x2
	.byte	0x91
	.sleb128 -54
	.uleb128 0x19
	.long	.LASF54
	.byte	0x1
	.byte	0xba
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x12
	.string	"off"
	.byte	0x1
	.byte	0xbb
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.string	"bad"
	.byte	0x1
	.byte	0xe8
	.long	.L60
	.uleb128 0x17
	.long	.LVL65
	.long	0x1539
	.long	0xa54
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -52
	.byte	0
	.uleb128 0x18
	.long	.LVL66
	.long	0x1556
	.uleb128 0x17
	.long	.LVL67
	.long	0x15dc
	.long	0xa72
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -46
	.byte	0
	.uleb128 0x18
	.long	.LVL69
	.long	0x157d
	.uleb128 0x17
	.long	.LVL72
	.long	0x158c
	.long	0xa91
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL73
	.long	0x166a
	.long	0xab0
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 -46
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x17
	.long	.LVL74
	.long	0x166a
	.long	0xacf
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 -46
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x17
	.long	.LVL75
	.long	0x1692
	.long	0xaf3
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -46
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x75
	.sleb128 -56
	.byte	0
	.uleb128 0x17
	.long	.LVL78
	.long	0x158c
	.long	0xb09
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL79
	.long	0x1656
	.long	0xb21
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC3
	.byte	0
	.uleb128 0x17
	.long	.LVL80
	.long	0x937
	.long	0xb37
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL81
	.long	0x15a0
	.long	0xb4d
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL82
	.long	0x16b4
	.long	0xb6e
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x17
	.long	.LVL83
	.long	0x16d6
	.long	0xb91
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -32
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x17
	.long	.LVL84
	.long	0x1656
	.long	0xba9
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC4
	.byte	0
	.uleb128 0x17
	.long	.LVL85
	.long	0x15b4
	.long	0xbbf
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL86
	.long	0x15a0
	.long	0xbd5
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL87
	.long	0x15b4
	.long	0xbeb
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL88
	.long	0x15a0
	.long	0xc01
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL89
	.long	0x157d
	.uleb128 0x17
	.long	.LVL91
	.long	0x15a0
	.long	0xc20
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL92
	.long	0x157d
	.byte	0
	.uleb128 0x10
	.long	.LASF55
	.byte	0x1
	.byte	0xef
	.byte	0x1
	.long	0x358
	.long	.LFB10
	.long	.LFE10
	.long	.LLST17
	.byte	0x1
	.long	0xe65
	.uleb128 0x1b
	.long	.LASF54
	.byte	0x1
	.byte	0xef
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x1b
	.long	.LASF6
	.byte	0x1
	.byte	0xef
	.long	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x1b
	.long	.LASF36
	.byte	0x1
	.byte	0xef
	.long	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0x1b
	.long	.LASF37
	.byte	0x1
	.byte	0xef
	.long	0xae
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0x12
	.string	"off"
	.byte	0x1
	.byte	0xf1
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x13
	.string	"ip"
	.byte	0x1
	.byte	0xf2
	.long	0x358
	.long	.LLST18
	.uleb128 0x13
	.string	"dp"
	.byte	0x1
	.byte	0xf2
	.long	0x358
	.long	.LLST19
	.uleb128 0x19
	.long	.LASF21
	.byte	0x1
	.byte	0xf3
	.long	0x3a7
	.byte	0x2
	.byte	0x91
	.sleb128 -42
	.uleb128 0x17
	.long	.LVL95
	.long	0x15dc
	.long	0xcd4
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x91
	.sleb128 -42
	.byte	0
	.uleb128 0x17
	.long	.LVL100
	.long	0x158c
	.long	0xcea
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL101
	.long	0x1692
	.long	0xd0e
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x91
	.sleb128 -42
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.uleb128 0x17
	.long	.LVL104
	.long	0x15a0
	.long	0xd24
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL105
	.long	0x158c
	.long	0xd3a
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL106
	.long	0x15a0
	.long	0xd50
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL109
	.long	0x16fd
	.long	0xd6b
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x8
	.byte	0x91
	.sleb128 -52
	.byte	0x94
	.byte	0x2
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0
	.uleb128 0x17
	.long	.LVL111
	.long	0x1656
	.long	0xd83
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC5
	.byte	0
	.uleb128 0x17
	.long	.LVL113
	.long	0x158c
	.long	0xd99
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL114
	.long	0x15b4
	.long	0xdaf
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL115
	.long	0x15b4
	.long	0xdc5
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL116
	.long	0x15f9
	.long	0xde5
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC1
	.byte	0
	.uleb128 0x17
	.long	.LVL117
	.long	0x15f9
	.long	0xe05
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -24
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x3
	.long	.LC2
	.byte	0
	.uleb128 0x17
	.long	.LVL118
	.long	0x1656
	.long	0xe1d
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC6
	.byte	0
	.uleb128 0x17
	.long	.LVL119
	.long	0x15f9
	.long	0xe3a
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x91
	.sleb128 -42
	.byte	0
	.uleb128 0x17
	.long	.LVL120
	.long	0x1656
	.long	0xe52
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC7
	.byte	0
	.uleb128 0x14
	.long	.LVL121
	.long	0x15a0
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x91
	.sleb128 -20
	.byte	0x6
	.byte	0
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF56
	.byte	0x1
	.value	0x11c
	.byte	0x1
	.long	0xb5
	.long	.LFB11
	.long	.LFE11
	.long	.LLST20
	.byte	0x1
	.long	0xff1
	.uleb128 0x1d
	.long	.LASF54
	.byte	0x1
	.value	0x11e
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.string	"fd"
	.byte	0x1
	.value	0x11f
	.long	0xb5
	.long	.LLST21
	.uleb128 0x1d
	.long	.LASF57
	.byte	0x1
	.value	0x11f
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.string	"f"
	.byte	0x1
	.value	0x120
	.long	0x24b
	.long	.LLST22
	.uleb128 0x1e
	.string	"ip"
	.byte	0x1
	.value	0x121
	.long	0x358
	.long	.LLST23
	.uleb128 0x17
	.long	.LVL123
	.long	0x1539
	.long	0xee9
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LVL124
	.long	0x1467
	.long	0xf04
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -28
	.byte	0
	.uleb128 0x18
	.long	.LVL125
	.long	0x1556
	.uleb128 0x17
	.long	.LVL126
	.long	0xc2a
	.long	0xf2d
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x32
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x18
	.long	.LVL128
	.long	0x157d
	.uleb128 0x18
	.long	.LVL130
	.long	0x1565
	.uleb128 0x18
	.long	.LVL132
	.long	0x157d
	.uleb128 0x17
	.long	.LVL135
	.long	0x158c
	.long	0xf5e
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL136
	.long	0x15a0
	.long	0xf74
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL137
	.long	0x157d
	.uleb128 0x18
	.long	.LVL138
	.long	0x171a
	.uleb128 0x17
	.long	.LVL140
	.long	0x462
	.long	0xf9c
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL143
	.long	0x1508
	.long	0xfb2
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL144
	.long	0x15a0
	.long	0xfc8
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL145
	.long	0x157d
	.uleb128 0x17
	.long	.LVL148
	.long	0x15c8
	.long	0xfe7
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL149
	.long	0x157d
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF58
	.byte	0x1
	.value	0x14e
	.byte	0x1
	.long	0xb5
	.long	.LFB12
	.long	.LFE12
	.long	.LLST24
	.byte	0x1
	.long	0x109b
	.uleb128 0x1d
	.long	.LASF54
	.byte	0x1
	.value	0x150
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.string	"ip"
	.byte	0x1
	.value	0x151
	.long	0x358
	.long	.LLST25
	.uleb128 0x18
	.long	.LVL151
	.long	0x1556
	.uleb128 0x17
	.long	.LVL152
	.long	0x1539
	.long	0x1052
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.long	.LVL153
	.long	0xc2a
	.long	0x1072
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 12
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x18
	.long	.LVL156
	.long	0x157d
	.uleb128 0x17
	.long	.LVL159
	.long	0x15a0
	.long	0x1091
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL160
	.long	0x157d
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF59
	.byte	0x1
	.value	0x15e
	.byte	0x1
	.long	0xb5
	.long	.LFB13
	.long	.LFE13
	.long	.LLST26
	.byte	0x1
	.long	0x119d
	.uleb128 0x1e
	.string	"ip"
	.byte	0x1
	.value	0x160
	.long	0x358
	.long	.LLST27
	.uleb128 0x1d
	.long	.LASF54
	.byte	0x1
	.value	0x161
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1e
	.string	"len"
	.byte	0x1
	.value	0x162
	.long	0xb5
	.long	.LLST28
	.uleb128 0x1d
	.long	.LASF36
	.byte	0x1
	.value	0x163
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1d
	.long	.LASF37
	.byte	0x1
	.value	0x163
	.long	0xb5
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.long	.LVL162
	.long	0x1556
	.uleb128 0x17
	.long	.LVL163
	.long	0x1539
	.long	0x112a
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.byte	0
	.uleb128 0x17
	.long	.LVL166
	.long	0x1467
	.long	0x1145
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.byte	0
	.uleb128 0x17
	.long	.LVL167
	.long	0x1467
	.long	0x1160
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x32
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -28
	.byte	0
	.uleb128 0x17
	.long	.LVL168
	.long	0xc2a
	.long	0x1174
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x33
	.byte	0
	.uleb128 0x18
	.long	.LVL171
	.long	0x157d
	.uleb128 0x17
	.long	.LVL174
	.long	0x15a0
	.long	0x1193
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -16
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL175
	.long	0x157d
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF60
	.byte	0x1
	.value	0x173
	.byte	0x1
	.long	0xb5
	.long	.LFB14
	.long	.LFE14
	.long	.LLST29
	.byte	0x1
	.long	0x126e
	.uleb128 0x1d
	.long	.LASF54
	.byte	0x1
	.value	0x175
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1e
	.string	"ip"
	.byte	0x1
	.value	0x176
	.long	0x358
	.long	.LLST30
	.uleb128 0x18
	.long	.LVL178
	.long	0x1556
	.uleb128 0x17
	.long	.LVL179
	.long	0x1539
	.long	0x11fe
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x18
	.long	.LVL180
	.long	0x1565
	.uleb128 0x18
	.long	.LVL183
	.long	0x157d
	.uleb128 0x17
	.long	.LVL186
	.long	0x158c
	.long	0x1226
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x17
	.long	.LVL187
	.long	0x15a0
	.long	0x123c
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL188
	.long	0x157d
	.uleb128 0x17
	.long	.LVL189
	.long	0x15c8
	.long	0x125b
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0
	.uleb128 0x18
	.long	.LVL190
	.long	0x161b
	.uleb128 0x18
	.long	.LVL191
	.long	0x157d
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF61
	.byte	0x1
	.value	0x18b
	.byte	0x1
	.long	0xb5
	.long	.LFB15
	.long	.LFE15
	.long	.LLST31
	.byte	0x1
	.long	0x137b
	.uleb128 0x1d
	.long	.LASF54
	.byte	0x1
	.value	0x18d
	.long	0x222
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1d
	.long	.LASF62
	.byte	0x1
	.value	0x18d
	.long	0x137b
	.byte	0x3
	.byte	0x91
	.sleb128 -152
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.value	0x18e
	.long	0xb5
	.long	.LLST32
	.uleb128 0x1d
	.long	.LASF63
	.byte	0x1
	.value	0x18f
	.long	0x25
	.byte	0x3
	.byte	0x91
	.sleb128 -156
	.uleb128 0x1d
	.long	.LASF64
	.byte	0x1
	.value	0x18f
	.long	0x25
	.byte	0x3
	.byte	0x91
	.sleb128 -160
	.uleb128 0x17
	.long	.LVL193
	.long	0x1539
	.long	0x12f5
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -16
	.byte	0
	.uleb128 0x17
	.long	.LVL194
	.long	0x1467
	.long	0x1311
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x75
	.sleb128 -148
	.byte	0
	.uleb128 0x17
	.long	.LVL195
	.long	0x16b4
	.long	0x1334
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x3
	.byte	0x75
	.sleb128 -144
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.uleb128 0x17
	.long	.LVL199
	.long	0x1728
	.long	0x134a
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x75
	.sleb128 -152
	.byte	0
	.uleb128 0x17
	.long	.LVL200
	.long	0x1745
	.long	0x1360
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x3
	.byte	0x75
	.sleb128 -144
	.byte	0
	.uleb128 0x14
	.long	.LVL201
	.long	0x1762
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0xb
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x32
	.byte	0x24
	.byte	0x75
	.sleb128 0
	.byte	0x22
	.byte	0x8
	.byte	0x90
	.byte	0x1c
	.byte	0
	.byte	0
	.uleb128 0xd
	.long	0x222
	.long	0x138b
	.uleb128 0xe
	.long	0x11d
	.byte	0x1f
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF65
	.byte	0x1
	.value	0x1a5
	.byte	0x1
	.long	0xb5
	.long	.LFB16
	.long	.LFE16
	.long	.LLST33
	.byte	0x1
	.long	0x1456
	.uleb128 0x1f
	.string	"fd"
	.byte	0x1
	.value	0x1a7
	.long	0x456
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.string	"rf"
	.byte	0x1
	.value	0x1a8
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1f
	.string	"wf"
	.byte	0x1
	.value	0x1a8
	.long	0x24b
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x1e
	.string	"fd0"
	.byte	0x1
	.value	0x1a9
	.long	0xb5
	.long	.LLST34
	.uleb128 0x1e
	.string	"fd1"
	.byte	0x1
	.value	0x1a9
	.long	0xb5
	.long	.LLST35
	.uleb128 0x17
	.long	.LVL203
	.long	0x149c
	.long	0x1415
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -20
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 8
	.byte	0x1
	.byte	0x38
	.byte	0
	.uleb128 0x17
	.long	.LVL204
	.long	0x177f
	.long	0x1431
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x2
	.byte	0x75
	.sleb128 -24
	.uleb128 0x15
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x2
	.byte	0x75
	.sleb128 -28
	.byte	0
	.uleb128 0x18
	.long	.LVL206
	.long	0x462
	.uleb128 0x18
	.long	.LVL209
	.long	0x462
	.uleb128 0x18
	.long	.LVL212
	.long	0x1508
	.uleb128 0x18
	.long	.LVL213
	.long	0x1508
	.byte	0
	.uleb128 0x20
	.long	.LASF13
	.byte	0x4
	.byte	0x1f
	.long	.LASF99
	.long	0x1e5
	.byte	0x1
	.byte	0x1
	.uleb128 0x21
	.byte	0x1
	.long	.LASF66
	.byte	0x7
	.byte	0x90
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1484
	.uleb128 0x22
	.long	0xb5
	.uleb128 0x22
	.long	0x456
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF67
	.byte	0x7
	.byte	0x1e
	.byte	0x1
	.long	0x24b
	.byte	0x1
	.long	0x149c
	.uleb128 0x22
	.long	0x24b
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF68
	.byte	0x7
	.byte	0x91
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x14be
	.uleb128 0x22
	.long	0xb5
	.uleb128 0x22
	.long	0x14be
	.uleb128 0x22
	.long	0xb5
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x222
	.uleb128 0x21
	.byte	0x1
	.long	.LASF69
	.byte	0x7
	.byte	0x20
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x14e6
	.uleb128 0x22
	.long	0x24b
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0xb5
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF70
	.byte	0x7
	.byte	0x22
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1508
	.uleb128 0x22
	.long	0x24b
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0xb5
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF76
	.byte	0x7
	.byte	0x1d
	.byte	0x1
	.byte	0x1
	.long	0x151c
	.uleb128 0x22
	.long	0x24b
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF71
	.byte	0x7
	.byte	0x21
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1539
	.uleb128 0x22
	.long	0x24b
	.uleb128 0x22
	.long	0x731
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF72
	.byte	0x7
	.byte	0x92
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1556
	.uleb128 0x22
	.long	0xb5
	.uleb128 0x22
	.long	0x14be
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF74
	.byte	0x7
	.byte	0x56
	.byte	0x1
	.long	0x1565
	.uleb128 0x25
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF73
	.byte	0x7
	.byte	0x31
	.byte	0x1
	.long	0x358
	.byte	0x1
	.long	0x157d
	.uleb128 0x22
	.long	0x222
	.byte	0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF75
	.byte	0x7
	.byte	0x57
	.byte	0x1
	.long	0x158c
	.uleb128 0x25
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF77
	.byte	0x7
	.byte	0x2b
	.byte	0x1
	.byte	0x1
	.long	0x15a0
	.uleb128 0x22
	.long	0x358
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF78
	.byte	0x7
	.byte	0x2e
	.byte	0x1
	.byte	0x1
	.long	0x15b4
	.uleb128 0x22
	.long	0x358
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF79
	.byte	0x7
	.byte	0x2f
	.byte	0x1
	.byte	0x1
	.long	0x15c8
	.uleb128 0x22
	.long	0x358
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF80
	.byte	0x7
	.byte	0x2d
	.byte	0x1
	.byte	0x1
	.long	0x15dc
	.uleb128 0x22
	.long	0x358
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF81
	.byte	0x7
	.byte	0x32
	.byte	0x1
	.long	0x358
	.byte	0x1
	.long	0x15f9
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0x222
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF82
	.byte	0x7
	.byte	0x26
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x161b
	.uleb128 0x22
	.long	0x358
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0x25
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF83
	.byte	0x7
	.byte	0x2c
	.byte	0x1
	.byte	0x1
	.long	0x162f
	.uleb128 0x22
	.long	0x358
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF84
	.byte	0x7
	.byte	0x33
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1656
	.uleb128 0x22
	.long	0x358
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0x25
	.uleb128 0x22
	.long	0x25
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF85
	.byte	0x7
	.byte	0x16
	.byte	0x1
	.byte	0x1
	.long	0x166a
	.uleb128 0x22
	.long	0x222
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF86
	.byte	0x7
	.byte	0x30
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1687
	.uleb128 0x22
	.long	0x1687
	.uleb128 0x22
	.long	0x1687
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.long	0x168d
	.uleb128 0x26
	.long	0x228
	.uleb128 0x21
	.byte	0x1
	.long	.LASF87
	.byte	0x7
	.byte	0x27
	.byte	0x1
	.long	0x358
	.byte	0x1
	.long	0x16b4
	.uleb128 0x22
	.long	0x358
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0xbc
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF88
	.byte	0x7
	.byte	0x89
	.byte	0x1
	.long	0xc2
	.byte	0x1
	.long	0x16d6
	.uleb128 0x22
	.long	0xc2
	.uleb128 0x22
	.long	0xb5
	.uleb128 0x22
	.long	0x25
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF89
	.byte	0x7
	.byte	0x35
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x16fd
	.uleb128 0x22
	.long	0x358
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0x25
	.uleb128 0x22
	.long	0x25
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF90
	.byte	0x7
	.byte	0x28
	.byte	0x1
	.long	0x358
	.byte	0x1
	.long	0x171a
	.uleb128 0x22
	.long	0x25
	.uleb128 0x22
	.long	0xae
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.long	.LASF100
	.byte	0x7
	.byte	0x1c
	.byte	0x1
	.long	0x24b
	.byte	0x1
	.uleb128 0x21
	.byte	0x1
	.long	.LASF91
	.byte	0x7
	.byte	0x93
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1745
	.uleb128 0x22
	.long	0x25
	.uleb128 0x22
	.long	0x456
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF92
	.byte	0x7
	.byte	0x19
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x1762
	.uleb128 0x22
	.long	0x222
	.uleb128 0x22
	.long	0x14be
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.long	.LASF93
	.byte	0x7
	.byte	0x94
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.long	0x177f
	.uleb128 0x22
	.long	0x25
	.uleb128 0x22
	.long	0x14be
	.byte	0
	.uleb128 0x28
	.byte	0x1
	.long	.LASF94
	.byte	0x7
	.byte	0x64
	.byte	0x1
	.long	0xb5
	.byte	0x1
	.uleb128 0x22
	.long	0x45c
	.uleb128 0x22
	.long	0x45c
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
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1a
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST2:
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
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL16-.Ltext0
	.long	.LVL18-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST5:
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
.LLST6:
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
.LLST7:
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
	.long	.LFB7-.Ltext0
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
	.long	.LFE7-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST10:
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL47-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST11:
	.long	.LVL36-.Ltext0
	.long	.LVL37-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL37-1-.Ltext0
	.long	.LVL38-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL38-.Ltext0
	.long	.LVL39-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL39-.Ltext0
	.long	.LVL58-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST12:
	.long	.LFB8-.Ltext0
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
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST13:
	.long	.LVL60-.Ltext0
	.long	.LVL61-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL61-.Ltext0
	.long	.LVL62-1-.Ltext0
	.value	0x1
	.byte	0x52
	.long	.LVL62-1-.Ltext0
	.long	.LFE8-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST14:
	.long	.LFB9-.Ltext0
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
	.long	.LFE9-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST15:
	.long	.LVL76-.Ltext0
	.long	.LVL77-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL77-.Ltext0
	.long	.LVL90-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST16:
	.long	.LVL68-.Ltext0
	.long	.LVL69-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL69-1-.Ltext0
	.long	.LVL70-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL70-.Ltext0
	.long	.LVL71-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL71-.Ltext0
	.long	.LVL93-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST17:
	.long	.LFB10-.Ltext0
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
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST18:
	.long	.LVL102-.Ltext0
	.long	.LVL103-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL103-.Ltext0
	.long	.LVL107-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL107-.Ltext0
	.long	.LVL108-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL108-.Ltext0
	.long	.LVL110-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL110-.Ltext0
	.long	.LVL111-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL111-1-.Ltext0
	.long	.LVL111-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	.LVL111-.Ltext0
	.long	.LVL112-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL112-.Ltext0
	.long	.LVL122-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -24
	.long	0
	.long	0
.LLST19:
	.long	.LVL96-.Ltext0
	.long	.LVL97-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL97-.Ltext0
	.long	.LVL98-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	.LVL98-.Ltext0
	.long	.LVL99-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL99-.Ltext0
	.long	.LFE10-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST20:
	.long	.LFB11-.Ltext0
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
	.long	.LFE11-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST21:
	.long	.LVL141-.Ltext0
	.long	.LVL142-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL146-.Ltext0
	.long	.LVL147-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL147-.Ltext0
	.long	.LVL150-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	0
	.long	0
.LLST22:
	.long	.LVL139-.Ltext0
	.long	.LVL140-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL140-1-.Ltext0
	.long	.LVL150-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST23:
	.long	.LVL127-.Ltext0
	.long	.LVL128-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL128-1-.Ltext0
	.long	.LVL129-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL131-.Ltext0
	.long	.LVL132-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL132-1-.Ltext0
	.long	.LVL133-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL133-.Ltext0
	.long	.LVL134-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL134-.Ltext0
	.long	.LVL150-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST24:
	.long	.LFB12-.Ltext0
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
	.long	.LFE12-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST25:
	.long	.LVL154-.Ltext0
	.long	.LVL155-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL157-.Ltext0
	.long	.LVL158-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL158-.Ltext0
	.long	.LVL161-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST26:
	.long	.LFB13-.Ltext0
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
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST27:
	.long	.LVL169-.Ltext0
	.long	.LVL170-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL172-.Ltext0
	.long	.LVL173-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL173-.Ltext0
	.long	.LVL176-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST28:
	.long	.LVL164-.Ltext0
	.long	.LVL165-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL165-.Ltext0
	.long	.LVL177-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL177-.Ltext0
	.long	.LFE13-.Ltext0
	.value	0x2
	.byte	0x91
	.sleb128 -20
	.long	0
	.long	0
.LLST29:
	.long	.LFB14-.Ltext0
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
	.long	.LFE14-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST30:
	.long	.LVL181-.Ltext0
	.long	.LVL182-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL184-.Ltext0
	.long	.LVL185-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL185-.Ltext0
	.long	.LVL192-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST31:
	.long	.LFB15-.Ltext0
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
	.long	.LFE15-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST32:
	.long	.LVL196-.Ltext0
	.long	.LVL197-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL197-.Ltext0
	.long	.LVL198-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL198-.Ltext0
	.long	.LVL202-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST33:
	.long	.LFB16-.Ltext0
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
	.long	.LFE16-.Ltext0
	.value	0x2
	.byte	0x74
	.sleb128 4
	.long	0
	.long	0
.LLST34:
	.long	.LVL205-.Ltext0
	.long	.LVL207-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL207-.Ltext0
	.long	.LVL208-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL208-.Ltext0
	.long	.LVL216-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST35:
	.long	.LVL210-.Ltext0
	.long	.LVL211-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL214-.Ltext0
	.long	.LVL215-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL215-.Ltext0
	.long	.LVL216-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
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
.LASF72:
	.string	"argstr"
.LASF23:
	.string	"EMBRYO"
.LASF66:
	.string	"argint"
.LASF100:
	.string	"filealloc"
.LASF95:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF87:
	.string	"dirlookup"
.LASF6:
	.string	"type"
.LASF54:
	.string	"path"
.LASF52:
	.string	"isdirempty"
.LASF32:
	.string	"pipe"
.LASF24:
	.string	"SLEEPING"
.LASF93:
	.string	"fetchstr"
.LASF10:
	.string	"stat"
.LASF65:
	.string	"sys_pipe"
.LASF92:
	.string	"exec"
.LASF71:
	.string	"filestat"
.LASF91:
	.string	"fetchint"
.LASF17:
	.string	"parent"
.LASF16:
	.string	"state"
.LASF85:
	.string	"panic"
.LASF67:
	.string	"filedup"
.LASF90:
	.string	"ialloc"
.LASF40:
	.string	"FD_NONE"
.LASF42:
	.string	"FD_INODE"
.LASF83:
	.string	"iput"
.LASF99:
	.string	"%gs:4"
.LASF5:
	.string	"pde_t"
.LASF2:
	.string	"unsigned int"
.LASF51:
	.string	"sys_link"
.LASF13:
	.string	"proc"
.LASF82:
	.string	"dirlink"
.LASF37:
	.string	"minor"
.LASF45:
	.string	"fdalloc"
.LASF41:
	.string	"FD_PIPE"
.LASF21:
	.string	"name"
.LASF25:
	.string	"RUNNABLE"
.LASF8:
	.string	"size"
.LASF3:
	.string	"short unsigned int"
.LASF81:
	.string	"nameiparent"
.LASF7:
	.string	"nlink"
.LASF20:
	.string	"ofile"
.LASF50:
	.string	"sys_fstat"
.LASF89:
	.string	"writei"
.LASF79:
	.string	"iupdate"
.LASF57:
	.string	"omode"
.LASF14:
	.string	"pgdir"
.LASF61:
	.string	"sys_exec"
.LASF19:
	.string	"killed"
.LASF22:
	.string	"UNUSED"
.LASF98:
	.string	"procstate"
.LASF43:
	.string	"trapframe"
.LASF96:
	.string	"sysfile.c"
.LASF27:
	.string	"ZOMBIE"
.LASF53:
	.string	"sys_unlink"
.LASF1:
	.string	"ushort"
.LASF80:
	.string	"iunlock"
.LASF68:
	.string	"argptr"
.LASF39:
	.string	"dirent"
.LASF49:
	.string	"sys_close"
.LASF38:
	.string	"addrs"
.LASF56:
	.string	"sys_open"
.LASF64:
	.string	"uarg"
.LASF97:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF59:
	.string	"sys_mknod"
.LASF0:
	.string	"uint"
.LASF33:
	.string	"inode"
.LASF15:
	.string	"kstack"
.LASF30:
	.string	"readable"
.LASF34:
	.string	"inum"
.LASF4:
	.string	"unsigned char"
.LASF58:
	.string	"sys_mkdir"
.LASF9:
	.string	"short int"
.LASF47:
	.string	"sys_read"
.LASF29:
	.string	"file"
.LASF48:
	.string	"sys_write"
.LASF60:
	.string	"sys_chdir"
.LASF26:
	.string	"RUNNING"
.LASF73:
	.string	"namei"
.LASF70:
	.string	"filewrite"
.LASF46:
	.string	"sys_dup"
.LASF77:
	.string	"ilock"
.LASF18:
	.string	"chan"
.LASF28:
	.string	"char"
.LASF69:
	.string	"fileread"
.LASF63:
	.string	"uargv"
.LASF31:
	.string	"writable"
.LASF76:
	.string	"fileclose"
.LASF11:
	.string	"context"
.LASF75:
	.string	"end_op"
.LASF44:
	.string	"argfd"
.LASF84:
	.string	"readi"
.LASF86:
	.string	"namecmp"
.LASF88:
	.string	"memset"
.LASF94:
	.string	"pipealloc"
.LASF74:
	.string	"begin_op"
.LASF35:
	.string	"flags"
.LASF12:
	.string	"sizetype"
.LASF78:
	.string	"iunlockput"
.LASF36:
	.string	"major"
.LASF62:
	.string	"argv"
.LASF55:
	.string	"create"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
