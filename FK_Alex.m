
clear;
alex= importrobot('Alex-Main-URDF.urdf');
% Define link offsets
d1=124.41;    d2=-15.64;  d3=17.75;
% Define link length
a1=0;  a2=0;   a3=176.95;
% Define link twist
al1=-90;    al2=180;  al3=0;

%Input the angles for the motors
J=input("Enter Joint angles: ");
q1=J(1,1);
q2=J(1,2);
q3=J(1,3);


%Transformation for each joint angles
T0_1 = [cosd(q1),  -sind(q1)*cosd(al1),      sind(q1)*sind(al1),     a1*(cosd(q1))
        sind(q1),   cosd(q1)*cosd(al1),     -cosd(q1)*sind(al1),     a1*(sind(q1))
         0,                  sind(al1),               cosd(al1),     d1
         0,                          0,                       0,     1];

T1_2 = [cosd(q2),  -sind(q2)*cosd(al2),      sind(q2)*sind(al2),     a2*(cosd(q2))
        sind(q2),   cosd(q2)*cosd(al2),     -cosd(q2)*sind(al2),     a2*(sind(q2))
         0,                  sind(al2),               cosd(al2),     d2
         0,                          0,                       0,     1];

T2_3 = [cosd(q3),  -sind(q3)*cosd(al3),      sind(q3)*sind(al3),     a3*(cosd(q3))
        sind(q3),   cosd(q3)*cosd(al3),     -cosd(q3)*sind(al3),     a3*(sind(q3))
         0,                  sind(al3),               cosd(al3),     d3
         0,                          0,                       0,     1];

%Multiply all transformations to get Homogenous matrix
H= (T0_1*T1_2*T2_3);

disp("Honogenous matrix= ");
disp(H);

config = homeConfiguration(alex);
config(1).JointPosition = q1*0.0174533;
config(2).JointPosition = q2*0.0174533;
config(3).JointPosition = q3*0.0174533;

showdetails(alex)
show(alex,config);
