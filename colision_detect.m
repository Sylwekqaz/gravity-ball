function [colision]=colision_detect(A,B,axisrange,global_mass)

	colision=0;
 r= ((B(2)-A(2))^2)+((B(3)-A(3))^2);
 r=sqrt(r)^2;
 
 
 size = axisrange*  (A(8)/global_mass)^(1/2);
 size1 = axisrange*  (B(8)/global_mass)^(1/2);
 size = size+size1;
 size=size; 
 %+(2*axisrange*0.1);
 
 
    if r<size
        colision=1;
    else
        colision=0;
    end
	
	%colision=0

end
	
	% [acceleration,colision]= get_acceleration_and_colision_detect(x,y)