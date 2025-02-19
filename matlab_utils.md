



### 1. Create and Write to a Text File
You can write text to a .txt file using fprintf:

```matlab
fileID = fopen('question1_answer.txt', 'w'); % 'w' means write mode
fprintf(fileID, 'Residual vector r is not exactly zero due to numerical rounding errors.\n');
fprintf(fileID, 'MATLAB uses floating-point arithmetic, which can introduce small errors.\n');
fclose(fileID); % Close the file
```

This creates a file named question1_answer.txt in your current working directory and writes the text inside it.

### 2. Append Text to an Existing File
If you want to add more text to an existing file instead of overwriting it, use 'a' (append mode):

```matlab
fileID = fopen('question1_answer.txt', 'a'); % 'a' means append mode
fprintf(fileID, 'These errors are due to the limitations of floating-point precision in MATLAB.\n');
fclose(fileID);
```

