
 
## SONIC on virtual machine for Windows
 
#### 1. Download and install QEMU for windows 
Go to: https://qemu.weilnetz.de/w64/ to download qemu-w64-setup-xxx.exe and install it to your windows machine.  

![](https://github.com/kannankvs/kvskSONiC/blob/master/images/VM_image1.png)

 
#### 2. Download sonic prebuilt image: Go to: https://sonic-jenkins.westus2.cloudapp.azure.com/job/vs/job/buildimage-vs201911/lastSuccessfulBuild/artifact/target/ and download sonic-vs.img.gz  
 
![](https://github.com/kannankvs/kvskSONiC/blob/master/images/VM_image2.png)
 
Extract sonic-vs-img.gz to a folder in your machine. Example: d:\sonic-vs.img 
 
#### 3. Start sonic image 
Open a command line and run the command:  
"c:\Program Files\qemu\qemu-system-x86_64.exe" -name sonic-simulator_1 -m 2048M -smp cpus=2 boot order=d -drive file=d:\sonic-vs.img,index=0,media=disk,id=drive0 -serial telnet:127.0.0.1:5001,server,nowait -monitor tcp:127.0.0.1:44001,server,nowait -device e1000,netdev=net0 -netdev user,id=net0 
 
![](https://github.com/kannankvs/kvskSONiC/blob/master/images/VM_image3.png)
 
Login with the account: admin/YourPaSsWoRd 
