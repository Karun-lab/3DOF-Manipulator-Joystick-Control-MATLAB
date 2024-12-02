clear; clc;
alex = importrobot('Alex-Main-URDF.urdf');

% Create a uifigure
fig = uifigure('Name', 'Robot Control');
fig.Position(3:4) = [500, 300];

% Create sliders for each joint
slider1 = uislider(fig, 'Limits', [0, 180], 'Position', [50, 200, 400, 3]);
slider2 = uislider(fig, 'Limits', [-90, 30], 'Position', [50, 150, 400, 3]);
slider3 = uislider(fig, 'Limits', [35, 270], 'Position', [50, 100, 400, 3]);

% Create robot visualization

config = homeConfiguration(alex);
robotPlot = show(alex, config);
showdetails(alex);

% Callback function to update robot configuration
slider1.ValueChangedFcn = @(src, ~) updateRobot(src, slider2, slider3, alex);
slider2.ValueChangedFcn = @(src, ~) updateRobot(slider1, src, slider3, alex);
slider3.ValueChangedFcn = @(src, ~) updateRobot(slider1, slider2, src, alex);

function updateRobot(slider1, slider2, slider3, alex)
    j1 = slider1.Value;
    j2 = slider2.Value;
    j3 = slider3.Value;
    
    config = homeConfiguration(alex);
    config(1).JointPosition = deg2rad(j1);
    config(2).JointPosition = deg2rad(j2);
    config(3).JointPosition = deg2rad(j3);
    
    show(alex, config);
    axis([-0.5 0.5 -0.5 0.5 0 0.5]);
end



