ORG 0000H

MOV 50H, #03H   ; value A
MOV 51H, #05H   ; value B

; Load values into registers
MOV R0, 50H        ; R0 = value at 50H
MOV R1, 51H        ; R1 = value at 51H

; Assume equal initially
MOV 52H, #00H      ; result = 00H (equal)

COMPARE_LOOP:
MOV A, R0
JZ CHECK_R1_ZERO   ; if R0 == 0, check R1

MOV A, R1
JZ A_GREATER       ; if R1 == 0 and R0 != 0, A > B

DEC R0             ; decrement both
DEC R1
SJMP COMPARE_LOOP

CHECK_R1_ZERO:
MOV A, R1
JZ DONE            ; both zero ? equal
SJMP A_LESS        ; R0 zero first ? A < B

A_GREATER:
MOV 52H, #01H      ; A > B
SJMP DONE

A_LESS:
MOV 52H, #0FFH     ; A < B

DONE:
SJMP DONE          ; stop execution

END
