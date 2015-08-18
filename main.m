% Ayush Aggarwal
% Lab 11
% 11177
% Heat map by density calculation

% Reading Lidar data 
D = dlmread('lab_11.txt','',1,0);

D = sortrows(D);

% taking XYZ
X = D(1:20000,1);
Y = D(1:20000,2);
Z = D(1:20000,3);

% density
size = 2;

% for heat map
densitycount=zeros(20000,1);
count=0;

for l=1:1:20000
count=0;
fprintf('density %d \n',l);
    for k=1:1:20000
        if ((X(l)-size)<X(k))&&(X(k)<(X(l)+size)) && ((Y(l)-size)<Y(k))&&(Y(k)<(Y(l)+size)) && ((Z(l)-size)<Z(k))&&(Z(k)<(Z(l)+size))
        count=count+1;
        end
    end
densitycount(l)=count;
end

% heatmap

x=linspace(min(X),max(X),150);
y=linspace(min(Y),max(Y),150);
[X1,Y1]=meshgrid(x,y);
F=TriScatteredInterp(X,Y,densitycount);
contourf(X1,Y1,F(X1,Y1),100,'LineColor','none');
colorbar;



