@ part1.s
@   
@   
@	
@ ---------------------------------------
@   Data Section
@ ---------------------------------------
	
.data
y:      .word 0

	
@ ---------------------------------------
@   Code Section
@ ---------------------------------------
	
.text
.global main
.extern printf

main:	
        ldr r0, =y
	ldr r1, =0xAAAAAAAA
	str r1, [r0]
	ldr r1, =0xBBBBBBBB
	str r1, [r0]
	ldr r1, =0xCCCCCCCC
	str r1, [r0]
	
	 
