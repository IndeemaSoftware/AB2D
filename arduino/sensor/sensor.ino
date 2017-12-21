#include <SPI.h>
#include <SparkFun_ADXL345.h>
#include <EEPROM.h>

ADXL345 adxl = ADXL345(10);           // SPI CS is wired to pin 10;
ADXL345(CS_PIN);
int x=0;
int y=0;
int z=z;

int ox = 0;
int oy = 0;
int oz = 0;

void setup() {
  // chip settings
  Serial.begin(115200);                 // Start the serial terminal
  Serial.println("Reading ADXL345");

  adxl.powerOn();                     // Power on the ADXL345  
  adxl.setSpiBit(0);                  // Configure the device to be in 4 wire SPI mode when set to '0' or 3 wire SPI mode when set to 
}

void loop() {
  adxl.readAccel(&x, &y, &z);         // Read the accelerometer values and store them in variables declared above x,y,z

  //we should check values updated before reading them
  if (((ox == 0 && oy == 0 && oz == 0) 
    || (ox != x || oy != y || oz != z))) {        
    //vertical
    Serial.print(String("x: " + String(x) + "\ny: " + String(y) + "\nz: " + String(z) + "\n"));
    ox = x;
    oy = y;
    oz = z;
  }
}
