IO8254_MODE  	EQU   283H     ;8254���ƼĴ����˿ڵ�ַ
IO8254_COUNT0	EQU   280H     ;8254������0�˿ڵ�ַ
IO8254_COUNT1	EQU   281H     ;8254������1�˿ڵ�ַ
IO8254_COUNT2	EQU   282H     ;8254������2�˿ڵ�ַ
                            
STACK1 SEGMENT STACK
        DW 256 DUP(?)
STACK1 ENDS
CODE SEGMENT
        ASSUME CS:CODE
START: MOV DX, IO8254_MODE       ;��ʼ��8254������ʽ
       MOV AL,00010001b         ;������0����ʽ0
	   ;MOV AL,00010111b  ������0����ʽ3
       OUT DX, AL
                
       MOV DX,280H       ;װ�������ֵ
       MOV AL,5
       OUT DX,AL

       MOV AX,4C00H               ;���ص�DOS
       INT 21H
       
CODE ENDS
     END START
