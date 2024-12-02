clear;
alex= importrobot('Alex-Main-URDF.urdf');

PX=input("X= ");
PY=input("Y= ");
PZ=input("Y= ");
L_1 = 124;
L_2 = 240;
L_3 = 175;

L (1) = Link([0 L_1 0 pi/2]);
L (2) = Link([0 0 L_2 0]);
L (3) = Link([0 0 L_3 0]);

Robot = SerialLink(L);
Robot.name = 'Gimble';

T = [ 1 0 0 PX ;
      0 1 0 PY ; 
      0 0 1 PZ ; 
      0 0 0 1];
J = Robot.ikine(T,[0 0 0],[1 1 1 0 0 0])*180/pi;
%Input the angles for the motors
q1=J(1,1)
q2=J(1,2)
q3=J(1,3)

Robot.plot(J);
T = Robot.fkine(J);
disp(T)
config = homeConfiguration(alex);
config(1).JointPosition = q1*0.0174533;
config(2).JointPosition = q2*0.0174533;
config(3).JointPosition = q3*0.0174533;


show(alex,config);