.model small
.stack 100h
.data
    multiplicand dw 50
    multiplier dw 10
    product dw 0
    output db 'Product is: $'
    numStr db '     $' ; Space for 5 characters and the terminating '$'

.code
main:
    mov ax, @data
    mov ds, ax            ; Initialize data segment

    mov cx, [multiplier]  ; Load multiplier (10) into CX
    mov ax, 0             ; Initialize AX to 0 (to store the result)
    
loop_multiply:
    add ax, [multiplicand] ; Add multiplicand (50) to AX
    loop loop_multiply     ; Decrease CX by 1 and continue loop if CX != 0
    
    mov [product], ax      ; Store the result in 'product'

    ; Convert number to string
    call NumToStr

    ; Print the output message
    lea dx, output
    mov ah, 09h
    int 21h                ; Display the string "Product (dec) is: "

    lea dx, numStr
    mov ah, 09h
    int 21h                ; Display the product

    ; Terminate program
    mov ax, 4C00h
    int 21h

NumToStr: ; Subroutine to convert number to string (AX -> numStr)
    push ax
    push bx
    push cx
    push dx
    lea di, numStr + 4    ; Start at the end of numStr buffer
    mov cx, 10            ; Decimal base

convert_loop:
    xor dx, dx            ; Clear dx
    div cx                ; Divide ax by 10, result in ax, remainder in dx
    add dl, '0'           ; Convert remainder to ASCII
    dec di
    mov [di], dl          ; Store ASCII character
    test ax, ax           ; Check if ax is zero
    jnz convert_loop      ; If not, repeat

    pop dx
    pop cx
    pop bx
    pop ax
    ret

end main
