// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(RESTART)
@SCREEN
D=A
@PIXEL
M=D	//put the screen address in the current pixel

(LOOP)
@KBD
D=M
@WHITE
D;JEQ	//jump to make the  screen white
@BLACK
D;JGT	//jump if any key on the keyboard is pressed

(WHITE)
@1
M=0	//what to the fill the screen with
@NEXT
0;JMP

(BLACK)
@1
M=-1	//16-bit screen with (-1=1111111111111111)
@NEXT
0;JMP

(NEXT)
@1
D=M

@PIXEL	//check what to fill the screen with
A=M	
M=D	//set pixel to pixel+1

@PIXEL
D=M+1
M=D

@KBD
D=A-D	//KBD-SCREEN=A

@LOOP
D;JGT
	
@RESTART
0;JMP