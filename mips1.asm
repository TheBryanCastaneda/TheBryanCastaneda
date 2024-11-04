.data
prompt1:        .asciiz "Enter first integer: "
prompt2:        .asciiz "Enter second integer: "
output_msg:     .asciiz "You entered: "
and_msg:        .asciiz " and "
newline:        .asciiz "\n"

result_add:     .asciiz "Addition result: "
result_sub:     .asciiz "Subtraction result: "
result_mul:     .asciiz "Multiplication result: "
result_div_quo: .asciiz "Division quotient: "
result_div_rem: .asciiz "Division remainder: "

same_msg:       .asciiz "User inputs are the same\n"
diff_msg:       .asciiz "User inputs are different\n"

.text
.globl main
main:

    # Task 1: Get user input and output them back

    # Print prompt1
    la $a0, prompt1      # Load address of prompt1 into $a0
    li $v0, 4            # syscall code for print_string
    syscall

    # Read first integer
    li $v0, 5            # syscall code for read_int
    syscall
    move $s0, $v0        # Store input in $s0

    # Print prompt2
    la $a0, prompt2
    li $v0, 4
    syscall

    # Read second integer
    li $v0, 5
    syscall
    move $s1, $v0        # Store input in $s1

    # Output the user inputs back to the user
    # Print "You entered: "
    la $a0, output_msg
    li $v0, 4
    syscall

    # Print $s0
    move $a0, $s0
    li $v0, 1            # syscall code for print_int
    syscall

    # Print " and "
    la $a0, and_msg
    li $v0, 4
    syscall

    # Print $s1
    move $a0, $s1
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # Task 2: Arithmetic operations

    # Perform addition
    add $t0, $s0, $s1

    # Perform subtraction
    sub $t1, $s0, $s1

    # Perform multiplication
    mul $t2, $s0, $s1

    # Perform division
    div $s0, $s1
    mflo $t3        # Quotient in $t3
    mfhi $t4        # Remainder in $t4

    # Output addition result
    la $a0, result_add
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # Output subtraction result
    la $a0, result_sub
    li $v0, 4
    syscall

    move $a0, $t1
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # Output multiplication result
    la $a0, result_mul
    li $v0, 4
    syscall

    move $a0, $t2
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # Output division quotient
    la $a0, result_div_quo
    li $v0, 4
    syscall

    move $a0, $t3
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # Output division remainder
    la $a0, result_div_rem
    li $v0, 4
    syscall

    move $a0, $t4
    li $v0, 1
    syscall

    # Print newline
    la $a0, newline
    li $v0, 4
    syscall

    # Task 3: Conditions

    beq $s0, $s1, inputs_same
    j inputs_diff

inputs_same:
    la $a0, same_msg
    li $v0, 4
    syscall
    j end_condition

inputs_diff:
    la $a0, diff_msg
    li $v0, 4
    syscall

end_condition:

    # Exit program
    li $v0, 10         # syscall code for exit
    syscall
