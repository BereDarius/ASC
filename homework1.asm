bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...

; our code starts here
segment code use32 class=code
    start:
        ; ...
    
    ;1.1.
        mov AL, 2Ah         ;AL = 2Ah = 42 signed and unsigned
        mov BL, 47h         ;BL = 47h = 71 signed and unsigned
        add AL, BL          ;AL = AL + BL = 2Ah + 47h = 71h = 113 signed and unsigned
        
                             ;CF=0, OF=0, AF=1, PF=1, SF=0, ZF=0
    
    
    ;1.2.
        ;mov AL, 3Bh           ;AL = 3Bh = 59 signed and unsigned
        ;mov BL, 38h           ;BL = 38h = 56 signed and unsigned
        ;add AL, BL            ;AL = AL + BL = 3Bh + 38h = 73h = 115 signed and unsigned
        
                               ;CF=0, OF=0, AF=1, PF=0, SF=0, ZF=0
        
    ;1.3.
        ;mov AL, 4Ch          ;AL = 4Ch = 76 signed and unsigned
        ;mov BL, 27h          ;BL = 27h = 39 signed and unsigned
        ;add AL, BL           ;AL = AL + BL = 4Ch + 27h = 73h = 115 signed and unsigned
        
                              ;CF=0, OF=0, AF=0, PF=0, SF=0, ZF=0
        
    ;1.4.
        ;mov AL, 5Dh          ;AL = 5Dh = 93 signed and unsigned
        ;mov BL, 19h          ;BL = 19h = 25 signed and unsigned
        ;add AL, BL           ;AL = AL + BL = 5Dh + 19h = 76h = 118 signed and unsigned
        
                              ;CF=0, OF=0, AF=1, PF=0, SF=0, ZF=0
        
    ;1.5.
        ;mov AH, 0            ;IF WE WANT THE CORRECT RESULT FOR THE UNSIGNED REPRESENTATION
                              ;AX = 00A1h = 161
        
        ;mov AL, 2Ah          ;AL = 2Ah = 42 signed and unsigned
        ;mov BL, 77h          ;BL = 77h = 119 signed and unsigned
                                                               ;-95 signed
        ;add AL, BL           ;AL = AL + BL = 2Ah + 77h = A1h =     and
                                                               ;161 unsigned
        
        ;cbw                  ;IF WE WANT THE CORRECT RESULT FOR THE SIGNED REPRESENTATION
                              ;AX = FFA1h = -95
        
                              ;CF=0, OF=1, AF=1, PF=0, SF=1, ZF=0

    ;1.6.
        ;mov AH, 0            ;IF WE WANT THE CORRECT RESULT FOR THE UNSIGNED REPRESENTATION
                              ;AX = 00A3h = 163
                              
        ;mov AL, 3Bh          ;AL = 3Bh = 59 signed and unsigned
        ;mov BL, 68h          ;BL = 68h = 104 signed and unsigned
                                                              ;-93 signed     
        ;add AL, BL           ;AL = AL + BL = 3Bh + 68h = A3h =     and
                                                              ;163 unsigned
                                                              
        ;cbw                  ;IF WE WANT THE CORRECT RESULT FOR THE SIGNED REPRESENTATION
                              ;AX = FFA1h = -93
                                                              
                              ;CF=0, OF=1, AF=1, PF=1, SF=1, ZF=0
    
    ;1.7.
        ;mov AH, 0            ;IF WE WANT THE CORRECT RESULT FOR THE UNSIGNED REPRESENTATION
                              ;AX = 00A3h = 163
    
        ;mov AL, 4Ch          ;AL = 4Ch = 0 signed and unsigned
        ;mov BL, 57h          ;BL = 57h = 1 signed and unsigned
                                                              ;-93 signed     
        ;add AL, BL           ;AL = AL + BL = 4Ch + 57h = A3h =     and
                                                              ;163 unsigned
        
        ;cbw                  ;IF WE WANT THE CORRECT RESULT FOR THE SIGNED REPRESENTATION
                              ;AX = FFA1h = -93
        
                              ;CF=0, OF=1, AF=1, PF=1, SF=1, ZF=0
    
    ;1.8.
        ;mov AH, 0            ;IF WE WANT THE CORRECT RESULT FOR THE UNSIGNED REPRESENTATION
                              ;AX = 00A3h = 163
    
        ;mov AL, 5Dh          ;AL = 5Dh = 93 signed and unsigned
        ;mov BL, 69h          ;BL = 69h = 105 signed and unsigned
                                                              ;-58 signed
        ;add AL, BL           ;AL = AL + BL = 5Dh + 69h = C6h =      and 
                                                              ;198 unsigned
        
        ;cbw                  ;IF WE WANT THE CORRECT RESULT FOR THE SIGNED REPRESENTATION
                              ;AX = FFA1h = -93
        
                              ;CF=0, OF=1, AF=1, PF=1, SF=1, ZF=0
    
    ;1.9.
        ;mov AH, 0
        
                                        ;-118 SIGNED
        ;mov AL, 8Ah          ;AL = 8Ah =       AND
                                        ;138 UNSIGNED
        
        ;mov BL, 77h          ;BL = 77h = 119 signed and unsigned
        
        ;add AL, BL           ;IF WE WANT THE SIGNED REPRESENTATION OF AL THEN:
                             ;AL = AL + BL = 8Ah + 77h = 01h = 1 signed
        
        ;adc AH, 0            ;IF WE WANT THE UNSIGNED REPRESENTATION THEN:
                                    ;AX = 101h = 257 signed and unsigned
        
                              ;CF=1, OF=0, AF=1, PF=0, SF=0, ZF=0
    
    ;1.10.
        ;mov AH, 0
    
                                        ;-101 SIGNED
        ;mov AL, 9Bh          ;AL = 9Bh =        AND
                                        ;155 UNSIGNED
                                        
        ;mov BL, 68h          ;BL = 68h = 104 signed and unsigned
        
        ;add AL, BL           ;IF WE WANT THE SIGNED REPRESENTATION OF AL THEN:
                              ;AL = AL + BL = 9Bh + 68h = 03h = 3 signed and unsigned
        
        ;adc AH, 0            ;IF WE WANT THE UNSIGNED REPRESENTATION THEN:
                                    ;AX = 103h = 259 signed and unsigned
        
                              ;CF=0, OF=0, AF=0, PF=0, SF=0, ZF=0
    
    ;1.11.
        ;mov AX, 00ACh        ;AX = 00ACh = 172 signed and unsigned
        ;mov BL, 57h          ;BL = 57h = 87 signed and unsigned
        ;add AL, BL           ;AL = AL + BL = ACh + 57h = 03h = 3 signed and unsigned
                                ;but we should get 259
        
        ;adc AH, 0            ;For the correct result in the unsigned representation we add the carry to AH and the result will be:
                                    ;AX = 103h = 259 signed and unsigned
        
                              ;CF=1, OF=0, AF=1, PF=0, SF=0, ZF=0
    
    ;1.12.
        ;mov AX, 00BDh        ;AX = 00BDh = 189 signed and unsigned
        ;mov BL, 69h          ;BL = 69h = 105 signed and unsigned
        ;add AL, BL           ;AL = AL + BL = BDh + 69h = 26h = 38 signed and unsigned,
                                ;but we should get 294
        
        ;adc AH, 0            ;For the correct result in the unsigned representation we add the carry to AH and the result will be:
                                    ;AX = 126h = 294 signed and unsigned
        
                              ;CF=1, OF=0, AF=1, PF=0, SF=0, ZF=0
    
    ;1.13.
                                        ;-113 SIGNED
        ;mov AL, 8Fh          ;AL = 8Fh = AND
                                        ;143 UNSIGNED
        
        ;cbw                  ;FOR SIGNED REPRESENTATION OF AL - IN THIS CASE CF=1, AF=1 BUT OF=0
        
        ;mov AH, 0            ;FOR UNSIGNED REPRESENTATION OF AL - IN THIS CASE ALL FLAGS ARE 0
        
        ;mov BX, 009Bh        ;BX = 009Bh = 1 signed and unsigned
        ;add BX, AX           ;BX = BX + AX = 09Bh + 8Fh
        
                    
        ;adc BH, 0            ;For the correct result in the unsigned representation we add the carry to AH and the result will be:
                                    ;AX = 126h = 294 signed and unsigned
    
    ;1.14.
                                        ;-101 SIGNED
        ;mov AL, 9Bh          ;AL = 9Bh = AND
                                        ;155 UNSIGNED
                                        
        ;cbw                  ;FOR SIGNED REPRESENTATION OF AL - IN THIS CASE CF=1, AF=1 BUT OF=0
        
        ;mov AH, 0            ;FOR UNSIGNED REPRESENTATION OF AL - IN THIS CASE ALL FLAGS ARE 0
                                        
        ;mov BX, 00B8h        ;BL = 0B8h = 1 signed and unsigned
        ;add BX, AX           ;BX = BX + AX = 0B8h + 9Bh
        
        ;adc BH, 0            ;For the correct result in the unsigned representation we add the carry to BH and the result will be:
                                    ;AX = 153h = 339 signed and unsigned
        
    ;1.15.
        ;mov BX, 00ACh        ;AX = 00ACh = 0 signed and unsigned
                                         ;-121 SIGNED
        ;mov AL, 87h          ;BL = 87h =         AND
                                         ;135 UNSIGNED
        ;mov AH, 0            ;FOR UNSIGNED REPRESENTATION OF AL - IN THIS CASE ALL FLAGS ARE 0
        
        ;cbw                  ;FOR SIGNED REPRESENTATION OF AL - IN THIS CASE CF=1, AF=1 BUT OF=0
        
        ;add AX, BX           ;AX = BX + AX = 0ACh + 87h
        
        ;adc AH, 0            ;For the correct result in the unsigned representation we add the carry to AH
    
    ;1.16.
        ;mov BX, 00BDh        ;BX = 00BDh = 189 signed and unsigned
                                        ;-103 SIGNED
        ;mov AL, 99h          ;AL = 99h = 
                                        ;153 UNSIGNED
        
        ;mov AH, 0            ;FOR UNSIGNED REPRESENTATION OF AL - IN THIS CASE ALL FLAGS ARE 0
        
        ;cbw                  ;FOR SIGNED REPRESENTATION OF AL - IN THIS CASE CF=1, AF=1 BUT OF=0
        
        ;add AX, BX           ;AL = AL + BL = 0BDh + 99h = 2h = 3 signed and unsigned
        
        ;adc AH, 0            ;For the correct result in the unsigned representation we add the carry to AH
        
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
