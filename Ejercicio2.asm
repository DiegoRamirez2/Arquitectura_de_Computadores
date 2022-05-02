.data

coorX1: .asciiz "Ingrese la coordenada X del vector 1: "
coorY1: .asciiz "Ingrese la coordenada Y del vector 1: "
coorZ1: .asciiz "Ingrese la coordenada Z del vector 1: "
coorX2: .asciiz "Ingrese la coordenada X del vector 2: "
coorY2: .asciiz "Ingrese la coordenada Y del vector 2: "
coorZ2: .asciiz "Ingrese la coordenada Z del vector 2: "

.text
    main:
        li $t8, 0x100101a0
        li $t9, 0x100101c0
        # Se solicitan los datos al usuario
        jal pedirXs
        jal pedirYs
        jal pedirZs
        j exit
        


pedirXs:
        # Se le solicita al usuario la coordenada X1
        li $v0, 4
        la $a0, coorX1
        syscall
        # Se recibe el valor
        li $v0, 7
        syscall
        # Se guarda el valor en $f2
        add.d $f2, $f0, $f30
        # Se le solicita al usuario la coordenada X2
        li $v0, 4
        la $a0, coorX2
        syscall
        # Se recibe el valor
        li $v0, 7
        syscall
        # Se restan X1 y X2
        sub.d $f2, $f2, $f0
        # Se multiplica el valor de (X1-X2) por si mismo y se guarda en el mismo registro
        mul.d $f2, $f2, $f2
        # Se suma con el contenido del registro $f4
        add.d $f4, $f2, $f4
        # Se salta de vuelta al main
        jr $ra
 
pedirYs:
        # Se le solicita al usuario la coordenada Y1
        li $v0, 4
        la $a0, coorY1
        syscall
        # Se recibe el valor
        li $v0, 7
        syscall
        # Se guarda el valor en $f2
        add.d $f2, $f0, $f30
        # Se le solicita al usuario la coordenada Y2
        li $v0, 4
        la $a0, coorY2
        syscall
        # Se recibe el valor
        li $v0, 7
        syscall
        # Se restan Y1 y Y2
        sub.d $f2, $f2, $f0
        # Se multiplica el valor de (Y1-Y2) por si mismo y se guarda en el mismo registro
        mul.d $f2, $f2, $f2
        # Se suma con el contenido del registro $f4
        add.d $f4, $f2, $f4
        # Se salta de vuelta al main
        jr $ra
  
pedirZs:
        # Se le solicita al usuario la coordenada Z1
        li $v0, 4
        la $a0, coorZ1
        syscall
        # Se recibe el valor
        li $v0, 7
        syscall
        # Se guarda el valor en $f2
        add.d $f2, $f0, $f30
        # Se le solicita al usuario la coordenada Z1
        li $v0, 4
        la $a0, coorZ2
        syscall
        # Se recibe el valor
        li $v0, 7
        syscall
        # Se restan Z1 y Z2
        sub.d $f2, $f2, $f0
        # Se multiplica el valor de (Z1-Z2) por si mismo y se guarda en el mismo registro
        mul.d $f2, $f2, $f2
        # Se suma con el contenido del registro $f4
        add.d $f4, $f2, $f4
        # Se salta de vuelta al main
        jr $ra

CalcularX0:
        # Se carga el número 1 al registro 1, y se transfiere al Coproc1, luego se transforma en un double
        li $a1, 2
        mtc1.d $a1, $f12
        cvt.d.w $f12, $f12
        # Se calcula el extremo superior
        add.d $f6, $f4, $f12
        # Se calcula el extramo inferior
        sub.d $f8, $f4, $f12
        add.d $f6, $f6, $f12
        
                
                     
exit:
        # Se termina el programa
        li $v0, 10
        syscall       
