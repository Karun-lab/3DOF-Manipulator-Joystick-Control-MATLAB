% Program: xbox.m
% Description: Control the 3DOF manipulator 'Alex' using an Xbox controller.
% Author: Karun Ashok Kumar
% GitHub: https://github.com/Karun-Lab/3DOF-Manipulator-Joystick-Control-MATLAB
% Date: June 2023
%
% Usage:
% - Ensure that the Robotics System Toolbox is installed.
% - Set up the Xbox controller as per the instructions provided in the repository.
%
clear; clc;
alex = importrobot('Alex-Main-URDF.urdf');
config = homeConfiguration(alex);

controllerLibrary = NET.addAssembly([pwd '\SharpDX.XInput.dll']);
myController = SharpDX.XInput.Controller(SharpDX.XInput.UserIndex.One);
VibrationLevel = SharpDX.XInput.Vibration;

J1 = zeros(100,1);
J2 = zeros(100,1);
J3 = zeros(100,1);
Time = zeros(100,1);
i=0;

while 1
    i=i+1;
    State = myController.GetState();
    ButtonStates = ButtonStateParser(State.Gamepad.Buttons); % Put this into a structure
%     disp(State.Gamepad);
%     disp(ButtonStates);
%     VibrationLevel.LeftMotorSpeed = double(State.Gamepad.LeftTrigger) * 255;
%     VibrationLevel.RightMotorSpeed = double(State.Gamepad.RightTrigger) * 255;

    myController.SetVibration(VibrationLevel); % If your controller supports vibration
   
    %Reading data from Joysticks
    valuex = double(State.Gamepad.LeftThumbX);  
    valuey = double(State.Gamepad.LeftThumbY);
    valuez = double(State.Gamepad.RightThumbY);
    %Input from Xbox on all joys
    input_min = -32000;
    input_max = 32000;
    %Joint 1 limints
    output_min = 0;
    output_max = 180;
    %Joint 2 limints
    output_miny = -90;
    output_maxy = 30;
    %Joint 3 limints
    output_minz = 35;
    output_maxz = 270;
    %Mapping values
    mapped_valuex = (valuex - input_min) * (output_max - output_min) / (input_max - input_min) + output_min;
    mapped_valuey = (valuey - input_min) * (output_maxy - output_miny) / (input_max - input_min) + output_miny;
    mapped_valuez = (valuez - input_min) * (output_maxz - output_minz) / (input_max - input_min) + output_minz;
    %disp([mapped_valuex mapped_valuey mapped_valuez] )

    % Update the robot configuration
    config(1).JointPosition = mapped_valuex * 0.0174533;
    config(2).JointPosition = mapped_valuey * 0.0174533;
    config(3).JointPosition = mapped_valuez * 0.0174533;

    J1(i)=double(State.Gamepad.LeftThumbX);
    J2(i)=double(State.Gamepad.LeftThumbY);
    J3(i)=double(State.Gamepad.RightThumbY);
    Time(i) = i;
    
    % Show the updated robot configuration
    show(alex, config);title('3DOF Manipulator');
    axis([-0.5 0.5 -0.5 0.5 0 0.8]);
    drawnow;

%     subplot(3,1,1);
%     plot(Time, J1, 'r');title('Joint 1');
%     subplot(3,1,2);
%     plot(Time, J2, 'b');title('Joint 2');
%     subplot(3,1,3);
%     plot(Time, J3, 'g');title('Joint 3');

    % Delay for a short interval to control the update rate
    

end



