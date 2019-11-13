class Star {
  private int x, y, z;
  public Star() {
    x = (int) random(width);
    y = (int) random(height);
    z = (int) random(width / 2, width);
  }
  
  public void draw(int screenX, int screenY) {
  	fill(width / z * 100 + 155);
    ellipse((screenX + x) * (width / 2) / z, (screenY + * (width / 2) / z);
  }
}
