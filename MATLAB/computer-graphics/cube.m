syms T(a,b,c) RX(t) RY(t) RZ(t) P(d)
T(a,b,c)=[1 0 0 a;0 1 0 b;0 0 1 c;0 0 0 1];
RX(t)=[1 0 0 0 ; 0 cos(t) -sin(t) 0;0 sin(t) cos(t) 0 ; 0 0 0 1];
RY(t)=[cos(t) 0 sin(t) 0;0 1 0 0;-sin(t) 0 cos(t) 0 ;0 0 0 1];
RZ(t)=[cos(t) -sin(t) 0 0;sin(t) cos(t) 0 0 ; 0 0 1 0; 0 0 0 1];
P(d)=[1 0 0 0;0 1 0 0;0 0 0 0;0 0 -1/d 1];

% The columns of C contain 8 vertices of a cube.
C = transpose([
    3   3   3   1
    3  -3   3   1
   -3  -3   3   1
   -3   3   3   1
    3   3  -3   1
    3  -3  -3   1
   -3  -3  -3   1
   -3   3  -3   1   
]);

% Do transformations to C here.  Assign the result of the transformation to
% C, and then the code below will plot the transformed C.  For example,
% you can write things like
% C = T(1,4,3)*C;




% Perspective projection
D = P(15)*C;

% Post-process.  No need to edit this part.
h = D(4,:).^(-1); % Extract row of fourth coordinates and take their reciprocals.
H = diag(h); % Make diagonal matrix whose diagonal entries are the elements of h.
E = D*H; % Multiplies each column of D by the appropriate scalar so that the fourth coordinate becomes 1.

% Plot all vertices.  No need to edit this part.
scatter(E(1,:), E(2,:),'filled')
hold on
% Draw top square (red)
plot(E(1,1:4), E(2,1:4),'r')
plot([E(1,4), E(1,1)], [E(2,4), E(2,1)],'r')
% Draw bottom square (blue)
plot(E(1,5:8), E(2,5:8),'b')
plot([E(1,8), E(1,5)], [E(2,8), E(2,5)],'b')
% Draw vertical edges (black)
plot([E(1,1), E(1,5)], [E(2,1), E(2,5)],'k')
plot([E(1,2), E(1,6)], [E(2,2), E(2,6)],'k')
plot([E(1,3), E(1,7)], [E(2,3), E(2,7)],'k')
plot([E(1,4), E(1,8)], [E(2,4), E(2,8)],'k')
axis square
axis([-8 8 -8 8])
hold off