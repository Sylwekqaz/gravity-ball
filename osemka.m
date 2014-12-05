clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 1000;
elements = 3;
B = repmat(0, [frames elements 9]);

v = [-1/2 , sqrt(3)/2]


masa2 =132; 




B(1,1,1) = 1;

B(1,1,2) = 50;
B(1,1,3) = 0;


B(1,1,4:5) = v;

B(1,1,8) = masa2;



B(1,2,1) = 1;

B(1,2,2) = 0;


B(1,2,4:5) = -2*v;

B(1,2,8) = masa2;


B(1,3,1) = 1;

B(1,3,2) = -50;

B(1,3,4:5) = v;

B(1,3,8) = masa2;


axisrange = 100;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);