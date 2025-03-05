	.file	"cpu.cpp"
	.text
	.align 2
	.p2align 4
	.globl	_ZN3CPUC2EP3Bus
	.def	_ZN3CPUC2EP3Bus;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPUC2EP3Bus
_ZN3CPUC2EP3Bus:
.LFB1787:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movl	$-4, %eax
	movq	%rcx, %rbx
	movq	%rdx, %rcx
	movw	%ax, 44(%rsp)
	movq	%rdx, (%rbx)
	leaq	44(%rsp), %rdx
	movl	$-16777216, 10(%rbx)
	movb	$52, 14(%rbx)
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movl	$-3, %edx
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	movzbl	%al, %esi
	call	_ZN3Bus7cpuReadERKt
	sall	$8, %eax
	orl	%esi, %eax
	movw	%ax, 8(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.globl	_ZN3CPUC1EP3Bus
	.def	_ZN3CPUC1EP3Bus;	.scl	2;	.type	32;	.endef
	.set	_ZN3CPUC1EP3Bus,_ZN3CPUC2EP3Bus
	.align 2
	.p2align 4
	.globl	_ZN3CPU9fetchByteEv
	.def	_ZN3CPU9fetchByteEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9fetchByteEv
_ZN3CPU9fetchByteEv:
.LFB1789:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzwl	8(%rcx), %eax
	movq	(%rcx), %r8
	leal	1(%rax), %edx
	movw	%dx, 8(%rcx)
	leaq	46(%rsp), %rdx
	movq	%r8, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU12fetchAddressEv
	.def	_ZN3CPU12fetchAddressEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU12fetchAddressEv
_ZN3CPU12fetchAddressEv:
.LFB1790:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r12
	movzwl	8(%rbx), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%rbx)
	movq	%r12, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movzbl	%al, %esi
	movzwl	8(%rbx), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%rbx)
	movq	%r12, %rdx
	call	_ZN3Bus7cpuReadERKt
	sall	$8, %eax
	orl	%esi, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU11readAddressERKt
	.def	_ZN3CPU11readAddressERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU11readAddressERKt
_ZN3CPU11readAddressERKt:
.LFB1791:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rdi
	movq	(%rcx), %rcx
	movq	%rdx, %rsi
	call	_ZN3Bus7cpuReadERKt
	movq	(%rdi), %rcx
	leaq	46(%rsp), %rdx
	movzbl	%al, %ebx
	movzwl	(%rsi), %eax
	addl	$1, %eax
	andw	$255, %ax
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	sall	$8, %eax
	orl	%ebx, %eax
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU11pushToStackEh
	.def	_ZN3CPU11pushToStackEh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU11pushToStackEh
_ZN3CPU11pushToStackEh:
.LFB1792:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	13(%rcx), %eax
	movq	(%rcx), %r9
	movb	%dl, 72(%rsp)
	leal	-1(%rax), %edx
	leaq	72(%rsp), %r8
	orb	$1, %ah
	movb	%dl, 13(%rcx)
	leaq	46(%rsp), %rdx
	movq	%r9, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	nop
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU13pullFromStackEv
	.def	_ZN3CPU13pullFromStackEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU13pullFromStackEv
_ZN3CPU13pullFromStackEv:
.LFB1793:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	13(%rcx), %eax
	movq	(%rcx), %r8
	addl	$1, %eax
	movb	%al, 13(%rcx)
	movzbl	%al, %eax
	leaq	46(%rsp), %rdx
	movq	%r8, %rcx
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU15zeropageAddressEv
	.def	_ZN3CPU15zeropageAddressEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU15zeropageAddressEv
_ZN3CPU15zeropageAddressEv:
.LFB1794:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzwl	8(%rcx), %eax
	movq	(%rcx), %r8
	leal	1(%rax), %edx
	movw	%dx, 8(%rcx)
	leaq	46(%rsp), %rdx
	movq	%r8, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movzbl	%al, %eax
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU16zeropageXAddressEv
	.def	_ZN3CPU16zeropageXAddressEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU16zeropageXAddressEv
_ZN3CPU16zeropageXAddressEv:
.LFB1795:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movzwl	8(%rbx), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%rbx)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	11(%rbx), %al
	movzbl	%al, %eax
	addq	$48, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU16zeropageYAddressEv
	.def	_ZN3CPU16zeropageYAddressEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU16zeropageYAddressEv
_ZN3CPU16zeropageYAddressEv:
.LFB1796:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movzwl	8(%rbx), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%rbx)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	12(%rbx), %al
	movzbl	%al, %eax
	addq	$48, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU15absoluteAddressEv
	.def	_ZN3CPU15absoluteAddressEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU15absoluteAddressEv
_ZN3CPU15absoluteAddressEv:
.LFB1797:
	.seh_endprologue
	jmp	_ZN3CPU12fetchAddressEv
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU16absoluteXAddressERb
	.def	_ZN3CPU16absoluteXAddressERb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU16absoluteXAddressERb
_ZN3CPU16absoluteXAddressERb:
.LFB1798:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%rbx), %r8d
	addl	%eax, %r8d
	xorl	%r8d, %eax
	testw	$-256, %ax
	movl	%r8d, %eax
	setne	(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU16absoluteYAddressERb
	.def	_ZN3CPU16absoluteYAddressERb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU16absoluteYAddressERb
_ZN3CPU16absoluteYAddressERb:
.LFB1799:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	call	_ZN3CPU12fetchAddressEv
	movzbl	12(%rbx), %r8d
	addl	%eax, %r8d
	xorl	%r8d, %eax
	testw	$-256, %ax
	movl	%r8d, %eax
	setne	(%rsi)
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU16indirectXAddressEv
	.def	_ZN3CPU16indirectXAddressEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU16indirectXAddressEv
_ZN3CPU16indirectXAddressEv:
.LFB1800:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %r12
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	movzwl	8(%r12), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	11(%r12), %al
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU11readAddressERKt
	addq	$56, %rsp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU16indirectYAddressERb
	.def	_ZN3CPU16indirectYAddressERb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU16indirectYAddressERb
_ZN3CPU16indirectYAddressERb:
.LFB1801:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r12
	movzwl	8(%rbx), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%rbx)
	movq	%r12, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r12, %rdx
	movq	%rbx, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU11readAddressERKt
	movzbl	12(%rbx), %r8d
	addl	%eax, %r8d
	xorl	%r8d, %eax
	testw	$-256, %ax
	movl	%r8d, %eax
	setne	(%rsi)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU9immediateEv
	.def	_ZN3CPU9immediateEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9immediateEv
_ZN3CPU9immediateEv:
.LFB2384:
	.seh_endprologue
	jmp	_ZN3CPU9fetchByteEv
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU8zeropageEv
	.def	_ZN3CPU8zeropageEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU8zeropageEv
_ZN3CPU8zeropageEv:
.LFB1803:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzwl	8(%rcx), %eax
	movq	(%rcx), %r12
	leal	1(%rax), %edx
	movw	%dx, 8(%rcx)
	leaq	46(%rsp), %r13
	movq	%r12, %rcx
	movq	%r13, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$56, %rsp
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU9zeropageXEv
	.def	_ZN3CPU9zeropageXEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9zeropageXEv
_ZN3CPU9zeropageXEv:
.LFB1804:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movzwl	8(%rcx), %eax
	movq	(%rcx), %r12
	leal	1(%rax), %edx
	movw	%dx, 8(%rcx)
	leaq	46(%rsp), %r13
	movq	%rcx, %rbx
	movq	%r12, %rcx
	movq	%r13, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addb	11(%rbx), %al
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU8absoluteEv
	.def	_ZN3CPU8absoluteEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU8absoluteEv
_ZN3CPU8absoluteEv:
.LFB1805:
	pushq	%r12
	.seh_pushreg	%r12
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	(%rcx), %r12
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$48, %rsp
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU9absoluteXERb
	.def	_ZN3CPU9absoluteXERb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9absoluteXERb
_ZN3CPU9absoluteXERb:
.LFB1806:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	(%rcx), %r12
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%rbx), %ecx
	leaq	46(%rsp), %rdx
	addl	%eax, %ecx
	xorl	%ecx, %eax
	movw	%cx, 46(%rsp)
	movq	%r12, %rcx
	testw	$-256, %ax
	setne	(%rsi)
	call	_ZN3Bus7cpuReadERKt
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU9absoluteYERb
	.def	_ZN3CPU9absoluteYERb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9absoluteYERb
