import paramiko
import sys

ssh_client = paramiko.SSHClient()
ssh_client.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh_client.connect("192.168.1.115", port = 22, username = "pi",password="054777")
    
def setData(law):
    ftp_client=ssh_client.open_sftp()
    ctrlLaw=ftp_client.file("/home/pi/MLC/ctrlLaw.txt","w")
    ctrlLaw.write(law)
    ftp_client.close()
    
setData(sys.argv[1])

print("done")