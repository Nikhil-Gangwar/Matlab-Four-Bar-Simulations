clc
clear all
close all

a=5;
b=13;
c=10;
d=15;

theta_2=0:5:360;

for i=1:length(theta_2)
    Ax(i)=a*cosd(theta_2(i));
    Ay(i)=a*sind(theta_2(i));
    
    P(i)=((Ay(i)*Ay(i))/((Ax(i)-d)*(Ax(i)-d))) + 1;
    
    S(i)=(a*a - b*b + c*c - d*d)/(2*(Ax(i)-d));
    
    R(i)=(d-S(i))*(d-S(i)) - (c*c);
    
    Q(i)=(2*Ay(i)*(d-S(i)))/(Ax(i)-d);
    
    
    By(i)=(-Q(i) + (Q(i)*Q(i) - 4*P(i)*R(i))^0.5)/(2*P(i));
    Bx(i)=S(i) - (2*Ay(i)*By(i))/(2*(Ax(i)-d));
        
    mx(i)=(Ax(i)+Bx(i))/2;
    my(i)=(Ay(i)+By(i))/2;
    
    plot([0, Ax(i), Bx(i), d],[0, Ay(i), By(i), 0])
    hold on
    %Joining Points 
    Trace=viscircles([Ax(i) Ay(i)], 0.1, 'Color', 'k');
    Trace=viscircles([Bx(i) By(i)], 0.1, 'Color', 'k');
    Trace=viscircles([0 0], 0.1, 'Color', 'k');
    Trace=viscircles([d 0], 0.1, 'Color', 'k');
    %TITLE
    title('Four Bar')
    %Plotting Mid Point of AB
    plot(mx,my,'r')
    Trace=viscircles([mx(i) my(i)], 0.1, 'Color', 'k');
    %Changing appearance of each link
    Crank=line([0 Ax(i)],[0 Ay(i)],'color','g','linewidth',2);
    Coupler=line([Ax(i) Bx(i)],[Ay(i) By(i)],'color','b','linewidth',2);
    Coupler2=line([Bx(i) d],[By(i) 0],'color','g','linewidth',2);
    hold off
    axis([-20 20 -20 20]);
    pause(0.01)
    
end