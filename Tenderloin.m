%this code calculates the solution to the unsteady state heat transfer
%problem of the form dT/dt=alpha*d^2T/dx^2 with initial conditions T=295 at
%all locations and boundary conditions that the problem is symmetric (no
%flux at the center), and that the flux at the surface is equal to the heat
%transfer coefficient, h, multiplied by the difference between the surface
%temperature and the outside air temperature
%m defines geometry, m=1 for cylinder and m=2 for sphere
m = 1;
mass = 3:1:14;
T = ones(100,100,length(mass));
indexes = ones(1,length(mass));
time = ones(1,length(mass));
for i=1:length(mass)
    R = masstoradius(mass(i),m);    
    t = linspace(0,10,100);
    r = linspace(0,10,100);
    sol = pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,r,t);
    T(:,:,i) = sol(:,:,1);
    indexes(i) = indexlocator(333,T(:,1,i));
    time(i) = t(indexes(i));
end
 newt=T(:,:,8);
surf(r,t,newt);
 
 
% time = time.*60;
% coeff =polyfit(mass,time,1);
% curve = polyval(coeff,mass);
% plot(mass,time,'ro',mass,curve,'-k')
% xlabel('mass (lbs)')
% ylabel('time (mins)')
% title('Cooking times for different sizes of tenderloin')
% hold on
% plot(mass,15.*mass)
% legend('Data Points','Fitted line','Package model','Location','Northwest')
% correlation= corrcoef(time,curve);
% r2= correlation(2,1)
% model= [mass;time]
% package= [mass;15.*mass]

%begin morgan comments
%temperature= T(indexes(i));

%surf(t,r,T)

%(mass,time,T)
%[X,Y,Z]=meshgrid(mass,time,T);
%Z=griddata(mass,time,T, X,Y);
%surf(mass,time,T);
%plot(time,T)

function [pl,ql,pr,qr] = pdex1bc(rl,Tl,rr,Tr,t)
%this function defines the boundary conditions (left and right)
%left is at center, where flux is zero
%right is at surface where flux is equal to convective heat transfer
%hk is h/k in units of inverse in
alpha=11.6;
hk=0.148;
pl = 0;
ql = 1;
pr = alpha*hk*(Tr-400);
qr = 1;
end


function T0 = pdex1ic(r)
%this function defines the initial condition T0 in degrees K
T0 = 295;
end

function [c,f,s] = pdex1pde(r,t,T,DTDr)
%alpha is k/(Cp*rho) in units of in^2/hr
alpha=11.6;
c = 1;
f = alpha*DTDr;
s = 0;
end
