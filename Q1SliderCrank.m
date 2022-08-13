clc
clear all
close all

a=5
b=13
c=7

theta_2=0:5:360;

for i=1:length(theta_2)
    
    Ax(i)=a*cosd(theta_2(i));
    Ay(i)=a*sind(theta_2(i));
    
    theta_3=asind(-(c-a*sind(theta_2(i)))/b);
    
    Bx(i)=a*cosd(theta_2(i)) + b*cosd(theta_3);
    By(i)=c;
    
    Cx(i)=(Ax(i) + Bx(i))/2;
    Cy(i)=(Ay(i) + By(i))/2;
    
    plot([0, Ax(i), Bx(i)], [0, Ay(i), By(i)]);
    hold on
    Trace=viscircles([Ax(i) Ay(i)], 0.1, 'Color', 'k');
    Trace=viscircles([Bx(i) By(i)], 0.1, 'Color', 'k');
    Trace=viscircles([0 0], 0.1, 'Color', 'k');
    %path=line([Bx(0),Bx(-1)],[By(0), By(-1)],'color', 'g', 'linewidth', 3)
    title('Slider Crank')
    plot(Cx,Cy,'r')
    Trace=viscircles([Cx(i) Cy(i)], 0.1, 'Color', 'k');
    Crank=line([0 Ax(i)],[0 Ay(i)],'color','b','linewidth',2);
    Coupler=line([Ax(i) Bx(i)],[Ay(i) By(i)],'color','g','linewidth',2)
    rectangle('Position',[Bx(i) By(i) 1 1],'FaceColor','r')
    hold off
    axis([-10 20 -10 25])
    pause(0.01)
    
end
    