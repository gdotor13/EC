########################################################### 
#
#	Ejercicio 7.7 - Ejemplo de realizacion paso a paso
#
########################################################### 

# Declaracion de los datos 
	.data
texto:	.space 80
texto1: .space 80
	
# Codigo del Programa 	
	.text
	.globl	main
main:
	li $v0, 8
	li $a1, 80
	la $a0, texto
	syscall
	la $t5, texto
	la $t6, texto1
	li $t7, 0x0a   # fin de string
	
mientras:
	lb	$a0, 0($t5)
	beq $a0, $t7, finmientras
	
	jal	CambiaLetra
	
	sb	$v0, 0($t6)
	addi $t5, $t5, 1
	addi $t6, $t6, 1
	j mientras
	
finmientras:
	sb	$t7, 0($t6) # ponemos el 0x0a del final en texto1:

	li $v0, 4
	la $a0, texto1
	syscall

	addi	$v0,$zero,10 	# Código para salir
	syscall					# Exit 
	

#	Subrutina que cambia vocal por x ...
#
# Asignación de uso de  registros:
#	
#	$t0 => variable local 'a'
#	$t1 => variable local 'e'
#	$t2 => variable local 'i'
#	$t3 => variable local 'o'
#	$t4 => variable local 'u'
#	$a0 => Num. elementos Vector (parámetro de  entrada)
#	$v0 => Valor de retorno
#
CambiaLetra:

# Sección: salvado de registros (pushes)
#		Registro que guadamos: $ra, $a0, $a1, $t0, $t1
#
		addi $sp, $sp, -4 	# push $ra 
		sw 	$ra, 0($sp) 
		addi $sp, $sp, -4 	# push $a0
		sw 	$a0, 0($sp) 
		addi $sp, $sp, -4	# push $t0
		sw 	$t0, 0($sp) 
		addi $sp, $sp, -4 	# push $t1
		sw 	$t1, 0($sp)
		addi $sp, $sp, -4	# push $t0
		sw 	$t2, 0($sp) 
		addi $sp, $sp, -4 	# push $t1
		sw 	$t3, 0($sp)
		addi $sp, $sp, -4	# push $t0
		sw 	$t4, 0($sp) 

		li $t0, 'a'
		li $t1, 'e'
		li $t2, 'i'
		li $t3, 'o'
		li $t4, 'u'

		beq $a0, $t0, ponx
		beq $a0, $t1, ponx
		beq $a0, $t2, ponx
		beq $a0, $t3, ponx
		beq $a0, $t4, ponx
		
		add $v0, $a0, $zero
		j RecuperaRegs
		
ponx:	li $v0, 'x'

RecuperaRegs:
		lw 	$t4, 0($sp)		# pop $t4
		addi $sp, $sp, 4 
		lw 	$t3, 0($sp)		# pop $t3
		addi $sp, $sp, 4 
		lw 	$t2, 0($sp)		# pop $t2
		addi $sp, $sp, 4 
		lw 	$t1, 0($sp) 	# pop $t1
		addi $sp, $sp, 4 
		lw 	$t0, 0($sp)		# pop $t0
		addi $sp, $sp, 4 
		lw 	$a0, 0($sp) 	# pop $a0
		addi $sp, $sp, 4 
		lw 	$ra, 0($sp) 	# pop $ra
		addi $sp, $sp, 4

# Sección: retorno al programa invocador 
		jr	$ra
