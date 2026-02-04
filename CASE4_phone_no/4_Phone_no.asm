ORG 0000H

; -------- Construct LOW BYTE first (A0H) --------
CLR A                  ; A = 00H
ORL A, #0A0H           ; Set required bits ? A = A0H
MOV R1, A              ; Store low byte

; -------- Construct HIGH BYTE using bit-clearing logic --------
MOV A, #1FH            ; A = 00011111 (base pattern)
ANL A, #17H            ; Clear unwanted bits ? A = 00010111
MOV R0, A              ; Store high byte

; -------- Shift HIGH BYTE to MSB position --------
MOV A, R0              ; Load high byte
SWAP A                 ; Swap nibbles
SWAP A                 ; Shift into upper byte position

; -------- Combine both bytes logically --------
ORL A, R1              ; A = 17A0H (6048 decimal)

HERE: SJMP HERE        ; End program

END
