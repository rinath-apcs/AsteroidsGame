public Spaceship spaceship;
public ArrayList<StarChunk> chunks;
public int screenX, screenY;
public int loaded;

public static ArrayList<PImage> images;

public static final int MAXIMUM_VELOCITY = 15;
public static final int HYPERSPACE_RANGE = 500;

public static final int DISTANCE_FROM_STARS = 250;
public static final int STAR_MIN_DISTANCE = DISTANCE_FROM_STARS;
public static final int STAR_MAX_DISTANCE = DISTANCE_FROM_STARS + 300;
public static final int CHANCE_FOR_POPULATED_CHUNK = 15;

public static final int CHANCE_TO_SHOW_IMAGE = 100;
public static final int IMAGE_OPACITY = 35;
public static final int MAXIMUM_IMAGE_SIZE = 500;
public static final int MINIMUM_IMAGE_SIZE = 50;
public static final int SIZING_SLOPE = (MINIMUM_IMAGE_SIZE - MAXIMUM_IMAGE_SIZE) / (STAR_MAX_DISTANCE - STAR_MIN_DISTANCE);

public static final int RENDER_DISTANCE = 10;
public static final int LOADING_DISTANCE = 2;
public static final int STARS_PER_CHUNK = 20;
public static final boolean SHOW_CHUNK_BORDERS = false;

public void setup() {
	size(1000, 1000);
	background(0);
	frameRate(-1);

	strokeWeight(2);	    
	stroke(255);
	tint(255, IMAGE_OPACITY);

	noFill();
	noLoop();

	textAlign(CENTER);

	images = new ArrayList();
	screenX = screenY = 0;
	chunks = new ArrayList();
	spaceship = new Spaceship();

	loaded = 0;
}

public void draw() {
	if (loaded == -1) {
		background(0);

		handleKey();
		loadStars(LOADING_DISTANCE);
		drawObjects();
		drawGUI();
	} else {
		handleLoading();
	}
}

public void handleLoading() {
	if (loaded == 0) {
		text("Loading images...", width / 2, height / 2);

		loaded = 1;
		loop();
	} else if (loaded == 1) {
		noLoop();
		background(0);

		for (int i = 1; i <= 9; i++) {
			PImage nebula = loadImage("./images/Nebula" + i + ".jpg");
			nebula.resize(MAXIMUM_IMAGE_SIZE, 0);
			images.add(nebula);
		}

		text("Generating stars...", width / 2, width / 2);

		loaded = 2;
		loop();
	} else if (loaded == 2) {
		noLoop();

		loadStars(LOADING_DISTANCE * 5);

		loaded = -1;		
		textAlign(BASELINE);
		loop();
	}
}
public void drawObjects() {
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
				spaceship.brake(0.85);
				break;
			case ' ':
				spaceship.hyperspace();
				break;
		}	
	}

	if (mousePressed) {
			spaceship.setSpecificPointDirection(degrees(atan2(mouseY - height / 2.0, mouseX - width / 2.0)));
	}
}

public void loadStars(int distance) {
	int currChunkX = screenX / width;
	int currChunkY = screenY / width;

	for (int y = currChunkY - distance; y <= currChunkY + distance; y++) {
		for (int x = currChunkX - distance; x <= currChunkX + distance; x++) {
			boolean exists = false;
			for (StarChunk chunk : chunks) {
				if (chunk.getX() == x && chunk.getY() == y) exists = true;
			}
			if (!exists) {
				chunks.add(new StarChunk(x, y));
			}	
		}
	}
}

public void drawGUI() {
	int currChunkX = screenX / width;
	int currChunkY = screenY / width;

	fill(255);
	text(screenX + ", " + screenY, 20, 20);
	text(currChunkX + ", " + currChunkY, 20, 40);
	text((int) spaceship.getPointDirection() + " degrees", 20, 60);
}