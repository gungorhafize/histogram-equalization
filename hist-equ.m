>> GirlIm =imread('girl.jpg');
GirlIm  =  rgb2gray(GirlIm);
%Aralığı [0-255] olarak belirliyoruz
bin=255;
%Histogramını buluyoruz
Value=reshape(GirlIm,[],1);

Value=double(Value);

Im=hist(Value,0:bin);
%Sonucu piksel sayısına bölüyoruz

Output=Im/numel(GirlIm);
%Kümülatif toplamı hesaplıyoruz
CSum=cumsum(Output);
%S = T (R) dönüşümünü S ve R aralığında [0 1] yapıyoruz.
HistIm=CSum(GirlIm+1);
%Görüntüyü uint8'ye dönüştürüyoruz

HistIm=uint8(HistIm*bin);
f  =  figure;
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

>> 