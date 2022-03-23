
# Ejercicio 3.2 del manual de prácticas

		.data
datosb:	.byte 0x10, 0x80, 0x75
		.align 2
datosw:	.space 12 	# .word 0, 0, 0

	.text
	.globl main

main:	la $t0, datosb
		la $t2, datosw

		lb $t1, 0($t0)		
		sw $t1, 0($t2)

		lb $t1, 1($t0)
		sw $t1, datosw+4

		lb $t1, 2($t0)
		sw $t1, datosw+8

		jr $ra
		.end














 