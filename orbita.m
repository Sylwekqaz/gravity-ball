clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 100;
elements = 2;
B = repmat(0, [frames elements 9]);

masa1 = 10000;
masa2 =10000; 
r=100;



B(1,1,1) = 1;

B(1,1,2) = r;

B(1,1,5) = sqrt(masa2/r);

B(1,1,8) = masa1;



B(1,2,1) = 0;

B(1,2,2) = 0;
B(1,2,3) = 0;

B(1,2,8) = masa2;


axisrange = 200;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);