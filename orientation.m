function orientation()
    global ori
    mylego = legoev3('USB')
    gyro = gyroSensor(mylego, 1);
    ori = readRotationAngle(gyro);
    disp(ori);
end