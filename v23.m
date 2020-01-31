%ʵ��2.3�������ͨ�˲� ideal high pass filter
clear;
fid = fopen('Eimage-007.img','rb'); 
    C=fread(fid,65536,'float64');
fclose(fid);
for i=1:256
    for j=1:256
        A(i,j)=C((i-1)*256+j);  
    end
end
%A=A';
figure;
maxmax=max(max(A));
minmin=min(min(A));
imshow(A,[minmin,maxmax]);
title('ԭʼͼ��');

%���ø���Ҷ�任
f=fft2(A);
%���ݾ���ƽ��
g=fftshift(f);

[M,N]=size(f);
n1=floor(M/2);
n2=floor(N/2); 
%d0=15
d0=15;
for i=1:M
    for j=1:N
        d=sqrt((i-n1)^2+(j-n2)^2);
        if d>=d0
            h=1;
        else
            h=0;
        end
        g(i,j)=h*g(i,j);
    end
end
g=ifftshift(g);
g=real(ifft2(g));
figure;
maxmax1=max(max(g));
minmin1=min(min(g));
imshow(g,[minmin1,maxmax1]);
title('�������ͨ�˲������ͼ��');

