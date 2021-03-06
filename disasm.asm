.model small
		ASSUME CS:kodas, DS:duomenys, SS:stekas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stekas	segment word 'STACK'
		dw 400h dup (00)									; stack -> 2Kb
stekas ends
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
duomenys segment para public 'DATA'
	instructions_1:
	; Immediate to register
		db 10110000b 
				dw offset immediateToReg
		db 10110001b 
				dw offset immediateToReg
		db 10110010b 
				dw offset immediateToReg
		db 10110011b 
				dw offset immediateToReg
		db 10110100b 
				dw offset immediateToReg
		db 10110101b 
				dw offset immediateToReg
		db 10110110b 
				dw offset immediateToReg
		db 10110111b 
				dw offset immediateToReg
		db 10111000b 
				dw offset immediateToReg
		db 10111001b 
				dw offset immediateToReg
		db 10111010b 
				dw offset immediateToReg
		db 10111011b 
				dw offset immediateToReg
		db 10111100b 
				dw offset immediateToReg
		db 10111101b 
				dw offset immediateToReg
		db 10111110b 
				dw offset immediateToReg
		db 10111111b 
				dw offset immediateToReg
	; Register/Memory to/from Register
		db 10001000b
				dw offset regMemToFromReg
		db 10001001b
				dw offset regMemToFromReg
		db 10001010b
				dw offset regMemToFromReg
		db 10001011b
				dw offset regMemToFromReg
	;Immediate to Register/Memory
		db 11000111b
				dw offset immediateToRegMem
		db 11000110b
				dw offset immediateToRegMem
	;Accumulator <- memory
		db 10100001b
				dw offset memoryToAcc
		db 10100000b
				dw offset memoryToAcc
	; Memory <-  accumulator
		db 10100010b
				dw offset accToMemory
		db 10100011b
				dw offset accToMemory
	; REgister/Memory to Segment Register
		db 10001110b
				dw offset regMemToSeg
		db 10001100b
				dw offset segToRegMem
	; PUSH: push register/memory
		db 11111111b
				dw offset pushMemReg
	; PUSH: push register
		db 01010000b
				dw offset pushReg
		db 01010001b
				dw offset pushReg
		db 01010010b
				dw offset pushReg
		db 01010011b
				dw offset pushReg
		db 01010100b
				dw offset pushReg
		db 01010101b
				dw offset pushReg
		db 01010110b
				dw offset pushReg
		db 01010111b
				dw offset pushReg
	; PUSH: push segment reg
		db 00000110b
				dw offset pushSeg
		db 00001110b
				dw offset pushSeg
		db 00010110b
				dw offset pushSeg
		db 00011110b
				dw offset pushSeg
	; POP: pop registry/memory
		db 10001111b
				dw offset popRegMem
	; POP: pop register
		db 01011000b
				dw offset popReg
		db 01011001b
				dw offset popReg
		db 01011010b
				dw offset popReg
		db 01011011b
				dw offset popReg
		db 01011100b
				dw offset popReg
		db 01011101b
				dw offset popReg
		db 01011110b
				dw offset popReg
		db 01011111b
				dw offset popReg
	; POP: pop segment reg
		db 00000111b
				dw offset popSeg
		db 00001111b
				dw offset popSeg
		db 00010111b
				dw offset popSeg
		db 00011111b
				dw offset popSeg
	; INC: reg / mem
		db 11111111b
				dw offset incRegMem
		db 11111110b
				dw offset incRegMem
	; INC: reg
		db 01000000b
				dw offset incReg
		db 01000001b
				dw offset incReg
		db 01000010b
				dw offset incReg
		db 01000011b
				dw offset incReg
		db 01000100b
				dw offset incReg
		db 01000101b
				dw offset incReg
		db 01000110b
				dw offset incReg
		db 01000111b
				dw offset incReg
	; SUB: Reg / memory & register to either
		db 00101000b
				dw offset subRegMem
		db 00101001b
				dw offset subRegMem
		db 00101010b
				dw offset subRegMem
		db 00101011b
				dw offset subRegMem
	;XCHG: acc with reg
		db 10010000b
				dw offset xchange
		db 10010001b
				dw offset xchange
		db 10010010b
				dw offset xchange
		db 10010011b
				dw offset xchange
		db 10010100b
				dw offset xchange
		db 10010101b
				dw offset xchange
		db 10010110b
				dw offset xchange
		db 10010110b
				dw offset xchange
		db 10010111b
				dw offset xchange
	;IN: ax or al 
		db 11100100b
				dw offset inputFrom
		db 11100101b
				dw offset inputFrom
	;OUT:
		db 11100111b
				dw offset outputTo
		db 11100110b
				dw offset outputTo
	;ADD:
		db 00000000b
				dw offset addregMemWithreg
		db 00000001b
				dw offset addregMemWithreg
		db 00000010b
				dw offset addregMemWithreg
		db 00000011b
				dw offset addregMemWithreg
	;ADC:
		db 00010000b
				dw offset addwithCarry
		db 00010001b
				dw offset addwithCarry
		db 00010010b
				dw offset addwithCarry
		db 00010011b
				dw offset addwithCarry
	; SBB:
		db 00011000b
				dw offset addwithBorrow
		db 00011001b
				dw offset addwithBorrow
		db 00011010b
				dw offset addwithBorrow
		db 00011011b
				dw offset addwithBorrow
	;DEC reg:
		db 01001000b
				dw offset decrement
		db 01001001b
				dw offset decrement
		db 01001010b
				dw offset decrement
		db 01001011b
				dw offset decrement
		db 01001100b
				dw offset decrement
		db 01001101b
				dw offset decrement
		db 01001110b
				dw offset decrement
		db 01001111b
				dw offset decrement
	;CMP
		db 00111000b
				dw offset compare
		db 00111001b
				dw offset compare
		db 00111010b
				dw offset compare
		db 00111011b
				dw offset compare
	;JMP	; NEBAIGTAS
		db 11101001b
				dw offset jmpP
	;AND
		db 00100000b
				dw offset andRegMemReg
		db 00100001b
				dw offset andRegMemReg
		db 00100010b
				dw offset andRegMemReg
		db 00100011b
				dw offset andRegMemReg
	;TEST
		db 10101000b
				dw offset testImmToAcc
		db 10101001b
				dw offset testImmToAcc
	;OR
		db 00001000b
				dw offset orRegMemAndReg
		db 00001001b
				dw offset orRegMemAndReg
		db 00001010b
				dw offset orRegMemAndReg
		db 00001011b
				dw offset orRegMemAndReg
	;XOR
		db 00110000b
				dw offset xorRegMemAndReg
		db 00110001b
				dw offset xorRegMemAndReg
		db 00110010b
				dw offset xorRegMemAndReg
		db 00110011b
				dw offset xorRegMemAndReg
	;ONE BYTE INSTRUCTIONS
		db 00111111b
				dw offset aasPrint
		db 00101111b
				dw offset dasPrint
		db 10011000b
				dw offset cbwPrint
		db 10011001b
				dw offset cwdPrint
		db 11111000b
				dw offset clcP
		db 11110101b
				dw offset cmcP
		db 11111001b
				dw offset stcP
		db 11111100b
				dw offset cldP
		db 11111101b
				dw offset stdP
		db 11111010b
				dw offset cliP
		db 11111011b
				dw offset stiP
		db 11110100b
				dw offset hltP
		db 10011011b
				dw offset waitP
		db 11110000b
				dw offset lockP
		db 11010111b
				dw offset xlatP
		db 10011111b
				dw offset lahfP
		db 10011110b
				dw offset sahfP
		db 10011100b
				dw offset pushfP
		db 10011101b 
				dw offset popfP
		db 11001100b
				dw offset int3P
		db 11001110b
				dw offset intoP
		db 11001111b
				dw offset iretP
		db 11000011b
				dw offset retP
	;REP
		db 11110011b
				dw offset repeatInst
		db 11110010b
				dw offset repeatInst
	;MOVSB/W
		db 10100101b
				dw offset movswP
		db 10100100b
				dw offset movsbP
	;CMPSB/W
		db 10100111b
				dw offset cmpswP
		db 10100110b
				dw offset cmpsbP
	;SCASB/W
		db 10101111b
				dw offset scaswP
		db 10101110b
				dw offset scasbP
	;LODSB/W
		db 10101101b
				dw offset lodswP
		db 10101100b
				dw offset lodsbP
	;STOSW/B
		db 10101011b
				dw offset stoswP
		db 10101010b
				dw offset stosbP
	;LEA	
		db 10001101b
				dw offset loadEaToReg
	;LDS
		db 11000101b
				dw offset loadPointerToDS
	;LES
		db 11000100b
				dw offset loadPointerToES
	;AAM
		db 11010100b
				dw offset aamP
	;AAD
		db 11010101b
				dw offset aadP
		
	f_read_error:
		db 00
    	com_line_count:
        	db 00
   	com_line_arg:
        	db 100h dup (00)
    	file:
        	dw 0FFFh 
    	output_line:
       		db '' 
    	scaned:
       		db 00, 00, '$'
    	instruction_error:
		db 'No such instruction$'
    	klaidosPranesimas:
        	db 'Error reading argument$'
    	error_on_file_open:
        	db 'Error on file open$'
    	error_on_file_read:
        	db 'Error trying read file$' 
    	new_line:   
        	db 0Dh, 0Ah, '$' 
	low_adr:
		db 00
	high_adr:
		db 00
	byte_count:
		dw 0000
