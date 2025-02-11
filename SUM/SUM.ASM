; hello.asm - prints "hello world" to stdout

    .MODEL SMALL
    .STACK 100h
    .DATA

DATA_SEG SEGMENT
HelloMsg DB 13,10, 'TYPE A NUMBER: ',13,10,'$'
DATA_SEG ENDS

    .CODE
ProgStart:
    MOV AX,DATA_SEG
    MOV DS,AX

; this interupt prints the message into the screen
    MOV AH,9
    MOV DX,OFFSET HelloMsg
    INT 21h

; this interupt reads user input and assigns it into AL
    MOV AH,1
    INT 21h
    MOV BH,AL
    SUB BH,48

; this interupt prints the message into the screen
    MOV AH,9
    MOV DX,OFFSET HelloMsg
    INT 21h

; this interupt reads user input and assigns it into AL
    MOV AH,1
    INT 21h
    ADD BH,AL

; this interput outputs newline (line feed)
    MOV DL,10
    MOV AH,2
    INT 21h

; this interput takes char from DL and prints it into user screen after adding 1
    MOV DL,BH
    MOV AH,2
    INT 21h

    MOV AH,4Ch
    INT 21h

END ProgStart
