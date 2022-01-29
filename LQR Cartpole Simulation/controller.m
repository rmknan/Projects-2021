clc
clear


%% Define Cartpole
g = 9.81;
l = 1;
mc = 5;
mp = 1;

A = [0, 0, 1, 0; 0, 0, 0, 1; 0, (mp*g)/mc, 0, 0; 0, ((mp+mc)*g)/(l*mc), 0, 0];
B = [0; 0; 1/mc; 1/(l*mc)];
C = [1 0 0 0; 0 1 0 0];
% rank(ctrb(A,B))
%rank(obsv(A,C))

%% Simulation
[ts, zs] = ode45(@(t, z) cartpole(t, z, A, B), [0:0.002:10], [0; pi+0.1; 0; 0]);


%% Dynamics Function
function dzdt = cartpole(t, z, A, B)
    bz = z - [0; pi; 0; 0];
    C = [1 0 0 0; 0 1 0 0];
    
    % Replace this with your own controller
    % =====================================
    p = [-1 -1.8 -2.5 -3];
    k = place(A,B,p);
    u = -k*bz;
    p2 = [-8 -10 -11 -15];
    g = place(A',C',p2)';
    % =====================================
    
    dzdt = (A -g*C)* bz + B * u;
end
