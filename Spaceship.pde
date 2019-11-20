class Spaceship extends FloaterWrapper {
    public Spaceship() {
        super(new int[] {5, -8, -5, -8}, new int[] {0, 5, 0 , -5});
    }

    public void hyperspace() {
        setSpecificPointDirection(random(360));
        setX((int) random(getX() - HYPERSPACE_RANGE, getX() + HYPERSPACE_RANGE));
        setY((int) random(getY() - HYPERSPACE_RANGE, getY() + HYPERSPACE_RANGE));
        setDirectionX(random(MAXIMUM_VELOCITY));
        setDirectionY(random(MAXIMUM_VELOCITY));
    }
}
