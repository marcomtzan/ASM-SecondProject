;;	Author:		Marco Martinez
;;	Filename:		gradeCalc.asm
;;	Version:		1.0
;;	Description:	Create a procedure named CalcGrade that receives an integer value between 0 and 100, and
;;				returns a single capital letter in the AL register. Preserve all other register values between calls
;;				to the procedure. The letter returned by the procedure should be according to the following
;;				ranges: 90 - 100 = A; 80 - 89 = B; 70 - 79 = C, 60 - 69 = D, 0 - 59 = F
;;				Write a test program that generates 10 random integers between 50 and 100, inclusive. Each
;;				time an integer is generated, pass it to the CalcGrade procedure. You can test your program
;;				using a debugger, or if you prefer to use the book’s library, you can display each integer and its
;;				corresponding letter grade. (The Irvine32 library is required for this solution program because it
;;				uses the RandomRange procedure.)
;;	Date:		10/28
;;	
;;	Program Change Log
;;	==================
;;	Name		Date		Description
;;	Marco	10/28	Create baseline for gradeCalc.asm
;;

INCLUDE Irvine32.inc

.data
	MIN_A EQU 90
	MIN_B EQU 80
	MIN_C EQU 70
	MIN_D EQU 60
	MIN_F EQU 50
	MIN_BOUND EQU 0
	MAX_BOUND EQU 100
     gradeA BYTE "A",0
     gradeB BYTE "B",0
     gradeC BYTE "C",0
	gradeD BYTE "D",0
     gradeF BYTE "F",0
	gradeFinal BYTE ?,0
     outOfBounds BYTE "Value out of bounds.",0
	msg BYTE " equates to ",0
	value DWORD ?
		
.code
main PROC

	call Randomize
	mov ecx, 10
L1:
	call DetermineInt
	call GradeCalc
	call DisplayGrade
	loop L1

	exit
main ENDP

;-----------------------------------------------------
DetermineInt PROC
;
; Determine the integers to be used for grade calculation (random)
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	mov eax,50
     call RandomRange
	add eax,51
	mov edx,eax
	Call WriteDec
	ret
DetermineInt ENDP

;-----------------------------------------------------
DisplayGrade PROC
;
; Displays the grade for each integer
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	mov edx,0
	mov edx,OFFSET msg
	call WriteString
     mov gradeFinal,al
     mov edx,OFFSET gradeFinal
     call WriteString
     call Crlf
	ret
DisplayGrade ENDP

;-----------------------------------------------------
GradeCalc PROC
;
; Calculates which grade the integer represents
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	cmp eax,MAX_BOUND
	ja OutBounds
	cmp eax,MIN_BOUND
	jb OutBounds
	cmp eax,MIN_A
	jae EarnedA
	cmp eax,MIN_B
	jae EarnedB
	cmp eax,MIN_C
	jae EarnedC
	cmp eax,MIN_D
	jae EarnedD
	cmp eax,MIN_F
	jae EarnedF
EarnedA:
	mov al,gradeA
	jmp Stop
EarnedB:
	mov al,gradeB
	jmp Stop
EarnedC:
	mov al,gradeC
	jmp Stop
EarnedD:
	mov al,gradeD
	jmp Stop
EarnedF:
	mov al,gradeF
	jmp Stop
OutBounds:
	mov edx,OFFSET outOfBounds
	call WriteString
	call Crlf
Stop:
	ret
GradeCalc ENDP
END main