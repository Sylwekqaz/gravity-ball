clear
%przygotowywanie danych
% pierwszy wymiar na ramki 
% 	drugi wymar to lista elementów 
% 		trzeci wymiar to dane pojedynczego obiektu
frames = 300;
elements = 2000;
B = repmat(0, [frames elements 9]);


masa = 10;

%statyczny
B(1,:,1) = 1;

%połozenie
B(1,1:elements,2) = (rand(1,elements)*200)-100;
B(1,1:elements,3) = (rand(1,elements)*200)-100;

for this_element = 1:elements
	B(1,this_element,4) = B(1,this_element,3);
	B(1,this_element,5) = -B(1,this_element,2);
	B(1,this_element,4:5) = B(1,this_element,4:5)/sqrt(sqrt(10/(B(1,this_element,4)^2 + B(1,this_element,5)^2)));
	
	speed = sqrt(1/((B(1,this_element,4)^2 + B(1,this_element,5)^2)));
	speed= 0.002;
	B(1,this_element,4:5) = B(1,this_element,4:5) * speed;
	
	
	
	end





%masa
B(1,1:elements,8) = masa; 


B;

axisrange = 300;
[B,sds]=gravity_symulation(B,frames,elements,axisrange);