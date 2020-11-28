global pos;
global x;
global y;
global objectflag;
x = 0;
y = 0;
pos = 0;

rt(30)
st(10)
obstracle()
if (objectflag == 1)
    rv(10)
    rt(90)
    str(10)
    str(10)
    left(90)
    obstracle()
    if (objectflag ==1)
        rt(90)
        str(10)
        str(10)
    else
        continue
    end
    rt(90)
    str(10)
    str(10)
    left(90)
    str(10)
    str(10)
    left(90)
    str(90)
    str(90)
    rt(90)
    str(10)
else
    continue
end

st(30)
rt(180)
st(40)
left(270)