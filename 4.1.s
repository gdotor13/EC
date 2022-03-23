	.data 
cadena1: .asciiz "\nIntroducir dato A = "   
cadena2: .asciiz "\nIntroducir dato B = "   
cadena3: .asciiz "\nEl valor de A+B es = "   

# definir a partir de aquí tres palabras: A, B y Suma. Tenga cuidado con el comienzo del segmento.
A:  .word 0
B:  .word 0
Suma:   .word 0

	.text   
	.globl main 
main:	# añada aquí las instrucciones de tu programa
    la $a0, cadena1
    li $v0, 4
    syscall     #imprime cadena1
    
    li $v0, 5
    syscall     #obtiene el valor de a
    sw $v0, A   #lo guardamos en a
	
	la $a0, A  		#a0=str1
	li $v0, 1		#imprimimos str1
	syscall			#llamamos al syscall
    
    la $a0, cadena2
    li $v0, 4
    syscall     #imprime cadena2
    
    li $v0, 5
    syscall     #obtiene el valor de b
    sw $v0, B   #lo guardamos en b
    
    lw $t0, A
    add $t0, $v0, $t0   #suma A+B
    sw $t0, Suma
    
    la $a0, cadena3
    li $v0, 4
    syscall     #imprime cadena3
    
    lw $a0, Suma
    li $v0, 1
    syscall     #imprime entero
	
    li $v0, 10
	syscall     # exit