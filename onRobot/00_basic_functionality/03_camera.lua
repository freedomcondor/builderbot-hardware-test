--[[ This function is executed every time you press the 'execute' button ]]
function init()
   reset()
end

--[[ This function is executed at each time step
     It must contain the logic of your controller ]]
function step()
   print_tag_info()
   print("led 1: " .. robot.camera_system.detect_led(vector3(0,0,0)))
end

function print_tag_info()
   print("#robot.camera_system.tags = ", #robot.camera_system.tags)
   for i,tag in ipairs(robot.camera_system.tags) do
      for index, v in pairs(tag) do
		  print(index, " ", v)
	  end
   end
end

--[[ This function is executed every time you press the 'reset'
     button in the GUI. It is supposed to restore the state
     of the controller to whatever it was right after init() was
     called. The state of sensors and actuators is reset
     automatically by ARGoS. ]]
function reset()
   robot.camera_system.enable()
end

--[[ This function is executed only once, when the robot is removed
     from the simulation ]]
function destroy()
   -- put your code here
end
