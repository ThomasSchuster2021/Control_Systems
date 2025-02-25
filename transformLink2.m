function transformLink2(theta1, theta2)
     clf
     hold on
     grid on
     axis([-20 20 -20 20 -5 15])
     view(3)
     BaseDesX = [0, 0];
     BaseDesY = [0, 0];
     BaseDesZ = [-5, 0];

     plot3(BaseDesX,BaseDesY,BaseDesZ,'rs-', 'LineWidth', 2, 'MarkerSize', 8);

     T0_1 = TRANS0_1(theta1);
     T1_2 = TRANS1_2(theta2, 8);
     link1points = [0 0 0 1; 0 0 -1 1; 0 6 -1 1; 0 6 0 1; 0 8 0 1]';
     link1transf = T0_1 * link1points;
     link2points = [0 0 0 1; 0 12 0 1]';
     link2transf = T0_1 * T1_2 * link2points;
     plot3(link1transf(1,:), link1transf(2,:), link1transf(3,:), 'ro-');
     plot3(link2transf(1,:), link2transf(2,:), link2transf(3,:), 'b-');
end