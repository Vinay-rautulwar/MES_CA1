ORG 0000H

MOV 40H, #99H    ; real data
MOV 0H, #40H     ; pointer

MOV R1, 0H       ; R1 = 40H
MOV A, @R1       ; A = RAM[40H] = 99H
MOV 50H, A       ; store result

HERE: SJMP HERE
END
