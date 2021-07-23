;;	Author:	Marco Martinez
;;	Program:	FibonacciNumbers.asm
;;	Date:	10/14/2018
;;	Purpose:	Write a program that uses a loop to calculate the first seven values of the Fibonacci number sequence,
;;			described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n – 1) + Fib(n – 2).
;;
;;	Software Change Record
;;	Name		Date		What
;;	Marco	10/14	Baseline for FibonacciNumbers.asm
;;	Marco	12/3		Adjust for reporting

INCLUDE Irvine32.inc

.data
	fib DWORD 7 DUP(0)
	counter DWORD 0
	fibStart BYTE "fib(",0
	fibEnd BYTE ")=",0
	space BYTE " ",0

.code
main proc

	push eax
	mov eax,10
	start:
		pushad
		mov ebx,0
		mov edx,1
		mov esi,OFFSET fib
		mov [esi],edx
		add esi,4
		mov ecx,6
		L1:
			mov eax,ebx
			add eax,edx
			mov [esi],eax
			add esi,4
			mov ebx,edx
			mov edx,eax
		loop L1
		popad

		pushad
		mov ebx,0
		mov esi,OFFSET fib
		mov edx,OFFSET fibStart
		call writeString
		mov eax,ebx
		add eax,1
		call writeInt
		mov edx,OFFSET fibEnd
		call writeString
		mov eax,[esi]
		call writeInt
		mov edx,OFFSET space
		call writeString
		inc ebx
		mov ecx,6
		L2:
			mov edx,OFFSET fibStart
			call writeString
			mov eax,ebx
			add eax,1
			call writeInt
			mov edx,OFFSET fibEnd
			call writeString
			mov eax,[esi+ebx*4]
			call writeInt
			mov edx,OFFSET space
			call writeString
			inc ebx
		loop L2
		popad

		call crlf
		dec eax
		cmp eax,0
	jg start
	pop eax

	invoke ExitProcess,0
main endp
end main