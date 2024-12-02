# 3DOF-Manipulator-Joystick-Control-MATLAB
This repository contains a MATLAB-based project for designing and controlling a 3-axis manipulator named Alex. The manipulator's model was designed in SolidWorks and integrated with MATLAB using its URDF file. The system enables control through an Xbox controller or a slider interface, and the project also demonstrates the manipulator's forward kinematics.

## Features
1. Xbox Controller Integration:
Control the 3DOF manipulator using an Xbox controller.
Setup requires files and instructions provided in the PPT by Jonathan Hoy.
2. Forward Kinematics:
Visualize the manipulator's pose by entering joint angles.
3. Slider Control:
Use sliders to control each axis of the manipulator.

## Prerequisites
### MATLAB Requirements
MATLAB Versions: Tested on MATLAB R2022a, R2022b, and R2024a.
Toolbox: Robotics System Toolbox.
### Files and Resources
URDF Files:
  Alex-Main-URDF.csv
  Alex-Main-URDF.urdf
Xbox Controller Setup:
  Follow the instructions provided in the PPT by Jonathan Hoy. Ensure all required files mentioned in the PPT are available.
## Repository Contents
### Main Files
Xbox Controller Control (xbox.m)
Use an Xbox controller to move the manipulator's joints interactively.
Forward Kinematics (FK_Alex.m)
Enter joint angles to visualize the robot's pose in MATLAB.
Slider Control (Slider_control_Alex.m)
Adjust three sliders to control each axis of the manipulator.

## Getting Started
### Step 1: Set Up MATLAB
Install MATLAB with the Robotics System Toolbox.
Ensure compatibility with the MATLAB versions mentioned above.

### Step 2: Prepare the Manipulator
Import the URDF files (Alex-Main-URDF.csv and Alex-Main-URDF.urdf) into your MATLAB workspace.
Load the manipulator model using MATLAB's robotics tools.

### Step 3: Configure the Xbox Controller
Follow the steps outlined in Jonathan Hoy's PPT to set up the Xbox controller.
Ensure all required files are added to your MATLAB path.

### Step 4: Run the Program
To use the Xbox controller: RUN xbox.m
To visualize forward kinematics: RUN FK_Alex.m
To control with sliders: RUN Slider_control_Alex.m

## Credits
Manipulator Design: Alex model created in SolidWorks. 
URDF Integration: MATLAB Robotics System Toolbox.
Xbox Controller Setup: Based on Jonathan Hoy's guide.
