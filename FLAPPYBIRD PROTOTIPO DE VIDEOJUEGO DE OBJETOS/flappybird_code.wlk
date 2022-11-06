import wollok.game.*

object flappy {
	
	method config () {
		game.width(70)
		game.height(40)
		game.title("Flappy bird Game")
		game.addVisual(bird)
		game.addVisual(obstacle)
		game.addVisual(obstacle2)
		game.boardGround('background.jpg')
		game.cellSize(10)
		
		keyboard.space().onPressDo{self.play()}
		
		game.onCollideDo(bird, {obs => obs.collide()})
	}
	
	method play() {
		if (bird.alive()) {
			bird.jump()
			game.removeVisual(game_over)
		} else {
			self.setup()

		}
	}
	
	method setup () {
		
		if (game.hasVisual(game_over)) {
			game.removeVisual(game_over)
		}
		bird.start()
		timer.start()
		obstacle.iniciar()
		obstacle2.iniciar()
		bitcoin.iniciar()

	}
	
	method gameOver() {
		gameover = true
		game.addVisual(game_over)
		game_over.finish_all()
	}
}

object timer {
	var time = 0
	method position() = game.at(65, 35)
	method text() = time.toString()
	
	method start() {
		game.onTick(100, "Timer", {time+=1})
	}
	
	method stop() {
		game.removeTickEvent("Timer")
	}
}

object bitcoin_counter { 
	var btc = 0;
	method text() = "Bitcoins: "+btc.toString()
	method position() = game.at(5, 35)
	
	method add_btc() {
		btc += 1
	}
	
	method reset() {
		btc = 0
	}
}

object bitcoin {
	var position = game.at(40, 20)
	method image () = "bitcoin.png"
	method position () = position
	
	method iniciar() {
		game.onTick(30, "MovingBtc", {self.moving()})
	}
	
	method moving() {
		if (position.x() == -10) {
			position = game.at(40,-40.randomUpTo(20).truncate(0))
		} else {
			position = position.left(1)
		}
	}
	
	method collide() {
		bitcoin_counter.add_btc()
	}
	
	method stop() {
		game.removeTickEvent("MovingBtc")
	}
	

}

object bird {
	var property alive = true
	var x = 0
	var y = 0
	var total_pos = game.at(6, 20)
	var image = "bird0.png"
	
	method position() = total_pos
	method image() = image
	
	method stop() {
		total_pos = game.at(1, 20)
		game.removeTickEvent("FallingBird")
		game.removeTickEvent("MovingBird")
	}
	
	method moving() {
		y = x % 3
		image = "bird"+y+".png"
		x+=1
	}
	
	method start() {
		game.onTick(200, "FallingBird", {self.falling()})
		game.onTick(100, "MovingBird", {self.moving()})
	}
	
	method jump() {
		if (total_pos.y() < 34) {
			total_pos = total_pos.up(4)	
		}
	}
	
	method falling() {
		if (total_pos.y() > -1 && self.alive()) {
			total_pos = total_pos.down(3.5)	
		} else {
			floor.collide()
			alive = false
		}
	}
	
	method morir() {
		game.say(bird, ":(")
		flappy.gameOver()
		alive = false
		self.stop()
	}
	

}
object obstacle {
	var position
	method position() = position
	method image() = "obstacle.png"
	
	method move () {
		if (position.x() == -10) {
			position = game.at(69, -40.randomUpTo(20).truncate(0))
			var pos = game.getObjectsIn(position)
			if (!pos.isEmpty()) {
				position = game.at(80, -40.randomUpTo(20).truncate(0))
			}
		}
		position = position.left(1)
	}
	
	method iniciar() {
		//-20.randomUpTo(-10).roundUp(1)
		position = game.at(69, -40.randomUpTo(20).truncate(0))
		game.onTick(40, "movingObstacle", {self.move() })
	}
	
	method collide() {
		game.removeTickEvent("movingObstacle")
		flappy.gameOver()
	}
	
	method stop() {
		game.removeTickEvent("movingObstacle")
	}
}

object obstacle2 {
	var position
	method position() = position
	method image() = "obstacle.png"
	method move () {
		if (position.x() == -10) {
			position = game.at(69, -40.randomUpTo(20).truncate(0))
			var pos = game.getObjectsIn(position)
			if (!pos.isEmpty()) {
			position = game.at(80, -40.randomUpTo(20).truncate(0))
			}
		}
		position = position.left(1)
	}
	
	method iniciar() {
		position = game.at(90, -40.randomUpTo(10).truncate(0) )
		game.onTick(40, "movingObstacle", {self.move() })
	}
	
	method collide() {
		game.removeTickEvent("movingObstacle")
		flappy.gameOver()
	}
	
	method stop() {
		game.removeTickEvent("movingObstacle")
		
	}
}

object floor {
	
	method position() = game.at(6,1)
	
	method collide() {
		flappy.gameOver()
	}
}

object game_over {
	method text() = 'GAME OVER , PRESS SPACE TO CONTINUE'
	method position() = game.center()
	
	method finish_all () {
		bitcoin_counter.reset()
		bird.stop()
		timer.stop()
		obstacle.stop()
		obstacle2.stop()
		bitcoin.stop()
	}

}

