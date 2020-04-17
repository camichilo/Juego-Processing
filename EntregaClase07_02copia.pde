float posX[];
float posY[];
int estado[];
int puntaje =0;
int hit = 0;
float vel=0;
float distancia=0;

/*float pos1X[];
float pos1Y[];
int estado1[];
int hit1 = 0;
float vel1=0;
int puntaje1 =0;
float distancia1=0;
*/

PImage Fondo1;
PImage Fondo;
PImage carro1;
PImage carro2;

int stage;
void setup()
{
  stage = 1;
  size(400, 600);

  posX = new float[100];
  posY = new float[100];
  estado = new int[100];

  for (int i=0; i<100; i++)
  {
    posX[i]=random(170, 190);
    posY[i]=random(0, 100);
    estado[i]=1;
  }
  
  Fondo1 =loadImage("fondo1.jpg");
  Fondo =loadImage("Carretera.png");
  carro1 = loadImage("carro1.png");
  carro2 = loadImage("carro2.png");
}

void draw()
{
  if (stage == 1)
  {
    image(Fondo1, 0, 0);
    text("Presiona Cualquier Tecla para Jugar", 50, 300);
    if (keyPressed == true) {
      stage = 2;
    }
  }  

  if (stage == 2) {
    image(Fondo, 0, 0);
    for (int i=0; i<5; i++)
    {
      vel=5;
      posY[i] = posY[i]+vel;
      
    }

    float paddle = 50;
    for (int i=0; i<5; i++)
    {
      if (estado [i] == 1)
      {
        image(carro1, posX[i], posY[i], 30, 50);
        float distance = abs(mouseX-posX[i]);
        if (distance < paddle) hit += 1;
      }
    }


    // Barra
    
    
    image (carro2, mouseX, height-60, 30, 50);

    for (int i=0; i<100; i++)
    {
      if (mousePressed == true)
      {
        distancia = dist(mouseX, mouseY, posX[i], posY[i]);
        if (distancia <= 20)
        {
          estado[i] = 0;
        }
      }
    }

    fill (23, 100, 130);
    text("Negros: " + puntaje, 30, 40);

    puntaje=0;
    for (int i=0; i<100; i++)
    {
      if (estado[i] == 0)
      {
        puntaje++;
      }
    }
  }
}
