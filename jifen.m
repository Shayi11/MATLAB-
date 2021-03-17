function [Output1,Output2] = jifen(Input1,Input2)
%jifen=�Ʒ� 
%   ���Ǽ���ÿ��վ��ĵ÷�
vi0 = Input1; % vi0��վ���������������������Ŷ~
sxxian=Input2;

%ʵ��vij,P1,P2�ļ���
for m=1:10
    for n=1:3
        vij(m,n)=abs(sxxian(m,2*n)-sxxian(m,2*n-1));
        P1ij(m,n)=abs(vi0(n)-0.5*(sxxian(m,2*n)+sxxian(m,2*n-1)))-0.5*(sxxian(m,2*n)-sxxian(m,2*n-1));
        P2ij(n)=abs(vi0(n)-0.5*sxxian(end,2*n))-0.5*sxxian(end,2*n);
    end
end

%�������ϵ��Kij
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

%ȷ���ۺϹ�����Kj
for m=1:10
    Kj(m)=0.2493*Kij(m,1)+0.1571*Kij(m,2)+0.5936*Kij(m,3);
end

%ȷ��������
[maxzhi,hang]=max(Kj);

Output1=maxzhi;
Output2=hang;

end

