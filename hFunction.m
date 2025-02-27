function h = hFunction(q1, q1_dot, q2, q2_dot)
    g=9.8;
    h1 = 1/2*q1_dot^2;
    h2 = 1/2*(sin(q2))^2*q1_dot^2 + 1/2*q2_dot^2;
    h3 = cos(q2)*q1_dot*q2_dot;
    h4 = g*cos(q2);
    h = [h1 h2 h3 h4];

end