q = sym('q', [3 1]);
qDot = sym('qdot', [3 1]);
qDotDot = sym('qdotdot', [3 1]);
% q = [1; 1; 2];
% qDot = [4; 3; 5];
% qDotDot = [5; 7; 3];

% Jacobian 
[Jv, Jw, J] = jacobPRP(q); 

% kinetic energy
[KinEnergy, D] = kineticPRP(q, qDot,  Jw, Jv);

%Christoffel matrix
ChristMatrix = ChristoffelPRP(D, q, qDot);

% Gravitational Potential energy
G = potentialPRP(q);

Torque = D*qDotDot + ChristMatrix*qDot + G;

% Have torques in terms of syms
% define position
q1 = 1;
q2 = 4;
q3 = 5;

% define velocity
qdot1 = 4;
qdot2 = 3;
qdot3 = 5;

% define acceleration
qdotdot1 = 5;
qdotdot2 = 7;
qdotdot3 = 3;

% sub values in
Torque = double(subs(Torque));



