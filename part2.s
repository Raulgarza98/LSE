@ scanfExample1.s
@ D. Thiebaut
@ A simple example illustrating how one
@ can call the C function scanf() from assembly.
@ The C example for this code would be:
@     int num = 0;
@     printf( "> " );
@     scanf( "%d", &num );
@     print( "give me the first operand: %d\n", num ) ;
@
@ ---------------------------------------
@     Data Section
@ ---------------------------------------
	
        .data
        .balign 4	
prompt1: .asciz  "> "
format1: .asciz  "%d"
num1:    .int    0
output1: .asciz  "give me the first operand:\n"

prompt2: .asciz  "> "
format2: .asciz  "%d"
num2:    .int    0
output2: .asciz  "give me the second operand:\n"

prompt3: .asciz  "> "
format3: .asciz  "%d"
num3:    .int    0
output3: .asciz  "The result is: %d\n"
	
@ ---------------------------------------
@     Code Section
@ ---------------------------------------
	
.text
.global main
.extern printf
.extern scanf

main:   push    {ip, lr}         @ push return address + dummy register for alignment
        ldr     r0, =prompt1     @ print the prompt
        bl      printf

        ldr     r0, =format1      @ call scanf, and pass address of format
        ldr     r1, =num1         @ string and address of num in r0, and r1,
        bl      scanf            @ respectively.

	push    {ip, lr}         @ push return address + dummy register for alignment
        ldr     r0, =prompt2     @ print the prompt
        bl      printf

        ldr     r0, =format2      @ call scanf, and pass address of format
        ldr     r1, =num2         @ string and address of num in r0, and r1,
        bl      scanf            @ respectively.

	ldr    r1, =num1		@ get address of a into r1
        ldr    r1, [r1]          @ get a into r1
        ldr    r2, =num2            @ get address of b into r2
        ldr    r2, [r2]          @ get b into r2
        add    r1, r1, r2        @ add r1 to r2 and store into r1
        ldr    r2, =num3            @ get address of c into r2
        str    r1, [r2]          @ store r1 into c

        Ldr     r1, =num3         @ print num formatted by output string.
        Ldr     r1, [r1]
        ldr     r0, =output3
        bl      printf

        pop     {ip, pc}         @ pop return address into pc
