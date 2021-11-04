Particle[] stars;

void setup()
{
  size(500, 500);
  stars = new Particle[200];
  for (int i = 0; i < stars.length; i++)
  {
    if (i < 3)
    {
      stars[i] = new moveParticle();
    } else if (i >= 3 && i < 6)
    {
      stars[i] = new OddballParticle();
    } else 
    {
      stars[i] = new Particle();
    }
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < 3; i++)
  {
    stars[i].move();
    stars[i].show();
    stars[i].follow();
  }
  for (int i = 3; i < 6; i++)
  {
    stars[i].move();
    stars[i].show();
  }
  for (int i = 6; i < stars.length; i++)
  {
    stars[i].move();
    stars[i].show();
  }
}

class Particle
{
  int myColor;
  double myX, myY, mySpeed, myAngle, mySize;
  Particle()
  {
    myX = 250;
    myY = 250;
    mySpeed = (Math.random()*5)+2;
    myAngle = Math.random()*(2*Math.PI);
    myColor = 255;
    mySize = 0.5;
  }
  void move()
  {
    myX = myX + (Math.cos(myAngle)*mySpeed);
    myY = myY + (Math.sin(myAngle)*mySpeed);
    mySize = mySize + 0.05;
    if (mySize > 4)
      mySize = 3.9;

    if (myX < 0)
    {
      myX = 250+(Math.random()*5)-2;
      myY = 250+(Math.random()*5)-2;
      myAngle = Math.random()*(2*Math.PI);
      mySize = 0.5;
      mySpeed = (Math.random()*5)+2;
    } else if (myX > 500)
    {
      myX = 250+(Math.random()*5)-2;
      myY = 250+(Math.random()*5)-2;
      myAngle = Math.random()*(2*Math.PI);
      mySize = 0.5;
      mySpeed = (Math.random()*5)+2;
    }
    if (myY < 0)
    {
      myX = 250+(Math.random()*5)-2;
      myY = 250+(Math.random()*5)-2;
      myAngle = Math.random()*(2*Math.PI);
      mySize = 0.5;
      mySpeed = (Math.random()*5)+2;
    } else if (myY > 500)
    {
      myX = 250+(Math.random()*5)-2;
      myY = 250+(Math.random()*5)-2;
      myAngle = Math.random()*(2*Math.PI);
      mySize = 0.5;
      mySpeed = (Math.random()*5)+2;
    }
  }
  void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void follow(){}
}

class moveParticle extends Particle
{
  moveParticle()
  {
    myX = 250;
    myY = 250;
    myAngle = Math.random()*(2*Math.PI);
    myColor = 80;
    mySize = 10;
  }
  void move()
  {
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }
  void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
    ellipse((float)myX+(float)(Math.random()*4)+1, (float)myY+(float)(Math.random()*4)+1, (float)mySize, (float)mySize);
    ellipse((float)myX-(float)(Math.random()*4)+1, (float)myY+(float)(Math.random()*4)+1, (float)mySize, (float)mySize);
    ellipse((float)myX+(float)(Math.random()*4)+1, (float)myY-(float)(Math.random()*4)+1, (float)mySize, (float)mySize);
    ellipse((float)myX-(float)(Math.random()*4)+1, (float)myY-(float)(Math.random()*4)+1, (float)mySize, (float)mySize);
  }
  void follow()
  {
      if (mouseX - myX <= 0 && dist((float)myX, (float)myY, (float)mouseX, (float)mouseY) > 0) 
      {
        myX = myX - (int)(Math.random()*7)+2;
      }
      if (mouseX - myX > 0 && dist((float)myX, (float)myY, (float)mouseX, (float)mouseY) > 0) 
      {
        myX = myX + (int)(Math.random()*7)-2;
      }
      if (mouseY - myY <= 0 && dist((float)myX, (float)myY, (float)mouseX, (float)mouseY) > 0) 
      {
        myY = myY - (int)(Math.random()*7)+2;
      }
      if (mouseY - myY > 0 && dist((float)myX, (float)myY, (float)mouseX, (float)mouseY) > 0) 
      {
        myY = myY + (int)(Math.random()*7)-2;
      }
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {
    myX = (int)(Math.random()*500)-250;
    myY = (int)(Math.random()*500)-250;
    mySize = 5;
  }
  void move()
  {
    myX = myX + 1;
    myY = myY + 1;
    
    if (myX > 500)
    {
      myX = (int)(Math.random()*500)-250;
      myY = (int)(Math.random()*500)-250;
    }
  }
  void show()
  {
    noStroke();
    fill(251, 255, 0);
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
}
