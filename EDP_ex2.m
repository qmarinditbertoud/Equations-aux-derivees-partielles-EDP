clear all;
close all;


%intervalle spatial
h=0.02;
xmin=0;
L=5;
x=[xmin:h:L]';
n=length(x);


%intervalle temporel
tmin=0;
tmax=10;
tau=0.005;%pour instable prendre tau=0.00127
t=tmin:tau:tmax;
m=length(t);
%
c=1;
r=(((c*tau)/h).^2)

%vitesse de propagation



g=@(x,mu,sigma)(exp(-((x-mu).^2)/(2*sigma^2))); % profil gaussien
G=g(x,2.5,0.1);
K=zeros(length(G),1);



%%conditions aux limites






%Matrice tri-diagonale M
M=diag(2*(1-r)*ones(1,n)) + diag(r*ones(1,n-1),1) + diag(r*ones(1,n-1),-1);

F0=G;
F1=F0;


figure(1);
plot(x,G);
for i=0:1:m
    F(1)=0;
    F(n)=0;
    F=(M * F1 )- F0;%equation de la chaleur discrétisée
    F0=F1;

% affichage du profil initial de l'onde
 
    plot(x,F);
    axis([0,L,-1,1]);
    title('Equation d''ondes');
    xlabel('x');
    pause(0.001);
    F1=F;

end
