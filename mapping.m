function mapping()
global objectflag;
mylego = legoev3('USB');
mymotor1 = motor(mylego, 'C');
mysonicsensor = sonicSensor(mylego);
SPEED = 35;
resetRotation(mymotor1);
a = readRotation(mymotor1);
disp(a);
%%
i = 0;
while(a<=60)
    %a = readRotation(mymotor1); disp(a);
    mymotor1.Speed = SPEED;
    start(mymotor1);
    pause(0.01);
    stop(mymotor1, 1);  
        %disp(dist);
        %pause(0.4);
        %dist2=readDistance(mysonicsensor);
        %dist =(dist1+dist2)/2;
        
        d1 = readDistance(mysonicsensor);disp(d1); pause(0.01);
        d2 = readDistance(mysonicsensor);
        d = (d1+d2)/2;
        r = double(d * 100);
        b = double(readRotation(mymotor1));       
        tab1(i+1,1) = r * (cosd(b));
        tab1(i+1,2) = r * (sind(b));
        i=i+1;
        
        plot(tab1(:,2),tab1(:,1), ':');
        drawnow
        hold on
        
    a = readRotation(mymotor1);
    if (d1<0.15)
         objectflag = 1; disp(d);
    else 
        objectflag = 0;
    end
end
stop(mymotor1, 1);
pause(1);
%%
while(a>=5)
    a = readRotation(mymotor1);
    mymotor1.Speed = -SPEED+20;
    start(mymotor1);
    a = readRotation(mymotor1);
end
stop(mymotor1, 1);
%%
j=0;
while(a>=-60)
    %a = readRotation(mymotor1); disp(a);
    mymotor1.Speed = -SPEED;
    start(mymotor1);
    pause(0.01);
    stop(mymotor1, 1);  
        %disp(dist);
        %pause(0.4);
        %dist2=readDistance(mysonicsensor);
        %dist =(dist1+dist2)/2;
        
        d1 = readDistance(mysonicsensor); pause(0.01);
        d2 = readDistance(mysonicsensor);
        d = (d1+d2)/2;
        r = double(d * 100);
        b = double(readRotation(mymotor1));       
        tab2(j+1,1) = r * (cosd(b));
        tab2(j+1,2) = r * (sind(b));
        j=j+1;
        plot(tab2(:,2),tab2(:,1), ':');
        drawnow
        hold on
    a = readRotation(mymotor1);
    
   
end
stop(mymotor1, 1);
%%
%a = readRotation(mymotor1);
while(a<=-10)
    a = readRotation(mymotor1);
    mymotor1.Speed = SPEED-20;
    start(mymotor1);
    a = readRotation(mymotor1);
end
stop(mymotor1, 1);
%%
%polarplot(table(:,1), table (:,2));
%[x, y] = pol2cart(table(:,2), table(:,1));
tab = [tab2;tab1];
end
%%
%plot(tab(:,2), tab(:,1));
%plot(x,y, ':');
%hold on;