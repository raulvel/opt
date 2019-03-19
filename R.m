function out = R(j, dmn )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

si = (dmn(2) - dmn(1))/3;%3 is e
L = dmn(1) + (j-1)*si;
U = L + si;
out = (U - L) + L*rand;

end

