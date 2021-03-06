function [angle,distance] = calcAngleandDistance_v3(Target,Robot)
init_Constants

sidey = Target.y - Robot.y;
sidex = Target.x - Robot.x;

distance = sqrt((power(sidey,2)+power(sidex,2)));
angle = atan2(sidey,sidex)-Robot.theta;

% if(angle>90*deg || angle<-90*deg)
%     distance = -distance;
% end


if (angle<-180*deg)
    angle = angle + 360*deg;
end

if (angle>180*deg)
    angle = angle - 360*deg;
end


%    2019-03-10 Dr K.  changing distance sign is probably not needed in
%    2019 Deep Space

 if(angle<-90*deg && angle>-270*deg || angle>90*deg && angle<270*deg)
     distance = -distance;
 end



%   Find projection of carrot onto the robot center line in the direction
%   of travel

%   This line goes through the point ( Robot.x, Robot.y) and in the
%   direction of Robot.theta

%   This is equivalent of projecting the carrot onto the x-axis
%   after rotating the x-y coordinate system by angle -Robot.theta

% R = [ cos(Robot.theta) -sin(Robot.theta); sin(Robot.theta) cos(Robot.theta)];
%
% vec     = [sidex ; sidey];
% % Rvec    = R * vec;

% distance = Rvec(1);
