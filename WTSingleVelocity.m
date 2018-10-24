function [MT, MN] = WTSingleVelocity(V0, Theta0, ThetaTwist, MeanChord, cgrad, TipRadius,RootRadius, omega, B)
%2: WHOLE ROTOR - loop WTInducedCalcs to find the values for all radii,
%then integrate these to get the normal and tangential moment at the blade
%root.

N=18; %set radius node count
radius_delta=(TipRadius-RootRadius)/N; %Increment in radius
S1=zeros(N,7); %Creat empty matrix to hold values

for i=1:N
    local_radius=TipRadius+((N-1)*radius_delta); % Calculate local radius from increment
    local_chord=cmean+((local_radius-((TipRadius-RootRadius)/2))*cgrad); % Calculate tapered chord
    local_theta=Theta0+(local_radius*ThetaTwist);
    s1_out=WTInducedCalcs(0,0,V0,w,local_radius,local_theta,local_chord,3);
    S1(i,:)=s1_out;

end
s1multitable=table(S1(:,1), S1(:,2), S1(:,3), S1(:,4), S1(:,5), S1(:,6), S1(:,7));
disp(s1multitable);

end