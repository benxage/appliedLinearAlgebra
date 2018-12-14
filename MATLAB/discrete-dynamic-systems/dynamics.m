A = [0.4 0.5 ; -0.2 1.2];
x0 = [500 ; 250]; % initial condition
x = x0;

% This loop computes x_1 through x_29 by multiplying the previous one by A.
% Each is stored as a column in x.
for k=2:30
   x(:,k) = A*x(:,k-1); 
end


% Create a scatter plot of x_0, x_1, ... , x_29
scatter(x(1,:), x(2,:))
axis square;
axis([0 500 0 500])