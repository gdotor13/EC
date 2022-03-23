
# Ejercicio 6.2 del manual de prácticas

		.data
v:		.byte		6, 7, 5, 3, 5, 0, 5, 2, 0, 5
num:	.word		10
cincos:	.space		4
texto:	.asciiz "\nNº de 5's del vector: "

		.text
		.globl main
		
main:	lw $t0, num
		and $t1, $0, $t1		# i=0
		and $t3, $0, $t3		# contador de 5's a 0
		la $t4, v
		li $t6, 5
		
para:	bgt $t1, $t0, finpara	# hasta llegar a num veces
		lb $t5, 0($t4)			# cargar un elto del vector
		bne $t5, $t6, finsi		# si no es un 5, salto
		addi $t3, $t3, 1		# si es un 5, incremento contador de 5's
finsi:	addi $t4, $t4, 1		# avanzo en el vector
		addi $t1, $t1, 1		# avanzo en la i
		j para
		
finpara:
		sw $t3, cincos

		la $a0, texto			# imprimir texto
		li $v0, 4
		syscall

		li $v0, 1				# imprimir número de 5's
		add $a0, $0, $t3
		syscall		
		
		jr $ra
		.end