function servotest
global objstat
mylego = legoev3('USB');
mymotor1 = motor(mylego, 'C');
mysonicsensor = sonicSensor(mylego);
SPEED = 50;
resetRotation(mymotor1);
a = readRotation(mymotor1);
disp(a);
%%
i = 1;
table = zeros(15,2);
while (a<=145)
    a = readRotation(mymotor1);
    mymotor1.Speed = SPEED;
    start(mymotor1);
    pause (0.01);
    stop(mymotor1);
    dist1 = readDistance(mysonicsensor);
    pause(.04);
    dist2 = readDistance(mysonicsensor);
    dist = (dist1+dist2)/2;
%    pause (0.01);
    table(i,1) = (i-1);
    table(i,2) = round(dist,2)
    i = i + 1;
  
    
    pause(0.01);
end
stop (mymotor1, 1);
pause(0.04);
j = 1; 
x = 0;
while (a>x)
    a = readRotation(mymotor1);
    mymotor1.Speed = -SPEED;
    start(mymotor1);
    pause(0.01);
    stop(mymotor1);
        dist1 = readDistance(mysonicsensor);
        pause(.04);
        dist2 = readDistance(mysonicsensor);
        dist = (dist1+dist2)/2;
        table(i-j,2) = (table(i-j,2) + round(dist,2))/2
        j = j + 1;
        
        
        pause(0.01);
end
stop(mymotor1, 1);
%polarplot(table(:,1), table (:,2));
while(a<=60)
     a = readRotation(mymotor1);
    mymotor1.Speed = SPEED;
    start(mymotor1);
    obj = readDistance(mysonicsensor); disp(obj);
if (obj<=15)
    objstat = 1;
else
    objstat = 0;
end
end

stop(mymotor1);
[X, Y] = pol2cart(table(:,1), table (:,2));
figure;
plot(X, Y, 'b--o');
drawnow;
title('Map of the Environment');
hold off
xlim([-.980 .980]);
ylim([-.980 .980]);
grid on;
end