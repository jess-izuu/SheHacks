
function r = masstoradius(m,shape)
% This function calculate the radius of a piece of meat given the density,
% the geometry and the mass of the meat. 
p = 1; % density of the meat in (g/cm^3)
m_g = m*(453.59237); %g  %converting the mass from lbm to g
V = m_g./p; %cm^3 % finding the volume of the meat
 
if shape == 2             %shape=2 sphere
    %V = 4/3*pi*r^3
    r = (3/(4*pi).*V).^(1/3); %cm
elseif shape == 1         %shape=1 cylindar
    %assuming a tenderloin length h = 6 in
    %V = h*pi*r^2
    h = 6*2.45; %cm
    r = sqrt(V./(h*pi)); %cm
end
end
