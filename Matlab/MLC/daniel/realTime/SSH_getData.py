import paramiko
import sys

ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.connect("192.168.1.115", port = 22, username = "pi",password="054777")

def getData():
    ftp_client=ssh_client.open_sftp()
    ftp_client.get("/home/pi/Documents/test.txt","C:/Users/danli/Downloads/a.txt")
    ftp_client.close()
    
def readData():
    ftp_client=ssh_client.open_sftp()
    jFile=ftp_client.file("/home/pi/MLC/ctrlLaw.txt","r")
    j=jFile.read()
    ftp_client.close()
    return j

j=readData()

print("done")