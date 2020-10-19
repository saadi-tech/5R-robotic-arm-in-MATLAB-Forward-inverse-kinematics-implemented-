l = [3 3 3 2];
h = 1;
theta = [0 0 0 0 0 ];
L(1) = Link('revolute', 'd', h, 'a', 0, 'alpha', pi/2);
L(2) = Link('revolute', 'd', 0, 'a', l(1), 'alpha', 0);
L(3) = Link('revolute', 'd', 0, 'a', 0, 'alpha', -pi/2);
L(4) = Link('revolute', 'd',  l(2)+l(3), 'a',0, 'alpha', pi/2);
L(5) = Link('revolute', 'd',  0, 'a',l(4), 'alpha', 0);

robot = SerialLink(L);
robot.name = 'Romio';
robot
addition = [0 pi/2 -pi/2 0 pi/2];
final_theta = theta + addition;
robot.plot(final_theta);