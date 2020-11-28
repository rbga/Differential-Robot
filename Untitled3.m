stcm(10)
function stcm(d)
mylego = legoev3('bt','00165344463c');
%mylego = legoev3('USB');
m1 = motor(mylego, 'A');     
m2 = motor(mylego, 'B');

wd = 5.5;

resetRotation(m1);                   
resetRotation(m2);
a1 = readRotation(m1);
a2 = readRotation(m2);
rotd = (d/(pi*wd))*360;

while (a1<rotd && a2<rotd)
    a1 = readRotation(m1);
    a2 = readRotation(m3);
    SPEED1 = 50;
    SPEED2 = 60;
    m1.Speed = SPEED1;                    
    m2.Speed = SPEED2;
    start(m1);
    start(m2);
    pause(0.1);
    SPEED1 = 50;
    SPEED2 = 50;
    m1.Speed = SPEED1;                    
    m2.Speed = SPEED2;
    
end
stop(m1);
stop(m2);
clear all;
end