;-----------------------------------------------------
	w_int:
		db 00
	d_int:
		db 00
	mod_int:
		db 00
	reg_int:
		db 00
	rm_int:
		db 00
	v_int:
		db 00
	mov_str:
		db 'mov $'
	word_str:
		db 'word ptr$'
	byte_str:
		db 'byte ptr$'
	cl_str:
		db 'cl$'
	push_str:
		db 'push $'
	pop_str:
		db 'pop $'
	inc_str:
		db 'inc $'
	sub_str:
		db 'sub $'
	xchg_str:
		db 'xchg $'
	acc_str:
		db 'ax$'
	in_str:
		db 'in $'
	out_str:
		db 'out $'
	add_str:
		db 'add $'
	adc_str:
		db 'adc $'
	ssb_str:
		db 'sbb $'
	dec_str:
		db 'dec $'
	cmp_str:
		db 'cmp $'
	jmp_str:
		db 'jmp $'
	and_str:
		db 'and $'
	or_str:
		db 'or $'
	xor_str:
		db 'xor $'
	test_str:
		db 'test $'
	aas_str:
		db 'aas$'
	das_str:
		db 'das$'
	cbw_str:
		db 'cbw$'
	cwd_str:
		db 'cwd$'
	clc_str:
		db 'clc$'
	cmc_str:
		db 'cmc$'
	stc_str:
		db 'stc$'
	cld_str:
		db 'cld$'
	std_str:
		db 'std$'
	cli_str:
		db 'cli$'
	sti_str:
		db 'sti$'
	hlt_str:
		db 'hlt$'
	wait_str:
		db 'wait$'
	lock_str:
		db 'lock$'
	xlat_str:
		db 'xlat$'
	lahf_str:
		db 'lahf$'
	sahf_str:
		db 'sahf$'
	pushf_str:
		db 'pushf$'
	popf_str:
		db 'popf$'
	int_str:
		db 'int 3$'
	into_str:
		db 'into$'
	iret_str:
		db 'iret$'
	ret_str:
		db 'ret$'
	rep_str:
		db 'rep$'
	movsw_str:
		db 'movsw$'
	movsb_str:
		db 'movsb$'
	cmpsw_str:
		db 'cmpsw$'
	cmpsb_str:
		db 'cmpsb$'
	scasw_str:
		db 'scasw$'
	scasb_str:
		db 'scasb$'
	lodsw_str:
		db 'lodsw$'
	lodsb_str:
		db 'lodsb$'
	stosw_str:
		db 'stosw$'
	stosb_str:
		db 'stosb$'
	lea_str:
		db 'lea $'
	les_str:
		db 'les $'
	lds_str:
		db 'lds $'
	aam_str:
		db 'aam$'
	aad_str:
		db 'aad$'
	mul_str:
		db 'mul $'
	imul_str:
		db 'imul $'
	div_str:
		db 'div $'
	idiv_str:
		db 'idiv $'
	not_str:
		db 'not $'
	shl_str:
		db 'shl $'
	shr_str:
		db 'shr $'
	sar_str:
		db 'sar $'
	rol_str:
		db 'rol $'
	ror_str:
		db 'ror $'
	rcl_str:
		db 'rcl $'
	rcr_str:
		db 'rcr $'
	jz_str:
		db 'jz $'
	jl_str:
		db 'jl $'
	jle_str:
		db 'jle $'
	jb_str:
		db 'jb $'
	jbe_str:
		db 'jbe $'
	jpe_str:
		db 'jpe $'
	jo_str:
		db 'jo $'
	js_str:
		db 'js $'
	jnz_str:
		db 'jnz $'
	jge_str:
		db 'jge $'
	jg_str:
		db 'jg $'
	jae_str:
		db 'jae $'
	ja_str:
		db 'ja $'
	jpo_str:
		db 'jpo $'
	jno_str:
		db 'jno $'
	jns_str:
		db 'jns $'
