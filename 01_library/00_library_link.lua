assert(loadfile("@CMAKE_INSTALL_PREFIX@/share/argos3/plugins/robots/builderbot/lua_library.luac"))()

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
      target = {},
      blocks = {},
      obstacles = {},
   }
   behavior = robot.utils.behavior_tree.create {
      type = "sequence",
      children = {
         robot.nodes.create_random_walk_node(),
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

   robot.logger:log_info("-------- data ---------")
   robot.logger:log_info(data)
end

function destroy()
   -- disable the robot's camera system
   robot.camera_system.disable()
end
