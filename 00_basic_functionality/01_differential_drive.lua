local count 
local rise_or_fall

function init()
	count = 0
	rise_or_fall = 0
end

function step()
	count = count + 1

	if count == 50 then
		rise_or_fall = 1 - rise_or_fall
		count = 0
	end
	
	local speed = count
	if rise_or_fall == 1 then
		speed = 50 - count
	end

	speed = speed * 0.001

	local vel = speed
	log("--------------------")
	log("set vel", vel)
	robot.differential_drive.set_target_velocity(vel,-vel);
	log("left:  " .. robot.differential_drive.encoders.left)
	log("right: " .. -robot.differential_drive.encoders.right)
end

function reset()
end

function destroy()
end
