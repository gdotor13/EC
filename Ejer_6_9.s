#
# Ejercicio 6.9 del manual de prácticas
#
				.data
Cadena:			.asciiz		"cadena a leer e imprimir en mayuscula"

				.text
				.globl main
main:			la $t2, Cadena
				li $t3, 32				#Para pasar a mayúsculas tenemos que restar 32
				li $t5, 97				#Caracter ASCII de la 'a' es 95

				#WHILE Cadena[i] =/= 0
				
whileBegin:		lbu $t4, 0($t2)			#Cargar elemento de cadena
				beqz $t4, whileExit
				
				#IF Cadena[i] =/= "a" OR Cadena[i] =/= " "
				
				beq $t4, $t5, ifExit	#Cadena[i] =/= "a"
				beq $t4, $t3, ifExit	#Aprovechamos $t3 ya que tiene el mismo valor ascii que el espacio (32)
				sub	$a0, $t4, $t3		#Cadena[i] = Cadena[i] - 32 (b -> B)
				li $v0, 11
				syscall					# imprimir el caracter
ifExit:			addi $t2, $t2, 1		# i+1
				jal whileBegin
				
whileExit:		jr $31
				.end