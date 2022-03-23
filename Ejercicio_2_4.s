		.data
str1:	.asciiz "\nIntroducir dato A= "
str2: 	.asciiz "\nIntroducir dato B= "
DatoA: 	.word 5
DatoB: 	.word 10
Result:	.asciiz "\nEl resultado de A+B= "
Suma:	.space 32

		.text
		.globl main
main:
		la $a0, str1  	#a0=str1
		li $v0, 4		#imprimimos str1
		syscall			#llamamos al syscall
		
		li $v0, 5		#leemos el entero
		syscall
		sw $t0, DatoA	#guardamos el entero leido(half) en t0
		
		la $a0, str2  	#a0=str2
		li $v0, 4		#imprimimos str2
		syscall			#llamamos al syscall
		
		li $v0, 5		#leemos el entero
		syscall
		sw $t1, DatoB	#guardamos el entero leido(word) en t1
		
		
		add $t2, $t0, $t1 #realizamos la suma de t0 + t1 y lo guardamos en t2
		sw $t2, Suma	#el resultado de la suma guardado en t2 se lo asignamos a suma
		
		la $a0, Result  #a0=Result
		li $v0, 4		#imprimimos Result
		syscall			#llamamos al syscall
		
		lw $a0, Suma	#recuperamos el valor de suma
		li $v0, 1		#imprimimos el entero
		syscall
		jr $ra