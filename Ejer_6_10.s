#
# Ejercicio 6.10 del manual de practicas
#
		.data
c:		.asciiz "esto Es 7una frase de 3ejemplo que funciona"
newc:	.space 64

		.text
		.globl main
main:	la $t0, c
		la $t1, newc
		lb $t2, 0($t0)	#$t2=c[1]

		li $t3, 0x61	# ascii 'a'
		li $t4, 122		# ascii 'z'
		li $t5, 0x20	# ascii ' '

		blt $t2, $t3, finsi # si <'a' finsi
		bgt $t2, $t4, finsi # si >'z' finsi
		addi $t2, $t2, -32 # minúsc a mayusc
finsi:	sb $t2, 0($t1)	# newc[1]= $t2

mientras:
		lb $t6, 0($t0) # ultimo=c[1]
		addi $t0, $t0, 1
		addi $t1, $t1, 1 
		lb $t2, 0($t0)
		beqz $t2, finmientras	# si no es fin de cadena
		bne $t6, $t5, finsi2	# si (no es espacio) finsi2
		blt $t2, $t3, finsi		# si <'a' finsi2
		bgt $t2, $t4, finsi		# si >'z' finsi2
		addi $t2, $t2, -32		# min a mayusc
finsi2:	sb $t2, 0($t1)			# newc[1]= $t2
		j mientras
		
finmientras:
		la $a0, newc
		li $v0, 4
		syscall

		jr $ra
		
		.end