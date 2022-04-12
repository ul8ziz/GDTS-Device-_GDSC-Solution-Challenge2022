#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include <GlcoseMeterEq.h>

int x=0;
int y=0;
int glcuse_led=1;
int glcuse_sig=A0;
long calc=0;
int stus=15;
int en=14;
// Set the LCD address to 0x27 for a 16 chars and 2 line display
LiquidCrystal_I2C lcd(0x27, 2, 1, 0, 4, 5, 6, 7, 3, POSITIVE);
void setup() {
  pinMode(11,INPUT); 
  pinMode(stus,INPUT);
  pinMode(en,OUTPUT);
  Serial1.begin(9600 );
  //Serial.begin(9600 );
  lcd.begin(16,2);//lcd.backlight();
  lcd.print(" START TESTING");
  lcd.setCursor(0, 1);
  lcd.print("PUT YOUR FINGER");
  delay(2000);
  
  Serial1.write("HI\n");
  delay(1000);
  Serial1.write("PLS PUT YOUR FINGER\n");
  delay(200);
  Serial1.write("PRESS START OR SEND 1 FROM THE APP \n");
  delay(200);
   digitalWrite(en,LOW);
  
}

void loop() {
 
  start1:
  //lcd.print("start testing");    
 if (digitalRead(11)==HIGH || Serial1.read()=='1')
 {
  x=0;
  calc=0;
  Serial1.write("wait.....");
  delay(100);
  for(int j=0;j<500;j++)
 {
  calc+=glc_scan;
  delay(10);
  if (j<=100)
  {
      lcd.clear();
      lcd.print("        1");
  }
    if (j<=200&&j>100)
  {
      lcd.clear();
      lcd.print("        2");
  }
    if (j<=300&&j>200)
  {
      lcd.clear();
      lcd.print("        3");
  }
    if (j<=400&&j>300)
  {
      lcd.clear();
      lcd.print("        4");
  }
    if (j<=500&&j>400)
  {
      lcd.clear();
      lcd.print("        5");
  }
 }
  glc_res=calc/500;
 if (glc_res>500)
 {
  lcd.print("      ERROR");
  lcd.setCursor(0, 1);
  lcd.print("   pp   ERROR");
  Serial1.write("Error");
  goto start1; 
  }
   if (glc_res<500&&glc_res>200)
 {
  lcd.setCursor(0, 0);
  lcd.print("   TEST AGAIN");
  lcd.setCursor(6, 1);
  lcd.print(glc_res);
  delay(100);
   Serial1.write("test again");
   Serial1.write(glc_res);
  goto start1; 
  }
 else{
  lcd.setCursor(0, 0);
  lcd.print("     GLCUSE");
  lcd.setCursor(6, 1);
  lcd.print(glc_res);
 delay(100);
   Serial1.write("GLCUSE");
   Serial1.write(glc_res);
 delay(100);
}}}
