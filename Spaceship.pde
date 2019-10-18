class Spaceship extends Floater {
    public Spaceship() {
    	xCorners = new int[] {-8, -3, 6, 8, 11, 8, 6, -3, -8, -5, -7, -7, -5};
    	yCorners = new int[] {8, 8, 2, 2, 0, -2, -2, -8, -8, -3, -1, 1, 3};
    	
    	corners = xCorners.length;
    	myColor = 255;
    	myDirectionX = myDirectionY = myPointDirection = 0.0;
    }

    public void setX(int x) {
    	myCenterX = x; 
    }

    public int getX() {
    	return (int) myCenterX;
    }

    public void setY(int y) {
    	myCenterY = y; 
    }

    public int getY() {
    	return (int) myCenterY;
    }

    
    public void setDirectionX(double x) {
    	myDirectionX = x;
    }

    public double getDirectionX() {
    	return myDirectionX;
    }

    public void setDirectionY(double y) {
    	myDirectionY = y;
    }

    public double getDirectionY() {
    	return myDirectionY;
    }

    public void setPointDirection(int degrees) {
    	myPointDirection = degrees;
    }

    public double getPointDirection() {
    	return myPointDirection;
    }

    @Override
    public void show() {
	    translate(width / 2.0, height / 2.0);

	    float dRadians = (float) (myPointDirection*(PI/180));
	    
	    rotate(dRadians);
	    
	    beginShape();
	    for (int i = 0; i < corners; i++)
	      vertex(xCorners[i], yCorners[i]);

	    endShape(CLOSE);

	    rotate(-1.0 * dRadians);
	    translate(-1.0 * width / 2.0, -1 * height / 2.0);
    }
}
