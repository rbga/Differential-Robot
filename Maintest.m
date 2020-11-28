prompt = 'Input X';
x = str2double(inputdlg(prompt));
prompt = 'Input Y';
y = str2double(inputdlg(prompt));

h = hypot(x, y);
disp(h);
th = radtodeg(asin(y/h)); disp(th);
%spd = th/3.4;% disp(spd);
sp = round(th); disp(sp);
d =[0, 0; x, y];
dist = pdist(d)/7.5;
%%
rt(sp)
st(dist)

nd = [x, y; 0, 0];
hdist = pdist(nd)/7.5;
hsp = th + 125; disp(hsp);
%hspd = hang/3.4;
%hsp = round(hang);

rethome(hdist, hsp)

function rethome(newd, newang)
rt(newang)
st(newd)
end
