all : riscv_asm

riscv_asm: myassembler.o 
	g++ -o riscv_asm myassembler.o 

myassembler.o: myassembler.cpp
	g++ -c myassembler.cpp -o myassembler.o

clean:
	rm -rf myassembler.o riscv_asm