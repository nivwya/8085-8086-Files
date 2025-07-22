.MODEL SMALL
.STACK 100H
.DATA
    msg db 'Hello, World!$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, OFFSET msg
    MOV AH, 09H
    INT 21H

    MOV AX, 4C00H
    INT 21H
MAIN ENDP
END MAIN
