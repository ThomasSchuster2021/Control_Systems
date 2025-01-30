function initialPosUser()
    task = input('Select Task: 1. Initial User Input, 2. All Joint Values, 3. Work Envelope, 4. End Effector): ');
    
    if task == 1

        joint1 = input('Enter Joint 1 length between 0-10: ');
        while joint1 < 0 || joint1 > 10
            disp('Invalid Entry');
            joint1 = input('Enter Joint 1 length between 0-10: ');
        end
    
        joint2 = input('Enter Joint 2 angle (+/- pi radians): ');
        while joint2 < -pi || joint2 > pi
            disp('Invalid Entry');
            joint2 = input('Enter Joint 2 angle (+/- pi radians): ');
        end

        joint3 = input('Enter Joint 3 length between 2-8: ');
        while joint3 < -2 || joint3 > 8
            disp('Invalid Entry');
            joint3 = input('Enter Joint 3 length between 2-8: ');
        end

        Link1Des = defineLink();
        transformedLink1 = TRANS01SF(Link1Des, joint2, joint1, joint3);
        plotPose(transformedLink1, Link1Des);
        % BaseP1 = [0;0;-10];
        % BaseP2 = [0;0;0];
        % BaseDes = [BaseP1,BaseP2];
    elseif task == 3
        workEnvelope();
    
    elseif task == 4
        x = input('Desired x-coordinate end effector point: ');
        y = input('Desired y-coordinate end effector point: ');
        z = input('Desired z-coordinate end effector point: ');

        [joint1, joint2, joint3] = inverseKinematics(x, y, z);
        fprintf('Calculated Joint Values: ')

        Link1Des = defineLink();
        transformedLink1 = TRANS01SF(Link1Des, joint2, joint1, joint3);
        plotPose(transformedLink1, Link1Des);

    else
        disp('Invalid Task Selection');
    end
end

function Link1Des = defineLink()
    Link1P1 = [0;0;0];
    Link1P2 = [4;0;0];
    Link1P3 = [4;0;1];
    Link1P4 = [6;0;1];
    Link1P5 = [4;0;1];
    Link1P6 = [4;0;-1];
    Link1P7 = [6;0;-1];
    Link1Des = [Link1P1,Link1P2,Link1P3,Link1P4,Link1P5,Link1P6,Link1P7];
end

function transformedPoints = TRANS01SF(points, theta, joint1, joint3)
    R = [cos(theta), -sin(theta), 0;
         sin(theta),  cos(theta), 0;
         0,           0,          1];
    T = [joint1; 0; joint3]; 
    transformedPoints = R * points + T;
end

function plotPose(transformedLink1, Link1Des)
    BaseDesX = transformedLink1(1,:);
    BaseDesY = transformedLink1(2,:);
    BaseDesZ = transformedLink1(3,:);
    plot3(BaseDesX,BaseDesY,BaseDesZ,'rs-')
    axis([-15 15 -15 15 -15 15]);
    grid on
    hold on

    BaseLink1X=Link1Des(1,:);
    BaseLink1Y=Link1Des(2,:);
    BaseLink1Z=Link1Des(3,:);
    plot3(BaseLink1X,BaseLink1Y,BaseLink1Z,'b-')
    hold off
end

function workEnvelope()
    figure;
    hold on;
    axis([-15 15 -15 15 -15 15]);
    grid on;

    for joint1 = 0:2:10
        for joint2 = -pi:pi/4:pi
            for joint3 = 2:2:8
                Link1Des = defineLink();
                transformedLink1 = TRAN01SF(Link1Des, joint2, joint1, joint3);
                plot3(transformedLink1(1,:), transformedLink1(2,:), transformedLink1(3,:), 'g.');
            end
        end
    end
    hold off;
    title('Work Envelope');
end

function [joint1, joint2, joint3] = inverseKinematics(x,y,z)
    % Joint 2 (Rotation)
    joint2 = atan2(y, x);
    % Joint 1 (Linear)
    joint1 = sqrt(x^2+y^2);
    % Joint 3 (Linear)
    joint3 = z;
end

