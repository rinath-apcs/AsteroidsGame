class Spaceship extends FloaterWrapper {
    public Spaceship() {
        super()
    	xCorners = new int[] {-8, -3, 6, 8, 11, 8, 6, -3, -8, -5, -7, -7, -5};
    	yCorners = new int[] {8, 8, 2, 2, 0, -2, -2, -8, -8, -3, -1, 1, 3};
    	
    	corners = xCorners.length;
    	myColor = 255;
    	myDirectionX = myDirectionY = myPointDirection = 0.0;
    }
}
