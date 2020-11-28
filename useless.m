st(10)


function st(d)
%Connection and motor assigning
mylego = legoev3('bt','00165344463c');
%mylego = legoev3('Bluetooth', 'COM3');
%mylego = legoev3('USB')
mymotor1 = motor(mylego, 'A');     
mymotor2 = motor(mylego, 'B');
%mysensor = gyroSensor(mylego, 1)
%angle = readRotationAngle(mysensor)
%disp('THe angle is,'); disp(angle);
%speed assigning
%PERIOD = 1/8;
SPEED1 = 50;
SPEED2 = 50;
%motor init
mymotor1.Speed = SPEED1;                    
mymotor2.Speed = SPEED2;
resetRotation(mymotor1);                   
resetRotation(mymotor2);
pause(0.1);
Kp = 1;
Ki = 0.003;
Kd = 0.01;
lastR1=0; lastR2=0;
lasterror = 0;
integral = 0;
%motor loop
for i=0:d
    start(mymotor1);
    start(mymotor2);
    r1=readRotation(mymotor1);
    r2 = readRotation(mymotor2);
    sp1 = round((r1-lastR1)/0.1);
    sp2 = round((r2-lastR2)/0.1);
    if (sp1>sp2)
        error = sp1 - sp2;
    else
        error = sp2 - sp1;
    end
    integral = integral + (error * 0.1);
    derivative = (error - lasterror)/0.1;
    pid = (Kp * error) + (Ki * integral) + (Kd * derivative);
    if (error>0)
        SPEED2 = SPEED2 + pid; 
        SPEED1 = SPEED1 - pid;
        if (SPEED1>SPEED2)
            diff = SPEED1-SPEED2;
            SPEED2 = SPEED2 + diff;
        elseif (SPEED2>SPEED1)
            diff = SPEED2 - SPEED1;
            SPEED1 = SPEED1 + diff;
        end
        
        if (SPEED2<0)
            SPEED2 = SPEED2 * (-1);
        elseif (SPEED1<0)
            SPEED1 = SPEED1 * (-1);
        else
            continue
        end
    else
        SPEED1 = SPEED1 + pid;
        SPEED2 = SPEED2 - pid;
         if (SPEED2<0)
            SPEED2 = SPEED2 * (-1);
        elseif (SPEED1<0)
            SPEED1 = SPEED1 * (-1);
        else
            continue
         end
    end
    mymotor1.Speed = SPEED1;                    
    mymotor2.Speed = SPEED2;
    lasterror = error;
    pause(0.1);
end
stop(mymotor2, 0);
stop(mymotor1, 0);

end
