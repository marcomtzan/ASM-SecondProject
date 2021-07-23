;;	Author:	Marco Martinez
;;	Program:	ShiftElements.asm
;;	Date:	10/14/2018
;;	Purpose:	Using a loop and indexed addressing, write code that rotates the members 
;; 			of a 32-bit integer array forward one position. The value at the end of 
;; 			the array must wrap around to the first position.
;;			For example, the array [10,20,30,40] would be transformed into 	
;;			[40,10,20,30].
;;
;;	Software Change Record
;;	Name        Date		What
;;	Marco	  10/14		Baseline for ShiftElements.asm
;;	Marco	  12/6		Implement reporting features.
;;

INCLUDE Irvine32.inc

.data
	array DWORD 10,20,30,40
	counter DWORD 1
	space BYTE " ",0
	msgOriginal BYTE "Original array: ",0
	msgShifted BYTE "Shifted array: ",0

.code
main proc
	mov ecx,0

	program:
		pushad
		mov esi,OFFSET array
		mov ecx,LENGTHOF array
		mov edx,OFFSET msgOriginal
		call writeString
		mov edx,OFFSET space
		L1:
			mov eax,[esi]
			call writeInt
			call writeString
			add esi,4
		loop L1
		call crlf
		popad
	
		pushad
		mov esi,OFFSET array+3*4
		mov eax,[esi]
		mov esi,OFFSET array
		mov ebx,[esi]
		mov [esi],eax
		mov eax,ebx
		mov esi,OFFSET array+1*4
		mov ecx,LENGTHOF array-1	
		L2:
			mov ebx,[esi]
			mov [esi],eax
			mov eax,ebx
			inc edx
			mov counter,edx
			add esi,4
		loop L2	
		popad

		pushad
		mov esi,OFFSET array
		mov ecx,LENGTHOF array
		mov edx,OFFSET msgShifted
		call writeString
		mov edx,OFFSET space
		call writeString
		L3:
			mov eax,[esi]
			call writeInt
			call writeString
			add esi,4
		loop L3
		call crlf
		popad

		call crlf
		inc ecx
		cmp ecx,4
	jl program

	invoke ExitProcess,0
main endp
end main
