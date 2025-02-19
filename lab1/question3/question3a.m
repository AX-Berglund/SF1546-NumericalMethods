% 3 a) - bestäm rötterna till ekvationen i föregående uppgift med sekantmetoden. 

% Inställningar
tol = 1e-8;
maxIter = 50;

% Öppna fil för att skriva x0, x1 och rötterna
fileID = fopen('question3b.txt', 'w');

% Kör sekantmetoden och spara x0, x1 och rötterna för varje fall

% Fall 1
x0 = -1.5;
x1 = -1.3;
[root1, iter1] = sekantmetod(@f, x0, x1, tol, maxIter);
fprintf(fileID, 'Fall 1: x0 = %.2f, x1 = %.2f, Rot = %.8f\n', x0, x1, root1);

% Fall 2
x0 = -0.29;
x1 = -0.26;
[root2, iter2] = sekantmetod(@f, x0, x1, tol, maxIter);
fprintf(fileID, 'Fall 2: x0 = %.2f, x1 = %.2f, Rot = %.8f\n', x0, x1, root2);

% Fall 3
x0 = 0.29;
x1 = -0.29;
[root3, iter3] = sekantmetod(@f, x0, x1, tol, maxIter);
fprintf(fileID, 'Fall 3: x0 = %.2f, x1 = %.2f, Rot = %.8f\n', x0, x1, root3);

% Fall 4
x0 = 4;
x1 = 6;
[root4, iter4] = sekantmetod(@f, x0, x1, tol, maxIter);
fprintf(fileID, 'Fall 4: x0 = %.2f, x1 = %.2f, Rot = %.8f\n', x0, x1, root4);

% Stäng filen
fclose(fileID);

% Visa resultaten i kommandofönstret
fprintf('Första roten: %.8f, Antal iterationer: %d\n', root1, iter1);
fprintf('Andra roten: %.8f, Antal iterationer: %d\n', root2, iter2);
fprintf('Tredje roten: %.8f, Antal iterationer: %d\n', root3, iter3);
fprintf('Fjärde roten: %.8f, Antal iterationer: %d\n', root4, iter4);
