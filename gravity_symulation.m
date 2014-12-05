function [bojawiem,M]=gravity_symulation(A,frames,elements,axisrange)

global_mass=0;
for this_element = 1:elements
global_mass=global_mass+A(1,this_element,8);
end
global_mass


%dla kazdej ramki
for frame = 2:frames
 
	%kopiujemy poprzedni stan	
	A(frame,:,:) = A(frame-1,:,:);
	A(frame,:,6:7) = 0;
	
		for this_element = 1:elements
			
			if A(frame,this_element,8)==0
				A(frame,this_element,1:8) =0;
				A(frame,this_element,2) =axisrange+10;
				A(frame,this_element,3) =axisrange+10;
				continue
			end
				
			for to_element = this_element+1:elements
			
				if A(frame,to_element,8)==0
					A(frame,to_element,1:8) =0;
					A(frame,to_element,2) =axisrange+10;
					A(frame,to_element,3) =axisrange+10;
					continue
				end
			
				[acceleration]= get_acceleration(A(frame,this_element,1:8),A(frame,to_element,1:8));

				%sumowanie przyspieszeñ dzia³aj¹cych na dane obiekty
				A(frame,this_element,6)=A(frame,this_element,6)+(acceleration(1)/A(frame,this_element,8));
				A(frame,this_element,7)=A(frame,this_element,7)+(acceleration(2)/A(frame,this_element,8));
				
				A(frame,to_element,6)=A(frame,to_element,6)-(acceleration(1)/A(frame,to_element,8));
				A(frame,to_element,7)=A(frame,to_element,7)-(acceleration(2)/A(frame,to_element,8));	
                
                

                
			end


	%sprawdzamy czy this_element jest dynamiczny (czy rusza siê // jeœli tak to dobiæ) 


		if A(frame,this_element,1)==1
		

		
		%ca³kowanie przyspieszenia do prêdkoœci 
		A(frame,this_element,4)=A(frame,this_element,4)+A(frame,this_element,6);
		A(frame,this_element,5)=A(frame,this_element,5)+A(frame,this_element,7);		
		
		%ca³kowanie prêdkoœci do po³o¿enia 
		A(frame,this_element,2)=A(frame,this_element,2)+A(frame,this_element,4);
		A(frame,this_element,3)=A(frame,this_element,3)+A(frame,this_element,5);
		
		end

		
		
	end
	
	
	
	
	for this_element = 1:elements
			
			if A(frame,this_element,8)==0
				A(frame,this_element,1:8) =0;
				A(frame,this_element,1:2) =axisrange+10;
				A(frame,this_element,1:3) =axisrange+10;
				continue
			end
				
			for to_element = this_element+1:elements
			
				if A(frame,to_element,8)==0
					A(frame,to_element,1:8) =0;
					A(frame,to_element,1:2) =axisrange+10;
					A(frame,to_element,1:3) =axisrange+10;
					continue
				end
				
				
				[colision]= colision_detect(A(frame,this_element,1:8),A(frame,to_element,1:8),axisrange,global_mass);
			
				if colision(1) == 0
				else
					nowa_masa = A(frame,this_element,8) + A(frame,to_element,8);
					
					A(frame,this_element,2) = (A(frame,this_element,2) * A(frame,this_element,8)) + (A(frame,to_element,2) * A(frame,to_element,8));
					A(frame,this_element,2) = A(frame,this_element,2)/nowa_masa;
					
					A(frame,this_element,3) = (A(frame,this_element,3) * A(frame,this_element,8)) + (A(frame,to_element,3) * A(frame,to_element,8));
					A(frame,this_element,3) = A(frame,this_element,3)/nowa_masa;
					%--
					
					A(frame,this_element,4) = (A(frame,this_element,4) * A(frame,this_element,8)) + (A(frame,to_element,4) * A(frame,to_element,8));
					A(frame,this_element,4) = A(frame,this_element,4)/nowa_masa;
					
					A(frame,this_element,5) = (A(frame,this_element,5) * A(frame,this_element,8)) + (A(frame,to_element,5) * A(frame,to_element,8));
					A(frame,this_element,5) = A(frame,this_element,5)/nowa_masa;
					
					
					A(frame,this_element,8) = nowa_masa;
					
					
					
					A(frame,to_element,1:8) =0;
					A(frame,to_element,2) =axisrange+10;
					A(frame,to_element,3) =axisrange+10; 
					
				end

			end
	end
	
	%renderowanie 

	
	clf
	hold on
	
	outputString = sprintf('frame %d z %d \n',frame,frames);
	text(axisrange*0.5, axisrange*0.9, outputString);
	axis([-axisrange axisrange -axisrange axisrange]);
    for this_element = 1:elements
	if A(frame,this_element,8) ==0
		continue
	end
	color = [0.5,0.5,0.5] ;
	color =color * sqrt(A(frame,this_element,8)/global_mass);
	color = [0.5,0.5,0.5] - color;
	
	
	size = axisrange*  (A(frame,this_element,8)/global_mass)^(1/2) /2;	
	size = size;
	
    if frame>12
		plot(A(frame-10:frame,this_element,2),A(frame-10:frame,this_element,3),'c-');
    end
    
	scatter(A(frame,this_element,2),A(frame,this_element,3),size,color,'fill')
	
	
	
	end
	
	%plot(A(frame,:,2),A(frame,:,3),'k.');
	
	hold off
	M(frame-1) = getframe;	
	
end


%movie(M,1,30) 
bojawiem=A;


end