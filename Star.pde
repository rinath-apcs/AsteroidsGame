class Star {
  private int x, y, z;
  private boolean showsImage;
  private PImage mimage;

  public Star(int chunkX, int chunkY) {
    x = (int) random(width) + chunkX * width;
    y = (int) random(height) + chunkY * height;
    z = (int) random(STAR_MIN_DISTANCE, STAR_MAX_DISTANCE);

    showsImage = (int) (random(CHANCE_TO_SHOW_IMAGE)) == 0; 

    if (showsImage) {
      mimage = images.get((int) random(images.size())).copy();
      int imageRadius = SIZING_SLOPE * z + MINIMUM_IMAGE_SIZE - SIZING_SLOPE * STAR_MAX_DISTANCE;
      mimage.resize(imageRadius, 0);
    }
  }
  
  public void show(int screenX, int screenY) {
  	fill((int) (width / z * 50 + 155));
    
    int projectedX = (x - screenX + width / 2) * (DISTANCE_FROM_STARS) / z;
    int projectedY = (y - screenY + height / 2) * (DISTANCE_FROM_STARS) / z;

    if (showsImage) {
      image(mimage, projectedX, projectedY);
    } else {
      point(projectedX, projectedY);
    }
  }
}
