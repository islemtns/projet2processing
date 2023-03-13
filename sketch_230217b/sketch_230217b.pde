// Définition de constantes pour les paramètres du jeu
final int OBSTACLE_COUNT = 3; // Nombre d'obstacles dans le jeu
final float OBSTACLE_SPEED = 3; // Vitesse des obstacles
final float BIRD_JUMP_FORCE = 0.5; // Force de saut de l'oiseau
final float TEXT_SIZE = 25; // Taille du texte affichant le score
final float START_TEXT_SIZE = 15; // Taille du texte affichant le message de début de partie

Obstacle[] obstacles = new Obstacle[OBSTACLE_COUNT]; // Tableau d'obstacles
Bird bird; // L'oiseau
boolean gameStarted = false; // Indique si le jeu a commencé ou non
PImage background; // Image de fond
int score = 0; // Score

void setup() {
  size(400, 600);
  background = loadImage("data/bg.png"); // Chargement de l'image de fond
  background.resize(width, height); // Redimensionnement de l'image de fond pour qu'elle remplisse toute la fenêtre
  statReset(); // Initialisation des objets
}

void draw() {
  final float OBSTACLE_HEIGHT_MIN = 150; // Hauteur minimale des obstacles
  background(background); // Affichage de l'image de fond
  if (gameStarted) { 
    bird.move(); // Déplacement de l'oiseau
    bird.draw(); // Affichage de l'oiseau

    for (int i = 0; i < obstacles.length; i++) { // Boucle pour tous les obstacles
      Obstacle obs = obstacles[i]; // Obstacle courant
      obs.move(); // Déplacement de l'obstacle
      obs.draw(); // Affichage de l'obstacle
      if (obs.hits(bird)) { // Si l'oiseau touche l'obstacle
        // Game over!
        gameStarted = false; // Le jeu est terminé
        statReset(); // Réinitialisation des objets
        score = 0; // Réinitialisation du score
      }
      if (obs.x < -(width/8)) { // Si l'obstacle est sorti de l'écran
        obs.x = width; // Le remettre à droite de l'écran
        obs.y = random(OBSTACLE_HEIGHT_MIN, height-OBSTACLE_HEIGHT_MIN); // Choisir une nouvelle hauteur pour l'obstacle
        score++;
      }
    }
    textAlign(RIGHT); // Alignement du texte à droite
    textSize(TEXT_SIZE); // Taille du texte
    text(score, width-(width/40), height/15); // Affichage du score
  } else {
    textAlign(CENTER); // Alignement du texte au centre
    textSize(START_TEXT_SIZE); // Taille du texte
    text("Appuyez sur ENTER pour commencer", width/2, height/2); // Affichage du message de début de partie
  }
}

void keyPressed() {
  if (key == ' ') { // Si la barre d'espace est pressée
    bird.jump(); // L'oiseau saute
  } else if (key == ENTER) { // Si la touche Entrée est pressée
    gameStarted = true; // La partie commence
  }
}

void statReset() {
  // Réinitialisation des valeurs constantes pour la création des objets
  final float BIRD_WIDTH = 3*width/40; // Largeur de l'oiseau
  final float BIRD_HEIGHT = height/20; // Hauteur de l'oiseau
  final float BIRD_POSITION_X = width/4; // Position horizontale de l'oiseau
  final float BIRD_POSITION_Y = height/2; // Position verticale de l'oiseau
  final float HEIGHT_OBSTACLE_MIN = height/4; // Hauteur minimale pour les obstacles
  final float HEIGHT_OBSTACLE_MAX = height-height/4; // Hauteur maximale pour les obstacles

  // Création d'un nouvel oiseau avec les valeurs réinitialisées
  bird = new Bird(BIRD_POSITION_X, BIRD_POSITION_Y, BIRD_WIDTH, BIRD_HEIGHT, 0, BIRD_JUMP_FORCE);

  // Création des obstacles avec les valeurs réinitialisées
  for (int j = 0; j < obstacles.length; j++) { // Boucle pour tous les obstacles
    float y = random(HEIGHT_OBSTACLE_MIN, HEIGHT_OBSTACLE_MAX ); // Hauteur aléatoire pour l'obstacle
    obstacles[j] = new Obstacle(width + j*(3*width/4), y, OBSTACLE_SPEED); // Nouvel obstacle
  }
}
