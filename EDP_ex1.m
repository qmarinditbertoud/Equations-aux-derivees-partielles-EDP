clear all;
close all;


%intervalle spatial
h=0.05;
xmin=0;
L=1;
x=[xmin:h:L]';
n=length(x);


%intervalle temporel
tmin=0;
tmax=0.13;
tau=0.00124;%pour instable prendre tau=0.00127
t=tmin:tau:tmax;
m=length(t);

r=tau/(h.^2);

%fonction a t=0
g=@(x)(1-abs((2*x)-1));
F=g(x);
%%conditions aux limites
F(1)=0;
F(n)=0;

figure(1);
plot(x,F);%affichage de la fonction à t=0 
title('equation de la chaleur');
xlabel('x');
ylabel('temperature');
hold on;

%Matrice tri-diagonale M de dimension nxn
M=diag((1-2*r)*ones(1,n)) + diag(r*ones(1,n-1),1) + diag(r*ones(1,n-1),-1);

j=0;%valeurs permettant de stocker 

for i=1:m
    
    
    
    F=M * F;%equation de la chaleur discrÃ©tisÃ©e
    F(n)=0;
    F(1)=0;
    
    if(mod(i,7)==0)%pour prendre que les multiple de 7
        if(mod(i,2)~=0)%pour prendre que les cas impaires
            j=j+1;
            t1(j)=i*0.0012;%calcul permettant de savoir à quel temps se refaire l'itération 
            plot(x,F);
            Legend{j}=strcat('t=', num2str(t1(j)),'s');%affichage du temps pour chaque itération
            pause(0.5);
        end
     
         
    end

end
legend(Legend);

