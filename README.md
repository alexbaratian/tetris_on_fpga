# UIUC-Themed Tetris on FPGA

Developed by Alex Baratian and Ieva Bagdonaviciute as part of a final project for the ECE385 course at UIUC.

### [Click here to watch the demo](https://github.com/user-attachments/assets/be7c0e70-5206-4351-ac89-c89c919bcb7b)

<img src="https://github.com/user-attachments/assets/c11bfd0a-dd21-405d-b30e-18d840c335e2" alt="tetris_image" width="300"/>

### Intro
This project implements a UIUC-themed Tetris game with the following features:
- 7 Tetromino Blocks: Each block has 4 possible rotations.
- Row Clearing: Rows are cleared once they are completely filled.
- Keyboard Input Control: The game utilizes an FPGA board with a keyboard interface for input.
- Collision detection and smooth movements.
- Scorekeeping: 10 points awarded for each cleared row, 1 point awarded for each row passed with acceleration.

### Controls:
- W: Rotate the Tetromino  
- A: Move left  
- D: Move right  
- S: Accelerate fall  
- Space: Start a new game/restart after losing  

Generally, our system uses an SoC with a MicroBlaze processor for taking keyboard inputs through our FPGA board and controlling the movements of Tetrominos. The game is displayed on a monitor connected through HDMI.

### Toplevel overview
<img src="https://github.com/user-attachments/assets/c9b4d4c3-39ca-45b5-b3d4-ce7d2852d866" alt="Toplevel Overview" width="600"/>

### References
Files vga_controller.sv and hew_driver.sv were provided to us by the ECE385 course staff.
