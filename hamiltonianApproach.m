function theta = hamiltonianApproach(data)
    t = data(:,1);
    volt = data(:,2);
    q1 = data(:,3);
    q1_dot = data(:,4);
    q2 = data(:,5);
    q2_dot = data(:,6);
    for i=2:length(t)
        H(i,:) = hFunction(q1(i),q1_dot(i),q2(i),q2_dot(i))-hFunction(q1(1),q1_dot(1),q2(1),q2_dot(1));
    end
    F1 = cumtrapz(t,q1_dot.^2);
    F2 = cumtrapz(t,q2_dot.^2);
    F = [F1 F2];
    d = cumtrapz(t,volt.*q1_dot);
    
    A = [H F];
    theta = pinv(A)*d;
end