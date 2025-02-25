function secondLink()
    baseRobo();
    hold on
    link2points = [0 0 0 1; 0 12 0 1]';
    link2X = link2points(1,:);
    link2Y = link2points(2,:);
    link2Z = link2points(3,:);
    plot3(link2X, link2Y, link2Z, 'b-');
end
