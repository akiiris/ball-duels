extends Ball

var damage: int = 5

func ball_collision(other_ball: Ball):
	other_ball.receive_hit(damage)
