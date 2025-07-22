.model small
.stack 100h
.code
main proc
    mov ax, 5   ; Load first number (5) into AX
    mov bx, 3   ; Load second number (3) into BX
    sub ax, bx  ; AX = AX - BX (5 - 3 = 2)

    ; At this point, AX holds the result (2)

    mov ah, 4Ch ; DOS interrupt to terminate the program
    int 21h

main endp
end main
