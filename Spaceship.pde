class Spaceship extends FloaterWrapper {
    public Spaceship() {
        super(new int[] {5, -8, -5, -8}, new int[] {0, 5, 0 , -5});
    }

    public void hyperspace() {
        setSpecificPointDirection(random(360));
        setX((int) random(getX() - 500, getX() + 500));
        setY((int) random(getY() - 500, getY() + 500));
        setDirectionX(random(MAXIMUM_VELOCITY));
        setDirectionY(random(MAXIMUM_VELOCITY));
    }
}
