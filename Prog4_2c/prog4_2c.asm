; Assembly equivalent of Prog4_2.c

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    CALL PRINT       ; Call the print function
    MOV AH, 0        ; Read a key from the keyboard
    INT 16H          ; Wait for a key press
    MOV AX, 4C00H    ; Return control to DOS
    INT 21H          ; DOS interrupt
MAIN ENDP

PRINT PROC
    MOV CX, 1        ; Initialize cx to 1
PRINT_LOOP:
    CMP CX, 6        ; Compare cx with 6
    JGE PRINT_END    ; Jump if cx is greater than or equal to 6
    MOV AH, 02H      ; Set AH to 02H (print character function)
    MOV DL, '*'      ; Set DL to '*' (character to print)
    INT 21H          ; Print the character in DL
    INC CX           ; Increment cx by 1
    JMP PRINT_LOOP   ; Jump to PRINT_LOOP
PRINT_END:
    RET              ; Return from the print function
PRINT ENDP

END MAIN