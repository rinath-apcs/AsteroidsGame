public class FloaterWrapper extends Floater {
	public FloaterWrapper(int[] xCorners, int[] yCorners, int col, int x, int y, int xv, int yv, int dir) {
		this.xCorners = xCorners;
		this.yCorners = yCorners;
		myColor = col;
		myCenterY = x;
		myCenterY = y;
		myDirectionX = xv;
		myDirectionY = yv;
		myPointDirection = dir;

		corners = xCorners.length;
	}

	public FloaterWrapper(int xCorners, int yCorners, int x, int y) {
		this(xCorners, yCorners, 255, x, y, 0, 0, 0);
	}

	public FLoaterWrapper(int xCorners, int yCorners) {
		this(xCorners, yCorners, 255, 0, 0, 0, 0);
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
    public void move() {
    	myCenterX += myDirectionX;    
    	myCenterY += myDirectionY;
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
