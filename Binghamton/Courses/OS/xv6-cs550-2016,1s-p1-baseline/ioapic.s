	.file	"ioapic.c"
	.text
.Ltext0:
	.comm	ioapic,4,4
	.type	ioapicread, @function
ioapicread:
.LFB0:
	.file 1 "ioapic.c"
	.loc 1 36 0
	.cfi_startproc
.LVL0:
	pushl	%ebp
.LCFI0:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI1:
	.cfi_def_cfa_register 5
	.loc 1 37 0
	movl	ioapic, %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 38 0
	movl	ioapic, %eax
	movl	16(%eax), %eax
	.loc 1 39 0
	popl	%ebp
.LCFI2:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	ioapicread, .-ioapicread
	.type	ioapicwrite, @function
ioapicwrite:
.LFB1:
	.loc 1 43 0
	.cfi_startproc
.LVL1:
	pushl	%ebp
.LCFI3:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI4:
	.cfi_def_cfa_register 5
	.loc 1 44 0
	movl	ioapic, %eax
	movl	8(%ebp), %edx
	movl	%edx, (%eax)
	.loc 1 45 0
	movl	ioapic, %eax
	movl	12(%ebp), %edx
	movl	%edx, 16(%eax)
	.loc 1 46 0
	popl	%ebp
.LCFI5:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	ioapicwrite, .-ioapicwrite
	.section	.rodata
	.align 4
.LC0:
	.string	"ioapicinit: id isn't equal to ioapicid; not a MP\n"
	.text
	.globl	ioapicinit
	.type	ioapicinit, @function
ioapicinit:
.LFB2:
	.loc 1 50 0
	.cfi_startproc
	pushl	%ebp
.LCFI6:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI7:
	.cfi_def_cfa_register 5
	subl	$40, %esp
	.loc 1 53 0
	movl	ismp, %eax
	testl	%eax, %eax
	jne	.L5
	.loc 1 54 0
	jmp	.L4
.L5:
	.loc 1 56 0
	movl	$-20971520, ioapic
	.loc 1 57 0
	movl	$1, (%esp)
	call	ioapicread
.LVL2:
	shrl	$16, %eax
	andl	$255, %eax
	movl	%eax, -16(%ebp)
.LVL3:
	.loc 1 58 0
	movl	$0, (%esp)
	call	ioapicread
.LVL4:
	shrl	$24, %eax
	movl	%eax, -20(%ebp)
.LVL5:
	.loc 1 59 0
	movzbl	ioapicid, %eax
.LVL6:
	movzbl	%al, %eax
	cmpl	-20(%ebp), %eax
	je	.L7
	.loc 1 60 0
	movl	$.LC0, (%esp)
	call	cprintf
.LVL7:
.L7:
	.loc 1 64 0
	movl	$0, -12(%ebp)
.LVL8:
	jmp	.L8
.LVL9:
.L9:
	.loc 1 65 0 discriminator 2
	movl	-12(%ebp), %eax
.LVL10:
	addl	$32, %eax
	orl	$65536, %eax
	movl	-12(%ebp), %edx
	addl	$8, %edx
	addl	%edx, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	ioapicwrite
.LVL11:
	.loc 1 66 0 discriminator 2
	movl	-12(%ebp), %eax
	addl	$8, %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	$0, 4(%esp)
	movl	%eax, (%esp)
	call	ioapicwrite
.LVL12:
	.loc 1 64 0 discriminator 2
	addl	$1, -12(%ebp)
.L8:
	.loc 1 64 0 is_stmt 0 discriminator 1
	movl	-12(%ebp), %eax
	cmpl	-16(%ebp), %eax
	jle	.L9
.LVL13:
.L4:
	.loc 1 68 0 is_stmt 1
	leave
.LCFI8:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	ioapicinit, .-ioapicinit
	.globl	ioapicenable
	.type	ioapicenable, @function
