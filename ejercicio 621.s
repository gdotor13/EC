				.data
vector:			.space 13
lineaInicial:	.asciiz "Esto es un ejercicio que va a contar los múltiplos de 3  según si son múltiplos pares o impares \n"
introducir:		.asciiz "\n Introduzca su número: "
longitudVector:	.word 13
error:			.asciiz "El valor que has introducido no es válido, vuelve a intentarlo"
mul3i:			.space 4
mul3p:			.space 4
resImpar:		.asciiz "\n Valor de mul3i: "
resPar:			.asciiz "\n Valor de mul3p: "
resNoMul:		.asciiz "\n Contador numl3: "
coma:			.asciiz ","


				.text
				.globl main
				
				
				
main:			la	$a0, lineaInicial			#asi será como se inicie el ejercicio, se verá un enunciado en la pantalla
				li	$v0, 4
				syscall
				
				
				addi $s0, $zero, 0				#index[i] = 0
				la	$s8, vector
				la	$s4, longitudVector
				lw	$s4, 0($s4)

				
				 
mientras:		beq $s0, $s4, info

				la	$a0, introducir
				li	$v0, 4
				syscall
				
				
				li	$v0, 5
				syscall
				
				move $t0, $v0
				
				beq	$t0, $zero, info
				
				j correcto
				
				

correcto:		sb $t0, 0($s8)
				addi $s0, $s0, 1
				addi $s8, $s8, 1
				
				j mientras
				
info:			addi $s1, $zero, 0					#inicializamos el contador impar a 0
				addi $s2, $zero, 0					#inicializamos el contador par a 0
				addi $s3, $zero, 0					#inicializamos el contador nomul a 0
				
				li $s5, 3
				la $s8, vector


operacion:		beq $s0, $zero, finMientras
				lb $t0, 0($s8)
				div $t0, $s5
				mfhi $t1
				bne $t1, $zero, nomul
				beq $t1, $zero, mul3
				

nomul: 			addi $s3, $s3, 1
				addi $a0, $t0, 0
				li 	 $v0, 1
				syscall
				
				la $a0, coma
				li, $v0, 4
				syscall
				
				 
				addi $s0, $s0, 1 
				addi $s8, $s8, 1
				j operacion
				
				


mul3:			andi $t0, $t0, 1
				beq	 $t0, $zero, mul3par
				j mul3impar
				

mul3par:		addi $s2, $s2, 1 		#se empiezan a contar los números pares
				addi $s0, $s0, -1
				addi $s8, $s8, 1
				
				j operacion
				
mul3impar:		addi $s1, $s1, 1
				addi $s0, $s0, -1
				addi $s8, $s8, 1
				
				j operacion
				
				
finMientras: 	la $a0, resImpar		
				li $v0, 4
				syscall
				
				addi $a0, $t2, 0
				li	 $v0, 1
				syscall					#se imprimen los numeros impares que hay
				
				
				
				la $a0, resPar
				li $v0, 4
				syscall
				
				addi, $a0, $t1, 0
				li, $v0, 1
				syscall					#se imprimen los numeros pares que hay
				
				
				
				la $a0, resNoMul
				li $v0, 4
				syscall
			
				addi, $a0, $t6, 0
				li	  $v0, 1
				syscall					#se imprimen los numeros que no son multiplos de 3
				
				jr $ra
				


		
				
				
				
				