function ri(d)
%Connection and motor assigning
%mylego = legoev3('bt','00165344463c');
%mylego = legoev3('Bluetooth', 'COM3');
mylego = legoev3('USB')
mymotor1 = motor(mylego, 'A');     
mymotor2 = motor(mylego, 'B');
mysensor = gyroSensor(mylego, 1);
%angle = readRotationAngle(mysensor);
resetRotationAngle(mysensor);
%speed assigning
PERIOD = 1/8;
SPEED = 10;   
%motor init
mymotor1.Speed = SPEED;                    
mymotor2.Speed = -SPEED;

resetRotation(mymotor1);                   
resetRotation(mymotor2);
%motor loop
a = 1;
while (a<=d)
    start(mymotor1);                         
    start(mymotor2);
    a = readRotationAngle(mysensor);
end
stop(mymotor1);                             
stop(mymotor2);
end