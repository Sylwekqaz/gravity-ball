clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 100;
elements = 10;
B = repmat(0, [frames elements 9]);

masa1 = 100;
masa2 =100000; 
r=50;


for th  = 1:elements-1

B(1,th,1) = 1;

B(1,th,2) = r*th;

B(1,th,5) =  (-1)^(th) * sqrt(masa2/(r*th));

B(1,th,8) = masa1;

end


B(1,elements,1) = 0;

B(1,elements,2) = 0;
B(1,elements,3) = 0;

B(1,elements,8) = masa2;


axisrange = 500;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);