class Obstacle {
  float x;    // position horizontale de l'obstacle
  float y;    // position verticale de l'obstacle
  float speed;  // vitesse de déplacement de l'obstacle
  PImage pipe, pipeTop; // images représentant l'obstacle
  boolean passed = false; // indique si l'oiseau a passé cet obstacle

  Obstacle(float x, float y, float speed) { // constructeur de la classe
    this.x = x; // initialise la position horizontale
    this.y = y; // initialise la position verticale
    this.speed = speed; // initialise la vitesse
    pipe = loadImage("data/pipe.png"); // charge l'image de l'obstacle inférieur
    pipeTop = loadImage("data/pipeTop.png"); // charge l'image de l'obstacle supérieur
  }

  void move() { // fait bouger l'obstacle
    x -= speed; // déplace l'obstacle horizontalement
  }

  void draw() { // dessine l'obstacle à l'écran
    image(pipeTop, x, 0, width/8, y-height/4); // dessine l'obstacle supérieur
    image(pipe, x, y+height/4, width/8, height-(y+height/4)); // dessine l'obstacle inférieur
    
    textAlign(CENTER); // Alignement du texte au centre
    textSize(15); // Taille du texte
    text("Appuyez sur ESPACE", width/2, height-30);
  }

  boolean hits(Bird bird) { // vérifie si l'oiseau a touché l'obstacle
    if ((bird.x)+(bird.sizeX/2) > x && (bird.x)-(bird.sizeX/2) < x+(width/8)) { // si l'oiseau est sur la même hauteur que l'obstacle
      if (bird.y < y-height/4 || bird.y+(bird.sizeY/2) > (y+height/4)) { // et s'il est entré en collision avec l'obstacle
        return true; // renvoie vrai
      }
    }
    return false; // sinon renvoie faux
  }

  boolean passed(Bird bird) { // vérifie si l'oiseau a passé l'obstacle
    if (bird.x > x + (width/8) && !passed) { // si l'oiseau a dépassé l'obstacle et que l'obstacle n'a pas encore été passé
      passed = true; // marquer l'obstacle comme passé
      return true; // renvoie vrai
    } else {
      return false; // sinon renvoie faux
    }
  }
}
