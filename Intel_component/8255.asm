IO8255_MODE	   EQU   28BH
IO8255_A	   EQU   288H
IO8255_B	   EQU   289H
IO8255_C           EQU   28AH

CODE SEGMENT
	     ASSUME CS: CODE
;ѧ��41824071��B�����룬A�����
START:  MOV DX, IO8255_MODE      	  ;8255��ʼ��
	  	 MOV AL, 10000010B 		  ;/�˿�A��ʽ0���˿�A������˿�B��ʽ0���˿�B���룬�˿�C����
	  	 OUT DX, AL
INOUT:  MOV DX, IO8255_B         ;��������
	  	IN AL,DX				;B������
	  	 MOV DX,IO8255_A        ;�������
		 OUT DX,AL      		 ;A�����         
	  	 MOV DL,0FFH            ;�ж��Ƿ��а���
	  	 MOV AH, 06H
	  	 INT 21H
	  	 JZ INOUT            	  ;����,�����
	  	 MOV AH,4CH             ;���򷵻�
	  	 INT 21H

CODE ENDS
	END START
