#Ejercicio 6.25
			.data
vector1:	.word 3, -1, 4, -55, 6, -1, 64, 32, 0, 32, 32, 64
vector2:	.space 48
texto1:		.asciiz"Vector2 = "
texto2:		.asciiz", "

			.text
			.globl main
main:
	# Definimos los registros que usaremos:
	# $t1 = vector1 address
	# $t2 = vector2 address
	# $s1 = i
	# $s2 = j
	# $s3 = Repeticiones
	
	la $t1, vector1
	la $t2, vector2
	li $s2, 0		# j = 0
	li $t3, 12		# Max de iteraciones
	
para1:
	bge $s2, $t3, finpara1
	li $s3, 0			# Repeticiones = 0
	sll $t8, $s2, 2
	add $t5, $t1, $t8	# $t5 = vector1[j] address
	lw $t4, 0($t5)		# Valor($t4) = vector1[j]
	li $s1, 0			# i = 0
	
para2:
	bge $s1, $t3, finpara2
	sll $t9, $s1, 2
	add $t6, $t1, $t9	# $t6 = vector1[i] address
	lw $t7, 0($t6)		# $t7 = Valor guardado en vector1[i]
si:
	bne $t4, $t7, finsi
	addi $s3, $s3, 1	#Repeticiones += 1
	
finsi:
	addi $s1, $s1, 1	# i += 1
	j para2
	
finpara2:
	sll $s4, $s2, 2
	add $s5, $t2, $s4	# $s5 = vector2[j] address
	sw $s3, 0($s5)		# vector2[j] = Repeticiones
	addi $s2, $s2, 1	# j += 1
	j para1

finpara1:
	li $t1, 0			# Contador
	li $t3, 12
	
	la $a0, texto1
	li $v0, 4
	syscall
	
loop:
	bge $t1, $t3, fin
	lw $a0, 0($t2)
	li $v0, 1
	syscall
	la $a0, texto2
	li $v0, 4
	syscall
	
	addi $t1, $t1, 1
	addi $t2, $t2, 4
	j loop
	
fin:
	li $v0, 10
    syscall

	

	
	
	