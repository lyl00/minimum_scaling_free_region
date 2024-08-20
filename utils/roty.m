function R = roty(theta)
% rotation matrix generated by rotating along y axis for degree theta.
    R = [cos(theta) 0 sin(theta);0 1 0;-sin(theta) 0 cos(theta)];
end