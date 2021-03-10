clc
clear all
close all

inp=input('Press any key to start encoding : ')

objt=audiorecorder

recordblocking(objt,10)

play(objt)

aa=getaudiodata(objt);

figure,plot(aa)
title('audio speech recorded')

N =length(aa)
r =aa;
for i = 1:N                    
    if r(i) >= -0.1
        r(i) = 1;
    else
        r(i) = 0;
    end
end
key1 = char(inputdlg('encrypt key')); 
key2 = char(inputdlg('decrypt key')); 

if key1==key2
    out=1;
else
    out=aa(1:length(aa)).*aa;
end

[r_encrypt,r_length] = DES_Encrypt(r,key1); 
r_decrypt = DES_Decrypt(r_encrypt,key2,r_length); 

count = 100;                       
R = zeros(1,length(r)*count);
R_encrypt = zeros(1,length(r_encrypt)*count);
R_decrypt = zeros(1,length(r_decrypt)*count);
for i = 1:length(r)*count           
    R(i) = r(((i-1)-mod((i-1),count))/count+1);
end
for i = 1:length(r_encrypt)*count   
    R_encrypt(i) = r_encrypt(((i-1)-mod((i-1),count))/count+1);
end
for i = 1:length(r_decrypt)*count   
    R_decrypt(i) = r_decrypt(((i-1)-mod((i-1),count))/count+1);
end

figure,
plot(0:1/count:length(r_encrypt)-1/count,R_encrypt,'b','LineWidth',2)
title('encrypted')
play(0:1/count:length(r_encrypt)-1/count,R_encrypt);



figure
plot(aa.*out,'b','LineWidth',2)
% axis([0,500,-1,2])
title('recovered speeech')
grid on

