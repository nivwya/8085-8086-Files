.model small
.stack 100h
.data
    arr dw 1023, 504, 655, 88, 9000, 3276, 2
    arr_size dw 7
    msg_max db 'Minimum : $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Initialize
    mov cx, arr_size
    mov si, 0         ; index
    mov ax, arr[si]
    mov bx, ax        ; max = bx
    add si, 2
    dec cx

next:
    mov ax, arr[si]
    cmp ax, bx
    jge skip
    mov bx, ax        ; update min

skip:
    add si, 2
    loop next

    ; ==========================
    ; Print "Maximum: "
    ; ==========================
    lea dx, msg_max
    mov ah, 09h
    int 21h

    mov ax, bx        ; max value in ax
    call print_number

    ; New line
    mov ah, 02h
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; Exit
    mov ah, 4ch
    int 21h

; ==========================
; Procedure to print 16-bit number in AX
; ==========================
print_number proc
    push ax
    push bx
    push cx
    push dx

    xor cx, cx
    mov bx, 10

convert:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

end main

