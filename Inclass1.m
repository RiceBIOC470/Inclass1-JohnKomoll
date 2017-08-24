% InClass1: some simple excerises to get started with MATLAB. Please complete by
% the second class. Answer questions in comments and return assignment via
% github
%% numbers vs strings
% Run the following two sections. explain why one gives a sensible result and the other doesn't
% Can you explain the value of the variable b? 
x = 1; 
y = x + x

% x is defined as an integer, and it makes sense to add two integers. 1+1=2.
%%
a = '1';
b = a+a

% a is defined as a string containing the character 1. MATLAB does not see
% a as the integer 1, but rather a character that corresponds to this
% integer. The value of b is the addition of the two 16-bit numeric values
% that correspond to the character 'a'.
%% concatenation
% what is being done by the following statements? what is the difference between x2 and a2? 
% what is the difference between x2 and x2b (hint run the size command on
% these arrays and explain the results). 

x2 = [x x]

a2 = [a a]

x2b = [x; x]

% All of the above statements are generating arrays. x2 is defined as an 
% array containing two instances of the integer 1. Since a is the character
% '1', a2 is defined as an array containing two instances of the character
% (not the integer) '1'. 
% x2 is an array with two instances of the integer 1 of size 1x2. x2b is an
% array with two instances of the integer 1 of size 2x1. x2 is a row vector
% while x2b is a column vector.
%% = vs ==, isequal
% explain why the identical commands with the == commands give different answers 
% hint: check the values of a and b as you execute the following statements
% if necessary. 
a = 1; b =2; 

a == b
a = b;
a == b

% When a and b are first defined, they are defined as two different
% integers and thus an equality comparison between a and b will yield 0 
% (meaning they are unequal). However, a is then assigned to be equal to b.
% Therefore, the second equality comparison is now comparing two integers 
% of the same value, which will yield 1 (meaning they are equal).


%explain the results of the following operations:
a = [1, 2, 4];
b = [0,2,7];
a == b

% a and b are defined as 1x3 row vectors with integer values as entries.
% The equality comparison between a and b yields the array [0, 1, 0],
% because the first entries of a and b are unequal, the second entries of a
% and b are equal, and the third entried of a and b are unequal. The
% resulting 1 means that that index is equal between arrays, and the
% resulting 0s mean that those indeces are unequal between arrays.

%explain why this gives an error:

b = [2, 3];
a == b

% a is of size 1x3 and b is defined to be an array of size 1x2. These two
% arrays are not of the same size, so they cannot be compared on an
% entry-by-entry basis, as the == operator attempts to do.

%explain why this does not give an error
b = 2;
a == b 

% b is defined as an integer. MATLAB is able to compare this integer to
% each integer value in a, a 1x3 array, and determine whether or not each
% integer in a is equal to the value of b. The resulting vector outputted
% represents unequal comparisons as 0s and an equal comparison as a 1.
%%  : operator 
%(hint for the following type "help colon" at the command line to see
% how the ":" operator works
% the following makes an array of the numbers from one to ten: 
oneToTen = 1:10;

%here are two ways to make the array of numbers from 1 to twenty
%explain how the second line works.
1:20
[oneToTen, oneToTen+10]

% The second line takes the pre-existing array of 1 to 10 and concatenates
% it with a pre-existing array of 1 to 10 that is increased by 10. This
% effectively adds an 11 to 20 array to the end of a 1 to 10 array,
% generating a 1 to 20 array.

% do each of the following in two different ways, by manipulating the array
% oneToTen and by defining it concisely from scratch

% 1. even numbers from two to twenty

2:2:20
oneToTen*2

% 2. odd numbers from one to nineteen

1:2:19
oneToTen*2 - 1

% 3. Even numbers in reverse order from twenty to two (hint lookup the
% matlab function fliplr)

20:-2:2
fliplr(oneToTen*2)

% explain why the fliplr funciton no longer works and find a different
% matlab function that performs an equivalent function on the same array
oneToTen = oneToTen';
flipud(oneToTen)

% The fliplr function cannot work on a column vector, because the column
% vector only has one column. There are no left or right values. Instead,
% we can use the flipud operator to flip the top and bottom.
%% matrices, . operator

%look at the matrix this defines. Note the other functions zeros, eye, and
%rand which can define matrices. 

m1 = ones(2);
m2 = 2*ones(2);

%explain the output of these two commands:
m1*m2
m1.*m2

% The first command takes the dot product between m1 and m2. The dot
% product is a 2x2 matrix with each value equal to 4.
% The second command performs element-by-element multiplication between m1
% and m2. This means that the product of each specific index is given in
% the output matrix at that index. The element-by-element multiplication
% between m1 and m2 yields a 2x2 matrix with each value equal to 2.

%explain this command:
m2./m1

% This command performs element-by-element division of m2 by m1. This means
% that the quotient of each specific index is given in the output matrix at
% that index. The element-by-element multiplication between m1 and m2
% yields a 2x2 matrix with each value equal to 2.

%extra credit: explain why this command gives a warning:
m2/m1

% This command attempts to perform a right matrix division of m2 by m1.
% Essentially, it is trying to solve the system m1 * x = m2. However, since
% the determinant of m1 (and m2) is 0, the matrix is singular. This means
% that m1 is not invertible, so MATLAB cannot perform m2 * INV(m1), and
% thus cannot solve this problem on its own.
%% access particular elements and groups of elements

%define a random matrix

rand_nums = rand(5);

%explain what is being done in each of the following lines

rand_nums(2,3)

% This command is indexing the value at the 2nd row, 3rd column of the
% matrix rand_nums.

rand_nums(2:4,3)

% This command is indexing the column vector in rand_nums located in the
% 3rd column and rows 2 through 4.

rand_nums(1:2,3:4)

% This command is indexing the array in rand_nums located in rows 1-2 and
% columns 3-4. It is essentially taking a smaller matrix out of the larger.

rand_nums(:,2)

% This command is indexing the column vector in rand_nums located at the
% 2nd entire column of the matrix. The : operator selects every row.

rand_nums(1,:)

% This command is indexing the row vector in rand_nums located at the 1st
% entire row of the matrix. The : operator selects every column.

rand_nums(:,[1 3 5])

% This command is indexing the 1st, 3rd, and 5th column vectors of
% rand_nums and is returning them in one large matrix of column vectors
% concatenated together. The : operator selects every row, and the [1 3 5]
% vector indexes the 1st, 3rd, and 5th columns.

