function [Output1,Output2] = jifen(Input1,Input2)
%jifen=计分；就是物元分析的打分  
vi0 = Input1; % vi0是待评价物元的指标项
sxxian=Input2;% 你自己创建的物元经典域

%实现vij,P1,P2的计算
for m=1:10
    for n=1:3%本项目的物元仅有三个指标
        vij(m,n)=abs(sxxian(m,2*n)-sxxian(m,2*n-1));
        P1ij(m,n)=abs(vi0(n)-0.5*(sxxian(m,2*n)+sxxian(m,2*n-1)))-0.5*(sxxian(m,2*n)-sxxian(m,2*n-1));
        P2ij(n)=abs(vi0(n)-0.5*sxxian(end,2*n))-0.5*sxxian(end,2*n);
    end
end

%计算关联系数Kij
for m=1:10
    for n=1:3
        if vi0(n)>=sxxian(m,2*n-1) && vi0(n)<=sxxian(m,2*n)
            Kij(m,n)=-(P1ij(m,n)/vij(m,n));
        else
            if P1ij(m,n)~=0
                Kij(m,n)=P1ij(m,n)/(P2ij(n)-P1ij(m,n));
            else P1ij(m,n)==0
                Kij(m,n)=-P1ij(m,n)-1;
            end
        end
    end
end

%确定综合关联度Kj
for m=1:10
    Kj(m)=0.2493*Kij(m,1)+0.1571*Kij(m,2)+0.5936*Kij(m,3);
end

%确定出评分
[maxzhi,hang]=max(Kj);

Output1=maxzhi;
Output2=hang;

end

