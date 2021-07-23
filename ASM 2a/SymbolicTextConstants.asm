;;	Author: Marco Martinez
;;	Program: SymbolicTextConstants.asm
;;	Date: 10/7/2018
;;	Purpose: Write a program that defines sumbolic names for several string literals (characters between quotes).
;;		 Use each symbolic name in a variable defintion.
;;
;;	Software Change Record
;;	Name         Date	What
;;	Marco	     10/7	Baseline for SymbolicTextConstants.asm
;;

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	MONDAY EQU <'Monday',0>
	TUESDAY EQU <'Tuesday',0>
	WEDNESDAY EQU <'Wednesday',0>
	THURSDAY EQU <'Thursday',0>
	FRIDAY EQU <'Friday',0>
	SATURDAY EQU <'Saturday',0>
	SUNDAY	EQU <'Sunday',0>
	array BYTE 7 MONDAY, TUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY, SUNDAY

.stack

.code
main proc				

	invoke ExitProcess,0
main endp
end main