;---------------------Registers-----------------------
	seg_reg:
		db 'es$'
		db 'cs$'
		db 'ss$'
		db 'ds$'

 	mod11_w0_reg:
		db 'al$'
		db 'cl$'
		db 'dl$'
		db 'bl$'
		db 'ah$'
		db 'ch$'
		db 'dh$'
		db 'bh$'
		 
	mod11_w1_reg:
		db 'ax$'
		db 'cx$'
		db 'dx$'
		db 'bx$'
		db 'sp$'
		db 'bp$'
		db 'si$'
		db 'di$'
		
	effectiveAddressCalculationRegisters:	
		db '[bx+si$' ;0
		db '[bx+di$' ;7
		db '[bp+si$' ;14
		db '[bp+di$' ;21
		db '[si	$' ;28
		db '[di      $' ;35
		db '[bp     $' ;42
		db '[bx     $' ;49

duomenys ends
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	find_shift macro bit_mask, var, shift_right
		; Finds w or d bit with shift
		push ax
		push si
		push dx
		push bx
		
		and al, 	bit_mask		        ; applying bit mask
		shr al, 	shift_right			; applyign shift
		mov byte ptr[var], al		; saving needed bit in chosen variable
		
		pop bx
		pop dx
		pop si
		pop ax					; return bits to ax
	endm
	
	find_noshift macro bit_mask, var
		; Finds w or d bit with no shift
		push ax
		push si
		push dx
		push bx
		
		and al, 	bit_mask			; applying bit mask
		mov byte ptr[var], al		; saving needed bit in chosen variable
		
		pop bx
		pop dx
		pop si
		pop ax
	endm
	
	print_sym macro char
		; Prints one symbol
		push ax
		push dx
		
		mov ah, 	2
		mov dl, 	char
		int 21h
		
		pop dx
		pop ax
		
	endm
	
	writeln macro string
		; prints full line
		push ax
		push dx
		
		mov ah, 	09
		mov dx, 	offset string
		int 21h
		
		mov ah, 	09
		mov dx, 	offset new_line
		int 21h
		
		pop dx 
		pop ax
		
	endm
	
	write macro string
		; prints new line without new lyne symbol '\n'
		push ax
		push dx
		
		mov ah, 	09
		mov dx, 	offset string
		int 21h
		
		pop dx
		pop ax
		
	endm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LOCALS @@

