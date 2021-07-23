;;	Author:		Marco Martinez
;;	Filename:		encryption.asm
;;	Version:		1.0
;;	Description:	Revise the encryption program in Section 6.3.4 in the following manner: Create an encryption
;;				key consisting of multiple characters. Use this key to encrypt and decrypt the plaintext by XORing
;;				each character of the key against a corresponding byte in the message. Repeat the key as
;;				many times as necessary until all plain text bytes are translated. Suppose, for example, the key
;;				were equal to “ABXmv#7”.
;;	Date:		10/28
;;	
;;	Program Change Log
;;	==================
;;	Name		Date		Description
;;	Marco	10/28	Create baseline for encryption.asm
;;

INCLUDE Irvine32.inc
BUFMAX = 128 ; maximum buffer size

.data
	sPrompt BYTE "Enter the plain text: ",0
	sEncrypt BYTE "Cipher text: ",0
	sDecrypt BYTE "Decrypted: ",0
	buffer BYTE BUFMAX+1 DUP(0)
	bufSize DWORD ?
	encryptKey BYTE "ABXmv#7",0

.code
main PROC
	call InputTheString ; input the plain text
	call TranslateBuffer ; encrypt the buffer
	mov edx,OFFSET sEncrypt ; display encrypted message
	call DisplayMessage
	call TranslateBuffer ; decrypt the buffer
	mov edx,OFFSET sDecrypt ; display decrypted message
	call DisplayMessage
	exit
main ENDP

;-----------------------------------------------------
InputTheString PROC
;
; Prompts user for a plaintext string. Saves the string
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad ; save 32-bit registers
	mov edx,OFFSET sPrompt ; display a prompt
	call WriteString
	mov ecx,BUFMAX ; maximum character count
	mov edx,OFFSET buffer ; point to the buffer
	call ReadString ; input the string
	mov bufSize,eax ; save the length
	call Crlf
	popad
	ret
InputTheString ENDP

;-----------------------------------------------------
DisplayMessage PROC
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the message
; Returns: nothing
;-----------------------------------------------------
	pushad
	call WriteString
	mov edx,OFFSET buffer ; display the buffer
	call WriteString
	call Crlf
	call Crlf
	popad
	ret
DisplayMessage ENDP

;-----------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov ecx,bufSize ; loop counter
	mov esi,0 ; index 0 in buffer
	mov edi,0 ; index 0 in encryptKey
L1:
	cmp edi,6 
	jb AvoidReset ; jump if edi is less than 6, sidestepping the reassignment process
	mov edi,0	; reset edi for looping through encryptKey array if it does not equal 7 (0-6)
AvoidReset:
	mov al, encryptKey[edi] ; assign encryptionKey byte at index edi to al
	xor buffer[esi],al ; translate a byte from al to buffer if they are not equal
	inc esi ; point to next buffer byte
	inc edi ; point to next key byte
	loop L1
	popad ; reset registers
	ret ; return
TranslateBuffer ENDP
END main