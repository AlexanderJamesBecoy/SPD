import cc.arduino.*;
import org.firmata.*;

import processing.serial.*;


// Module Opgave - 4 Extra
// Alexander James Becoy
// 18-9-2017

Arduino arduino;
int ledPin = 13;

void setup() {
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
}

void draw() {
  arduino.digitalWrite(ledPin, Arduino.HIGH);
  delay(1000);
  arduino.digitalWrite(ledPin, Arduino.LOW);
  delay(1000);
}