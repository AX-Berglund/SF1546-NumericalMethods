% Uppgift1.m - Solving a linear system Ax = b and calculating residual vector

% Clear workspace and command window
clear; clc;

% Define matrix A and vector b
A = [1 2 3 0;
     0 4 5 6;
     1 1 -1 0;
     1 1 1 1];

b = [7; 6; 5; 4];

% Solve the linear system Ax = b
x = A \ b;

% Display solution
disp('Solution vector x:');
disp(x);

% Compute the residual vector r = b - Ax
r = b - A * x;

% Display residual vector
disp('Residual vector r:');
disp(r);

% Write results to a text file
fileID = fopen('question1_answer.txt', 'w'); % Open file for writing
fprintf(fileID, 'a)\n');
fprintf(fileID, 'Solution vector x:\n');
fprintf(fileID, '%.6f\n', x); % Save x with six decimal places

fprintf(fileID, '\nb)');
fprintf(fileID, '\nResidual vector r:\n');
fprintf(fileID, '%.6e\n', r); % Display residual vector in scientific notation

fprintf(fileID, '\nc)');
fprintf(fileID, '\nExplanation:\n');
fprintf(fileID, 'Residual vector r is not exactly zero due to numerical rounding errors.\n');
fprintf(fileID, 'MATLAB uses floating-point arithmetic, which can introduce small errors.\n');
fprintf(fileID, 'These errors occur because computers store numbers in binary with limited precision.\n');
fclose(fileID); % Close file

% Open the result file automatically in MATLAB editor
open('question1_answer.txt');
