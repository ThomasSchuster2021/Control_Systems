function transformedPoints = TRANS0_1(points, theta1)
    R = [cos(theta1), -sin(theta1), 0, 0;
    sin(theta1), cos(theta1), 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1];
    T = Link1Des;
    transformedPoints = R * points + T;
end