import "CoreLibs/graphics"
import "CoreLibs/object"
import "CoreLibs/sprites"
import "circle"
import "gui"
import "player/player"
import "level"

local pd <const> = playdate
local gfx <const> = pd.graphics


local function initialize()

	local gui = gui()

	gui.createGUI()

	local level = level()
	level.createLevel()

	local player = Player(120 ,120, "player/player")
	player:add()
end

initialize()


function pd.update()

	gfx.sprite.update()
	
end
