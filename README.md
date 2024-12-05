# UIUC-Themed Tetris on Fpga
Developed by Alex Baratian and Ieva Bagdonaviciute as part of a final project for the ECE385 course at UIUC.

### Demo
https://github.com/user-attachments/assets/be7c0e70-5206-4351-ac89-c89c919bcb7b

<img src="https://github.com/user-attachments/assets/be7c0e70-5206-4351-ac89-c89c919bcb7b.mp4" width="200">

### Intro
This project is a classical Tetris game that uses 7 Tetromino blocks each of which have 4 possible rotations. The rows are cleared once all the blocks are filled in the block. In general, we have used an SoC that utilizes a MicroBlaze processor for taking keyboard inputs through our FPGA board and controlling the rotations of the Tetrominos. The defined controls are: W: Rotate the Tetromino A: Move left D: Move right S: Accelerate fall Space: Start a new game or restart after losing. 

### Toplevel overview
![image](https://github.com/user-attachments/assets/c9b4d4c3-39ca-45b5-b3d4-ce7d2852d866)
