function str(d)
global strflag;
mylego = legoev3('USB'); 
%mylego = legoev3('bt','00165344463c');
m1 = motor(mylego, 'A');           
m2 = motor(mylego, 'B');              
wd = 5.5;
                            
PERIOD = 0.1;                               
SPEED = 20;                                 
P = 0.01;
rotd = ((d-5)/(pi*wd))*360;
m1.Speed = SPEED;                     
m2.Speed = SPEED;

resetRotation(m1);                    
resetRotation(m2);
a1 = readRotation(m1);
a2 = readRotation(m2);
start(m1);                            
start(m2);


lastR1 = 0;
lastR2 = 0;

while (a1<rotd && a2<rotd)     
    a1 = readRotation(m1);
    a2 = readRotation(m2);
    r1 = readRotation(m1);            
    r2 = readRotation(m2);            
    
    speed1 = (r1 - lastR1)/PERIOD;          
    speed2 = (r2 - lastR2)/PERIOD;
    
    diff = speed1 - speed2;                 
    m1.Speed = m1.Speed - int8(diff * P);
    
    lastR1 = r1;
    lastR2 = r2;
    
    pause(PERIOD);                        
   
end
stop(m1);                             % Stop motor 
stop(m2);
strflag = d;
end

