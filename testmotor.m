prompt = 'Input Distance(cms)';
dist = str2double(inputdlg(prompt));
t=(dist/7.5);
disp(t);
st(t)

function st(d)
%Connection and motor assigning
mylego = legoev3('bt','00165344463c');
%mylego = legoev3('Bluetooth', 'COM3');
%mylego = legoev3('USB')
mymotor1 = motor(mylego, 'A');     
mymotor2 = motor(mylego, 'B');
mysensor = gyroSensor(mylego, 1)
angle = readRotationAngle(mysensor)
disp('THe angle is,'); disp(angle);
%speed assigning
PERIOD = 1/8;
SPEED = 50;   
%motor init
mymotor1.Speed = SPEED;                    
mymotor2.Speed = SPEED;

resetRotation(mymotor1);                   
resetRotation(mymotor2);

pause(PERIOD);
%motor loop
for i=0:d
    start(mymotor1);                         
    start(mymotor2);
     
    rotation1=readRotation(mymotor1)
        disp(rotation1)
    rotation2 = readRotation(mymotor2)
        disp(rotation2)
end
pause(d);
stop(mymotor1);                             
stop(mymotor2);

end
function rv(d)
%Connection and motor assigning
mylego = legoev3('bt','00165344463c');
mymotor1 = motor(mylego, 'A');             
mymotor2 = motor(mylego, 'B');    
%speed assigning
PERIOD = 1/8;
SPEED = -50;   
%motor init
mymotor1.Speed = SPEED;                    
mymotor2.Speed = SPEED;
resetRotation(mymotor1);                   
resetRotation(mymotor2);
pause(PERIOD);
%motor loop
for i=0:d
    start(mymotor1);                         
    start(mymotor2);
    rotation1=readRotation(mymotor1)
        disp(rotation1)
    rotation2 = readRotation(mymotor2)
        disp(rotation2)
end
pause(d);
stop(mymotor1);                             
stop(mymotor2);
end