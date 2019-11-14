public Spaceship spaceship;
public ArrayList<StarChunk> chunks;
public int screenX, screenY;

public static final int MAXIMUM_VELOCITY = 10;

public static final int DISTANCE_FROM_STARS = 250;
public static final int STAR_MIN_DISTANCE = DISTANCE_FROM_STARS;
public static final int STAR_MAX_DISTANCE = DISTANCE_FROM_STARS + 300;

public static final int RENDER_DISTANCE = 10;
public static final int LOADING_DISTANCE = 2;
public static final int STARS_PER_CHUNK = 20;
public static final boolean SHOW_CHUNK_BORDERS = false;


public void setup() {
	size(1000, 1000);
	noFill();
	strokeWeight(2);	    
	stroke(255);

	screenX = screenY = 0;
	chunks = new ArrayList();
	spaceship = new Spaceship();
}

public void draw() {
	background(0);

	showAndMove();
	handleKey();
	loadStars();
	setText();
}

public void showAndMove() {
	for (StarChunk chunk : chunks) {
		chunk.show(screenX, screenY);
	}

	spaceship.show();
	spaceship.move();

	screenX = spaceship.getX();
	screenY = spaceship.getY();
}

public void handleKey() {
	if (keyPressed) {
		switch (key) {
			case 'w':
				spaceship.accelerate(1);
				break;
			case 's':
				spaceship.accelerate(-1);
				break;
			case ' ':
				spaceship.setDirectionX(0);
				spaceship.setDirectionY(0);
				break;
		}	
	}

	if (mousePressed) {
			spaceship.setSpecificPointDirection(atan2(mouseY - height / 2.0, mouseX - width / 2.0));
	}

}

public void loadStars() {
	int currChunkX = screenX / width;
	int currChunkY = screenY / width;

	for (int y = currChunkY - LOADING_DISTANCE; y <= currChunkY + LOADING_DISTANCE; y++) {
		for (int x = currChunkX - LOADING_DISTANCE; x <= currChunkX + LOADING_DISTANCE; x++) {
			boolean exists = false;
			for (StarChunk chunk : chunks) {
				if (chunk.getX() == x && chunk.getY() == y) exists = true;
			}
			if (!exists) {
				chunks.add(new StarChunk(x, y));
				println("added new chunk at: " + x + ", " + y);
			}	
		}
	}
}

public void setText() {
	int currChunkX = screenX / width;
	int currChunkY = screenY / width;

	fill(255);
	text(screenX + ", " + screenY, 20, 20);
	text(currChunkX + ", " + currChunkY, 20, 40);
	text((int) spaceship.getPointDirection() + " degrees", 20, 60);
}