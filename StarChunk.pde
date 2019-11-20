public class StarChunk {

	private int x, y;
	private Star[] stars;

	public StarChunk(int chunkX, int chunkY) {
		x = chunkX;
		y = chunkY;

		if (random(CHANCE_FOR_POPULATED_CHUNK) > 1) {
			stars = new Star[(int) random(STARS_PER_CHUNK)];
		} else {
			stars = new Star[STARS_PER_CHUNK * 2 + (int) random(STARS_PER_CHUNK * 10)];
		}
		
		for (int i = 0; i < stars.length; i++) {
			stars[i] = new Star(x, y);
		}
	}

	public void show(int screenX, int screenY) {
		int screenChunkX = screenX / width;
		int screenChunkY = screenY / height;

		if (dist(x, y, screenChunkX, screenChunkY) <= RENDER_DISTANCE) {
			for (Star star : stars) {
				star.show(screenX, screenY);
			}
		}

		if (SHOW_CHUNK_BORDERS) {
			noFill();
			stroke(0, 255, 0);
			rect(width * x - screenX, height * y - screenY, width, height);
			stroke(255);
		}
	}

	public int getX() {
		return x;
	}

	public int getY() {
		return y;
	}
}