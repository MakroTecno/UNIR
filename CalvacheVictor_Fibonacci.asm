.data
#Declaracion variable que tendra el mensaje que pedira la cantidad de numeros para la serie Fibonacci
    msg_num: .asciiz "Ingrese el numero de terminos de la serie Fibonacci: "
#Declaracion variable que dara el resultado con la serie fibonacci
    msg_fib: .asciiz "Serie Fibonacci: "
    new_line: .asciiz "\n"
.text 

main:

#Indica que va a mostrar un string
    li $v0, 4
#Imprime el string y lo guarda en el registro de memoria a0
    la $a0, msg_num
    syscall
#Capturo el entero con el codigo para leer enteros que es el 5
    li $v0, 5
    syscall
#Como debo utilizar el v0 en otros procesos, muevo el dato a t0
    move $t0, $v0
#Inicializo los dos primeros numeros de fibonacci y los guardo en t1 y t2 respectivamente
    li $t1, 0
    li $t2, 1
#Imprimir mensaje de inicio de la serie
    li $v0, 4
    la $a0, msg_fib
    syscall
#Imprimir el primer número (0)
    li $v0, 1
    move $a0, $t1
    syscall
#Imprimir el segundo número (1)
    li $v0, 1
    move $a0, $t2
    syscall
#Generar e imprimir los siguientes números de Fibonacci, en caso de que no existan mas terminos a operar se va a la funcion exit
    subi $t0, $t0, 2
    beqz $t0, exit
#Crea una funcion que suma t3 = t1 + t2 y de hay sale el otro numero para fibonacci
fib_loop:
    add $t3, $t1, $t2
#Imprimir el siguiente número
    li $v0, 1
    move $a0, $t3
    syscall
#Actualizar valores para el siguiente ciclo
    move $t1, $t2
    move $t2, $t3
#Decrementar el contador de términos
    subi $t0, $t0, 1
    bnez $t0, fib_loop
#Si no hay terminos disponibles esta funcion se habilitara y cerrara el proceso.
exit:
    li $v0, 4
    la $a0, new_line
    syscall
#Terminar el programa
    li $v0, 10
    syscall
