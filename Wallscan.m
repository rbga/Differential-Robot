function Wallscan()
global ispress;
global ori;
global strflag;
global rvflag;
global pos;
global x;
global y;
global objectflag;
press();
j=0;
%i=0;
%x[];
while(ispress == 0)
    orientation();
    %odometry
        pos = double(pos + strflag);
        ang = double(ori);
        %ang = double(oriangle);
        %lastori = ori;
        
        
        %odometry plotting
        %x[i+1] = x[i] + (pos * cosd(ang));
        %y[i+1] = y[i] + (pos * sind(ang));
        x = pos * cosd(ang);
        y = pos * sind(ang);
        xl = x;
        yl = y;
        odom(j+1, 1) = x;
        odom(j+1, 2) = y;
        j = j+1;
        plot(odom(:,2), odom(:,1), 'r*');
        %plot(y[], [], 'r', 'Linewidth' ,4 );
        drawnow
        hold on
    str(20);
    mapping();
    while(objectflag == 1)
        rv(10)
        left(30)
        mapping();
    end
    press();
end
x = x + xl; y = y + yl;
rv(10); pos = double(pos + rvflag);
left(90);ang = double(ori);%double(oriangle + rtflag); disp('Angle');disp(ang);%ang = double(ori);
end
%end

