;;	Author: Marco Martinez
;;	Program: DataDefinitions.asm
;;	Date: 10/7/2018
;;	Purpose: Write a program that contains a definition of each data type listed in Table 3-2 in Section 3.4.
;;		 Initialize each variable to a value that is consistent with its data type.
;;
;;	Software Change Record
;;	Name         Date	What
;;	Marco	     10/7	Baseline for DataDefinitions.asm
;;

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	valByte BYTE 256B		; 8bit unsigned integer
	valSByte SBYTE -128S		; 8bit signed integer
	valWord WORD 65536		; 16bit unsigned integer
	valSWord SWORD -32768		; 16bit signed integer
	valDWord DWORD 4294967296D	; 32bit unsigned integer
	valSDWord SDwORD -2147483648SD	; 32bit signed integer
	valFWord FWORD 1		; 48bit integer (Far pointer in protected mode)
	valQWord QWORD 1Q		; 64bit integer
	valTByte TBYTE 1T		; 80bit integer
	valReal4 REAL4 4.5E4		; 32bit real, IEEE short real
	valReal8 REAL8 5.3E8		; 64bit real, IEEE long real
	valReal10 REAL10 6.7E10		; 80bit real, IEEE extended real

.stack

.code
main proc				

	invoke ExitProcess,0
main endp
end main