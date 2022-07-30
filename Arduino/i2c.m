%%

clear
format long
a = arduino("COM6", "Uno","Libraries","I2C")

dev = device(a,'I2CAddress','0x08')
% write(dev,"0.10");
configurePin(a,'A0','AnalogInput')
% configurePin(a,'D3','PWM')
% writePWMVoltage(a,'D3',5);
% writePWMDutyCycle(a,'D3',0.333333);
i=0;
lastVal=0;
while(1)
    Vin=readVoltage(a,'A0');
    val=Vin/5;
    if abs(lastVal- val)>0.01
        lastVal=val;
        val=strcat(num2str(val),'0');
        write(dev,val);
        
    end
    
    pause(.05)
end
clear a
clear dev