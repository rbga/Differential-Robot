
%%
rt(90)
function rt(s)
%mylego = legoev3('bt','00165344463c');
mylego = legoev3('USB');
mymotor1 = motor(mylego, 'A');             
mymotor2 = motor(mylego, 'B');    
gyro = gyroSensor(mylego, 1)
PERIOD = 1/8;                            
SPEED = 25;
mymotor1.Speed = SPEED;                    
mymotor2.Speed = -SPEED;
resetRotation(mymotor1);                   
resetRotation(mymotor2);
pause(PERIOD);
resetRotationAngle(gyro);
angle = readRotationAngle(gyro);
disp(angle);
while angle<s
    angle = readRotationAngle(gyro)
    start(mymotor1);                         
    start(mymotor2);
    if (angle == s-10)
        break
    else
        continue
    end
end
stop(mymotor1);                             
stop(mymotor2);
end
%%