_ZN3CPU9absoluteYERb:
.LFB1807:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	(%rcx), %r12
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	call	_ZN3CPU12fetchAddressEv
	movzbl	12(%rbx), %ecx
	leaq	46(%rsp), %rdx
	addl	%eax, %ecx
	xorl	%ecx, %eax
	movw	%cx, 46(%rsp)
	movq	%r12, %rcx
	testw	$-256, %ax
	setne	(%rsi)
	call	_ZN3Bus7cpuReadERKt
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU9indirectXEv
	.def	_ZN3CPU9indirectXEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9indirectXEv
_ZN3CPU9indirectXEv:
.LFB1808:
	pushq	%r12
	.seh_pushreg	%r12
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	(%rcx), %r12
	call	_ZN3CPU16indirectXAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$48, %rsp
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU9indirectYERb
	.def	_ZN3CPU9indirectYERb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU9indirectYERb
_ZN3CPU9indirectYERb:
.LFB1809:
	pushq	%r12
	.seh_pushreg	%r12
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	(%rcx), %r12
	call	_ZN3CPU16indirectYAddressERb
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	addq	$48, %rsp
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU14updateZeroFlagERKh
	.def	_ZN3CPU14updateZeroFlagERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU14updateZeroFlagERKh
_ZN3CPU14updateZeroFlagERKh:
.LFB1810:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	andl	$-3, %eax
	orl	$2, %edx
	cmpb	$0, (%r8)
	cmove	%edx, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU18updateNegativeFlagERKh
	.def	_ZN3CPU18updateNegativeFlagERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU18updateNegativeFlagERKh
_ZN3CPU18updateNegativeFlagERKh:
.LFB1811:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	andl	$127, %eax
	orl	$-128, %edx
	cmpb	$0, (%r8)
	cmovs	%edx, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU15updateCarryFlagERKb
	.def	_ZN3CPU15updateCarryFlagERKb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU15updateCarryFlagERKb
_ZN3CPU15updateCarryFlagERKb:
.LFB1812:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	cmpb	$0, (%r8)
	cmovne	%edx, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU18updateOverflowFlagERKhS1_S1_
	.def	_ZN3CPU18updateOverflowFlagERKhS1_S1_;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU18updateOverflowFlagERKhS1_S1_
_ZN3CPU18updateOverflowFlagERKhS1_S1_:
.LFB1813:
	.seh_endprologue
	movzbl	(%rdx), %edx
	movzbl	14(%rcx), %eax
	movl	%edx, %r10d
	xorb	(%r8), %r10b
	js	.L34
	xorb	(%r9), %dl
	js	.L36
.L34:
	andl	$-65, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	orl	$64, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU11updateBFlagERKb
	.def	_ZN3CPU11updateBFlagERKb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU11updateBFlagERKb
_ZN3CPU11updateBFlagERKb:
.LFB1814:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	andl	$-17, %eax
	orl	$16, %edx
	cmpb	$0, (%r8)
	cmovne	%edx, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU19updateInterruptFlagERKb
	.def	_ZN3CPU19updateInterruptFlagERKb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU19updateInterruptFlagERKb
_ZN3CPU19updateInterruptFlagERKb:
.LFB1815:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movq	%rdx, %r8
	movl	%eax, %edx
	andl	$-5, %eax
	orl	$4, %edx
	cmpb	$0, (%r8)
	cmovne	%edx, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU8branchIfERKb
	.def	_ZN3CPU8branchIfERKb;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU8branchIfERKb
_ZN3CPU8branchIfERKb:
.LFB1816:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	%rdx, %rsi
	movq	(%rcx), %rcx
	movzwl	8(%rbx), %eax
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%rbx)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	xorl	%r8d, %r8d
	cmpb	$0, (%rsi)
	je	.L43
	movzwl	8(%rbx), %ecx
	movsbw	%al, %dx
	leal	(%rdx,%rcx), %eax
	movw	%ax, 8(%rbx)
	xorl	%ecx, %eax
	testw	$-256, %ax
	setne	%r8b
	addl	$1, %r8d
.L43:
	movl	%r8d, %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ADCERKh
	.def	_ZN3CPU3ADCERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ADCERKh
_ZN3CPU3ADCERKh:
.LFB1817:
	.seh_endprologue
	movzbl	10(%rcx), %r10d
	movzbl	14(%rcx), %eax
	movzbl	(%rdx), %r8d
	movl	%r10d, %r9d
	addl	%r10d, %r8d
	movl	%eax, %r10d
	movl	%r9d, %r11d
	andl	$1, %r10d
	addl	%r10d, %r8d
	movl	%eax, %r10d
	andl	$-2, %eax
	orl	$1, %r10d
	cmpw	$256, %r8w
	movb	%r8b, 10(%rcx)
	cmovnb	%r10d, %eax
	movl	%eax, %r10d
	andl	$127, %eax
	orl	$-128, %r10d
	testb	%r8b, %r8b
	cmovs	%r10d, %eax
	movl	%eax, %r10d
	andl	$-3, %eax
	orl	$2, %r10d
	testb	%r8b, %r8b
	cmove	%r10d, %eax
	movb	%al, 14(%rcx)
	xorb	(%rdx), %r11b
	js	.L54
	xorb	%r8b, %r9b
	js	.L56
.L54:
	andl	$-65, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L56:
	orl	$64, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ANDERKh
	.def	_ZN3CPU3ANDERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ANDERKh
_ZN3CPU3ANDERKh:
.LFB1818:
	.seh_endprologue
	movzbl	10(%rcx), %eax
	andb	(%rdx), %al
	movl	%eax, %edx
	movb	%al, 10(%rcx)
	movzbl	14(%rcx), %eax
	jne	.L58
	orl	$2, %eax
.L59:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L58:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L59
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ASLEv
	.def	_ZN3CPU3ASLEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ASLEv
_ZN3CPU3ASLEv:
.LFB1819:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movzbl	10(%rcx), %edx
	movl	%eax, %r8d
	andl	$-2, %eax
	orl	$1, %r8d
	testb	%dl, %dl
	cmovs	%r8d, %eax
	addl	%edx, %edx
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L64
	orl	$2, %eax
.L65:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L64:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L65
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ASLERKt
	.def	_ZN3CPU3ASLERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ASLERKt
_ZN3CPU3ASLERKt:
.LFB1820:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %r12
	call	_ZN3Bus7cpuReadERKt
	movzbl	14(%rbx), %edx
	testb	%al, %al
	jns	.L68
	orl	$1, %edx
