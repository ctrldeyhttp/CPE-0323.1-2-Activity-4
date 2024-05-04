; Assembly equivalent of Prog4_1.c

.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    MOV CX, 0        ; Initialize cx to 0
LOOP_START:
    CMP CX, 5        ; Compare cx with 5
    JGE LOOP_END     ; Jump if cx is greater than or equal to 5
    MOV AH, 02H      ; Set AH to 02H (print character function)
    MOV DL, '*'      ; Set DL to '*' (character to print)
    INT 21H          ; Print the character in DL
    INC CX           ; Increment cx by 1
    JMP LOOP_START   ; Jump to LOOP_START
LOOP_END:
    MOV AH, 0        ; Read a key from the keyboard
    INT 16H          ; Wait for a key press
    MOV AX, 4C00H    ; Return control to DOS
    INT 21H          ; DOS interrupt
MAIN ENDP
END MAIN
