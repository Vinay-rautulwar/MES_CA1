ORG 0000H

; -------------------------------------------------
; STEP 2: IN-PLACE COMPACTION (indirect addressing)
; -------------------------------------------------

MOV R0, #40H        ; Read pointer
MOV R1, #40H        ; Write pointer

SCAN:
MOV A, R0
CJNE A, #60H, READ
SJMP FILL_ZERO      ; End of scan

READ:
MOV A, @R0
CJNE A, #0FFH, COPY
SJMP NEXT

COPY:
MOV @R1, A
INC R1

NEXT:
INC R0
SJMP SCAN

; -------------------------------------------------
; STEP 3: FILL REMAINING MEMORY WITH 00H
; -------------------------------------------------

FILL_ZERO:
MOV A, R1
CJNE A, #60H, ZERO
SJMP DONE

ZERO:
MOV @R1, #00H
INC R1
SJMP FILL_ZERO

DONE:
SJMP DONE           ; Stop execution

END