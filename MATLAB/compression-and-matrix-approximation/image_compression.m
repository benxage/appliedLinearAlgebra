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
SP = S; % Make copy of S (Sigma)

k = 10; % Number of singular values to keep

% This loop deletes all singular values after the k-th one
for i=[k+1:p]
    SP(i,i)=0;
end;

% Construct the compressed image
AP = U*SP*transpose(V);

% Display image
imshow(AP,'border','tight');

norm(SP,'fro')/norm(S,'fro')