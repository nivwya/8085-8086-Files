.model small
.stack 100h
.data
    arr dw 1023, 504, 655, 88, 9000, 3276, 2
    arr_size dw 7
    target dw 1          ; 🔍 Element to search

    found_msg db 'Element Found$'
    not_found_msg db 'Element Not Found$'

.code
main:
    mov ax, @data
    mov ds, ax

    mov cx, arr_size        ; total elements
    mov si, 0               ; index
    mov ax, target

search_loop:
    cmp ax, arr[si]
    je found
    add si, 2
    loop search_loop

    ; ===== Element Not Found =====
    lea dx, not_found_msg
    mov ah, 09h
    int 21h
    jmp exit

found:
    lea dx, found_msg
    mov ah, 09h
    int 21h

exit:
    mov ah, 4ch
    int 21h

end main

