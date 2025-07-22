.model small
.stack 100h
.data
    arr dw 1023, 504, 655, 88, 9000, 3276, 2
    arr_size dw 7
    newline db 13,10,'$'
    msg_sorted db 'Sorted Array: $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; Bubble Sort
    mov cx, arr_size
    dec cx              ; Outer loop count = n - 1
outer_loop:
    push cx
    mov cx, arr_size
    dec cx              ; Inner loop count = n - 1
    mov si, 0

inner_loop:
    mov ax, arr[si]
    cmp ax, arr[si+2]
    jbe no_swap

    ; Swap arr[si] and arr[si+2]
    xchg ax, arr[si+2]
    mov arr[si], ax

no_swap:
    add si, 2
    loop inner_loop
    pop cx
    loop outer_loop

    ; =====================
    ; Display Sorted Array
    ; =====================
    lea dx, msg_sorted
    mov ah, 09h
    int 21h

    ; Print each element
    mov cx, arr_size
    mov si, 0

print_loop:
    mov ax, arr[si]
    call print_number

    ; Print newline after each number
    lea dx, newline
    mov ah, 09h
    int 21h

    add si, 2
    loop print_loop

    ; Exit
    mov ah, 4ch
    int 21h

; =====================
; Procedure: print_number
; =====================
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

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_number endp

end main

