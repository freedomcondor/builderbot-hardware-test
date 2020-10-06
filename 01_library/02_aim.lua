assert(loadfile("/usr/share/argos3/plugins/robots/builderbot/control_interface/lua/init.lua"))()

local data, behavior

function init()  
   robot.logger:register_module("controller")
   robot.logger:set_verbosity(2) 
   -- enable the robot's camera system  
   robot.camera_system.enable()
   reset()
end

function reset()
   data = {
      target = {id = 1},
      blocks = {},
      obstacles = {},
   }
   behavior = robot.utils.behavior_tree.create {
      type = "sequence",
      children = {
		  robot.nodes.create_curved_approach_block_node(data, 0.20),
      }
   }
end

function step()
   -- preprocessing
   robot.api.process_blocks(data.blocks)
   robot.api.process_leds(data.blocks)
   robot.api.process_obstacles(data.obstacles, data.blocks)
   -- tick behavior tree
   behavior()
   --[[
   robot.logger:log_info("-------- data ---------")
   robot.logger:log_info("-- blocks --")
   robot.logger:log_info(data.blocks)
   robot.logger:log_info("-- target --")
   robot.logger:log_info(data.target)
   --]]
end

function destroy()
   -- disable the robot's camera system
   robot.camera_system.disable()
end
