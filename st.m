function st(d)
d = 10;
mylego = legoev3('bt','00165344463c');
%mylego = legoev3('USB');
m1 = motor(mylego, 'A');     
m2 = motor(mylego, 'B');
SPEED1 = 25;
SPEED2 = 25;
wd = 5.5;
m1.Speed = SPEED1;                    
m2.Speed = SPEED2;
resetRotation(m1);                   
resetRotation(m2);
a1 = readRotation(m1);
a2 = readRotation(m2);
rotd = ((d-5)/(pi*wd))*360;
Kp = 0.8;
Ki = 0;
Kd = 0.01;
lastR1=0; lastR2=0;
lasterror = 0;
integral = 0;
%gyro = gyroSensor(mylego);
%resetRotationAngle(gyro);
while (a1<rotd && a2<rotd)
    a1 = readRotation(m1)
    a2 = readRotation(m2);
    %oangle = readRotationAngle(gyro);
    
        SPEED1 = 20;
        SPEED2 = 25;
        m1.Speed = SPEED1;                    
        m2.Speed = SPEED2;
   
    start(m1);
    start(m2);
    SPEED1 = 20;
        SPEED2 = 20;
        m1.Speed = SPEED1;                    
        m2.Speed = SPEED2;
      
   % if (oangle>0)
     %   SPEED2 = SPEED2 + 1;
    %    m2.Speed = SPEED2;
   % elseif (oangle<0)
  %      SPEED1 = SPEED1 + 1;
 %       m1.Speed = SPEED1;    
%    else
     %   continue
    %end
    %PID Calculations
    r1 = readRotation(m1);
    r2 = readRotation(m2);
    sp1 = (r1 - lastR1)/0.1;
    sp2 = (r2 - lastR2)/0.1;
    
        if (sp1>sp2)
            error = sp1 - sp2;
        else
            error = sp2 - sp1;
        end
        
    integral = integral + (error*0.1);
    derivative = (error - lasterror)/0.1;
    pid = (Kp * error) + (Ki * integral) + (Kd * derivative);
        
        if (error>0)
            SPEED2 = SPEED2 + pid; 
            SPEED1 = SPEED1 - pid;
                
                      if (SPEED2<0)
                            SPEED2 = SPEED2 * (-1);
                        elseif (SPEED1<0)
                            SPEED1 = SPEED1 * (-1);
                        else
                            continue
                        end
                %if (SPEED1>SPEED2)
                 %   diff = SPEED1-SPEED2;
                  %  SPEED2 = SPEED2 + diff;
               % elseif (SPEED2>SPEED1)
                %    diff = SPEED2 - SPEED1;
                 %   SPEED1 = SPEED1 + diff;
                %end
        
                        
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
               % if (SPEED1>SPEED2)
                %    diff = SPEED1-SPEED2;
                 %   SPEED2 = SPEED2 + diff;
                %elseif (SPEED2>SPEED1)
                 %   diff = SPEED2 - SPEED1;
                  %  SPEED1 = SPEED1 + diff;
                %end
         
       
    m1.Speed = SPEED1;                    
    m2.Speed = SPEED2;
    lastR1 = r1;
    lastR2 = r2;
    lasterror = error;
    
    a1 = readRotation(m1);
    a2 = readRotation(m2);
end

stop(m1);
stop(m2);
clear all;
end