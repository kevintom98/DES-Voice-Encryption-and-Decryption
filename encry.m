clc
clear all
close all

objt=audiorecorder

recordblocking(objt,5)

play(objt)

aa=getaudiodata(objt);

figure,plot(aa)


blocksize=8;

inp=reshape(aa,200,200);

host=inp+0.8;



tic

x=uint8(host+128); 
figure,imshow(x,[])

[a b c]=size(x); 
N=a*b; 

m(1)=0.8; 
 
for i=1:N-1 
    m(i+1)=4*m(i)-4*m(i)^2; 
end 
m=mod(1000*m,200); 
m=uint8(m); 
n=1; 
for i=1:a 
    for j=1:b 
        I1= x;


        e(i,j)=bitxor(m(n),x(i,j)); 
        
        
        n=n+1; 
    end 
end

figure,imshow(e)

imwrite(e,'e.jpg');

bkjbjb
% clear;
% clc; 
e=imread('e.jpg')
x1=uint8(e); 

[a1 b1 c1]=size(x1); 
N1=a1*b1; 
m1(1)=0.8; 
for i=1:N1-1 
    m1(i+1)=4*m1(i)-4*m1(i)^2; 
end 
m1=mod(1000*m1,256); 
m1=uint8(m1); 
n1=1; 
for i=1:a1 
    for j=1:b1 
       

        e1(i,j)=bitxor(m1(n1),x1(i,j)); 
        
        
        
        
        n1=n1+1; 
    end 
end 

    

figure,imshow(e1)




s ='MATLAB'
val=double(s)
nume=reshape(val, 3, 5)
m = [1 5 3; 2 11 8; 4 24 21]

nume=nume-32
ncoded=mod(m*(nume),95)+32
scoded=reshape(char(ncoded),1,15)
sdecoded = reshape(double(scoded),3,5)
ndecoded = mod (inv(m)*(sdecoded-32), 95) + 32
sdecoded = reshape (char(ndecoded), 1, 15)
