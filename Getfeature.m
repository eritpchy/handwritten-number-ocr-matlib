function feature = Getfeature(im)

[row,col] = find(im==0); %得到图片的上下左右的边界
y1 = min(row);
y2 = max(row);
x1 = min(col);
x2 = max(col);

w = x2 - x1;
h = y2 - y1;
if w / h < 0.6
    w = fix(h * 0.6);
    hw = fix(w / 2);
    xm = fix((x1 + x2) / 2);
    im = im(y1:y2, xm - hw: xm + hw);   %找到图片中手写数字的位置
else
    im = im(y1:y2, x1:x2);   %找到图片中手写数字的位置
end

[row,col] = size(im);  %手写数字的行和列
h = fix(row/6);   % fix是为了取整
w = fix(col/6);

count = 0;
k=1;
feature = zeros(1,36);

for i=1:1:6 %从第一行开始
    for j=1:1:6  %从第一列开始
        for m=(i-1)*h+1:i*h
            for n=(j-1)*w+1:j*w
                if im(m,n)==0
                    count=count+1;
                end
            end
        end
        feature(k)=count/(h*w);  %第k个特征分量
        count=0;
        k=k+1;
    end
end
end