clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 400;
elements = 3;
B = repmat(0, [frames elements 9]);


masa2 =100000; 
r=50;

% [-1/2 , sqrt(3)/2]
% [ sqrt(3)/2 ,1/2 ]


B(1,1,1) = 1;

B(1,1,2) = r;

B(1,1,5) = sqrt(2*masa2/(2.25*r));

B(1,1,8) = masa2;



B(1,2,1) = 1;

B(1,2,2:3) = [-1/2 , sqrt(3)/2] *r

B(1,2,4:5) = [ -sqrt(3)/2 ,-1/2 ] * sqrt(2*masa2/(2.25*r));

B(1,2,8) = masa2;


B(1,3,1) = 1;

B(1,3,2:3) = [-1/2 , -sqrt(3)/2] *r

B(1,3,4:5) = [ sqrt(3)/2 ,-1/2 ] * sqrt(2*masa2/(2.25*r));

B(1,3,8) = masa2;


axisrange = 500;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);