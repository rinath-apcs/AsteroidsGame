class Star {
  private int x, y, z;

  public Star(int chunkX, int chunkY) {
    x = (int) random(width) + chunkX * width;
    y = (int) random(width) + chunkY * width;
    z = (int) random(width / 4, width * 4);
  }
  
  public void show(int screenX, int screenY) {
  	fill((int) (width / z * 50 + 155));
    point((x - screenX + width / 2.0) * (DISTANCE_FROM_STARS) / z, (y - screenY + height / 2.0) * (DISTANCE_FROM_STARS) / z);
  }
}
