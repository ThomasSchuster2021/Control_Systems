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
    theta3p = 1/2 * m2 * l2_l2p * l2;
    theta4p = m2 * lc2;

    % Theta values
    theta1 = theta1p * (Ra/(kr*kt));
    theta2 = theta2p * (Ra/(kr*kt));
    theta3 = theta3p * (Ra/(kr*kt));
    theta4 = theta4p * (Ra/(kr*kt));
    theta5 = b1 * (Ra / (kr * kt)) + kr * kv;
    theta6 = b2 * (Ra / (kr * kt));