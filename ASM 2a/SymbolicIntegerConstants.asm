;;	Author: Marco Martinez
;;	Program: SymbolicIntegerConstants.asm
;;	Date: 10/7/2018
;;	Purpose: Write a program that defines symbolic constants for all seven days of the week. 
;;		 Create an array variable that uses the symbols as initializers.
;;
;;	Software Change Record
;;	Name         Date	What
;;	Marco	     10/7	Baseline for SymbolicIntegerConstants.asm
;;

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	MONDAY = 1
	TUESDAY = 2
	WEDNESDAY = 3
	THURSDAY = 4
	FRIDAY = 5
	SATURDAY = 6
	SUNDAY = 7
	array BYTE 7 MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY

.stack

.code
main proc				

	invoke ExitProcess,0
main endp
end main