.L69:
	movb	%dl, 14(%rbx)
	movq	(%rbx), %rcx
	addl	%eax, %eax
	movq	%r12, %rdx
	leaq	47(%rsp), %r8
	movb	%al, 47(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	47(%rsp), %edx
	movzbl	14(%rbx), %eax
	testb	%dl, %dl
	jne	.L70
	orl	$2, %eax
.L71:
	andl	$127, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L68:
	andl	$-2, %edx
	jmp	.L69
	.p2align 4,,10
	.p2align 3
.L70:
	andl	$-3, %eax
	movb	%al, 14(%rbx)
	testb	%dl, %dl
	jns	.L71
	orl	$-128, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BCCEv
	.def	_ZN3CPU3BCCEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BCCEv
_ZN3CPU3BCCEv:
.LFB1821:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	notl	%eax
	andl	$1, %eax
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BCSEv
	.def	_ZN3CPU3BCSEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BCSEv
_ZN3CPU3BCSEv:
.LFB1822:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	andl	$1, %eax
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BEQEv
	.def	_ZN3CPU3BEQEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BEQEv
_ZN3CPU3BEQEv:
.LFB1823:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	shrb	%al
	andl	$1, %eax
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BITERKt
	.def	_ZN3CPU3BITERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BITERKt
_ZN3CPU3BITERKt:
.LFB1824:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	call	_ZN3Bus7cpuReadERKt
	testb	%al, 10(%rbx)
	movzbl	14(%rbx), %edx
	jne	.L77
	orl	$2, %edx
.L78:
	movl	%edx, %ecx
	andl	$127, %edx
	orl	$-128, %ecx
	testb	%al, %al
	cmovs	%ecx, %edx
	andl	$64, %eax
	andl	$-65, %edx
	orl	%eax, %edx
	movb	%dl, 14(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	andl	$-3, %edx
	jmp	.L78
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BMIEv
	.def	_ZN3CPU3BMIEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BMIEv
_ZN3CPU3BMIEv:
.LFB1825:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	shrb	$7, %al
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BNEEv
	.def	_ZN3CPU3BNEEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BNEEv
_ZN3CPU3BNEEv:
.LFB1826:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	shrb	%al
	xorl	$1, %eax
	andl	$1, %eax
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BPLEv
	.def	_ZN3CPU3BPLEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BPLEv
_ZN3CPU3BPLEv:
.LFB1827:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	notl	%eax
	shrb	$7, %al
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BVCEv
	.def	_ZN3CPU3BVCEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BVCEv
_ZN3CPU3BVCEv:
.LFB1828:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	shrb	$6, %al
	xorl	$1, %eax
	andl	$1, %eax
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BVSEv
	.def	_ZN3CPU3BVSEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BVSEv
_ZN3CPU3BVSEv:
.LFB1829:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	shrb	$6, %al
	andl	$1, %eax
	leaq	47(%rsp), %rdx
	movb	%al, 47(%rsp)
	call	_ZN3CPU8branchIfERKb
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3BRKEv
	.def	_ZN3CPU3BRKEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3BRKEv
_ZN3CPU3BRKEv:
.LFB1830:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzwl	8(%rcx), %eax
	addl	$1, %eax
	movq	%rcx, %rbx
	movw	%ax, 8(%rcx)
	movzbl	%ah, %eax
	movq	(%rcx), %rcx
	movb	%al, 44(%rsp)
	movzbl	13(%rbx), %eax
	leaq	44(%rsp), %r13
	leaq	46(%rsp), %r12
	movq	%r13, %r8
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rbx)
	movq	%r12, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzwl	8(%rbx), %eax
	movq	(%rbx), %rcx
	movq	%r13, %r8
	movb	%al, 44(%rsp)
	movzbl	13(%rbx), %eax
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rbx)
	movq	%r12, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	14(%rbx), %eax
	movq	(%rbx), %rcx
	movq	%r13, %r8
	orl	$16, %eax
	movb	%al, 14(%rbx)
	movb	%al, 44(%rsp)
	movzbl	13(%rbx), %eax
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rbx)
	movq	%r12, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	orb	$4, 14(%rbx)
	movq	(%rbx), %rcx
	movq	%r13, %rdx
	movl	$-2, %eax
	movw	%ax, 44(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movl	$-1, %edx
	movw	%dx, 46(%rsp)
	movq	%r12, %rdx
	movzbl	%al, %esi
	call	_ZN3Bus7cpuReadERKt
	sall	$8, %eax
	orl	%esi, %eax
	movw	%ax, 8(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	popq	%r13
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CLCEv
	.def	_ZN3CPU3CLCEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CLCEv
_ZN3CPU3CLCEv:
.LFB1831:
	.seh_endprologue
	andb	$-2, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CLDEv
	.def	_ZN3CPU3CLDEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CLDEv
_ZN3CPU3CLDEv:
.LFB1832:
	.seh_endprologue
	andb	$-9, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CLIEv
	.def	_ZN3CPU3CLIEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CLIEv
_ZN3CPU3CLIEv:
.LFB1833:
	.seh_endprologue
	andb	$-5, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CLVEv
	.def	_ZN3CPU3CLVEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CLVEv
_ZN3CPU3CLVEv:
.LFB1834:
	.seh_endprologue
	andb	$-65, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CMPERKh
	.def	_ZN3CPU3CMPERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CMPERKh
_ZN3CPU3CMPERKh:
.LFB1835:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movl	%eax, %r9d
	andl	$-2, %eax
	orl	$1, %r9d
	movq	%rdx, %r8
	movzbl	10(%rcx), %edx
	movzbl	(%r8), %r8d
	cmpb	%r8b, %dl
	cmovnb	%r9d, %eax
	subb	%r8b, %dl
	jne	.L94
	orl	$2, %eax
.L95:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L94:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L95
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CPXERKh
	.def	_ZN3CPU3CPXERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CPXERKh
_ZN3CPU3CPXERKh:
.LFB1836:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movl	%eax, %r9d
	andl	$-2, %eax
	orl	$1, %r9d
	movq	%rdx, %r8
	movzbl	11(%rcx), %edx
	movzbl	(%r8), %r8d
	cmpb	%r8b, %dl
	cmovnb	%r9d, %eax
	subb	%r8b, %dl
	jne	.L100
	orl	$2, %eax
.L101:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L100:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L101
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3CPYERKh
	.def	_ZN3CPU3CPYERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3CPYERKh
_ZN3CPU3CPYERKh:
.LFB1837:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movl	%eax, %r9d
	andl	$-2, %eax
	orl	$1, %r9d
	movq	%rdx, %r8
	movzbl	12(%rcx), %edx
	movzbl	(%r8), %r8d
	cmpb	%r8b, %dl
	cmovnb	%r9d, %eax
	subb	%r8b, %dl
	jne	.L106
	orl	$2, %eax
.L107:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L106:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L107
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3DECERKt
	.def	_ZN3CPU3DECERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3DECERKt
_ZN3CPU3DECERKt:
.LFB1838:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %r12
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movq	%r12, %rdx
	leaq	47(%rsp), %r8
	subl	$1, %eax
	movb	%al, 47(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	47(%rsp), %edx
	movzbl	14(%rbx), %eax
	testb	%dl, %dl
	jne	.L110
	orl	$2, %eax
.L111:
	andl	$127, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	andl	$-3, %eax
	movb	%al, 14(%rbx)
	testb	%dl, %dl
	jns	.L111
	orl	$-128, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3DEXEv
	.def	_ZN3CPU3DEXEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3DEXEv
_ZN3CPU3DEXEv:
.LFB1839:
	.seh_endprologue
	movzbl	11(%rcx), %eax
	leal	-1(%rax), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 11(%rcx)
	testb	%dl, %dl
	jne	.L114
	orl	$2, %eax
.L115:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L114:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L115
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3DEYEv
	.def	_ZN3CPU3DEYEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3DEYEv
_ZN3CPU3DEYEv:
.LFB1840:
	.seh_endprologue
	movzbl	12(%rcx), %eax
	leal	-1(%rax), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 12(%rcx)
	testb	%dl, %dl
	jne	.L118
	orl	$2, %eax
.L119:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L118:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L119
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3EORERKh
	.def	_ZN3CPU3EORERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3EORERKh
_ZN3CPU3EORERKh:
.LFB1841:
	.seh_endprologue
	movzbl	10(%rcx), %r9d
	movzbl	14(%rcx), %eax
	movzbl	(%rdx), %r8d
	movl	%eax, %r10d
	movl	%r9d, %edx
	andl	$-3, %eax
	xorl	%r8d, %edx
	orl	$2, %r10d
	cmpb	%r8b, %r9b
	cmove	%r10d, %eax
	movb	%dl, 10(%rcx)
	movl	%eax, %r8d
	andl	$127, %eax
	orl	$-128, %r8d
	testb	%dl, %dl
	cmovs	%r8d, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3INCERKt
	.def	_ZN3CPU3INCERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3INCERKt
_ZN3CPU3INCERKt:
.LFB1842:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %r12
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movq	%r12, %rdx
	leaq	47(%rsp), %r8
	addl	$1, %eax
	movb	%al, 47(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	47(%rsp), %edx
	movzbl	14(%rbx), %eax
	testb	%dl, %dl
	jne	.L127
	orl	$2, %eax
.L128:
	andl	$127, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L127:
	andl	$-3, %eax
	movb	%al, 14(%rbx)
	testb	%dl, %dl
	jns	.L128
	orl	$-128, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3INXEv
	.def	_ZN3CPU3INXEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3INXEv
_ZN3CPU3INXEv:
.LFB1843:
	.seh_endprologue
	movzbl	11(%rcx), %eax
	leal	1(%rax), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 11(%rcx)
	testb	%dl, %dl
	jne	.L131
	orl	$2, %eax
.L132:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L131:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L132
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3INYEv
	.def	_ZN3CPU3INYEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3INYEv
_ZN3CPU3INYEv:
.LFB1844:
	.seh_endprologue
	movzbl	12(%rcx), %eax
	leal	1(%rax), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 12(%rcx)
	testb	%dl, %dl
	jne	.L135
	orl	$2, %eax
.L136:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L135:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L136
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3JMPEv
	.def	_ZN3CPU3JMPEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3JMPEv
_ZN3CPU3JMPEv:
.LFB1845:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movq	%rcx, %rbx
	call	_ZN3CPU12fetchAddressEv
	movw	%ax, 8(%rbx)
	addq	$32, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3JMPERKt
	.def	_ZN3CPU3JMPERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3JMPERKt
_ZN3CPU3JMPERKt:
.LFB1846:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %rdi
	call	_ZN3Bus7cpuReadERKt
	movzwl	(%rdi), %edx
	movq	(%rbx), %rcx
	movzbl	%al, %eax
	sall	$8, %eax
	movzbl	%dl, %r8d
	movl	%eax, %esi
	movl	%edx, %eax
	addl	$1, %edx
	xorb	%al, %al
	cmpw	$255, %r8w
	cmove	%eax, %edx
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	movzbl	%al, %eax
	orl	%esi, %eax
	movw	%ax, 8(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3JSREv
	.def	_ZN3CPU3JSREv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3JSREv
_ZN3CPU3JSREv:
.LFB1847:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzwl	8(%rcx), %eax
	leal	2(%rax), %esi
	movq	%rcx, %rbx
	leaq	45(%rsp), %rdi
	leaq	46(%rsp), %r12
	call	_ZN3CPU12fetchAddressEv
	movq	(%rbx), %rcx
	movq	%rdi, %r8
	movw	%ax, 8(%rbx)
	movl	%esi, %eax
	movzbl	%ah, %eax
	movb	%al, 45(%rsp)
	movzbl	13(%rbx), %eax
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rbx)
	movq	%r12, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	13(%rbx), %eax
	movq	(%rbx), %rcx
	movq	%rdi, %r8
	movb	%sil, 45(%rsp)
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rbx)
	movq	%r12, %rdx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3LDAERKh
	.def	_ZN3CPU3LDAERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3LDAERKh
_ZN3CPU3LDAERKh:
.LFB1848:
	.seh_endprologue
	movzbl	(%rdx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L144
	orl	$2, %eax
.L145:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L144:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L145
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3LDXERKh
	.def	_ZN3CPU3LDXERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3LDXERKh
_ZN3CPU3LDXERKh:
.LFB1849:
	.seh_endprologue
	movzbl	(%rdx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 11(%rcx)
	testb	%dl, %dl
	jne	.L148
	orl	$2, %eax
.L149:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L148:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L149
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3LDYERKh
	.def	_ZN3CPU3LDYERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3LDYERKh
_ZN3CPU3LDYERKh:
.LFB1850:
	.seh_endprologue
	movzbl	(%rdx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 12(%rcx)
	testb	%dl, %dl
	jne	.L152
	orl	$2, %eax
.L153:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L152:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L153
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3LSREv
	.def	_ZN3CPU3LSREv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3LSREv
_ZN3CPU3LSREv:
.LFB1851:
	.seh_endprologue
	movzbl	10(%rcx), %edx
	movzbl	14(%rcx), %eax
	movl	%edx, %r8d
	movl	%eax, %r9d
	andl	$-2, %eax
	orl	$1, %r9d
	andl	$1, %r8d
	cmovne	%r9d, %eax
	sarl	%edx
	movb	%dl, 10(%rcx)
	movl	%eax, %r8d
	andl	$-3, %eax
	orl	$2, %r8d
	testl	%edx, %edx
	cmove	%r8d, %eax
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3LSRERKt
	.def	_ZN3CPU3LSRERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3LSRERKt
_ZN3CPU3LSRERKt:
.LFB1852:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %r12
	call	_ZN3Bus7cpuReadERKt
	testb	$1, %al
	movzbl	%al, %edx
	movzbl	14(%rbx), %eax
	je	.L161
	orl	$1, %eax
.L162:
	movb	%al, 14(%rbx)
	movq	(%rbx), %rcx
	movl	%edx, %eax
	leaq	47(%rsp), %r8
	sarl	%eax
	movq	%r12, %rdx
	movb	%al, 47(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	47(%rsp), %edx
	movzbl	14(%rbx), %eax
	testb	%dl, %dl
	jne	.L163
	orl	$2, %eax
.L164:
	andl	$127, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L161:
	andl	$-2, %eax
	jmp	.L162
	.p2align 4,,10
	.p2align 3
.L163:
	andl	$-3, %eax
	movb	%al, 14(%rbx)
	testb	%dl, %dl
	jns	.L164
	orl	$-128, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3NOPEv
	.def	_ZN3CPU3NOPEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3NOPEv
_ZN3CPU3NOPEv:
.LFB1853:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzwl	8(%rcx), %eax
	movq	(%rcx), %r8
	leal	1(%rax), %edx
	movw	%dx, 8(%rcx)
	leaq	46(%rsp), %rdx
	movq	%r8, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	nop
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ORAERKh
	.def	_ZN3CPU3ORAERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ORAERKh
_ZN3CPU3ORAERKh:
.LFB1854:
	.seh_endprologue
	movzbl	10(%rcx), %eax
	orb	(%rdx), %al
	movl	%eax, %edx
	movb	%al, 10(%rcx)
	movzbl	14(%rcx), %eax
	jne	.L168
	orl	$2, %eax
.L169:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L168:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L169
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3PHAEv
	.def	_ZN3CPU3PHAEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3PHAEv
_ZN3CPU3PHAEv:
.LFB1855:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	10(%rcx), %eax
	movq	(%rcx), %r9
	movb	%al, 45(%rsp)
	movzbl	13(%rcx), %eax
	leaq	45(%rsp), %r8
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rcx)
	leaq	46(%rsp), %rdx
	movq	%r9, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	nop
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3PHPEv
	.def	_ZN3CPU3PHPEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3PHPEv
_ZN3CPU3PHPEv:
.LFB1856:
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movq	(%rcx), %r9
	orl	$16, %eax
	movb	%al, 14(%rcx)
	leaq	45(%rsp), %r8
	movb	%al, 45(%rsp)
	movzbl	13(%rcx), %eax
	leal	-1(%rax), %edx
	orb	$1, %ah
	movb	%dl, 13(%rcx)
	leaq	46(%rsp), %rdx
	movq	%r9, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	nop
	addq	$56, %rsp
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3PLAEv
	.def	_ZN3CPU3PLAEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3PLAEv
_ZN3CPU3PLAEv:
.LFB1857:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	leaq	46(%rsp), %rdx
	movzbl	13(%rbx), %eax
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movzbl	14(%rbx), %edx
	movb	%al, 10(%rbx)
	testb	%al, %al
	jne	.L174
	orl	$2, %edx
.L175:
	andl	$127, %edx
	movb	%dl, 14(%rbx)
	addq	$48, %rsp
	popq	%rbx
	ret
	.p2align 4,,10
	.p2align 3
.L174:
	andl	$-3, %edx
	movb	%dl, 14(%rbx)
	testb	%al, %al
	jns	.L175
	orl	$-128, %edx
	movb	%dl, 14(%rbx)
	addq	$48, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3PLPEv
	.def	_ZN3CPU3PLPEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3PLPEv
_ZN3CPU3PLPEv:
.LFB1858:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	leaq	46(%rsp), %rdx
	movzbl	13(%rbx), %eax
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movb	%al, 14(%rbx)
	addq	$48, %rsp
	popq	%rbx
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ROLEv
	.def	_ZN3CPU3ROLEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ROLEv
_ZN3CPU3ROLEv:
.LFB1859:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movzbl	10(%rcx), %r8d
	movl	%eax, %r9d
	movl	%eax, %edx
	andl	$-2, %eax
	orl	$1, %edx
	andl	$1, %r9d
	testb	%r8b, %r8b
	cmovs	%edx, %eax
	leal	(%r8,%r8), %edx
	orl	%r9d, %edx
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L181
	orl	$2, %eax
.L182:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L181:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L182
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ROLERKt
	.def	_ZN3CPU3ROLERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ROLERKt
_ZN3CPU3ROLERKt:
.LFB1860:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %r12
	call	_ZN3Bus7cpuReadERKt
	movzbl	14(%rbx), %ecx
	movl	%ecx, %edx
	movl	%ecx, %r8d
	andl	$-2, %ecx
	andl	$1, %edx
	orl	$1, %r8d
	testb	%al, %al
	cmovs	%r8d, %ecx
	addl	%eax, %eax
	leaq	47(%rsp), %r8
	orl	%edx, %eax
	movq	%r12, %rdx
	movb	%cl, 14(%rbx)
	movq	(%rbx), %rcx
	movb	%al, 47(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	47(%rsp), %edx
	movzbl	14(%rbx), %eax
	testb	%dl, %dl
	jne	.L187
	orl	$2, %eax
.L188:
	andl	$127, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L187:
	andl	$-3, %eax
	movb	%al, 14(%rbx)
	testb	%dl, %dl
	jns	.L188
	orl	$-128, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3ROREv
	.def	_ZN3CPU3ROREv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3ROREv
_ZN3CPU3ROREv:
.LFB1861:
	.seh_endprologue
	movzbl	14(%rcx), %r8d
	movzbl	10(%rcx), %edx
	movl	%r8d, %r9d
	movl	%r8d, %eax
	orl	$1, %r9d
	andl	$-2, %eax
	testb	$1, %dl
	cmovne	%r9d, %eax
	andl	$1, %r8d
	shrb	%dl
	sall	$7, %r8d
	orl	%r8d, %edx
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L193
	orl	$2, %eax
.L194:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L193:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L194
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3RORERKt
	.def	_ZN3CPU3RORERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3RORERKt
_ZN3CPU3RORERKt:
.LFB1862:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	movq	%rdx, %r12
	call	_ZN3Bus7cpuReadERKt
	movzbl	14(%rbx), %ecx
	movl	%ecx, %edx
	movl	%ecx, %r8d
	andl	$-2, %ecx
	andl	$1, %edx
	orl	$1, %r8d
	testb	$1, %al
	cmovne	%r8d, %ecx
	shrb	%al
	leaq	47(%rsp), %r8
	orl	%edx, %eax
	movq	%r12, %rdx
	movb	%cl, 14(%rbx)
	movq	(%rbx), %rcx
	movb	%al, 47(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movzbl	47(%rsp), %edx
	movzbl	14(%rbx), %eax
	testb	%dl, %dl
	jne	.L199
	orl	$2, %eax
.L200:
	andl	$127, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L199:
	andl	$-3, %eax
	movb	%al, 14(%rbx)
	testb	%dl, %dl
	jns	.L200
	orl	$-128, %eax
	movb	%al, 14(%rbx)
	addq	$56, %rsp
	popq	%rbx
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3RTIEv
	.def	_ZN3CPU3RTIEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3RTIEv
_ZN3CPU3RTIEv:
.LFB1863:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r12
	movzbl	13(%rbx), %eax
	movq	%r12, %rdx
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movq	%r12, %rdx
	movb	%al, 14(%rbx)
	movzbl	13(%rbx), %eax
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movq	%r12, %rdx
	movzbl	%al, %esi
	movzbl	13(%rbx), %eax
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	sall	$8, %eax
	orl	%esi, %eax
	movw	%ax, 8(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3RTSEv
	.def	_ZN3CPU3RTSEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3RTSEv
_ZN3CPU3RTSEv:
.LFB1864:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movq	%rcx, %rbx
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r12
	movzbl	13(%rbx), %eax
	movq	%r12, %rdx
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movq	(%rbx), %rcx
	movq	%r12, %rdx
	movzbl	%al, %esi
	movzbl	13(%rbx), %eax
	addl	$1, %eax
	movb	%al, 13(%rbx)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	sall	$8, %eax
	orl	%esi, %eax
	addl	$1, %eax
	movw	%ax, 8(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3SBCERKh
	.def	_ZN3CPU3SBCERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3SBCERKh
_ZN3CPU3SBCERKh:
.LFB1865:
	.seh_endprologue
	movzbl	14(%rcx), %eax
	movzbl	(%rdx), %r9d
	movzbl	10(%rcx), %r8d
	movl	%r8d, %r10d
	subl	%r9d, %r8d
	movl	%eax, %r9d
	notl	%r9d
	movl	%r10d, %r11d
	andl	$1, %r9d
	subl	%r9d, %r8d
	movl	%eax, %r9d
	andl	$-2, %eax
	orl	$1, %r9d
	cmpw	$255, %r8w
	movb	%r8b, 10(%rcx)
	cmovbe	%r9d, %eax
	movl	%eax, %r9d
	andl	$-3, %eax
	orl	$2, %r9d
	testb	%r8b, %r8b
	cmove	%r9d, %eax
	movl	%eax, %r9d
	andl	$127, %eax
	orl	$-128, %r9d
	testb	%r8b, %r8b
	cmovs	%r9d, %eax
	movb	%al, 14(%rcx)
	xorb	(%rdx), %r11b
	js	.L211
	xorb	%r8b, %r10b
	js	.L213
.L211:
	andl	$-65, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L213:
	orl	$64, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3SEDEv
	.def	_ZN3CPU3SEDEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3SEDEv
_ZN3CPU3SEDEv:
.LFB1866:
	.seh_endprologue
	orb	$8, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3SECEv
	.def	_ZN3CPU3SECEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3SECEv
_ZN3CPU3SECEv:
.LFB1867:
	.seh_endprologue
	orb	$1, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3SEIEv
	.def	_ZN3CPU3SEIEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3SEIEv
_ZN3CPU3SEIEv:
.LFB1868:
	.seh_endprologue
	orb	$4, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3STAERKt
	.def	_ZN3CPU3STAERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3STAERKt
_ZN3CPU3STAERKt:
.LFB1869:
	.seh_endprologue
	leaq	10(%rcx), %r8
	movq	(%rcx), %rcx
	jmp	_ZN3Bus8cpuWriteERKtRKh
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3STXERKt
	.def	_ZN3CPU3STXERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3STXERKt
_ZN3CPU3STXERKt:
.LFB1870:
	.seh_endprologue
	leaq	11(%rcx), %r8
	movq	(%rcx), %rcx
	jmp	_ZN3Bus8cpuWriteERKtRKh
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3STYERKt
	.def	_ZN3CPU3STYERKt;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3STYERKt
_ZN3CPU3STYERKt:
.LFB1871:
	.seh_endprologue
	leaq	12(%rcx), %r8
	movq	(%rcx), %rcx
	jmp	_ZN3Bus8cpuWriteERKtRKh
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3TAXEv
	.def	_ZN3CPU3TAXEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3TAXEv
_ZN3CPU3TAXEv:
.LFB1872:
	.seh_endprologue
	movzbl	10(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 11(%rcx)
	testb	%dl, %dl
	jne	.L221
	orl	$2, %eax
.L222:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L221:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L222
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3TAYEv
	.def	_ZN3CPU3TAYEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3TAYEv
_ZN3CPU3TAYEv:
.LFB1873:
	.seh_endprologue
	movzbl	10(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 12(%rcx)
	testb	%dl, %dl
	jne	.L225
	orl	$2, %eax
.L226:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L225:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L226
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3TSXEv
	.def	_ZN3CPU3TSXEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3TSXEv
_ZN3CPU3TSXEv:
.LFB1874:
	.seh_endprologue
	movzbl	13(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 11(%rcx)
	testb	%dl, %dl
	jne	.L229
	orl	$2, %eax
.L230:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L229:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L230
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3TXAEv
	.def	_ZN3CPU3TXAEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3TXAEv
_ZN3CPU3TXAEv:
.LFB1875:
	.seh_endprologue
	movzbl	11(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L233
	orl	$2, %eax
.L234:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L233:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L234
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3TXSEv
	.def	_ZN3CPU3TXSEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3TXSEv
_ZN3CPU3TXSEv:
.LFB1876:
	.seh_endprologue
	movzbl	11(%rcx), %eax
	movb	%al, 13(%rcx)
	ret
	.seh_endproc
	.align 2
	.p2align 4
	.globl	_ZN3CPU3TYAEv
	.def	_ZN3CPU3TYAEv;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU3TYAEv
_ZN3CPU3TYAEv:
.LFB1877:
	.seh_endprologue
	movzbl	12(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L238
	orl	$2, %eax
.L239:
	andl	$127, %eax
	movb	%al, 14(%rcx)
	ret
	.p2align 4,,10
	.p2align 3
.L238:
	andl	$-3, %eax
	movb	%al, 14(%rcx)
	testb	%dl, %dl
	jns	.L239
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.ascii "La instrucci\303\263n de CPU ingresada no es valida\0"
	.text
	.align 2
	.p2align 4
	.globl	_ZN3CPU19execute_instructionERKh
	.def	_ZN3CPU19execute_instructionERKh;	.scl	2;	.type	32;	.endef
	.seh_proc	_ZN3CPU19execute_instructionERKh
_ZN3CPU19execute_instructionERKh:
.LFB1878:
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	subq	$56, %rsp
	.seh_stackalloc	56
	.seh_endprologue
	cmpb	$-91, (%rdx)
	movb	$0, 45(%rsp)
	movq	%rcx, %r12
	ja	.L242
	movzbl	(%rdx), %eax
	leaq	.L244(%rip), %rdx
	movslq	(%rdx,%rax,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section .rdata,"dr"
	.align 4
.L244:
	.long	.L337-.L244
	.long	.L336-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L335-.L244
	.long	.L334-.L244
	.long	.L242-.L244
	.long	.L333-.L244
	.long	.L332-.L244
	.long	.L331-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L330-.L244
	.long	.L329-.L244
	.long	.L242-.L244
	.long	.L328-.L244
	.long	.L327-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L326-.L244
	.long	.L325-.L244
	.long	.L242-.L244
	.long	.L324-.L244
	.long	.L323-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L322-.L244
	.long	.L321-.L244
	.long	.L242-.L244
	.long	.L320-.L244
	.long	.L319-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L318-.L244
	.long	.L317-.L244
	.long	.L316-.L244
	.long	.L242-.L244
	.long	.L315-.L244
	.long	.L314-.L244
	.long	.L313-.L244
	.long	.L242-.L244
	.long	.L312-.L244
	.long	.L311-.L244
	.long	.L310-.L244
	.long	.L242-.L244
	.long	.L309-.L244
	.long	.L308-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L307-.L244
	.long	.L306-.L244
	.long	.L242-.L244
	.long	.L305-.L244
	.long	.L303-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L303-.L244
	.long	.L302-.L244
	.long	.L242-.L244
	.long	.L301-.L244
	.long	.L300-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L299-.L244
	.long	.L298-.L244
	.long	.L242-.L244
	.long	.L297-.L244
	.long	.L296-.L244
	.long	.L295-.L244
	.long	.L242-.L244
	.long	.L294-.L244
	.long	.L293-.L244
	.long	.L292-.L244
	.long	.L242-.L244
	.long	.L291-.L244
	.long	.L290-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L289-.L244
	.long	.L288-.L244
	.long	.L242-.L244
	.long	.L287-.L244
	.long	.L286-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L285-.L244
	.long	.L284-.L244
	.long	.L242-.L244
	.long	.L283-.L244
	.long	.L282-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L281-.L244
	.long	.L280-.L244
	.long	.L242-.L244
	.long	.L279-.L244
	.long	.L278-.L244
	.long	.L277-.L244
	.long	.L242-.L244
	.long	.L276-.L244
	.long	.L275-.L244
	.long	.L274-.L244
	.long	.L242-.L244
	.long	.L273-.L244
	.long	.L272-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L271-.L244
	.long	.L270-.L244
	.long	.L242-.L244
	.long	.L269-.L244
	.long	.L268-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L267-.L244
	.long	.L266-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L265-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L264-.L244
	.long	.L263-.L244
	.long	.L262-.L244
	.long	.L242-.L244
	.long	.L261-.L244
	.long	.L242-.L244
	.long	.L260-.L244
	.long	.L242-.L244
	.long	.L259-.L244
	.long	.L258-.L244
	.long	.L257-.L244
	.long	.L242-.L244
	.long	.L256-.L244
	.long	.L255-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L254-.L244
	.long	.L253-.L244
	.long	.L252-.L244
	.long	.L242-.L244
	.long	.L251-.L244
	.long	.L250-.L244
	.long	.L249-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L248-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L247-.L244
	.long	.L246-.L244
	.long	.L245-.L244
	.long	.L242-.L244
	.long	.L242-.L244
	.long	.L243-.L244
	.text
	.p2align 4,,10
	.p2align 3
.L303:
	leaq	45(%rsp), %rdx
.LEHB0:
	call	_ZN3CPU9absoluteYERb
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	je	.L430
.L377:
	andl	$-3, %edx
	movb	%dl, 14(%r12)
	testb	%al, %al
	jns	.L355
	orl	$-128, %edx
.L356:
	cmpb	$0, 45(%rsp)
	movb	%dl, 14(%r12)
	jne	.L351
.L360:
	movl	$4, %eax
.L241:
	addq	$56, %rsp
	popq	%r12
	popq	%r13
	ret
.L243:
	call	_ZN3CPU8zeropageEv
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	testb	%al, %al
	jne	.L411
	orl	$2, %edx
.L412:
	andl	$127, %edx
	movl	$3, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L306:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	11(%r12), %al
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3ROLERKt
	movl	$6, %eax
	jmp	.L241
.L307:
	call	_ZN3CPU9zeropageXEv
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L372
	orl	$2, %edx
.L373:
	andl	$127, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L305:
	orb	$1, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L308:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9indirectYERb
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L369
.L432:
	orl	$2, %edx
.L370:
	andl	$127, %edx
.L371:
	cmpb	$0, 45(%rsp)
	movb	%dl, 14(%r12)
	je	.L351
.L350:
	movl	$6, %eax
	jmp	.L241
.L309:
	movzbl	14(%rcx), %eax
	leaq	46(%rsp), %rdx
	shrb	$7, %al
	movb	%al, 46(%rsp)
	call	_ZN3CPU8branchIfERKb
	addl	$2, %eax
	jmp	.L241
.L310:
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3ROLERKt
	movl	$6, %eax
	jmp	.L241
.L311:
	call	_ZN3CPU8absoluteEv
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L367
	orl	$2, %edx
.L368:
	andl	$127, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L312:
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3BITERKt
	movl	$4, %eax
	jmp	.L241
.L314:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L365
	orl	$2, %edx
.L366:
	andl	$127, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L315:
	movzbl	13(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %rdx
	addl	$1, %eax
	movb	%al, 13(%r12)
	movzbl	%al, %eax
	orb	$1, %ah
	movw	%ax, 46(%rsp)
	call	_ZN3Bus7cpuReadERKt
	movb	%al, 14(%r12)
	movl	$4, %eax
	jmp	.L241
.L313:
	call	_ZN3CPU3ROLEv
	movl	$2, %eax
	jmp	.L241
.L316:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3ROLERKt
	movl	$5, %eax
	jmp	.L241
.L317:
	call	_ZN3CPU8zeropageEv
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L363
	orl	$2, %edx
.L364:
	andl	$127, %edx
	movl	$3, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L318:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3BITERKt
	movl	$3, %eax
	jmp	.L241
.L319:
	call	_ZN3CPU9indirectXEv
	andb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L361
	orl	$2, %edx
.L362:
	andl	$127, %edx
	movl	$6, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L320:
	call	_ZN3CPU3JSREv
	movl	$6, %eax
	jmp	.L241
.L322:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9absoluteXERb
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L377
.L430:
	orl	$2, %edx
.L355:
	andl	$127, %edx
	jmp	.L356
.L323:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9absoluteYERb
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L377
	jmp	.L430
.L321:
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%r12), %edx
	movq	%r12, %rcx
	addl	%eax, %edx
	xorl	%edx, %eax
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	testw	$-256, %ax
	setne	45(%rsp)
	call	_ZN3CPU3ASLERKt
	movl	$7, %eax
	jmp	.L241
.L324:
	andb	$-2, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L325:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	11(%r12), %al
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3ASLERKt
	movl	$6, %eax
	jmp	.L241
.L326:
	call	_ZN3CPU9zeropageXEv
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L352
	orl	$2, %edx
.L353:
	andl	$127, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L327:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9indirectYERb
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	je	.L432
.L369:
	andl	$-3, %edx
	movb	%dl, 14(%r12)
	testb	%al, %al
	jns	.L370
	orl	$-128, %edx
	jmp	.L371
.L328:
	movzbl	14(%rcx), %eax
	leaq	46(%rsp), %rdx
	notl	%eax
	shrb	$7, %al
	movb	%al, 46(%rsp)
	call	_ZN3CPU8branchIfERKb
	addl	$2, %eax
	jmp	.L241
.L329:
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3ASLERKt
	movl	$6, %eax
	jmp	.L241
.L330:
	call	_ZN3CPU8absoluteEv
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L345
	orl	$2, %edx
.L346:
	andl	$127, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L331:
	call	_ZN3CPU3ASLEv
	movl	$2, %eax
	jmp	.L241
.L332:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L343
	orl	$2, %edx
.L344:
	andl	$127, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L333:
	call	_ZN3CPU3PHPEv
	movl	$3, %eax
	jmp	.L241
.L334:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3ASLERKt
	movl	$5, %eax
	jmp	.L241
.L335:
	call	_ZN3CPU8zeropageEv
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L341
	orl	$2, %edx
.L342:
	andl	$127, %edx
	movl	$3, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L336:
	call	_ZN3CPU9indirectXEv
	orb	10(%r12), %al
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	jne	.L339
	orl	$2, %edx
.L340:
	andl	$127, %edx
	movl	$6, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L245:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	movzbl	14(%r12), %edx
	movb	%al, 11(%r12)
	testb	%al, %al
	jne	.L409
	orl	$2, %edx
.L410:
	andl	$127, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L337:
	call	_ZN3CPU3BRKEv
	movl	$7, %eax
	jmp	.L241
.L246:
	call	_ZN3CPU9indirectXEv
	movzbl	14(%r12), %edx
	movb	%al, 10(%r12)
	testb	%al, %al
	jne	.L407
	orl	$2, %edx
.L408:
	andl	$127, %edx
	movl	$6, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L247:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	movzbl	14(%r12), %edx
	movb	%al, 12(%r12)
	testb	%al, %al
	jne	.L405
	orl	$2, %edx
.L406:
	andl	$127, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L271:
	call	_ZN3CPU9zeropageXEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	movl	$4, %eax
	jmp	.L241
.L255:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU16indirectYAddressERb
	movq	(%r12), %rcx
	leaq	46(%rsp), %rdx
	leaq	10(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$6, %eax
	jmp	.L241
.L256:
	movzbl	14(%rcx), %eax
	leaq	46(%rsp), %rdx
	notl	%eax
	andl	$1, %eax
	movb	%al, 46(%rsp)
	call	_ZN3CPU8branchIfERKb
	addl	$2, %eax
	jmp	.L241
.L257:
	call	_ZN3CPU12fetchAddressEv
	movq	(%r12), %rcx
	leaq	46(%rsp), %rdx
	leaq	11(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$4, %eax
	jmp	.L241
.L258:
	call	_ZN3CPU12fetchAddressEv
	movq	(%r12), %rcx
	leaq	46(%rsp), %rdx
	leaq	10(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$4, %eax
	jmp	.L241
.L259:
	call	_ZN3CPU12fetchAddressEv
	movq	(%r12), %rcx
	leaq	46(%rsp), %rdx
	leaq	12(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$4, %eax
	jmp	.L241
.L260:
	movzbl	11(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L401
	orl	$2, %eax
.L402:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$2, %eax
	jmp	.L241
.L261:
	movzbl	12(%rcx), %eax
	leal	-1(%rax), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 12(%rcx)
	testb	%dl, %dl
	jne	.L399
	orl	$2, %eax
.L400:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$2, %eax
	jmp	.L241
.L287:
	andb	$-5, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L251:
	movzbl	12(%rcx), %edx
	movzbl	14(%rcx), %eax
	movb	%dl, 10(%rcx)
	testb	%dl, %dl
	jne	.L403
	orl	$2, %eax
.L404:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$2, %eax
	jmp	.L241
.L252:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%r12), %rcx
	addb	12(%r12), %al
	movq	%r13, %rdx
	movzbl	%al, %eax
	leaq	11(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$4, %eax
	jmp	.L241
.L253:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%r12), %rcx
	addb	11(%r12), %al
	movq	%r13, %rdx
	movzbl	%al, %eax
	leaq	10(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$4, %eax
	jmp	.L241
.L254:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%r12), %rcx
	addb	11(%r12), %al
	movq	%r13, %rdx
	movzbl	%al, %eax
	leaq	12(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$4, %eax
	jmp	.L241
.L249:
	movzbl	11(%rcx), %eax
	movb	%al, 13(%rcx)
	movl	$2, %eax
	jmp	.L241
.L250:
	call	_ZN3CPU12fetchAddressEv
	movzbl	12(%r12), %edx
	movq	(%r12), %rcx
	leaq	10(%r12), %r8
	addl	%eax, %edx
	xorl	%edx, %eax
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	testw	$-256, %ax
	setne	45(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$5, %eax
	jmp	.L241
.L248:
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%r12), %edx
	movq	(%r12), %rcx
	leaq	10(%r12), %r8
	addl	%eax, %edx
	xorl	%edx, %eax
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	testw	$-256, %ax
	setne	45(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$5, %eax
	jmp	.L241
.L263:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%r12), %rcx
	leaq	10(%r12), %r8
	movq	%r13, %rdx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$3, %eax
	jmp	.L241
.L264:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%r12), %rcx
	leaq	12(%r12), %r8
	movq	%r13, %rdx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$3, %eax
	jmp	.L241
.L265:
	call	_ZN3CPU16indirectXAddressEv
	movq	(%r12), %rcx
	leaq	46(%rsp), %rdx
	leaq	10(%r12), %r8
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$6, %eax
	jmp	.L241
.L266:
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%r12), %edx
	movq	%r12, %rcx
	addl	%eax, %edx
	xorl	%edx, %eax
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	testw	$-256, %ax
	setne	45(%rsp)
	call	_ZN3CPU3RORERKt
	movl	$7, %eax
	jmp	.L241
.L267:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9absoluteXERb
.L418:
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	cmpb	$0, 45(%rsp)
	je	.L360
	.p2align 4,,10
	.p2align 3
.L351:
	movl	$5, %eax
	jmp	.L241
.L269:
	orb	$4, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L270:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	11(%r12), %al
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3RORERKt
	movl	$6, %eax
	jmp	.L241
.L262:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	(%r12), %rcx
	leaq	11(%r12), %r8
	movq	%r13, %rdx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3Bus8cpuWriteERKtRKh
	movl	$3, %eax
	jmp	.L241
.L268:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9absoluteYERb
	jmp	.L418
.L279:
	call	_ZN3CPU3PLAEv
	movl	$4, %eax
	jmp	.L241
.L280:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3RORERKt
	movl	$5, %eax
	jmp	.L241
.L281:
	call	_ZN3CPU8zeropageEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	movl	$3, %eax
	jmp	.L241
.L282:
	call	_ZN3CPU9indirectXEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	movl	$6, %eax
	jmp	.L241
.L283:
	call	_ZN3CPU3RTSEv
	movl	$6, %eax
	jmp	.L241
.L284:
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%r12), %edx
	movq	%r12, %rcx
	addl	%eax, %edx
	xorl	%edx, %eax
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	testw	$-256, %ax
	setne	45(%rsp)
	call	_ZN3CPU3LSRERKt
	movl	$7, %eax
	jmp	.L241
.L285:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9absoluteXERb
.L434:
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L396
	orl	$2, %eax
.L397:
	andl	$127, %eax
.L398:
	cmpb	$0, 45(%rsp)
	movb	%al, 14(%r12)
	jne	.L351
	jmp	.L360
.L286:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9absoluteYERb
	jmp	.L434
.L275:
	call	_ZN3CPU8absoluteEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	movl	$4, %eax
	jmp	.L241
.L276:
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3JMPERKt
	movl	$5, %eax
	jmp	.L241
.L277:
	call	_ZN3CPU3ROREv
	movl	$2, %eax
	jmp	.L241
.L278:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	movl	$2, %eax
	jmp	.L241
.L273:
	movzbl	14(%rcx), %eax
	leaq	46(%rsp), %rdx
	shrb	$6, %al
	andl	$1, %eax
	movb	%al, 46(%rsp)
	call	_ZN3CPU8branchIfERKb
	addl	$2, %eax
	jmp	.L241
.L274:
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3RORERKt
	movl	$6, %eax
	jmp	.L241
.L272:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9indirectYERb
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movb	%al, 46(%rsp)
	call	_ZN3CPU3ADCERKh
	cmpb	$0, 45(%rsp)
	jne	.L350
	jmp	.L351
.L295:
	call	_ZN3CPU3LSREv
	movl	$2, %eax
	jmp	.L241
.L296:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	leaq	46(%rsp), %rdx
	call	_ZN3Bus7cpuReadERKt
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L384
	orl	$2, %eax
.L385:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$2, %eax
	jmp	.L241
.L297:
	call	_ZN3CPU3PHAEv
	movl	$3, %eax
	jmp	.L241
.L291:
	movzbl	14(%rcx), %eax
	leaq	46(%rsp), %rdx
	shrb	$6, %al
	xorl	$1, %eax
	andl	$1, %eax
	movb	%al, 46(%rsp)
	call	_ZN3CPU8branchIfERKb
	addl	$2, %eax
	jmp	.L241
.L292:
	call	_ZN3CPU12fetchAddressEv
	leaq	46(%rsp), %rdx
	movq	%r12, %rcx
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3LSRERKt
	movl	$6, %eax
	jmp	.L241
.L293:
	call	_ZN3CPU8absoluteEv
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L386
	orl	$2, %eax
.L387:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$4, %eax
	jmp	.L241
.L294:
	call	_ZN3CPU12fetchAddressEv
	movw	%ax, 8(%r12)
	movl	$3, %eax
	jmp	.L241
.L289:
	call	_ZN3CPU9zeropageXEv
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L391
	orl	$2, %eax
.L392:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$4, %eax
	jmp	.L241
.L290:
	leaq	45(%rsp), %rdx
	call	_ZN3CPU9indirectYERb
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L388
	orl	$2, %eax
.L389:
	andl	$127, %eax
.L390:
	cmpb	$0, 45(%rsp)
	movb	%al, 14(%r12)
	jne	.L350
	jmp	.L351
.L288:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	addb	11(%r12), %al
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3LSRERKt
	movl	$6, %eax
	jmp	.L241
.L299:
	call	_ZN3CPU8zeropageEv
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L382
	orl	$2, %eax
.L383:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$3, %eax
	jmp	.L241
.L300:
	call	_ZN3CPU9indirectXEv
	movzbl	10(%r12), %edx
	movl	%eax, %ecx
	xorl	%edx, %ecx
	cmpb	%dl, %al
	movzbl	14(%r12), %eax
	movb	%cl, 10(%r12)
	jne	.L380
	orl	$2, %eax
.L381:
	andl	$127, %eax
	movb	%al, 14(%r12)
	movl	$6, %eax
	jmp	.L241
.L301:
	call	_ZN3CPU3RTIEv
	movl	$6, %eax
	jmp	.L241
.L302:
	call	_ZN3CPU12fetchAddressEv
	movzbl	11(%r12), %edx
	movq	%r12, %rcx
	addl	%eax, %edx
	xorl	%edx, %eax
	movw	%dx, 46(%rsp)
	leaq	46(%rsp), %rdx
	testw	$-256, %ax
	setne	45(%rsp)
	call	_ZN3CPU3ROLERKt
	movl	$7, %eax
	jmp	.L241
.L298:
	movzwl	8(%r12), %eax
	movq	(%rcx), %rcx
	leaq	46(%rsp), %r13
	leal	1(%rax), %edx
	movw	%ax, 46(%rsp)
	movw	%dx, 8(%r12)
	movq	%r13, %rdx
	call	_ZN3Bus7cpuReadERKt
	movq	%r13, %rdx
	movq	%r12, %rcx
	movzbl	%al, %eax
	movw	%ax, 46(%rsp)
	call	_ZN3CPU3LSRERKt
.LEHE0:
	movl	$5, %eax
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L396:
	andl	$-3, %eax
	movb	%al, 14(%r12)
	testb	%cl, %cl
	jns	.L397
	orl	$-128, %eax
	jmp	.L398
.L384:
	andl	$-3, %eax
	testb	%cl, %cl
	jns	.L385
	orl	$-128, %eax
	movb	%al, 14(%r12)
	movl	$2, %eax
	jmp	.L241
.L405:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L406
	orl	$-128, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L382:
	andl	$-3, %eax
	testb	%cl, %cl
	jns	.L383
	orl	$-128, %eax
	movb	%al, 14(%r12)
	movl	$3, %eax
	jmp	.L241
.L380:
	andl	$-3, %eax
	testb	%cl, %cl
	jns	.L381
	orl	$-128, %eax
	movb	%al, 14(%r12)
	movl	$6, %eax
	jmp	.L241
.L386:
	andl	$-3, %eax
	testb	%cl, %cl
	jns	.L387
	orl	$-128, %eax
	movb	%al, 14(%r12)
	movl	$4, %eax
	jmp	.L241
.L391:
	andl	$-3, %eax
	testb	%cl, %cl
	jns	.L392
	orl	$-128, %eax
	movb	%al, 14(%r12)
	movl	$4, %eax
	jmp	.L241
.L399:
	andl	$-3, %eax
	testb	%dl, %dl
	jns	.L400
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L388:
	andl	$-3, %eax
	movb	%al, 14(%r12)
	testb	%cl, %cl
	jns	.L389
	orl	$-128, %eax
	jmp	.L390
.L401:
	andl	$-3, %eax
	testb	%dl, %dl
	jns	.L402
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L372:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L373
	orl	$-128, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L365:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L366
	orl	$-128, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L345:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L346
	orl	$-128, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L367:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L368
	orl	$-128, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L363:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L364
	orl	$-128, %edx
	movl	$3, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L361:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L362
	orl	$-128, %edx
	movl	$6, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L352:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L353
	orl	$-128, %edx
	movl	$4, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L403:
	andl	$-3, %eax
	testb	%dl, %dl
	jns	.L404
	orl	$-128, %eax
	movb	%al, 14(%rcx)
	movl	$2, %eax
	jmp	.L241
.L407:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L408
	orl	$-128, %edx
	movl	$6, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L411:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L412
	orl	$-128, %edx
	movl	$3, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L343:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L344
	orl	$-128, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L339:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L340
	orl	$-128, %edx
	movl	$6, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L341:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L342
	orl	$-128, %edx
	movl	$3, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L409:
	andl	$-3, %edx
	testb	%al, %al
	jns	.L410
	orl	$-128, %edx
	movl	$2, %eax
	movb	%dl, 14(%r12)
	jmp	.L241
.L242:
	movl	$16, %ecx
	call	__cxa_allocate_exception
	leaq	.LC0(%rip), %rdx
	movq	%rax, %rcx
	movq	%rax, %r12
.LEHB1:
	call	_ZNSt16invalid_argumentC1EPKc
.LEHE1:
	leaq	_ZNSt16invalid_argumentD1Ev(%rip), %r8
	leaq	_ZTISt16invalid_argument(%rip), %rdx
	movq	%r12, %rcx
.LEHB2:
	call	__cxa_throw
.L414:
	movq	%rax, %r13
	movq	%r12, %rcx
	call	__cxa_free_exception
	movq	%r13, %rcx
	call	_Unwind_Resume
	nop
.LEHE2:
	.def	__gxx_personality_seh0;	.scl	2;	.type	32;	.endef
	.seh_handler	__gxx_personality_seh0, @unwind, @except
	.seh_handlerdata
.LLSDA1878:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE1878-.LLSDACSB1878
.LLSDACSB1878:
	.uleb128 .LEHB0-.LFB1878
	.uleb128 .LEHE0-.LEHB0
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB1-.LFB1878
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L414-.LFB1878
	.uleb128 0
	.uleb128 .LEHB2-.LFB1878
	.uleb128 .LEHE2-.LEHB2
	.uleb128 0
	.uleb128 0
.LLSDACSE1878:
	.text
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
.LFB1882:
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	call	__main
	xorl	%eax, %eax
	addq	$40, %rsp
	ret
	.seh_endproc
	.globl	_ZTSSt9exception
	.section	.rdata$_ZTSSt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTSSt9exception:
	.ascii "St9exception\0"
	.globl	_ZTISt9exception
	.section	.rdata$_ZTISt9exception,"dr"
	.linkonce same_size
	.align 8
_ZTISt9exception:
	.quad	_ZTVN10__cxxabiv117__class_type_infoE+16
	.quad	_ZTSSt9exception
	.globl	_ZTSSt11logic_error
	.section	.rdata$_ZTSSt11logic_error,"dr"
	.linkonce same_size
	.align 16
_ZTSSt11logic_error:
	.ascii "St11logic_error\0"
	.globl	_ZTISt11logic_error
	.section	.rdata$_ZTISt11logic_error,"dr"
	.linkonce same_size
	.align 8
_ZTISt11logic_error:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt11logic_error
	.quad	_ZTISt9exception
	.globl	_ZTSSt16invalid_argument
	.section	.rdata$_ZTSSt16invalid_argument,"dr"
	.linkonce same_size
	.align 16
_ZTSSt16invalid_argument:
	.ascii "St16invalid_argument\0"
	.globl	_ZTISt16invalid_argument
	.section	.rdata$_ZTISt16invalid_argument,"dr"
	.linkonce same_size
	.align 8
_ZTISt16invalid_argument:
	.quad	_ZTVN10__cxxabiv120__si_class_type_infoE+16
	.quad	_ZTSSt16invalid_argument
	.quad	_ZTISt11logic_error
	.ident	"GCC: (tdm64-1) 9.2.0"
	.def	_ZN3Bus7cpuReadERKt;	.scl	2;	.type	32;	.endef
	.def	_ZN3Bus8cpuWriteERKtRKh;	.scl	2;	.type	32;	.endef
	.def	__cxa_allocate_exception;	.scl	2;	.type	32;	.endef
	.def	_ZNSt16invalid_argumentC1EPKc;	.scl	2;	.type	32;	.endef
	.def	_ZNSt16invalid_argumentD1Ev;	.scl	2;	.type	32;	.endef
	.def	__cxa_throw;	.scl	2;	.type	32;	.endef
	.def	__cxa_free_exception;	.scl	2;	.type	32;	.endef
	.def	_Unwind_Resume;	.scl	2;	.type	32;	.endef
	.section	.rdata$.refptr._ZNSt16invalid_argumentD1Ev, "dr"
	.globl	.refptr._ZNSt16invalid_argumentD1Ev
	.linkonce	discard
.refptr._ZNSt16invalid_argumentD1Ev:
	.quad	_ZNSt16invalid_argumentD1Ev
