	.data
v:	.byte 	0x6, -0x7, 0x8, 0x3, -0x5, 0x0, 0x5, 0x2, -0x4, 0x1

	.text
	.globl main

main:
	li $s0, 9	#NumElementos-1
	li $s1, 2	#para dividir entre dos y comprobar si es par
	li $s2, 4
	li $s3, 11
	
	la $t0, v	#cargamos el vector
	li$t1, 0	#i
	
loop:
	beq $t1, $s0, end_loop

	lb $t2, 0($t0)	#v[i]
	div $t1, $s1	#i/2
	mfhi $t3		#resto
	
	bne $t3, $zero, impar
	
	ble $t2, $s2, si
	bge $t2, $s3, si
	
	neg $t2, $t2
	
	addi $t2, $t2, 1	#avanzamos en memoria
	addi $t1, $t1, 1
	j loop

impar:
	addi $t1, $t1, 1
	addi $t2, $t2, 1	#avanzamos en memoria
	j loop
	
si:	
	addi $t2, $t2, 1	#avanzamos en memoria
	addi $t1, $t1, 1	#incrementamos i

end_loop:	
	
	li $v0, 10
	syscall