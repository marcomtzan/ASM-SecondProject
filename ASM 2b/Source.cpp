;;	Author:		Marco Martinez
;;	Filename:		counting.asm
;;	Version:		1.0
;;	Description:	Write a procedure named CountNearMatches that receives pointers to two arrays of signed doublewords,
;;			a parameter that indicates the length of the two arrays, and a parameter that indicates the
;;			maximum allowed difference(called diff) between any two matching elements.For each element x
;;			in the first array, if the difference between it and the corresponding y in the second array is less
;;			than or equal to diff, increment a count.At the end, return a count of the number of nearly matching
;;			array elements in EAX.Write a test program that calls CountNearMatches and passes pointers
;;			to two different pairs of arrays.Use the INVOKE statement to call your procedure and pass stack
;;			parameters.Create a PROTO declaration for CountMatches.Save and restore any registers(other
	;;			than EAX) changed by your procedure.
	;;	Date:		12 / 2
	;;
;;	Program Change Log
;;	==================
;;	Name		Date		Description
;;	Marco		12 / 2		Create baseline for counting.asm
;;

INCLUDE Irvine32.inc

.data
array1 DWORD - 10, 10, 20
array2 DWORD - 14, 12, 0
diff DWORD 4
message BYTE “Number of near matches between{ -10,10,20 } and {-14, 12, 0}: ”, 0

.code
CountNearMatches PROTO,
arrayPtr1 : PTR DWORD,
	arrayPtr2 : PTR DWORD,
	arraySize : DWORD,
	margin : DWORD

	main PROC

	invoke CountNearMatches, OFFSET array1, OFFSET array2, LENGTHOF array1, diff
	mov edx, OFFSET message
	call WriteString
	call WriteInt
	call Crlf
	call Crlf

	exit
	main ENDP

	CountNearMatches PROC USES esi edi ebx ecx edx,
	arrayPtr1:PTR DWORD,
	arrayPtr2 : PTR DWORD,
	arraySize : DWORD,
	margin : DWORD
	LOCAL count : DWORD

	mov esi, arrayPtr1
	mov edi, arrayPtr2
	mov ecx, arraySize
	L1 :
mov eax, [esi]
mov ebx, [edi]
cmp eax, ebx
jg Subtraction
mov edx, eax
mov eax, ebx
mov ebx, edx
Subtraction :
sub eax, ebx
mov edx, margin
cmp eax, edx
jg Reset
mov eax, 1
add count, eax
Reset :
add esi, 4
add edi, 4
loop L1
mov eax, count
ret
CountNearMatches ENDP
END main
