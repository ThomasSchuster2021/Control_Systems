function transformedPoints = TRANS1_2(points, theta2)
    R = [cos(theta2), -sin(theta2), 0, 0;
    0, 0, -1, (l1+l2);
    sin(theta2), cos(theta2), 0, 0;
    0, 0, 0, 1];
    T = Link1Des;
    transformedPoints = R * points + T;
end