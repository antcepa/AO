clear;
clf;
clc;
ind = 1;
vc = 1;
vh = 2;

ptaki = double(imread('ptaki.jpg'))/255;  

%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(ptaki);

red = ptaki(:,:,1);
green = ptaki(:,:,2);
blue = ptaki(:,:,3);

% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(red);
% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(green);
% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(blue);

red(red > 0.3) = 0;
blue = im2bw(blue,0.6);
red = im2bw(red,0.15);

% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(red);
% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(green);
% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(blue);

ptaki1 = 2  - red - blue;
% imshow(ptaki1);
% % subplot(vc,vh,ind);
% imhist(blue);
% ind = ind +1;


ptaki2 = bwmorph(ptaki1,'clean');
ptaki2 = bwmorph(ptaki2,'close');
ptaki2 = bwmorph(ptaki2,'majority');


% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(ptaki1);
% subplot(vc,vh,ind);
% ind = ind +1;
% imshow(ptaki2);

ptaki3 = bwlabel(ptaki2);


kaczka1 = ptaki3 == 1; 
%wyciecie pierwszej kaczki
% subplot(vc,vh,ind);
% imshow(kaczka1);
ind = ind +1;
% imshow(kaczka1);

%zblizenie na wycieta kaczke
ptaki5 = regionprops(kaczka1,'all');
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(ptaki5.Image);


Funkcja= {@AO5RCircularityL,@AO5RCircularityS,@AO5RMalinowska,@AO5RFeret,@AO5RDanielsson,@AO5RHaralick,@AO5RShape,@AO5RBlairBliss};
wynik = zeros(max(max(ptaki3)),length(Funkcja));

for i = 1:max(max(ptaki3))
    j = 1;
    for f = Funkcja
        k1 = ptaki3 == i; 
        a = f{1}(k1);
        wynik(i,j) = a;
        j = j+1;
    end
end

s = std(wynik);
m = mean(wynik); 
%wzor : w = (w-m)/s
w = (wynik - repmat(m,[max(max(ptaki3)),1]))./repmat(s,[max(max(ptaki3)),1]);
w = abs(w)>2;

%subplot(vc,vh,ind);
%ind = ind +1;
% imshow(w);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% LAB 07 %%%%%%%%%%%%%%%%%%%%%%%%%%%

Z = max(w')
Z = 1 - Z;
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(Z);
kaczki = [] ;
l2 = [];
%klasyfikator obiektu
for i = 1:length(Z)
    kaczka1 = ptaki3 == i; 
    kaczki = [kaczki, regionprops(kaczka1,'all'),regionprops(imerode(kaczka1,ones(1)),'all'),regionprops(imdilate(kaczka1,ones(1)),'all'),regionprops(imrotate(kaczka1,25),'all') ];
    l2 = [l2, ones(1,4)*Z(i)];
end
kaczki
%subplot(vc,vh,ind);
%ind = ind +1;
%imshow(l2);

wynik1 = zeros(length(kaczki),length(Funkcja));
j = 1;

for i = 1:length(kaczki)
    j = 1;
    for f = Funkcja
        k1 = kaczki(i).Image; 
        wynik1(i,j) = f{1}(k1);
        j = j+1;
    end
end
 wynik1;

subplot(vc,vh,ind);
ind = ind +1;
% imshow(wynik1);