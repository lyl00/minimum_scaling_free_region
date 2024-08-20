function [P1,As,bs] = rep_poly_bTow(P, T)
% Transform the representation of a polytope from its own frame world frame. 
% Input: 
% P : polytope representation in its body frame
% T : The transformation matrix expressing the body frame in world, 
% i.e., w_T_b.
% Output:
% P1 : polytope representation in world frame
% As, bs: the corresponding linear constraints defining the hyperplanes.
rep_in_b = hrep(P);
T_inv = TransInv(T);
A = rep_in_b.B;
b = rep_in_b.b;
As = A*T_inv(1:3,1:3);
bs = b-A*T_inv(1:3,4);
rep_in_w.B = As;
rep_in_w.b = bs;
P1 = polyh(rep_in_w,'h');
end