ioapicenable:
.LFB3:
	.loc 1 72 0
	.cfi_startproc
.LVL14:
	pushl	%ebp
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
.LCFI10:
	.cfi_def_cfa_register 5
	subl	$8, %esp
	.loc 1 73 0
	movl	ismp, %eax
	testl	%eax, %eax
	jne	.L11
	.loc 1 74 0
	jmp	.L10
.L11:
	.loc 1 79 0
	movl	8(%ebp), %eax
	addl	$32, %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	addl	%edx, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	ioapicwrite
.LVL15:
	.loc 1 80 0
	movl	12(%ebp), %eax
	sall	$24, %eax
	movl	8(%ebp), %edx
	addl	$8, %edx
	addl	%edx, %edx
	addl	$1, %edx
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	ioapicwrite
.LVL16:
.L10:
	.loc 1 81 0
	leave
.LCFI11:
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	ioapicenable, .-ioapicenable
.Letext0:
	.file 2 "types.h"
	.file 3 "defs.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x2a5
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF15
	.byte	0x1
	.long	.LASF16
	.long	.LASF17
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF2
	.byte	0x2
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
	.uleb128 0x2
	.long	.LASF3
	.byte	0x2
	.byte	0x3
	.long	0x49
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x4
	.long	.LASF13
	.byte	0x14
	.byte	0x1
	.byte	0x1c
	.long	0x87
	.uleb128 0x5
	.string	"reg"
	.byte	0x1
	.byte	0x1d
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x5
	.string	"pad"
	.byte	0x1
	.byte	0x1e
	.long	0x87
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF5
	.byte	0x1
	.byte	0x1f
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0
	.uleb128 0x7
	.long	0x25
	.long	0x97
	.uleb128 0x8
	.long	0x97
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x9
	.long	.LASF18
	.byte	0x1
	.byte	0x23
	.byte	0x1
	.long	0x25
	.long	.LFB0
	.long	.LFE0
	.long	.LLST0
	.byte	0x1
	.long	0xca
	.uleb128 0xa
	.string	"reg"
	.byte	0x1
	.byte	0x23
	.long	0xca
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xb
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0xc
	.long	.LASF19
	.byte	0x1
	.byte	0x2a
	.byte	0x1
	.long	.LFB1
	.long	.LFE1
	.long	.LLST1
	.byte	0x1
	.long	0x107
	.uleb128 0xa
	.string	"reg"
	.byte	0x1
	.byte	0x2a
	.long	0xca
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF5
	.byte	0x1
	.byte	0x2a
	.long	0x25
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF8
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.long	.LFB2
	.long	.LFE2
	.long	.LLST2
	.byte	0x1
	.long	0x1d2
	.uleb128 0xf
	.string	"i"
	.byte	0x1
	.byte	0x33
	.long	0xca
	.long	.LLST3
	.uleb128 0xf
	.string	"id"
	.byte	0x1
	.byte	0x33
	.long	0xca
	.long	.LLST4
	.uleb128 0x10
	.long	.LASF7
	.byte	0x1
	.byte	0x33
	.long	0xca
	.long	.LLST5
	.uleb128 0x11
	.long	.LVL2
	.long	0x9e
	.long	0x15f
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0x11
	.long	.LVL4
	.long	0x9e
	.long	0x173
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x11
	.long	.LVL7
	.long	0x286
	.long	0x18b
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x5
	.byte	0x3
	.long	.LC0
	.byte	0
	.uleb128 0x11
	.long	.LVL11
	.long	0xd1
	.long	0x1b3
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x7
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.byte	0x31
	.byte	0x24
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x9
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x20
	.byte	0x40
	.byte	0x3c
	.byte	0x24
	.byte	0x21
	.byte	0
	.uleb128 0x13
	.long	.LVL12
	.long	0xd1
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x9
	.byte	0x75
	.sleb128 -12
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.byte	0x31
	.byte	0x24
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF9
	.byte	0x1
	.byte	0x47
	.byte	0x1
	.long	.LFB3
	.long	.LFE3
	.long	.LLST6
	.byte	0x1
	.long	0x24f
	.uleb128 0xa
	.string	"irq"
	.byte	0x1
	.byte	0x47
	.long	0xca
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0xd
	.long	.LASF10
	.byte	0x1
	.byte	0x47
	.long	0xca
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x11
	.long	.LVL15
	.long	0xd1
	.long	0x22c
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x7
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.byte	0x31
	.byte	0x24
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x20
	.byte	0
	.uleb128 0x13
	.long	.LVL16
	.long	0xd1
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 0
	.byte	0x9
	.byte	0x91
	.sleb128 0
	.byte	0x6
	.byte	0x23
	.uleb128 0x8
	.byte	0x31
	.byte	0x24
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x12
	.byte	0x2
	.byte	0x74
	.sleb128 4
	.byte	0x5
	.byte	0x91
	.sleb128 4
	.byte	0x6
	.byte	0x48
	.byte	0x24
	.byte	0
	.byte	0
	.uleb128 0x14
	.long	.LASF11
	.byte	0x3
	.byte	0x3e
	.long	0x3e
	.byte	0x1
	.byte	0x1
	.uleb128 0x14
	.long	.LASF12
	.byte	0x3
	.byte	0x5a
	.long	0xca
	.byte	0x1
	.byte	0x1
	.uleb128 0x15
	.long	.LASF13
	.byte	0x1
	.byte	0x19
	.long	0x27b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ioapic
	.uleb128 0x16
	.byte	0x4
	.long	0x281
	.uleb128 0x17
	.long	0x50
	.uleb128 0x18
	.byte	0x1
	.long	.LASF20
	.byte	0x3
	.byte	0x14
	.byte	0x1
	.byte	0x1
	.long	0x29b
	.uleb128 0x19
	.long	0x29b
	.uleb128 0x1a
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.long	0x2a1
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF14
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x18
	.byte	0
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
.LLST3:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL10-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -12
	.long	0
	.long	0
