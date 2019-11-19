function feature = Getfeature(im)

[row,col] = find(im==0); %�õ�ͼƬ���������ҵı߽�
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
    im = im(y1:y2, xm - hw: xm + hw);   %�ҵ�ͼƬ����д���ֵ�λ��
else
    im = im(y1:y2, x1:x2);   %�ҵ�ͼƬ����д���ֵ�λ��
end

[row,col] = size(im);  %��д���ֵ��к���
h = fix(row/6);   % fix��Ϊ��ȡ��
w = fix(col/6);

count = 0;
k=1;
feature = zeros(1,36);

for i=1:1:6 %�ӵ�һ�п�ʼ
    for j=1:1:6  %�ӵ�һ�п�ʼ
        for m=(i-1)*h+1:i*h
            for n=(j-1)*w+1:j*w
                if im(m,n)==0
                    count=count+1;
                end
            end
        end
        feature(k)=count/(h*w);  %��k����������
        count=0;
        k=k+1;
    end
end
end