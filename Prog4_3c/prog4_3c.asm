; Assembly equivalent of Prog4_3.c

.MODEL SMALL
.STACK 100H
.DATA
    message DB 'Hello World!', '$' ; Define the message string
.CODE
MAIN PROC
    MOV AX, @DATA      ; Load the address of the data segment into AX
    MOV DS, AX         ; Set DS to point to the data segment

    MOV DX, OFFSET message  ; Load the offset of the message string into DX
    MOV AH, 09H             ; Set AH to 09H (print string function)
    INT 21H                 ; Print the string

    MOV AH, 0               ; Read a key from the keyboard
    INT 16H                 ; Wait for a key press

    MOV AX, 4C00H           ; Return control to DOS
    INT 21H                 ; DOS interrupt
MAIN ENDP
END MAIN
