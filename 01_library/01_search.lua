assert(loadfile("/usr/share/argos3/plugins/robots/builderbot/control_interface/lua/init.lua"))()

local data, behavior

local rules = {
   selection_method = 'nearest_win',
   list = {
      -- pickup a type 0 (black) block
      -- turn the block type 4 (blue) when picking up it
      {
         rule_type = 'pickup',
         structure = {
            {
               index = vector3(0, 0, 0),
               type = 4
            },
         },
         target = {
            reference_index = vector3(0, 0, 0),
            offset_from_reference = vector3(0, 0, 0),
            type = 1,
         },
      },
      -- place a block in front of a type 1 (pink) block
      -- turn the block type 1 (pink) when placing it
      {
         rule_type = 'place',
         structure = {
            {
               index = vector3(0, 0, 0),
               type = 1,
            },
         },
         target = {
            reference_index = vector3(0, 0, 0),
            offset_from_reference = vector3(1, 0, 0),
            type = 1
         },
      },
   }, -- end of rule.list
} -- end of rules

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
      type = "sequence*",
      children = {
		robot.nodes.create_approach_block_node(data, 
			robot.nodes.create_search_block_node(data,
           		robot.nodes.create_process_rules_node(data, rules, "pickup")
        	),
			0.20
		),
		robot.nodes.create_pick_up_block_node(data, 0.20),
		function()
			robot.logger:log_info("pick up block complete")
			return false, true
		end,
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
