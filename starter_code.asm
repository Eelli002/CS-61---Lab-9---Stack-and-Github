.orig x3000
;this stack lab computes the polish notation of a set of calls
LD R6, Int_Stack
;push_val(4) pushes the value 4 onto the stack [4]
AND R1, R1, x0
ADD R1, R1, #4
LD R5, push_val_ptr
JSRR    R5

;push_val(3) pushes the value 3 onto the stack [4,3]
AND R1, R1, x0
ADD R1, R1, #3
LD R5, push_val_ptr
JSRR    R5


;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R1, R1, x0
ADD R1, R1, #2
LD R5, push_val_ptr
JSRR    R5



;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R5, add_val_ptr
JSRR    R5

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
JSRR R5

;move the top value of the stack into r4
LDR R4, R6, 0


HALT
Int_Stack   .FILL   x4200
push_val_ptr    .FILL   x3400
add_val_prt     .FILL x3800

.end

;---------------------------------------------------------------------------------
; push_val() - Pushes value passed in to the top of stack
;
; parameter: R1 - Value to be added to top of stack
;
; returns: This function does not return a value
;---------------------------------------------------------------------------------
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack
    STR R1, R6, #0
    ADD R6, R6, x1
RET

.end


;---------------------------------------------------------------------------------
; add_val() - Pops 2 top elements off of the stack, adds them together, and pushes them back on
;
; parameter: none
;
; returns: This function does not return a value
;---------------------------------------------------------------------------------
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack
    AND R3, R3, x0

    LDR R4, R6
    STR R3, R6, #0
    ADD R6, R6, x-1

    LDR R5, R6
    ADD R4, R4, R5
    STR R4, R6, #0

    RET

.end



.orig x4200 ;;data you might need

.end


