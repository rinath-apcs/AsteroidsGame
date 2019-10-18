Spaceship spaceship;

public void setup() {
	size(500, 500);

	noFill();
	strokeWeight(2);	    
	stroke(255);

	spaceship = new Spaceship();
}
public void draw() {
	background(0);
	spaceship.show();

	if (keyPressed) {
		switch (key) {
			case 'w':
				spaceship.accelerate(2);
				break;
			case 'a':
				spaceship.turn(-1);
				break;
			case 'd':
				spaceship.turn(1);
				break;
			case 's':
				spaceship.accelerate(-2);
				break;
		}	
	}
}

