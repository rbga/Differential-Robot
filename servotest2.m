function servotest2
mylego = legoev3('USB');
mymotor1 = motor(mylego, 'C');
mysonicsensor = sonicSensor(mylego);
SPEED = 15;
resetRotation(mymotor1);
a = readRotation(mymotor1);
disp(a);
%%
i = 0;
table = zeros(200,2);

while (a<=140)
    %a = readRotation(mymotor1); disp(a);
    mymotor1.Speed = SPEED;
    start(mymotor1);
        
        %disp(dist);
        %pause(0.4);
        %dist2=readDistance(mysonicsensor);
        %dist =(dist1+dist2)/2;
        b = readRotation(mymotor1);
        ang = double(b);
    t=0;
    for t=0:1:10
        d = readDistance(mysonicsensor);
        dist = double(d);
        table(i+1,1) = dist*(cosd(ang));
        table(i+2,2) = dist*(sind(ang));
        i=i+1;
    end
    a = readRotation(mymotor1);
end
stop(mymotor1, 1);
pause(1);
while (a>=10)
    %a = readRotation(mymotor1);
    mymotor1.Speed = -SPEED;
    start(mymotor1);
    a = readRotation(mymotor1);
end
stop(mymotor1, 1);
%polarplot(table(:,1), table (:,2));
[x, y] = pol2cart(table(:,2), table(:,1));
%polarplot(table(:,1), table(:,2));
plot(x,y, 'b--o');
hold on;
return
end