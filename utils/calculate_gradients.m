% this manuscript obtain the analytical gradients representation for one facet of the free region.

% robot states
syms x y z roll pitch yaw real;

% free region frame in world
syms r11 r12 r13 r21 r22 r23 r31 r32 r33 px_ py_ pz_ real;
w_R_free = [r11 r12 r13;r21 r22 r23; r31 r32 r33];
w_p_free = [px_ py_ pz_]';
w_p_robot = [x y z]';

% using roll-pitch-yaw representation
eul = [roll pitch yaw];
w_R_robot =  rotz(yaw)*roty(pitch)*rotx(roll);

% represent robot body frame in free region
free_R_robot = w_R_free'*w_R_robot;
free_p_robot = w_R_free'*w_p_robot-w_R_free'*w_p_free;

% duals corresponding to equalities constraints on the monomials: 1 x y z
syms dual_0 dual_1 dual_2 dual_3 real;
% L = alpha + dual * constraints
% one facet of the polytope representation for free region in its own frame 
syms Ax Ay Az real;
A = [Ax Ay Az];
expression = dual_0 * A * free_p_robot + dual_1 * A * free_R_robot(:,1) + dual_2 * A * free_R_robot(:,2) + dual_3 * A * free_R_robot(:,3);
% get the derivative vector with respect to robot states:
robot_state = [x y z roll pitch yaw];
% robot_state = [x y z mrp1 mrp2 mrp3];
for i = 1:size(robot_state,2)
    gradient_state(i) = diff(expression,robot_state(i));
end

clearvars -except x y z roll pitch yaw r11 r12 r13 r21 r22 r23 r31 r32 r33 px_ py_ pz_ dual_0 dual_1 dual_2 dual_3 Ax Ay Az gradient_state;
save('gradient_expression.mat');
