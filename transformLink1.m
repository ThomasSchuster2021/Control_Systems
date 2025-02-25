function transformLink1(theta1)
      clf
      hold on
      grid on
      axis([-20 20 -20 20 -5 15]);
      view(3)

      link1points = [0 0 0 1; 0 0 -1 1; 0 6 -1 1; 0 6 0 1; 0 8 0 1]';
      T0_1 = TRANS0_1(theta1);

      link1transf = T0_1 * link1points;
      plot3(link1transf(1,:), link1transf(2,:), link1transf(3,:), 'ro-');
end