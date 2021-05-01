; ICW1д��ż��ַ�˿ڣ�ICW2-4д�����ַ�˿�
; OCW2��OCW3д��ż��ַ�˿ڣ�OCW1д�����ַ�˿�

I8259_1   EQU   2B0H     ; 8259��ICW1�˿ڵ�ַ
I8259_2   EQU   2B1H     ; 8259��ICW2�˿ڵ�ַ
I8259_3   EQU   2B1H      ; 8259��ICW3�˿ڵ�ַ
I8259_4   EQU   2B1H      ; 8259��ICW4�˿ڵ�ַ
O8259_1   EQU   2B1H       ; 8259��OCW1�˿ڵ�ַ
O8259_2   EQU   2B0H       ; 8259��OCW2�˿ڵ�ַ
O8259_3   EQU   2B0H       ; 8259��OCW3�˿ڵ�ַ

DATA SEGMENT
 MES1   DB   ��YOU CAN PLAY A KEY ON THE KEYBOARD!',0DH, 0AH, 24H
 MES2   DD    MES1
 MESS1 DB 'HELLO! THIS IS COMPUTER LAB    *  0  *!',0DH,0AH,'$'
 MESS2 DB 'HELLO! THIS IS COMPUTER LAB     *  1  *!',0DH,0AH,'$'
 MESS3 DB 'HELLO! THIS IS COMPUTER LAB     *  2  *!',0DH,0AH,'$'
 MESS4 DB 'HELLO! THIS IS COMPUTER LAB     *  3  *!',0DH,0AH,'$'
 MESS5 DB 'HELLO! THIS IS COMPUTER LAB     *  4  *!',0DH,0AH,'$'
 MESS6 DB 'HELLO! THIS IS COMPUTER LAB     *  5  *!',0DH,0AH,'$'
 MESS7 DB 'HELLO! THIS IS COMPUTER LAB     *  6  *!',0DH,0AH,'$'
 MESS8 DB 'HELLO! THIS IS COMPUTER LAB     *  7  *!',0DH,0AH,'$'
DATA ENDS

STACKS SEGMENT
 		DB 100 DUP(?)
STACKS ENDS
STACK1 SEGMENT STACK
        DW 256 DUP(?)
STACK1 ENDS

CODE SEGMENT
        ASSUME CS:CODE, DS:DATA, SS:STACKS, ES:DATA
.386
START:  MOV AX,DATA
         MOV DS, AX
         MOV ES, AX
         MOV AX, STACKS
         MOV SS, AX
         MOV DX, I8259_1         ;��ʼ��8259��ICW1
         MOV AL, 00010011b         ;���ش�������Ƭ8259����ҪICW4
         OUT DX,AL

         MOV DX,I8259_2         ;��ʼ��8259��ICW2
         MOV AL,0B0H            ;10110000b
         OUT DX,AL
		 
         MOV AL,03H				;��ʼ��ICW4
         OUT DX,AL
		 
         MOV DX,O8259_1     ;��ʼ��8259���ж����β���������ocw1
         MOV AL,00H             ;����������λ
         OUT DX,AL
      
QUERY:  MOV AH,1               ;�ж��Ƿ��а�������
         INT 16H			  ;���а��������������̻��������գ�����ZF��0��AL�д�ŵ��������ASCII�룬AH�д�������ַ�����չ�롣���޼����£����־λZF��1��
         JNZ QUIT               ;�а������˳�
         MOV DX,O8259_3        ;��8259���Ͳ�ѯ����
         MOV AL,00001100b		;����Ϊ�жϲ�ѯ��ʽ
         OUT DX,AL
         IN AL,DX               ;������ѯ��
         TEST AL,80H            ;�ж��ж��Ƿ�����Ӧ��d7�Ƿ�Ϊ1
         JZ QUERY               ;û����Ӧ�������ѯ
         AND AL,07H				;������3λ��d2��d1��d0
         CMP AL,00H
         JE IR0ISR              ;��ΪIR0��������IR0�������
         CMP AL,01H
         JE IR1ISR              ;��ΪIR1��������IR1�������
         CMP AL,02H
         JE IR2ISR              ;��ΪIR2��������IR2�������
         CMP AL,03H
         JE IR3ISR              ;��ΪIR3��������IR3�������
         CMP AL,04H
         JE IR4ISR              ;��ΪIR4��������IR4�������
         CMP AL,05H
         JE IR5ISR              ;��ΪIR5��������IR5�������
         CMP AL,06H
         JE IR6ISR              ;��ΪIR6��������IR6�������
         CMP AL,07H
         JE IR7ISR              ;��ΪIR7��������IR7�������
         JMP QUERY
IR0ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS1     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR1ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS2     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR2ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS3     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR3ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS4     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR4ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS5     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR5ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS6    ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR6ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS7     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
         JMP EOI
IR7ISR:  MOV AX,DATA
         MOV DS,AX
         MOV DX,OFFSET MESS8     ;��ʾ��ʾ��Ϣ
         MOV AH,09
         INT 21H
EOI:  
         MOV DX,O8259_2         ;��8259�����жϽ�������
         MOV AL,00100000b        ;һ����жϽ�������
         OUT DX,AL              
         JMP QUERY
QUIT:    MOV AX,4C00H            ;���������˳�
         INT 21H

CODE ENDS
     END START
