#I have used the Euclidean Algorithm to find the GCD of two numbers.

lui x3,0x10000      
addi x29,x3,0x200         # initialising register x29 with 0x10000200      
ld x31,0(x3)              # loading number of pairs in register x31 
loop1:
    beq x31,x0,end        # to check when all gcd's have been calculated  
    addi x31,x31,-1
    ld x13,8(x3)          # loading first value of a pair in register x13  
    ld x14,16(x3)         # loading second value of a pair in register x14
    beq x13,x0,edgecase
    beq x14,x0,edgecase
    beq x0,x0,loop
edgecase:                 # handling edgecase if any number is 0
    sd x0,0(x29)
    addi x3,x3,16         # updating the address stored in x3
    addi x29,x29,8        # updating x29 to memory location where next GCD will be stored
    beq x0,x0,loop1
loop: 
    beq x13,x14,exit
    blt x13,x14,l1     
    sub x13,x13,x14       # subtracting the smaller number from larger
    beq x0,x0,loop
    
l1:
    sub x14,x14,x13       # subtracting the smaller number from larger
    beq x0,x0,loop
exit:
    sd x13,0(x29)         # storing the answer at the location told
    addi x3,x3,16         # updating the address stored in x3
    addi x29,x29,8        # updating x29 to memory location where next GCD will be stored
    beq x0,x0,loop1
end: 
    add x0,x0,x0
