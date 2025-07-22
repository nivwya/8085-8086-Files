dosseg 
model small
.8086

.data
n db 41h
m db 01h
p db ?
num db 10 dup('$')

.code
mov ax, @data
mov ds, ax
mov al, n
add al, m
mov p, al
mov ax, 4c00h
int 21h
end
