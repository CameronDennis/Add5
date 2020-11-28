;Cameron Dennis, 03/20/2019
;Program adds up to 5 numbers, does not take in other characters except for 'enter',
;which causes it to print the sum of the entered numbers immediately and then restart,
;or 'q', which prints a message and ends the program.

        .ORIG x3000

START   LD R0, Z         ; Resetting Registers
        LD R1, Z
        LD R2, Z
        LD R3, Z
        LD R3, Z
        LD R4, Z
        LD R0, NL		; Load New Line
		OUT			    ; Output New Line
        LEA R0, SFASK   ; Loads first ask statement
        PUTS            ; Prints first ask statement
        BRnzp INP       ; Jumps to waiting for input

GASK    LD R0, NL		; Load New Line
		OUT			    ; Output New Line
        LEA R0, SGASK   ; Loads general ask statement
        PUTS            ; Prints general ask statement
        BRnzp INP       ; Jumps to waiting for input

INP     GETC            ; User Input
        OUT             ; Prints User Input
        ADD R1, R0, #0	; R0 into R1
        NOT R2, R1
        ADD R2, R2, #1
        LD R5, Q        ; Checks for 'q'
        ADD R2, R2, R5
        BRz QQQ

        NOT R2, R1      ; Checks for 'enter'
        ADD R2, R2 #1
        LD R5, ENT
        ADD R2, R2, R5
        BRz ENTL

        ADD R2, R1, #0  ; Sets orignal input into R2
        LD R5, Z
        LD R6, CA
        ADD R5, R5, R6
        NOT R5, R5
        ADD R5, R5, #1  ; Sets R5 to -57
        ADD R2, R5, R2  ;
        BRp INP

        ADD R2, R1, #0  ; Sets orignal input into R2
        LD R5, Z
        LD R6, CB
        ADD R5, R5, R6
        NOT R5, R5
        ADD R5, R5, #1  ; Sets R5 to -48
        ADD R2, R5, R2  ;
        BRn INP

        LD R5, AH
        ADD R1, R1, R5
        ADD R3, R3, R1  ; Add to sum
        ADD R4, R4, #1  ; Increment Counter
        LD R5, Z
        ADD R5, R5, #4
        NOT R5, R5
        ADD R5, R4, R5
        BRnp GASK

SUMM    LD R0, NL		; Load New Line
		OUT			    ; Output New Line

ENTL    LEA R0, SEND
        PUTS
        LD R6, NN
        ADD R6, R6, R3
        BRp DOUB

        LD R6, CB
        ADD R0, R3, R6  ; Prints ones place
        OUT
        LD R0, NL		; Load New Line
        OUT			    ; Output New Line
        BRnzp START

DOUB    LD R6, TEN      ; Checks if number is 10-19
        ADD R6, R6, R3
        LD R5, NN
        ADD R5, R6, R5
        BRp DOUBA
        LD R0, CB
        ADD R0, R0, #1  ; Prints tens place
        OUT
        LD R0, CB
        ADD R0, R0, R6  ; Prints ones place
        OUT
        LD R0, NL		; Load New Line
        OUT			    ; Output New Line
        BRnzp START


DOUBA   LD R6, TWE      ; Checks if number is 20-29
        ADD R6, R6, R3
        LD R5, NN
        ADD R5, R6, R5
        BRp DOUBB
        LD R0, CB
        ADD R0, R0, #2  ; Prints tens place
        OUT
        LD R0, CB
        ADD R0, R0, R6  ; Prints ones place
        OUT
        LD R0, NL		; Load New Line
        OUT			    ; Output New Line
        BRnzp START

DOUBB   LD R6, THI      ; Checks if number is 30-39
        ADD R6, R6, R3
        LD R5, NN
        ADD R5, R6, R5
        BRp DOUBC
        LD R0, CB
        ADD R0, R0, #3  ; Prints tens place
        OUT
        LD R0, CB
        ADD R0, R0, R6  ; Prints ones place
        OUT
        LD R0, NL		; Load New Line
        OUT			    ; Output New Line
        BRnzp START

DOUBC   LD R6, FOR      ; Checks if number is 40-45
        ADD R6, R6, R3
        LD R5, NN
        ADD R5, R6, R5
        LD R0, CB
        ADD R0, R0, #4  ; Prints tens place
        OUT
        LD R0, CB
        ADD R0, R0, R6  ; Prints ones place
        OUT
        LD R0, NL		; Load New Line
        OUT			    ; Output New Line
        BRnzp START

QQQ     LD R0, NL		; Load New Line
        OUT			    ; Output New Line
        LEA R0, SQUIT   ;
        PUTS            ;
        HALT            ;


SFASK    .STRINGZ "Enter Start Number (0-9): "
SGASK    .STRINGZ "Enter Next Number (0-9): "
SQUIT    .STRINGZ "Thank you for playing!"
SEND     .STRINGZ "The sum of the numbers is: "
SENT     .STRINGZ "Enter"
NL       .FILL x000A
Z        .FILL x0000
ENT      .FILL x0A
Q        .FILL x0071
CA       .FILL x0039
CB       .FILL x0030
AH       .FILL xFFD0
NN       .FILL xFFF7
TEN      .FILL #-10
NIN      .FILL #9
TWE      .FILL #-20
THI      .FILL #-30
FOR      .FILL #-40
FIF      .FILL #-50
