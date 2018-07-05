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

A = [
    0 -1 0
    1 0 0
    0 0 0
    ];






% Don't edit below.  The loop applies exp(tA) to the cube for t ranging
% from 0 to 1 in increments of 0.01.  It plots the result for each t using
% perspective projection from a "nice" angle.  The last frame of the
% animation is exp(A) applied to the cube.
dt = 0.01;
for t=0:dt:1
    % Take matrix exponential and then make 4 x 4 matrix (for homogeneous
    % coordinates).
    B = expm(t*A);
    B = [B zeros(3,1) ; zeros(1,3) 1];
    % Apply transformation exp(tA) to cube.
    C1 = B*C;
    
    % Rotate to nice perspective
    C1 = [1 0 0 0 ; 0 cos(-pi/3) -sin(-pi/3) 0;0 sin(-pi/3) cos(-pi/3) 0 ; 0 0 0 1]*[cos(pi/6) -sin(pi/6) 0 0;sin(pi/6) cos(pi/6) 0 0 ; 0 0 1 0; 0 0 0 1]*C1;
    % Perspective projection from d = 15
    D = [1 0 0 0;0 1 0 0;0 0 0 0;0 0 -1/15 1]*C1;
    % Post-process
    h = D(4,:).^(-1); % Extract row of fourth coordinates and take their reciprocals.
    H = diag(h); % Make diagonal matrix whose diagonal entries are the elements of h.
    E = D*H; % Multiplies each column of D by the appropriate scalar so that the fourth coordinate becomes 1.

    % Plot all vertices
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
    pause(0.01)
end