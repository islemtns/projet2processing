class Bird {
  float x; // position horizontale de l'oiseau
  float y; // position verticale de l'oiseau
  float sizeX; // taille de l'oiseau sur l'axe X
  float sizeY; // taille de l'oiseau sur l'axe Y
  float velocity; // vitesse de l'oiseau
  float gravity; // gravité affectant l'oiseau
  PImage img; // image représentant l'oiseau

  // constructeur de la classe Bird
  Bird(float x, float y, float sizeX, float sizeY, float velocity, float gravity) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.velocity = velocity;
    this.gravity = gravity;
    img = loadImage("data/bird.png");
  }

  // méthode pour faire bouger l'oiseau
  void move() {
    velocity += gravity;
    y += velocity;
  }

  // méthode pour faire sauter l'oiseau
  void jump() {
    velocity = -10;
  }

  // méthode pour afficher l'oiseau à l'écran
  void draw() {
    image(img, x, y, sizeX, sizeY);
  }
}
