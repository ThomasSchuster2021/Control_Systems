% Task 1: Base of robot in Frame-O
BaseDesX = [0 0 0];
BaseDesY = [0 0 0];
BaseDesZ = [0 0 -10];
plot3(BaseDesX,BaseDesY,BaseDesZ,'rs-')
axis([-15 15 -15 15 -15 15]);
grid on
hold on

% Task 2: First link of robot in Frame-1
Link1Des = defineLink();
plot3(Link1Des);
hold on

% Task 3: Transformation Function 1
theta = input('Theta for the rotation about the Z-axis: ');
transformedLink1 = TRANS0_1(Link1Des, theta);
plotPose(transformedLink1, Link1Des);

% Task 4: Second link of robot in Frame-2

% Task 5: Transformation Function 2

% l1 is the length of the first link
% l1 is the length of the second link

% function Link1Des = defineLink()
%     LinkDes1 = [0 0 0];
%     LinkDes2 = [0 0 -1];
%     LinkDes3 = [0 6 -1];
%     LinkDes4 = [0 6 0];
%     LinkDes5 = [0 8 0];
%     Link1Des = [LinkDes1,LinkDes2,LinkDes3,LinkDes4,LinkDes5];
% end

% function plotPose(transformedLink1, Link1Des)
%     BaseDesX = transformedLink1(1,:);
%     BaseDesY = transformedLink1(2,:);
%     BaseDesZ = transformedLink1(3,:);
%     plot3(BaseDesX,BaseDesY,BaseDesZ,'rs-')
%     axis([-15 15 -15 15 -15 15]);
%     grid on
%     hold on
%     BaseLink1X=Link1Des(1,:);
%     BaseLink1Y=Link1Des(2,:);
%     BaseLink1Z=Link1Des(3,:);
%     plot3(BaseLink1X,BaseLink1Y,BaseLink1Z,'b-')
%     hold off
% end

% function transformedPoints = TRANS0_1(points, theta1)
%     R = [cos(theta1), -sin(theta1), 0, 0;
%     sin(theta1), cos(theta1), 0, 0;
%     0, 0, 1, 0;
%     0, 0, 0, 1];
%     T = Link1Des;
%     transformedPoints = R * points + T;
% end

% function transformedPoints = TRANS1_2(points, theta2)
%     R = [cos(theta2), -sin(theta2), 0, 0;
%    0, 0, -1, (l1+l2);
%     sin(theta2), cos(theta2), 0, 0;
%     0, 0, 0, 1];
%     T = Link1Des;
%     transformedPoints = R * points + T;
% end