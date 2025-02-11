clc
clear 
close all

% initializing functions
clear
clc

L1 = 8; 
link1points = [0 0 0 1; 0 0 -1 1; 0 6 -1 1; 0 6 0 1; 0 8 0 1]';
L2 = 12;
link2points = [0 0 0 1; 0 12 0 1]';

disp('Choose Task:');
disp('1. Robot Base');
disp('2. First Link');
disp('3. Transform First Link');
disp('4. Second Link');
disp('5. Transform Second Link');
disp('6. Animation');
task = input('Enter task number: ');
    if task == 1
        baseRobo();
    elseif task == 2
        firstLink();
    elseif task == 3
        theta1 = input('Enter theta1 (degrees): ');
        transformLink1(theta1);
    elseif task == 4
        secondLink();
    elseif task == 5
        theta1 = input('Enter theta1 (degrees): ');
        theta2 = input('Enter theta2 (degrees): ');
        transformLink2(theta1, theta2);  
    elseif task == 6
        animateRobo()
    else
    disp('Invalid Task Selection')
    end

% Task 1: Base of robot in Frame-O
function baseRobo()
    hold on
    grid on
    axis([-20 20 -20 20 -5 15]);
    view(3)
    BaseDesX = [0, 0];
    BaseDesY = [0, 0];
    BaseDesZ = [-5, 0];
    plot3(BaseDesX,BaseDesY,BaseDesZ,'rs-', 'LineWidth', 2, 'MarkerSize', 8);
end

% Task 2: First link in Frame-1
function firstLink()
    baseRobo();
    hold on;
    grid on
    link1points = [0 0 0 1; 0 0 -1 1; 0 6 -1 1; 0 6 0 1; 0 8 0 1]';
    link1X = link1points(1,:);
    link1Y = link1points(2,:);
    link1Z = link1points(3,:);
    plot3(link1X, link1Y, link1Z, 'g-');
end

% Task 3: Transform First Link
function transformLink1(theta1)
      clf
      hold on
      grid on
      axis([-20 20 -20 20 -5 15]);
      view(3)
      baseRobo();

      T0_1 = TRANS0_1(theta1);
      link1points = [0 0 0 1; 0 0 -1 1; 0 6 -1 1; 0 6 0 1; 0 8 0 1]';

      link1transf = T0_1 * link1points;
      plot3(link1transf(1,:), link1transf(2,:), link1transf(3,:), 'ro-');
end

% Task 4: Second link of robot in Frame-2
function secondLink()
    baseRobo();
    hold on
    link2points = [0 0 0 1; 0 12 0 1]';
    link2X = link2points(1,:);
    link2Y = link2points(2,:);
    link2Z = link2points(3,:);
    plot3(link2X, link2Y, link2Z, 'b-');
end

% Task 5: Transform second link
function transformLink2(theta1, theta2)
     clf
     hold on
     grid on
     axis([-20 20 -20 20 -5 15])
     view(3)
     baseRobo();

     T0_1 = TRANS0_1(theta1);
     T1_2 = TRANS1_2(theta2, 8);
     link2points = [0 0 0 1; 0 12 0 1]';
     link2transf = T0_1 * T1_2 * link2points;

     plot3(link2transf(1,:), link2transf(2,:), link2transf(3,:), 'b-');
end

% Task 6: Loop robot
function animateRobo()
    for theta1 = 0:5:360
      clf
      hold on
      grid on
      axis([-20 20 -20 20 -5 15]);
      view(3)
      baseRobo();
     
      T0_1 = TRANS0_1(theta1);
      link1points = [0 0 0 1; 0 0 -1 1; 0 6 -1 1; 0 6 0 1; 0 8 0 1]';
      link1transf = T0_1 * link1points;
      plot3(link1transf(1,:), link1transf(2,:), link1transf(3,:), 'ro-');

         for theta2 = 0:5:360
              T1_2 = TRANS1_2(theta2, 8);
              link2points = [0 0 0 1; 0 12 0 1]';
              link2transf = T0_1 * T1_2 * link2points;

              plot3(link2transf(1,:), link2transf(2,:), link2transf(3,:));
              pause(0.01);

         end

    end
end

function transformedPoints = TRANS0_1(theta)
    theta = deg2rad(theta);
    transformedPoints = [cos(theta), -sin(theta), 0, 0;
    sin(theta), cos(theta), 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1];
end

function transformedPoints = TRANS1_2(theta, L1)
    theta = deg2rad(theta);
    transformedPoints = [cos(theta), -sin(theta), 0, 0;
   sin(theta), cos(theta), 0, L1;
    0, 0, 1, 0;
    0, 0, 0, 1];
end