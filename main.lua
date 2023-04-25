push = require 'push'
Class = require 'class'

require 'Player'

SPEED = 80
VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

gameState = 'play'

function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync= true
    })




    player1 = Player(0, 0, 20, 20)




    player2 = Player(432 - 40, 0, 20, 20)

end



function love.update(dt)
	if gameState == 'play' then
	
	
		print(player2:collides(player1))
		
		
		
		-- player1 movement
		
		if love.keyboard.isDown('d') and (not player1:collides(player2) or not (player2.x + player2.width > player1.x)) then
			player1.x = math.min(VIRTUAL_WIDTH -40, player1.x + SPEED * dt)
		end

		if love.keyboard.isDown('w') then
			player1.y = math.max(0, player1.y - SPEED * dt)
		end

		if love.keyboard.isDown('a') then
			player1.x = math.max(0, player1.x - SPEED * dt)
		end

		if love.keyboard.isDown('s') then
			player1.y = math.min(VIRTUAL_HEIGHT - 40, player1.y + SPEED * dt)
		end


		
		-- player2 movement

		if love.keyboard.isDown('right') then
			player2.x = math.min(VIRTUAL_WIDTH -40, player2.x + SPEED * dt)
		end

		if love.keyboard.isDown('up') then
			player2.y = math.max(0, player2.y - SPEED * dt)
		end

		if love.keyboard.isDown('left') then
			player2.x = math.max(0, player2.x - SPEED * dt)
		end

		if love.keyboard.isDown('down') then
			player2.y = math.min(VIRTUAL_HEIGHT - 40, player2.y + SPEED * dt)
		end
	end
end


function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
	if key == 'space' then
		if gameState == 'pause' then
			gameState = 'play'
		elseif gameState == 'play' then
			gameState = 'pause'
		end
	end
end

function love.draw()
    push:apply('start')
-- ბეგრაუნდის ფერი.
    love.graphics.clear(0/255, 0/255, 0/255, 255/255)
-- ფლეიერ ერთის ობიეცტის ფუნქციის გამოძახება.
        player1 : render ()
        player2 : render ()
    push:apply('end')
end
