
from pyfirmata2 import Arduino
import time
from math import pi,cos,sin,tanh,exp
import numpy as np
#PORT = Arduino.AUTODETECT
# PORT = '/dev/ttyACM0'
PORT = 'COM7'
ctrlLawFile=open('ctrlLaw.txt','r')
b=ctrlLawFile.read()
ctrlLawFile.close()
dataOutFile=open('dataOutFile.txt','w')

class signalProcess:
    def __init__(self):
        self.samplingRate = 1000 #Hz
        self.timestamp = 0
        self.board = Arduino(PORT)

    def start(self):
        self.board.analog[0].register_callback(self.actuationCallback)
        self.board.samplingOn(1000 / self.samplingRate)
        self.board.analog[0].enable_reporting()

    def actuationCallback(self, data):
        S0=data
        S1=1
        fOut=eval(b)
        #print("%f,%f" % (self.timestamp, fOut))
        dataOutFile.write(str(fOut))
        dataOutFile.write("\n")
        self.timestamp += (1 / self.samplingRate)

    def stop(self):
        self.board.samplingOff()
        self.board.exit()

signalProcess = signalProcess()
signalProcess.start()
time.sleep(5)
signalProcess.stop()
ctrlLawFile.close()
print("finished")