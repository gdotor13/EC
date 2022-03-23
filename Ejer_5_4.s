
# Ejercicio 5.4 del manual de prácticas

			.data
pregunta: 	.asciiz "\nIntroduce ºC:"
respuesta:	.asciiz "\nºFarenheit :"

		.text
		.globl main

main:	la $a0, pregunta	# imprimir pregunta
		li $v0, 4
		syscall
		
		li $v0, 5			# leer temperatura celsius
		syscall
		
		add $s0, $0, $v0
		addi $s1, $0, 9
		mul $s2, $s1, $s0	# multiplicar por 9

		addi $t0, $0, 5
		div $s3, $s2, $t0	# dividir por 5

		addi  $s4, $s3, 32	# sumar 32

		la $a0, respuesta	# imprimir respuesta
		li $v0, 4
		syscall

		li $v0, 1			# imprimir temperatura farenheit
		add $a0, $0, $s4
		syscall

		jr $ra				# retornar
		
		.end

