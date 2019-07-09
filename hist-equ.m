>> GirlIm =imread('girl.jpg');
GirlIm  =  rgb2gray(GirlIm);
%Aralýðý [0-255] olarak belirliyoruz
bin=255;
%Histogramýný buluyoruz
Value=reshape(GirlIm,[],1);

Value=double(Value);

Im=hist(Value,0:bin);
%Sonucu piksel sayýsýna bölüyoruz

Output=Im/numel(GirlIm);
%Kümülatif toplamý hesaplýyoruz
CSum=cumsum(Output);
%S = T (R) dönüþümünü S ve R aralýðýnda [0 1] yapýyoruz.
HistIm=CSum(GirlIm+1);
%Görüntüyü uint8'ye dönüþtürüyoruz

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