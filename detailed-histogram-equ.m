>> GirlIm=imread('girl.jpg');

numberofpixels=size(GirlIm,1)*size(GirlIm,2);


HistIm=uint8(zeros(size(GirlIm,1),size(GirlIm,2)));
freq=zeros(256,1);

probf=zeros(256,1);

probc=zeros(256,1);

cum=zeros(256,1);

output=zeros(256,1);


%Herbir pixel için sýklýk hesaplanmasý
%probf ile herbirinin bulunma olasýðýnýn hesaplanmasý.


for i=1:size(GirlIm,1)

    for j=1:size(GirlIm,2)

        value=GirlIm(i,j);

        freq(value+1)=freq(value+1)+1;

        probf(value+1)=freq(value+1)/numberofpixels;

    end

end


sum=0;

bin=255;


%Kümülatif daðýlým olasýlýðý hesaplanmasý. 

for i=1:size(probf)

   sum=sum+freq(i);

   cum(i)=sum;

   probc(i)=cum(i)/numberofpixels;

   output(i)=round(probc(i)*bin);

end

for i=1:size(GirlIm,1)

    for j=1:size(GirlIm,2)

            HistIm(i,j)=output(GirlIm(i,j)+1);

    end

end

f = figure;
s1  =  subplot(2,2,1);
  imshow(GirlIm);
title('Original  Image');
s2  =  subplot(2,2,2);
  imhist(GirlIm);
title('Histogram');
s2  =  subplot(2,2,3);
  imshow(HistIm);
title('Histogram  equalization  of  original  Image');
s2  =  subplot(2,2,4);
  imhist(HistIm);
title('Histogram');
