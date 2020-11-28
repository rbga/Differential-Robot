function obstacle()
global oobjectflag
mylego = legoev3('USB');
mymotor1 = motor(mylego, 'C');
mysonicsensor = sonicSensor(mylego);
SPEED = 35;
resetRotation(mymotor1);
a = readRotation(mymotor1);
disp(a);
    d = readDistance(mysonicsensor); disp(d);
    if (d<0.15)
        oobjectflag = 1;
    else 
        oobjectflag = 0;
        
    end
end

