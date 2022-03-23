#
# Ejercicio 5.6 del manual de prácticas
#			
			.data
A:			.word 3
B:			.word 7
C:			.word 5
X:			.space 4

cadena1:	.asciiz	"Introducir valor de X: "
cadena2:	.asciiz "Valor de A*X*X + B*X + C = : "
			.align 2
	
		.text
		.globl main
main:	la $a0, cadena1
		li $v0, 4	
		syscall
		li $v0, 5
		syscall
		sw $v0, X

		lw $t0, X
		lw $t1, A
		mul $t2, $t0, $t0 # X*X
		mul $t2, $t2, $t1 # A*X*X
		
		lw $t1, B
		mul $t3, $t1, $t0 # B*X
		
		add $t4, $t2, $t3 # A*X*X + B*X
		lw $t5, C
		add $s6, $t5, $t4 # A*X*X + B*X + C
		
		la $a0, cadena2
		li $v0, 4	
		syscall
			
		add $a0, $s6, $zero
		li $v0, 1
		syscall

		jr $ra
		.end