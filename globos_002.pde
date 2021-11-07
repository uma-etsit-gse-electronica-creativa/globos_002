// Luis Molina-Tanco - 2021. 
// 
// Ejemplo uso puerto serie. 
//
// Este programa está pensado para funcionar con un arduino
// que esté ejecutando el ejemplo InputPullupSerial, que se puede
// ver aquí:
//
// https://www.arduino.cc/en/Tutorial/BuiltInExamples/InputPullupSerial  

import processing.serial.*;
ArrayList<Globo> globos;
Serial myPort;
int dato=0, datoAnt=0;
void setup()
{
  size(displayWidth, displayHeight);
  background(255, 255, 255);
  globos = new ArrayList<Globo>();
  printArray(Serial.list());
  myPort = new Serial(this, Serial.list()[4], 9600); 
  myPort.bufferUntil(10);
  myPort.clear();
}

void draw()
{
  background(155, 226, 244);
  for (int i = 0; i<globos.size(); i++)
  {
    Globo g = globos.get(i);
    g.update();
    g.draw();
  }
}

void mousePressed()
{
 creaGlobo(mouseX,mouseY); 
}

void serialEvent(Serial p)
{
  String datoS = p.readString();
  dato = int(datoS.trim());
  // Tenemos que hacer esto porque el programa Arduino es muy sencillo. 
  // Manda constantemente el valor a la entrada a la que está conectada el pulsador. 
  if (datoAnt == 1)
  {
    if (dato == 0) {
      creaGlobo(int(random(0,width)),height-100);
    }
  }
  datoAnt = dato;
}

void creaGlobo(int x, int y)
{
  globos.add(new Globo(random(100, 150), 
    color(random(255),random(255),random(255)),
    x, 
    y, 
    0.0, 
    0.0));
    println(globos.size());
}
