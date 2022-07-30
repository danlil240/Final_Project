clear
ard=arduino('COM6','Uno');
configurePin(ard, "A0", "AnalogInput");
i=1;
t=zeros(300,1);
val=t;
while(i<=length(t))
val(i)=readVoltage(ard,"A0");
t(i)=i;
i=i+1;
end
plot(t,val);