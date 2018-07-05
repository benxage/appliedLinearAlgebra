I = imread('dog.jpg'); % Read image as a matrix.
A = rgb2gray(I); % Convert to grayscale.

% These commands convert the entries of A to numbers between 0 and 1.
A = double(A);
A = A-min(A(:));
A = A/max(A(:));

m = size(A,1); % number of rows
n = size(A,2); % number of columns
p = min(m,n); % number of singular values that will be in Sigma

[U,S,V] = svd(A);

k = 75; % Number of singular values to keep

AP = zeros(m,n);
W = transpose(V);
% Each iteration of this loop adds one more term sigma_i(u_i)(v_i)^T to the
% approximated image.  It displays the approximated image at each step,
% creating an animation.
for i=1:k
    AP = AP + S(i,i)*U(:,i)*W(i,:); % Add the next rank 1 matrix
    imshow(AP,'border','tight');
    pause(0.1)
end;