kodas segment para public 'CODE'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	addByte proc near
		push ax
		xor ax, ax
		mov al, 01
		add word ptr[byte_count], ax
		pop ax
		ret
	addByte endp
	
	subByte proc near
		push ax
		
		xor ax, ax
		mov al, 01
		sub word ptr[byte_count], ax
		mov byte ptr[low_adr], al
		mov al, ah
		
		pop ax
		ret
	subByte endp
	
	read_arg proc near
		; function reads next string in cmd line and searches for the file in directory
		; if file is not in the directory CF = 1
		push bx
		push di
		push si
		push ax

		xor bx, 	bx
		xor si, 	si
		xor di, 	di
		
		mov bl, 	es:byte ptr[80h]         
		mov byte ptr com_line_count, bl
		mov si, 	0081h  
		mov di, 	offset com_line_arg
		push cx
		mov cx, 	bx
		mov ah, 	00
		cmp cx, 	0000
		jne @@pagalVisus
		stc 
		jmp @@end

		@@pagalVisus:
		mov al, 	byte ptr es:[si]
		cmp al, 	' '
		je @@next
		cmp al, 	0Dh
		je @@next
		cmp al, 	0Ah
		je @@next
		mov byte ptr [di],	 al

		mov ah, 	01                 				; ah = 1 if there was something else than space
		inc di     
		jmp @@next_step
		@@next:
		cmp ah, 	01                  				; checks if there was any non space symbols
		je @@exit 
		@@next_step:
		inc si

		loop @@pagalVisus
		@@exit: 
		cmp ah, 	01                  				; checks if there was any non space symbols
		je @@attach_com
		stc                         					; if error
		jmp @@end 
		@@attach_com:
		mov byte ptr [di],		'.'
		mov byte ptr [di+1], 	'C'
		mov byte ptr [di+2], 	'O'
		mov byte ptr [di+3], 	'M'
		clc                         					; if no error
		@@end:
		pop cx
		pop ax
		pop si
		pop di 
		pop dx
		ret
	read_arg endp
	
	f_open proc near						; opens a file
	
		push ax
		push dx
		
		mov ah, 	3Dh
		mov al,	 	00h
		int 21h
		
		jc @@eof
		mov word ptr file, ax
		
		@@eof:
		pop dx
		pop ax
		ret
		
	f_open endp
	
	; FIXME: not accurate op address
	add_op_mem proc near
		push ax
		
		xor ax, 	ax
		mov ax, 	100d
		add ax, 	word ptr[byte_count]
		mov byte ptr[low_adr], al
		mov al, 	ah
		
		call bin_to_hex
		mov word ptr[si], ax
		write output_line
		mov al, 	byte ptr[low_adr]
		call bin_to_hex
		mov word ptr[si], ax
		write output_line
		print_sym ':'
		print_sym ' '
		pop ax
	
		ret
	add_op_mem endp
	
	f_read proc near						; 1. reads bytes from specified file
										; 2. calls function from table for specific op code
		push ax
		push dx							; buffer 
		push bx							; file descriptor
		push cx
		push si
			
		mov si, 	dx
		@@repeat:
		mov cx, 	01					
		mov ah, 	3Fh 
		int 21h
		jc @@exit_on_error_1
		cmp ax, 	00
		je @@exit_on_error_1

		mov al, 	byte ptr [si]   	   			; al <- getting element from buffer DS:DX, si - iterator (liet. ateina nuskaitytas elementas)
			call add_op_mem
			call addByte
			mov cx, 	00FFh
			mov bp, 	00h
			
			cmp al, 11110111b
				jne @@next_1
				push ax
				mov byte ptr[w_int], 1b
				call f_read_next
				find_shift 00111000b, reg_int, 3
				cmp byte ptr[reg_int], 100b
					jne @@n1
					call mulP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n1:
				cmp byte ptr[reg_int], 101b
					jne @@n2
					call imulP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n2:
				cmp byte ptr[reg_int], 110b
					jne @@n3
					call divP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n3:
				cmp byte ptr[reg_int], 111b
					jne @@n4
					call idivP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n4:
				
			jmp @@skip_1
			@@exit_on_error_1:
			jmp @@exit_on_error_2
			@@skip_1:
			
				cmp byte ptr[reg_int], 010b
					jne @@n5
					call notP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n5:
				dec si
				pop ax
				call subByte
			@@next_1:
			
			cmp al, 11110110b
				jne @@next_2
				push ax
				mov byte ptr[w_int], 0b
				call f_read_next
				find_shift 00111000b, reg_int, 3
				cmp byte ptr[reg_int], 100b
					jne @@n6
					call mulP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n6:
				cmp byte ptr[reg_int], 101b
					jne @@n7
					call imulP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n7:
				cmp byte ptr[reg_int], 110b
					jne @@n8
					call divP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n8:
				cmp byte ptr[reg_int], 111b
					jne @@n9
					call idivP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n9:
				cmp byte ptr[reg_int], 010b
					jne @@n10
					call notP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n10:
				dec si
				pop ax
				call subByte
			@@next_2:
			
			jmp @@skip_2
			@@exit_on_error_2:
			jmp @@exit_on_error_3
			@@skip_2:
			
			push ax
			and al, 11111100b
			cmp al, 11010000b
				jne @@next_3
				pop ax
				find_shift 00000010b, v_int, 1
				find_noshift 00000001b, w_int
				call f_read_next
				find_shift 00111000b, reg_int, 3
				cmp byte ptr[reg_int], 100b
					jne @@n11
					call shlP
					mov word ptr [si], ax
					jmp @@repeat
				@@n11:
				cmp byte ptr[reg_int], 101b
					jne @@n12
					call shrP
					mov word ptr [si], ax
					jmp @@repeat
				@@n12:
				cmp byte ptr[reg_int], 111b
					jne @@n13
					call sarP
					mov word ptr [si], ax
					jmp @@repeat
				@@n13:
				cmp byte ptr[reg_int], 000b
					jne @@n14
					call rolP
					mov word ptr [si], ax
					jmp @@repeat
				@@n14:
				
				jmp @@skip_3
				@@next_3:
				jmp @@next_4
				@@skip_3:
				
				cmp byte ptr[reg_int], 001b
					jne @@n15
					call rorP
					mov word ptr [si], ax
					jmp @@repeat
				@@n15:
				cmp byte ptr[reg_int], 010b
					jne @@n16
					call rclP
					mov word ptr [si], ax
					jmp @@repeat
				@@n16:
				cmp byte ptr[reg_int], 011b
					jne @@n17
					call rcrP
					mov word ptr [si], ax
					jmp @@repeat
				@@n17:
					dec si
					call subByte
			@@next_4:
			pop ax
											; FFFF - opcode + 1 - shift + 4 bytes ex.: a100 je 0
											; FFFF - FEFC + 1 - 104
			push ax
			cmp al, 00001111b
				jne @@next_5
				call f_read_next
				cmp al, 10000100b 			;jz
					jne @@n18
					write jz_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n18:
				cmp al, 10001100b			;jl
					jne @@n19
					write jl_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n19:
				cmp al, 10001110b			; jle
					jne @@n20
					write jle_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n20:
				cmp al, 10000010b			; jb
					jne @@n21
					write jb_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n21:
				
			jmp @@skip_4
			@@next_5:
			jmp @@next_6
			@@skip_4:
			
				cmp al, 10000110b			; jbe
					jne @@n22
					write jbe_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n22:
				cmp al, 10001010b 			; jpe
					jne @@n23
					write jpe_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n23:
				cmp al, 10000000b 			; jo
					jne @@n24
					write jo_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n24:
				cmp al, 10001000b 			; js
					jne @@n25
					write js_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n25:
				cmp al, 10000101b 			; jnz 
					jne @@n26
					write jnz_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n26:
				cmp al, 10001101b 			; jge 
					jne @@n27
					write jge_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n27:
				cmp al, 10001111b 			; jg 
					jne @@n28
					write jg_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n28:
				cmp al, 10000011b 			; jae
					jne @@n29
					write jae_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n29:
				
			jmp @@skip_5
			@@next_6:
			jmp @@next_7
			@@skip_5:
			
				cmp al, 10000111b 			; ja
					jne @@n30
					write ja_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n30:
				cmp al, 10001011b 			; jpo
					jne @@n31
					write jpo_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n31:
				cmp al, 10000001b 			; jno
					jne @@n32
					write jno_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n32:
				cmp al, 10001001b 			; jns
					jne @@n33
					write jns_str
					call jmpP
					pop ax
					mov word ptr [si], ax
					jmp @@repeat
				@@n33:
				dec si
				call subByte
			@@next_7:
			pop ax
			
			@@instruction_loop_1:				   
					cmp al, byte ptr [instructions_1 + bp] 	; checks if byte == op code
					je @@call_instructions_1
					inc bp
					inc bp
					inc bp
			loop @@instruction_loop_1
			
			writeln instruction_error
			jmp @@repeat
			
			@@call_instructions_1:
			call word ptr [instructions_1 + 1 + bp]
			mov word ptr [si], ax  
		jmp @@repeat
			
		@@exit_on_error_3:
		pop si
		pop cx
		pop bx
		pop dx
		pop ax
		ret
		
	f_read endp
	
	f_read_next proc near
		push bx
		call addByte
		
		; reads aditional byte and saves to AL
		mov cx,		01							; cx - byte count
		mov ah, 	3Fh								; read file using handle
		int 21h
		
		; error check 
		jc @@exit									; if cf == 1 => read error
		cmp ax, 	00								; if ax == 00 => eof
		je @@exit
			mov al, 	byte ptr[si]			  		; al <- symbol from DS:DX buffer
			mov byte ptr f_read_error, 	00000000b 	; if no error occurred f_read_error = 00000000
			
		@@exit:
		mov byte ptr f_read_error, 	11111111b  		; if error f_read_error = 11111111
		pop bx
		ret
	f_read_next endp
	
	regMemToFromReg proc near
		
		push ax
		push dx
		push bx
		push cx
		push si
		
		write mov_str
		find_noshift 00000001b, w_int					; find w bit
		find_shift 00000010b, d_int, 1					; find d bit
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b						; if d bit is 1 then to register
			jne @@d_is_0
			mov byte ptr[mod_int], 11b  				; mod <- 11
			find_shift 00111000b, reg_int, 3 			; find & print second register
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6			; find second mod
			find_noshift 00000111b, rm_int			; find rm
			call print_reg							; prints effective address or register
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6				; find mod
		find_noshift 00000111b, rm_int				; find rm
		call print_reg								; prints effective address or register
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b  					; mod = 11
		find_shift 00111000b, reg_int, 3 				; spausdinu antra registra
		call print_reg
			
		@@exit:
		write new_line
		pop si
		pop cx
		pop bx
		pop dx
		pop ax
		ret
		
	regMemToFromReg endp
	
	immediateToRegMem proc near
	
		write mov_str
		find_noshift 00000001b, w_int
		call f_read_next
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		cmp byte ptr[w_int], 1b
			jne @@w_is_0
			write word_str
			jmp @@next
		@@w_is_0:
		write byte_str
		@@next:
		call print_reg
		print_sym ','
		print_sym ' '
		call print_direct
		write new_line
		ret
	immediateToRegMem endp
	
	immediateToReg proc near
		; op - immediate to Register
		; mod = 11 (aprioiri by op code)
		; 1011|w|reg
		; w = 1 full byte
		; w = 0 half byte 4 bits
		
		find_shift 00001000b, w_int, 3				; find w bit
		find_noshift 00000111b, reg_int				; find register
		mov byte ptr[mod_int], 11b
		
		write mov_str
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[w_int], 1b			
			je @@w_is_1							; if ZF == 1 => w = 1 => jump
			call print_direct						; two byte effective address
			jmp @@exit
		@@w_is_1:
		call print_direct
		
		@@exit:
		write new_line
		ret
		
	immediateToReg endp
	
	memoryToAcc proc near
		
		find_noshift 00000001b, w_int
		mov byte ptr[rm_int], 	000b
		mov byte ptr[mod_int], 	11b
		write mov_str
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[w_int], 1b
		print_sym '['
		call print_direct
		print_sym ']'
		write new_line
		ret
	memoryToAcc endp
	
	accToMemory proc near
		
		write mov_str
		mov byte ptr[w_int], 1b
		print_sym '['
		call print_direct
		print_sym ']'
		print_sym ','
		print_sym ' '
		
		find_noshift 00000001b, w_int
		mov byte ptr[rm_int], 000b
		mov byte ptr[mod_int], 11b
		call print_reg
		write new_line
		ret
	accToMemory endp
		
	regMemToSeg proc near
		write mov_str
		call f_read_next
		find_shift 00011000b, reg_int, 3				; find segment register
		call print_seg
		print_sym ','
		print_sym ' '
		find_shift 11000000b, mod_int, 6 				; find mod
		find_noshift 00000111b, rm_int				; find rm
		mov byte ptr[w_int], 1b
		call print_reg
		write new_line
		ret
	regMemToSeg endp
	
	segToRegMem proc near
		write mov_str
		call f_read_next
		find_shift 11000000b, 	mod_int, 6
		find_noshift 00000111b, rm_int
		mov byte ptr[w_int], 	1b
		call print_reg
		print_sym ','
		print_sym ' '
		find_shift 00011000b, reg_int, 3				; find segment register
		call print_seg
		write new_line
		ret
	segToRegMem endp
	
	pushMemReg proc near
		write push_str
		call f_read_next
		find_shift 11000000b, 	mod_int, 6
		find_noshift 00000111b, rm_int
		mov byte ptr[w_int], 	1b
		cmp byte ptr[mod_int], 11b
			je @@next
			write word_str
		@@next:
		call print_reg
		write new_line
		ret
	pushMemReg endp
	
	pushReg proc near
		write push_str
		mov byte ptr[w_int], 	1b
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	pushReg endp
	
	pushSeg proc near
		write push_str
		find_shift 00011000b, reg_int, 3
		call print_seg
		write new_line
		ret
	pushSeg endp
	
	popRegMem proc near
		write pop_str
		call f_read_next
		find_shift 11000000b, 	mod_int, 6
		find_noshift 00000111b, rm_int
		mov byte ptr[w_int], 	1b
		cmp byte ptr[mod_int], 11b
			je @@next
			write word_str
		@@next:
		call print_reg
		write new_line
		ret
	popRegMem endp
	
	popReg proc near
		write pop_str
		mov byte ptr[w_int], 	1b
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	popReg endp
	
	popSeg proc near
		write pop_str
		find_shift 00011000b, reg_int, 3
		call print_seg
		write new_line
		ret
	popSeg endp
	
	incRegMem proc near
	
		write inc_str
		find_noshift 00000001b, w_int
		call f_read_next
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		cmp byte ptr[mod_int], 11b
			jne @@mod_not_11
			call print_reg
			jmp @@end
			
		@@mod_not_11:
		cmp byte ptr[w_int], 1b
			jne @@w_is_0
			write word_str
			call print_reg
			jmp @@end
			
		@@w_is_0:
		write byte_str
		call print_reg
		
		@@end:
		write new_line
		ret
		
	incRegMem endp
	
	incReg proc near
	
		write inc_str
		find_noshift 00000111b, reg_int
		mov byte ptr[mod_int], 	11b
		mov byte ptr[w_int], 	1b
		call print_reg
		write new_line
		ret
		
	incReg endp
	
	subRegMem proc near
	
		write sub_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		cmp byte ptr[d_int], 1b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b  				; mod = 11 (apriori by op code)
			find_shift 00111000b, reg_int, 3 			; print second register
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b  					; mod = 11 (apriori by op code)
		find_shift 00111000b, reg_int, 3 				; print second register
		call print_reg
			
		@@exit:
		write new_line
		ret
		
	subRegMem endp
	
	xchange proc near
		write xchg_str
		write acc_str
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		mov byte ptr[w_int], 1b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	xchange endp
	
	inputFrom proc near
		write in_str
		find_noshift 00000001b, w_int
		mov byte ptr[mod_int], 11b
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[w_int], 0b
		call print_direct
		write new_line
		ret
	inputFrom endp
	
	outputTo proc near
		write out_str
		push ax
		mov byte ptr[w_int], 0b
		call print_direct
		print_sym ','
		print_sym ' '
		pop ax
		find_noshift 00000001b, w_int
		mov byte ptr[mod_int], 11b
		call print_reg
		write new_line
		ret
	outputTo endp
	
	addregMemWithreg proc near
		write add_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b  				; mod = 11 (apriori by op code)		(liet. istumus 11 pasikeicia d_int)
			find_shift 00111000b, reg_int, 3 			; print second register
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
			
		@@exit:
		write new_line
		ret
	addregMemWithreg endp
	
	addwithCarry proc near
		write adc_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b
			find_shift 00111000b, reg_int, 3
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
			
		@@exit:
		write new_line
		ret
	addwithCarry endp
	
	addwithBorrow proc near
		write ssb_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b
			find_shift 00111000b, reg_int, 3
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
			
		@@exit:
		write new_line
		ret
	addwithBorrow endp
	
	decrement proc near
		write dec_str
		find_noshift 00000111b, reg_int
		mov byte ptr[mod_int], 	11b
		mov byte ptr[w_int], 	1b
		call print_reg
		write new_line
		ret
	decrement endp
	
	compare proc near
		write cmp_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b
			find_shift 00111000b, reg_int, 3
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
			
		@@exit:
		write new_line
		ret
	compare endp
	
	jumpUncon proc near
		write jmp_str
		ret
	jumpUncon endp
	
	andRegMemReg proc near
		write and_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b
			find_shift 00111000b, reg_int, 3
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
			
		@@exit:
		write new_line
		ret
	andRegMemReg endp
	
	orRegMemAndReg proc near
		write or_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b
			find_shift 00111000b, reg_int, 3
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
		
		@@exit:
		write new_line
		ret
	orRegMemAndReg endp
	
	xorRegMemAndReg proc near
		write xor_str
		find_noshift 00000001b, w_int
		find_shift 00000010b, d_int, 1
		
		call f_read_next
		
		cmp byte ptr[d_int], 01b
			jne @@d_is_0
			mov byte ptr[mod_int], 11b
			find_shift 00111000b, reg_int, 3
			call print_reg
			print_sym ','
			print_sym ' '
			find_shift 11000000b, mod_int, 6
			find_noshift 00000111b, rm_int
			call print_reg
			jmp @@exit
		@@d_is_0:
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
		
		@@exit:
		write new_line
		ret
	xorRegMemAndReg endp
	
	testImmToAcc proc near
		write test_str
		find_noshift 00000001b, w_int
		mov byte ptr[rm_int], 	000b
		mov byte ptr[mod_int], 	11b
		call print_reg
		print_sym ','
		print_sym ' '
		mov byte ptr[w_int], 1b
		call print_direct
		write new_line
		ret
	testImmToAcc endp
	
	loadEaToReg proc near
		write lea_str
		call f_read_next
		mov byte ptr[w_int], 1b
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
		print_sym ','
		print_sym ' '
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		
		cmp byte ptr[mod_int], 1b
			jne not_01
			mov byte ptr[w_int], 0b
			jmp exit
		not_01:
		mov byte ptr[w_int], 1b
		
		exit:
		call print_reg
		write new_line
		ret
	loadEaToReg endp
	
	loadPointerToDS proc near
		write lds_str
		call f_read_next
		mov byte ptr[w_int], 1b
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
		print_sym ','
		print_sym ' '
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		
		cmp byte ptr[mod_int], 1b
			jne n_01
			mov byte ptr[w_int], 0b
			jmp ex
		n_01:
		mov byte ptr[w_int], 1b
		
		ex:
		call print_reg
		write new_line
		ret
	loadPointerToDS endp
	
	loadPointerToES proc near
		write les_str
		call f_read_next
		mov byte ptr[w_int], 1b
		mov byte ptr[mod_int], 11b
		find_shift 00111000b, reg_int, 3
		call print_reg
		print_sym ','
		print_sym ' '
		find_shift 11000000b, mod_int, 6
		find_noshift 00000111b, rm_int
		
		cmp byte ptr[mod_int], 1b
			jne not_1
			mov byte ptr[w_int], 0b
			jmp ext
		not_1:
		mov byte ptr[w_int], 1b
		
		ext:
		call print_reg
		write new_line
		ret
	loadPointerToES endp
	
	notP proc near
		write not_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	notP endp
	
	mulP proc near
		write mul_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	mulP endp
	
	imulP proc near
		write imul_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	imulP endp
	
	divP proc near
		write div_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	divP endp
	
	idivP proc near
		write idiv_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		write new_line
		ret
	idivP endp
	
	shlP proc near
		write shl_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	shlP endp
	
	shrP proc near
		write shr_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	shrP endp
	
	sarP proc near
		write sar_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	sarP endp
	
	rolP proc near
		write rol_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	rolP endp
	
	rorP proc near
		write ror_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	rorP endp
	
	rclP proc near
		write rcl_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	rclP endp
	
	rcrP proc near
		write rcr_str
		mov byte ptr[mod_int], 11b
		find_noshift 00000111b, reg_int
		call print_reg
		print_sym ','
		print_sym ' '
		cmp byte ptr[v_int], 1
			jne @@v_is_0
			write cl_str
			jmp @@ex_1
		@@v_is_0:
			print_sym '1'
		@@ex_1:
		write new_line
		ret
	rcrP endp
	
	jmpP proc near
		
		push dx
		push ax
		
		cmp al, 11101001b
			jne @@n55
			write jmp_str
		@@n55:
		
		call f_read_next
		mov byte ptr[low_adr], al					; end
		call f_read_next
		mov byte ptr [high_adr], al					; begining
		mov ax, 0ffffh
		
		push bx
		mov bh, byte ptr[high_adr]
		mov bl, byte ptr[low_adr]
		sub ax, bx
		sub ax, 100h
		sub ax, word ptr[byte_count]
		not ax
		mov byte ptr[low_adr], al
		mov al, ah
		pop bx
		
		call bin_to_hex
		mov word ptr[si], ax
		write output_line
		mov al, byte ptr[low_adr]
		call bin_to_hex
		mov word ptr[si], ax
		write output_line
		
		pop ax
		pop dx
		
		write new_line
		ret
	jmpP endp
	
	aasPrint proc near
		writeln aas_str
		ret
	aasPrint endp
	
	dasPrint proc near
		writeln das_str
		ret
	dasPrint endp
	
	cbwPrint proc near
		writeln cbw_str
		ret
	cbwPrint endp
	
	cwdPrint proc near
		writeln cwd_str
		ret
	cwdPrint endp
	
	clcP proc near
		writeln clc_str
		ret
	clcP endp
	
	cmcP proc near
		writeln cmc_str
		ret
	cmcP endp
	
	stcP proc near
		writeln stc_str
		ret
	stcP endp
	
	cldP proc near
		writeln cld_str
		ret
	cldP endp
		
	stdP proc near
		writeln std_str
		ret
	stdP endp
	
	cliP proc near
		writeln cli_str
		ret
	cliP endp
	
	stiP proc near
		writeln sti_str
		ret
	stiP endp
	
	hltP proc near
		writeln hlt_str
		ret
	hltP endp
	
	waitP proc near
		writeln wait_str
		ret
	waitP endp
	
	lockP proc near
		writeln lock_str
		ret
	lockP endp
	
	xlatP proc near
		writeln xlat_str
		ret
	xlatP endp
	
	lahfP proc near
		writeln lahf_str
		ret
	lahfP endp
	
	sahfP proc near
		writeln sahf_str
		ret
	sahfP endp
	
	pushfP proc near
		writeln pushf_str
		ret
	pushfP endp
	
	popfP proc near
		writeln popf_str
		ret
	popfP endp
	
	int3P proc near
		writeln int_str
		ret
	int3P endp
	
	intoP proc near
		writeln into_str
		ret
	intoP endp
	
	iretP proc near
		writeln iret_str
		ret
	iretP endp
	
	retP proc near
		writeln ret_str
		ret
	retP endp
	
	repeatInst proc near
		writeln rep_str
		ret
	repeatInst endp
	
	movsbP proc near
		writeln movsb_str
		ret
	movsbP endp
	
	movswP proc near
		writeln movsw_str
		ret
	movswP endp
	
	cmpsbP proc near
		writeln cmpsb_str
		ret
	cmpsbP endp
	
	cmpswP proc near
		writeln cmpsw_str
		ret
	cmpswP endp
	
	scaswP proc near
		writeln scasw_str
		ret
	scaswP endp
	
	scasbP proc near
		writeln scasb_str
		ret
	scasbP endp
	
	lodswP proc near
		writeln lodsw_str
		ret
	lodswP endp
	
	lodsbP proc near
		writeln lodsb_str
		ret
	lodsbP endp
	
	stoswP proc near
		writeln stosw_str
		ret
	stoswP endp
	
	stosbP proc near
		writeln stosb_str
		ret
	stosbP endp
	
	aamP proc near
		call f_read_next
		cmp al, 00001010b
			jne @@error
			writeln aam_str
			jmp @@end
		@@error:
			writeln instruction_error
		@@end:
		ret
	aamP endp
	
	aadP proc near
		call f_read_next
		cmp al, 00001010b
			jne @@error
			writeln aad_str
			jmp @@end
		@@error:
			writeln instruction_error
		@@end:
		ret
	aadP endp
	
	print_seg proc near
		push ax
		push bx
		push si
		push dx
		
		mov al,		byte ptr[reg_int]
		mov bl, 	3
		mul bl
		mov si, 	ax
		lea dx, 	word ptr[seg_reg+si]
		mov ah, 	09
		int 21h
		
		pop dx
		pop si
		pop bx
		pop ax
		ret
	print_seg endp
	
	print_reg proc near
		push dx
		push bx
		push cx
		push si
			push ax
			
			cmp byte ptr[mod_int], 11b
				jne @@mod_not_11
				;/////////////////////////////// mod is 11: start
				cmp byte ptr[w_int], 1b
					jne w_is_0
					; printing full register
					push ax
					push si
					push dx
					push bx
					
					mov al,  	byte ptr[reg_int]
					mov bl, 	3
					mul bl        
					mov si, 	ax
					lea dx, 	[mod11_w1_reg + si]

					mov ah, 	09
					int 21h
					
					pop bx
					pop dx
					pop si
					pop ax
					jmp @@exit
				w_is_0:
					push ax
					push si
					push dx
					push bx
					
					mov al, 	byte ptr[reg_int]
					mov bl, 	3
					mul bl
					mov si, 	ax
					lea dx, 	[mod11_w0_reg + si]
					
					mov ah, 	09
					int 21h
					
					pop bx
					pop dx
					pop si
					pop ax
					jmp @@exit
				;/////////////////////////////// mod is 11: end
			@@mod_not_11:
			cmp byte ptr[mod_int], 00b
				jne @@mod_not_00
				;/////////////////////////////// mod is 00: start
				cmp byte ptr[rm_int], 110b
					jne @@rm_not_110
					print_sym '['
					call print_direct
					print_sym ']'
					jmp @@exit
				@@rm_not_110:
				mov al, 	byte ptr[rm_int]
				mov bl, 	7
				mul bl
				mov si, 	ax
				lea dx, 	[effectiveAddressCalculationRegisters+si]

				mov ah, 	09
				int 21h
				
				print_sym ']' 
				jmp @@exit
				;/////////////////////////////// mod is 00: end
			@@mod_not_00:
			cmp byte ptr[mod_int], 01b
				jne @@mod_not_01
				;/////////////////////////////// mod is 01: start
				push ax
				push si
				push dx
				push bx
				
				mov al, 	byte ptr[rm_int]
				mov bl, 	7
				mul bl
				mov si, 	ax
				lea dx, 	[effectiveAddressCalculationRegisters+si]

				mov ah, 	09
				int 21h
				print_sym '+'
				
				pop bx
				pop dx
				pop si
				pop ax
				
				mov byte ptr[w_int], 00b
				call print_direct
				print_sym ']'
				jmp @@exit
				;/////////////////////////////// mod is 01: end
			@@mod_not_01:
			;/////////////////////////////// else: mod is 10
			push ax
			push si
			push dx
			push bx
				
			mov al, 	byte ptr[rm_int]
			mov bl, 	7
			mul bl
			mov si, 	ax
			lea dx, 	[effectiveAddressCalculationRegisters+si]

			mov ah, 	09
			int 21h
			
			pop bx
			pop dx
			pop si
			pop ax
				
			print_sym '+'
			call print_direct
			print_sym ']'
			
			;/////////////////////////////// else: mod is 10
			@@exit:
			pop ax	
			pop si
		pop cx
		pop bx
		pop dx
		ret
	print_reg endp
	
	print_direct proc near
	
		push ax
		push dx
		
		cmp byte ptr[w_int], 00b
			jne @@print_dw
			call f_read_next							; prints when w = 0
			call bin_to_hex
			mov word ptr[si], ax
			write output_line
			jmp @@exit
		@@print_dw:

		call f_read_next								; prints when w = 1
		push ax
		call f_read_next
		call bin_to_hex
		mov word ptr[si], ax
		write output_line
		pop ax
		call bin_to_hex
		mov word ptr[si], ax
		write output_line
		
		@@exit:
		pop dx
		pop ax
		ret
		
	print_direct endp
	
	f_close proc near									; dx - file address
													; CF = 1 if error occurred
		push ax
		push dx
		
		mov ah, 	3Eh
		int 21h
		
		@@eof:
		pop dx
		pop ax
		ret
	
	f_close endp
	
	bin_to_hex proc near								; al - is binary
													; ax - is hexadecimal
		mov ah, 		al
		and  ah, 		0F0h
		shr   ah, 		1
		shr   ah, 		1
		shr   ah, 		1
		shr   ah, 		1
		and  al, 		0Fh

		cmp al, 		09
		jle @@plus_0
		sub al, 		10
		add al, 		'A'
		jmp @@AH
		@@plus_0:
		add al, 		'0'
		@@AH:
		     
		cmp ah, 		09
		jle @@darplius0
		sub ah, 		10
		add ah, 		'A'
		jmp @@end
		@@darplius0:
		add ah, 		'0'
			
		@@end:
		xchg ah,		al 
		ret
		
	bin_to_hex endp
	
	writeASCIIZ proc near								; prints line with null ending, dx - it's address
		
		push si
		push ax
		push dx

		mov  si, 		dx

		@@by_all:
		mov dl, 		byte ptr [si]  						; load symbol to dl from buffer
		cmp dl, 		00             						; check if line end
		je @@end

		mov ah, 		02
		int 21h
		inc si
		jmp @@by_all
		@@end:

		writeln new_line

		pop dx
		pop ax
		pop si
		ret
		
	writeASCIIZ endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	pradzia:
	
		mov ax,		seg duomenys                   			; loading data segment
		mov ds,		ax
		
		call read_arg
		jnc @@write_arg
		writeln klaidosPranesimas
		jmp @@exit
		
		@@write_arg:
		mov dx, 	offset com_line_arg
		call writeASCIIZ
		
		mov dx, 	offset com_line_arg						; opens file, and checks for errors
		call f_open
		jnc @@read_file
		writeln error_on_file_open
		jmp @@exit
		
		@@read_file:
		mov bx, 		word ptr file
		mov dx, 		offset scaned
		call f_read
		jnc @@file_close
		writeln error_on_file_read
		
		@@file_close:
		mov bx, 		word ptr file
		call f_close
		
		@@exit:
		mov ah,		4ch                            				; end function
		int 21h
kodas ends
	end pradzia