.LLST4:
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL6-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -20
	.long	0
	.long	0
.LLST5:
	.long	.LVL3-.Ltext0
	.long	.LVL4-1-.Ltext0
	.value	0x1
	.byte	0x50
	.long	.LVL4-1-.Ltext0
	.long	.LVL13-.Ltext0
	.value	0x2
	.byte	0x75
	.sleb128 -16
	.long	0
	.long	0
.LLST6:
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
.LASF1:
	.string	"short unsigned int"
.LASF0:
	.string	"unsigned int"
.LASF15:
	.string	"GNU C 4.8.4 -m32 -mtune=generic -march=i686 -g -gdwarf-2 -O0 -fno-pic -fno-builtin -fno-strict-aliasing -fvar-tracking -fvar-tracking-assignments -fno-omit-frame-pointer -fno-stack-protector"
.LASF8:
	.string	"ioapicinit"
.LASF2:
	.string	"uint"
.LASF17:
	.string	"/home/hprem991/Desktop/Courses/OS/xv6-cs550-2016,1s-p1-baseline"
.LASF13:
	.string	"ioapic"
.LASF9:
	.string	"ioapicenable"
.LASF12:
	.string	"ismp"
.LASF14:
	.string	"char"
.LASF20:
	.string	"cprintf"
.LASF4:
	.string	"unsigned char"
.LASF5:
	.string	"data"
.LASF11:
	.string	"ioapicid"
.LASF3:
	.string	"uchar"
.LASF7:
	.string	"maxintr"
.LASF18:
	.string	"ioapicread"
.LASF16:
	.string	"ioapic.c"
.LASF10:
	.string	"cpunum"
.LASF19:
	.string	"ioapicwrite"
.LASF6:
	.string	"sizetype"
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
