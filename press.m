function press()
    global ispress
    mylego = legoev3('USB');
    touch = touchSensor(mylego);
    ispress = readTouch(touch);
end
