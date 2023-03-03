	.file	"next_pow.c"
	.text
	.p2align 4
	.globl	next_pow2_dichotomy
	.type	next_pow2_dichotomy, @function
next_pow2_dichotomy:
.LFB24:
	.cfi_startproc
	endbr64
	movl	$63, %edx
	xorl	%esi, %esi
	movl	$1, %r9d
.L2:
	movzbl	%sil, %r8d
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L5:
	movzbl	%dl, %ecx
	movq	%r9, %rax
	addl	%r8d, %ecx
	sarl	%ecx
	salq	%cl, %rax
	movl	%ecx, %r10d
	cmpq	%rax, %rdi
	jnb	.L8
	movl	%ecx, %edx
.L3:
	cmpb	%sil, %dl
	ja	.L5
	movl	$1, %eax
	movl	%r8d, %ecx
	salq	%cl, %rax
.L1:
	ret
	.p2align 4,,10
	.p2align 3
.L8:
	jbe	.L1
	leal	1(%r10), %esi
	jmp	.L2
	.cfi_endproc
.LFE24:
	.size	next_pow2_dichotomy, .-next_pow2_dichotomy
	.p2align 4
	.globl	next_pow2_bitshift_origin
	.type	next_pow2_bitshift_origin, @function
next_pow2_bitshift_origin:
.LFB25:
	.cfi_startproc
	endbr64
	movq	%rdi, %rdx
	shrq	%rdx
	orq	%rdi, %rdx
	movq	%rdx, %rax
	shrq	%rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	shrq	%rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	shrq	%rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	%rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$8, %rax
	orq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$16, %rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$32, %rax
	orq	%rdx, %rax
	addq	$1, %rax
	ret
	.cfi_endproc
.LFE25:
	.size	next_pow2_bitshift_origin, .-next_pow2_bitshift_origin
	.p2align 4
	.globl	next_pow2_bitshift_new
	.type	next_pow2_bitshift_new, @function
next_pow2_bitshift_new:
.LFB26:
	.cfi_startproc
	endbr64
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.L10
	movq	%rdi, %rcx
	shrq	%rcx
	orq	%rdi, %rcx
	movq	%rcx, %rax
	shrq	%rax
	orq	%rcx, %rax
	movq	%rax, %rcx
	shrq	%rcx
	orq	%rax, %rcx
	movq	%rcx, %rax
	shrq	%rax
	orq	%rcx, %rax
	movq	%rax, %rcx
	shrq	%rcx
	orq	%rax, %rcx
	movq	%rcx, %rax
	shrq	%rax
	orq	%rcx, %rax
	movq	%rax, %rcx
	shrq	%rcx
	orq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$8, %rax
	orq	%rcx, %rax
	movq	%rax, %rcx
	shrq	$16, %rcx
	orq	%rax, %rcx
	movq	%rcx, %rax
	shrq	$32, %rax
	orq	%rcx, %rax
	addq	$1, %rax
	movq	%rax, %rcx
	shrq	%rcx
	cmpq	%rdi, %rcx
	cmove	%rcx, %rax
.L10:
	ret
	.cfi_endproc
.LFE26:
	.size	next_pow2_bitshift_new, .-next_pow2_bitshift_new
	.p2align 4
	.globl	next_pow2_builtin
	.type	next_pow2_builtin, @function
next_pow2_builtin:
.LFB27:
	.cfi_startproc
	endbr64
	movl	$1, %eax
	testq	%rdi, %rdi
	je	.L15
	movabsq	$-9223372036854775808, %rax
	bsrq	%rdi, %rdx
	xorq	$63, %rdx
	movl	%edx, %ecx
	shrq	%cl, %rax
	cmpq	%rax, %rdi
	je	.L15
	movl	$64, %ecx
	movl	$1, %eax
	subl	%edx, %ecx
	salq	%cl, %rax
.L15:
	ret
	.cfi_endproc
.LFE27:
	.size	next_pow2_builtin, .-next_pow2_builtin
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Enter a number (uint64_t):"
.LC1:
	.string	"__builtin_clzl(0) = %d\n"
.LC2:
	.string	"Using dichotomy: %ld\n"
.LC3:
	.string	"Using bitshift_origin: %ld\n"
.LC4:
	.string	"Using bitshift_new: %ld\n"
.LC5:
	.string	"Using builtin: %ld\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB28:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leaq	.LC0(%rip), %r15
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC1(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	.LC2(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC3(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$1, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	.p2align 4,,10
	.p2align 3
.L25:
	movq	%r15, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$64, %edx
	movq	%r14, %rsi
	xorl	%eax, %eax
	movl	$1, %edi
	call	__printf_chk@PLT
	movl	$63, %eax
	xorl	%edx, %edx
.L20:
	movzbl	%dl, %esi
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L23:
	movzbl	%al, %ecx
	movq	%rbx, %r10
	xorl	%ebp, %ebp
	addl	%esi, %ecx
	sarl	%ecx
	salq	%cl, %r10
	movl	%ecx, %edi
	cmpq	%r10, %rbp
	jnb	.L30
	movl	%ecx, %eax
.L21:
	cmpb	%dl, %al
	ja	.L23
	movq	%rbx, %r10
	movl	%esi, %ecx
	salq	%cl, %r10
.L22:
	movq	%r10, %rdx
	movq	%r13, %rsi
	movl	$1, %edi
	xorl	%ebp, %ebp
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	movq	%r12, %rsi
	call	next_pow2_bitshift_origin
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	%rbp, %rdi
	leaq	.LC4(%rip), %rsi
	call	next_pow2_bitshift_new
	movl	$1, %edi
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %edx
	testq	%rbp, %rbp
	je	.L24
	movabsq	$-9223372036854775808, %rdx
	bsrq	%rbp, %rax
	xorq	$63, %rax
	movl	%eax, %ecx
	shrq	%cl, %rdx
	cmpq	%rdx, %rbp
	je	.L24
	movl	$64, %ecx
	movq	%rbx, %rdx
	subl	%eax, %ecx
	salq	%cl, %rdx
.L24:
	leaq	.LC5(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L25
	.p2align 4,,10
	.p2align 3
.L30:
	jbe	.L22
	leal	1(%rdi), %edx
	jmp	.L20
	.cfi_endproc
.LFE28:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
