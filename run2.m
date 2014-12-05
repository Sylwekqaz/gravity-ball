clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 400;
elements = 100;
B = repmat(0, [frames elements 9]);




%statyczny
B(1,:,1) = 1;

%połozenie
B(1,1:elements,2) = (rand(1,elements)*200)-100;
B(1,1:elements,3) = (rand(1,elements)*200)-100;

%prędkośc
B(1,1:elements,4) = 0;
B(1,1:elements,5) = 0;





%masa
B(1,1:elements,8) = 10; 

B;

axisrange = 100;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);