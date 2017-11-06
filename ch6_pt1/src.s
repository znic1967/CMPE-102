; San Jose State University
; College of Engineering
; Computer Engineering Department
; CMPE102 - Assembly Language Programming
; 
; *************************************************************
; Chapter 6 Part 1 Homework Checker
; *************************************************************
; Reserve one word (16 bits) for each variable with ``.space`` directive.

; Assembly Code
; =============
.text
.global __reset
__reset:

; Initialize memory
mov #0x1004,W0
mov #0x1006,W1
mov #0x8301,W2
mov #0xF0A2,W3
mov #0x0004,W4
mov #0x0802,W14
mov #0x1004,W15
    
mov #0x382A,W5
mov W5, 0x1000
mov #0xFB80,W5
mov W5, 0x1002
mov #0x80FF, W5
mov W5, 0x1004
mov #0x7B03, W5
mov W5, 0x1006
mov #0x0001, W5
mov W5, 0x1008
mov #0xCE46, W5
mov W5, 0x100A
mov #0x8B17, W5
mov W5, 0x100C
    
;Problems
    mov W6,W7
    ;mov [--W1],W0
    ;mov W1, [W0 + W4]
    ;mov.b [--W1],W0
    ;mov.b W1, [W0+W4]
    ;mov W2, [W0++]
    ;mov W2, [++W0]
    ;mov.b W2, [W0++]
    ;mov.b W2, [--W1]
    ;mov [W1+W4],W2
    ;mov [++W1],W1
    ;mov [W1],[W0++]
    ;mov.b [W1+W4], W2
    ;mov.b [++W1], W1
    ;mov.b [W1],[W0++]
    ;mov.b W1, [W0+3]
    ;mov [W0 - 4], W1
    ;push W1
    ;pop W2
    ;pop W3
    ; push W0
    
    