--[[ This function is executed every time you press the 'execute' button ]]
local count
function init()
	count = 0
end


--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
	local interval = 10
	for i = 0, 4 do
		if count == i * interval then
			print("write", i)
			robot.nfc.write(tostring(i))
		end
	end

	count = count + 1
	if count == 5 * interval then count = 0 end
end

--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
end

--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
