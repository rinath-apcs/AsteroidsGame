// public class Enemy extends FloaterWrapper {
// 	public Enemy(int x, int y) {
// 		super(new int[] {5, -8, -5, -8}, new int[] {0, 5, 0 , -5}, (int) random(width) + x * width, (int) random(height) + y * height);

// 		myColor = color(255, 0, 0);

// 		myPointDirection = random(360);
// 	}

// 	@Override
// 	public void move() {
// 		myDirectionX = 0;//cos(radians((float) myPointDirection)) * (MAXIMUM_VELOCITY / 2.0);
// 		myDirectionY = 0;//sin(radians((float) myPointDirection)) * (MAXIMUM_VELOCITY / 2.0);

// 		float targetAngle = (atan2((int) myCenterY - screenY, (int) myCenterX - screenX));

// 		stroke(255, 0, 0);
// 		fill(255,0,0);
// 		line((float) myCenterX - screenX, (float) myCenterY - screenY, (float) myCenterX - screenX + 20* cos(targetAngle), (float) myCenterY - screenY + 20*sin(targetAngle));

// 		if (myPointDirection < degrees(targetAngle)) {
// 			super.turn(5);
// 		} else {
// 			super.turn(-5);
// 		}
// 		super.move();
// 	}
// }