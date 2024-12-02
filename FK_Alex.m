% Program: FK_Alex.m
% Description: Control the 3DOF manipulator 'Alex' using an Xbox controller.
% Author: Karun Ashok Kumar
% GitHub: https://github.com/Karun-Lab/3DOF-Manipulator-Joystick-Control-MATLAB
% Date: June 2023
%
% Usage:
% - Ensure that the Robotics System Toolbox is installed.

%show(alex)
%interactiveGUI = interactiveRigidBodyTree(alex)

clear;
clc;

alex = importrobot('Alex-Main-URDF.urdf');
config = homeConfiguration(alex);

figure;
robotPlot = show(alex, config);
showdetails(alex);


    j1 = input('Joint angle 1: ');
    j2 = input('Joint angle 2: ');
    j3 = input('Joint angle 3: ');
    
    config(1).JointPosition = j1 * 0.0174533;
    config(2).JointPosition = j2 * 0.001;
    config(3).JointPosition = j3 * 0.0174533;
    
    disp(robotPlot);
    
    axis([-0.5 0.5 -0.5 0.5 0 0.5]);

hold on
