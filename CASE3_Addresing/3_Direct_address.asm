ORG 0000H

MOV 0FH, #05H
MOV A, 0FH     ; Direct addressing
MOV 00H, A     ; Store result for observation

HERE: SJMP HERE
END
