;;	Author:	Marco Martinez
;;	Program:	IntegerExpressionCalculation.asm
;;	Date:	11/1/2018
;;	Purpose:	To calculate the expression: A = (A+B)-(C+D)
;;
;;	Software Change Record
;;	Name         Date	What
;;	Marco	     10/7	Baseline for integer calculation A = (A+B) - (C-D)
;;

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	a SDWORD  10
	b SDWORD  15
	cee SDWORD  5
	d SDWORD  10
.stack 4096

.code
main proc
	mov	eax, a				
	mov	ebx, b
	add	eax, ebx
	mov	ecx, cee
	mov	edx, d
	add	ecx, edx
	sub	eax, ecx				

	invoke ExitProcess,0
main endp
end main