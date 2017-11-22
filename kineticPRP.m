function KinEnergy = kineticPRP(q,qdot,  Jw, Jv)
% calcuates the kinetric energy of the manipulator
% calculate the linear kinetic energy first

m1 = 0.3;
m2 = 0.3;
m3 = 0.3; % 0.3 kg

Jvc1 = Jv(:,1);
Jvc2 = Jv(:,2);
Jvc3 = Jv(:,3);

Jvc1T = transpose(Jvc1);
Jvc2T = transpose(Jvc2);
Jvc3T = transpose(Jvc3);

Jwc1 = Jw(:,1);
Jvw2 = Jw(:,2);
Jwc3 = Jw(:,3);

Jwc1T = transpose(Jwc1);
Jwc2T = transpose(Jwc2);
Jwc3T = transpose(Jwc3);

% Get the rotation matrices
[T01a, T02a, T03a] = fkinPRP(q);

R1 = T01a(1:3, 1:3);
R1T = transpose(R1);
R2 = T02a(1:3, 1:3);
R2T = transpose(R2);
R3 = T03a(1:3, 1:3);
R3T = transpose(R3);


% create inertial matrices with zeroes except for the Izz value
I_1 = zeros(3,3);
I_1(3,3) = 0.11;
I_2 = I_1;
I_3 = I_1;


LinKin = [m1*Jvc1T*Jvc1 + m2*Jvc2T*Jvc2 + m3*Jvc3T*Jvc3];

K_1 = 0.5*transpose(qdot)*LinKin*qdot;

% Now calcualte rotational kinetic energy

RotKin = [Jwc1T*R1*I_1*R1T*Jwc1 + Jwc2T*R2*I_2*R2T*Jwc2 + Jwc3T*R3*I_3*R3T*Jwc3];

K_2 = 0.5*transpose(qdot)*RotKin*qdot;

KinEnergy = K_1 + K_2;

end
