
# Ejercicio 5.2 del libro de prácticas

		.data 
dato1:		.word 0x03af45cd
dato2:		.word 0x33a744c2
resultado:	.space 8
	
		.text
		.globl main
main:	lw $t0, dato1
		lw $t1, dato2
		mult $t0, $t1
		mfhi $t2
		mflo $t3
		sw $t2, resultado + 4
		sw $t3, resultado
	
		jr $31
		.end