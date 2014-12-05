clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 100;
elements = 2;
B = repmat(0, [frames elements 9]);


masa2 =10000; 
r=50;



B(1,1,1) = 1;

B(1,1,2) = r;

B(1,1,5) = sqrt(masa2/(4*r));

B(1,1,8) = masa2;



B(1,2,1) = 1;

B(1,2,2) = -r;

B(1,2,5) = -sqrt(masa2/(4*r));

B(1,2,8) = masa2;


axisrange = 100;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);