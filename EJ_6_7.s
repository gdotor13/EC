#
# Ejercicio 6.7 del libro de prácticas
# Contar el número de elementos que están entre linf y lsup (ambos incluidos)
#
		.data
c1:		.asciiz "\nEn el vector existen "
c2:		.asciiz " elementos entre "	
c3:		.asciiz " y "

# Define a partir de aquí los datos que necesites
# El vector tendrá los elementos 6,-7,8,3,5,0,5,2,4,1
# Y los límites son 4 y 8

v:	.byte 	0x6, -0x7, 0x8, 0x3, 0x5, 0x0, 0x5, 0x2, 0x4, 0x1
		.align 2
res:	.space 32
	
		.text
		.globl main
main:	#Escribe a partir de aquí tus instrucciones
		li $s1, 4	#liminf
		li $s2, 8	#liminf
		li $s3, 9	#NumElementos-1
		
		la $t0, v	#cargar en memoria el vector
		li $t1, 0	#contador
		li $t2, 0	#i 
		
		
bucle:
		beq $t2, $s3, fin	#para i=0 hasta NumElementos
		
		lb $t3, 0($t0)
		blt $t3, $s1, si  #hacemos el or 
		bgt $t3, $s2, si
		
		addi $t1, $t1, 1	# n > 4 & n < 8 ++
		addi $t0, $t0, 1	# avanza en memoria
		addi $t2, $t2, 1 #incrementamos la i
		
		j bucle

si:
		addi $t0, $t0, 1	# avanza en memoria
		addi $t2, $t2, 1 #incrementamos la i
		j bucle

fin:	
		sw $t1, res			# guardamos el resultado en memoria	

		la $a0, c1   #imprimo la cadena 1
		li $v0, 4
		syscall
		
		move $a0, $t1 #imprimimos s3 (contador)
		li $v0, 1
		syscall
		
		la $a0, c2   #imprimo la cadena 2
		li $v0, 4
		syscall
		
		move $a0, $s1 #imprimimos s1 (lim inferior)
		li $v0, 1
		syscall
		
		la $a0, c3   #imprimo la cadena 3
		li $v0, 4
		syscall
		
		move $a0, $s2 #imprimimos s2 (lim superior)
		li $v0, 1
		syscall

		li $v0, 10
		syscall
