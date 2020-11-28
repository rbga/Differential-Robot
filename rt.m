function rt(a)
global rtflag;
rot = a*4
%Connection and motor assigning
%mylego = legoev3('bt','00165344463c');
%mylego = legoev3('Bluetooth', 'COM3');
mylego = legoev3('USB')
m1 = motor(mylego, 'A');     
m2 = motor(mylego, 'B');
%mysensor = gyroSensor(mylego, 1);
%angle = readRotationAngle(mysensor);
%resetRotationAngle(mysensor);
%speed assigning
SPEED1 = 20;
SPEED2 = -10;
wb = 12;
wd = 5.5;
%motor init
m1.Speed = SPEED1;                    
m2.Speed = SPEED2;

resetRotation(m1);                   
resetRotation(m2);
rotd = ((wb/wd)*(a/360))*360;
a1 = readRotation(m1)
a2 = readRotation(m2);
%motor loop

while (a1<(rot-35)) %&& a2>(-rotd+5)
    %a = readRotationAngle(mysensor);
    %a1 = readRotation(m1)
    %a2 = readRotation(m2);
    a1 = readRotation(m1);
    start(m1);                         
    %start(m2);
    a1 = readRotation(m1);
    %a2 = readRotation(m2);
    %a = readRotationAngle(mysensor);
end
stop(m1);     
rtflag = a;
%stop(m2);
end