function [Mt, Mn,S2] = WTSingleVelocity(V0, Theta0, ThetaTwist, MeanChord, c_grad, TipRadius,RootRadius, omega, B)
%2: WHOLE ROTOR - loop WTInducedCalcs to find the values for all radii,
%then integrate these to get the normal and tangential moment at the blade
%root.
global Hhub dhub Rmin Rmax c_mean M_rootmax F_Ymax rho_blade EI_blade Vmin Vmax A k w

N=19 %set radius node count
radius_delta=(TipRadius-RootRadius)/(N); %Increment in radius
S2=zeros(N,8); %Creat empty matrix to hold values

for j=1:N
    local_radius=RootRadius+((j-1)*radius_delta)+(radius_delta/2); % Calculate local radius from centre increment
    local_chord=c_mean+((local_radius-((TipRadius-RootRadius)/2))*c_grad); % Calculate tapered chord
    local_theta=Theta0+(local_radius*ThetaTwist);
    disp(j);
    [a_s1, adash_s1, phi_s1, Cn_s1, Ct_s1, tol_s1, i_s1]=WTInducedCalcs(0,0,V0,w,local_radius,local_theta,local_chord,3);
    S2(j,1:8)=[local_radius, a_s1, adash_s1, phi_s1, Cn_s1, Ct_s1, tol_s1, i_s1];
    
    %Calculate each moment
    

end

Mt=0;
Mn=0;

end