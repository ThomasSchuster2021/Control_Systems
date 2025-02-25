function output = energies(q1, q1dot, q2, q2dot)
    % "Robot" Characteristics
    J1 = 0.0012;
    l2 = 0.3;
    b2 = 0.002;
    kr = 70;
    m2 = 0.127;
    l2_l2p = 0.2;
    lc2 = 0.15;
    Ra = 2.6;
    b1 = 0.015;
    kt = 0.00768;
    kv = kt;

    % Theta prime values
    theta1p = J1 + m2 * l2_l2p^2;
    theta2p = 1/3 * m2 * l2^2;
    theta3p = 1/2 * m2 * l2_l2p^2 * l2;
    theta4p = m2 * l2;

    % Theta values
    theta1 = theta1p * (Ra/(kr*kt));
    theta2 = theta2p * (Ra/(kr*kt));
    theta3 = theta3p * (Ra/(kr*kt));
    theta4 = theta4p * (Ra/(kr*kt));
    theta5 = b1 * (Ra / (kr * kt)) + kr * kv;
    theta6 = b2 * (Ra / (kr * kt));

    % Energy matrices

    KE_link2 = 1/2 * (theta1p + theta2p * sin(q2)^2)*q1dot^2 + theta3p*cos(q2)*q1dot*q2dot2 + 1/2*theta2p*q2dot^2;
    PE_link2 = m_2 * g*lc2*cos(q2);
    m11 = theta1+sin(q2)^2*theta2;
    m12 = theta3*cos(q2);
    m21 = theta3*cos(q2);
    m22 = theta2;
    m = [m11 m12; m21 m22];
    
    c11 = 2*theta2*sin(q2)*cos(q2)*q2dot;
    c12 = -theta3*sin(q2)*q2dot;
    c21 = -theta2*sin(q2)*cos(q2)*q1dot;
    c22 = 0;
    c = [c11 c12; c21 c22];

    f1 = theta5;
    f2 = theta6;
    f = [f1; f2];
    
    g1 = 0;
    g2 = -theta4*g*sin(q2);
    gMatrix = [g1; g2];

    vMatrix = m*[q1dotdot; q2dotdot]+c*[q1dot; q2dot]+f*[q1dot; q2dot]+gMatrix;
    v1 = vMatrix(1);

    p_x1 = 0;
    KE_link1 = (1/2)*J1*q1dot^2;
    PE_link1 = m1*g*z_c1;

    % KE_link2 = 1/2*m_2*((l_1+l_2prime)^2*q_1dot^2+(l_1+l_2prime)*l_2*cos(q_2)*q_1dot*q_2dot+1/3(l_2)^2*(sin(q_2)^2*q_1dot^2+q_2dot^2))
    % PE_link2