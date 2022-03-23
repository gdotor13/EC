#
# Ejercicio 6.7 del libro de prácticas
# Contar el número de elementos que NO están entre linf y lsup (ambos incluidos)
# si (elto<linf) OR (elto>lsup) => contar
#
# Pide los datos al usuario en este orden:
# 1) el numero de elementos del vector
# 2) el límite inferior
# 3) el límite superior
# 4) los elementos del vector (uno a uno)
#

		.data
c1:		.asciiz "\nEn el vector existen "
c2:		.asciiz " elementos que NO están entre "	
c3:		.asciiz " y "
c4:		.asciiz "\nIntroduce el número de elementos del vector: "
c5:		.asciiz "\nIntroduce un elemento del vector: "
c6:		.asciiz "\nIntroduce el límite inferior del rango: "
c7:		.asciiz "\nIntroduce el límite superior del rango: "
c8:		.asciiz "\nEl rango es incorrecto (linf>lsup)"
c9:		.asciiz "\nSi el número de elementos es menor o igual que 0, no hay vector"

# Define a partir de aquí los datos que necesites

v:		.space 32
	
		.text
		.globl main
main:	#Escribe a partir de aquí tus instrucciones
		li $t9, 0	#i 
		li $s3, 0	#contador
		
		#Número de elementos
		la $a0, c4   #imprimo la cadena 4
		li $v0, 4
		syscall
		
		li $v0, 5    #pido el entero (número de elementos del vector)
		syscall
		
		move $s0, $v0  #muevo al registro s0
		
		blez $s0, excepcion_1   #comparamos si s0 es menor o igual a 0
							    #Si no es asi continua, sino va a la excepcion
		
		#limite inferior
		la $a0, c6   #imprimo la cadena 6
		li $v0, 4
		syscall
		
		li $v0, 5    #pido el entero (número del limite inferior)
		syscall
		
		move $s1, $v0  #muevo al registro s1
		
		#limite superior
		la $a0, c7   #imprimo la cadena 7
		li $v0, 4
		syscall
		
		li $v0, 5    #pido el entero (número del limite superior)
		syscall
		
		move $s2, $v0  #muevo al registro s2

		bgt $s1, $s2, excepcion_2  #comparo si el limite inferior es mayor
								   #o menor al limite superior

bucle:
		beq $s0, $t9, fin
		
		#elemento del vector
		la $a0, c5   #imprimo la cadena 5
		li $v0, 4
		syscall
		
		li $v0, 5    #pido el entero (número del limite inferior)
		syscall
		
		sb $v0, v($t9) #cargo en memoria el elemento dentro del vector
					   #anteriormente creado con un espacio de 32
					   
		addi $t9, $t9, 1 #incrementamos la i
		
		blt $v0, $s1, si  #hacemos el or 
		bgt $v0, $s2, si
		
		j bucle


excepcion_1:
		la $a0, c9   #imprimo la cadena 9
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall
		
excepcion_2:
		la $a0, c8   #imprimo la cadena 8
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall
		
si:
		addi $s3, $s3, 1  #suma del contador
		j bucle


fin:
		la $a0, c1   #imprimo la cadena 1
		li $v0, 4
		syscall
		
		move $a0, $s3 #imprimimos s3 (contador)
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
