function [Acc]=get_acceleration(A,B)
%magiczne wzory

    r= ((B(2)-A(2))^2)+((B(3)-A(3))^2);
    
	if r==0;
	gravity = 0;
	Acc(1)=0;
	Acc(2)=0;
	else	
	
	gravity = (A(8)*B(8))/(r);
	Acc(1)=B(2)-A(2);
	Acc(2)=B(3)-A(3);
	
	
	
	Acc(1:2)=Acc(1:2)/norm(Acc(1:2));
	
	Acc(1:2)=Acc(1:2)*gravity;
	
	end
	

	

end
	
	% [acceleration,colision]= get_acceleration_and_colision_detect(x,y)