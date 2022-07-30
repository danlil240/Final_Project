clc

global a;
% 
% if ~isempty(instafind)
% fclose(instrfind);
% delete(instrfind);
% end

% The above if-condition will help you find the COM port.

a= arduino();
%make "a" object of arduino

interv = 200;
%defining time

init_time = 1;
%initial time

x=0;

while (init_time<interv)
  b=readVoltage(a,'A0');
%reading voltages from pin A0 , reads voltages not adc value ,
%voltages = (ADC*5)/1024
  x=[x,b];
  plot(x)
  grid ON
  init_time=init_time+1;
  drawnow
end

%the above loop will run for 200 values, if you want to run it for more time change the interv value  
  