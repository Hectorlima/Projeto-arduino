// Inclui a biblioteca LiquidCrystal.h
#include <LiquidCrystal.h>
// Define que o pino 6 responde como switch_pin 
#define switch_pin 6

// Inicializa a biblioteca com os pinos ligados no Arduino
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

void setup(){
  pinMode(switch_pin, INPUT);  
  // Configura o número de linhas e colunas no Arduino
  lcd.begin(16, 2);
  // Inicializa a comunicação serial
  Serial.begin(9600);
}


void loop()
{
  
   
   
  // Quando chegar algum caracter na porta serial
  if (Serial.available()) {
    // Espera um pouco para a mensagem chegar
    delay(100);
    // Limpa o LCD
    lcd.clear();
    // Lê os caractéres que chegam na comunicação serial
    while (Serial.available() > 0) {
      // Exibe os caracteres no LCD
     lcd.write(Serial.read());
    
  }
  // Vai realizar a função 25 vezes
   for (int positionCounter = 0; positionCounter < 25; positionCounter++) {
    // Move uma posição do lcd para esquerda
    lcd.scrollDisplayLeft(); 
    // Aguarda um momento
    delay(150);}
  }

  // Vai realizar a função 25 vezes
   for (int positionCounter = 0; positionCounter < 25; positionCounter++) {
    // Move uma posição do lcd para esquerda
    lcd.scrollDisplayLeft(); 
    // Aguarda um momento
    delay(150);
  }
   
  
  // cria uma variável do tipo inteira
  int chave = 0;
  // chave vai receber o valor da leitura do pino 6
   chave = digitalRead(switch_pin);
   // Se chave, que é o pino 6, estiver conduzindo 5v(HIGH)
    if (chave == HIGH) {
      // Enviará via serial, para o PC, a informação LIGADO
      Serial.println("Ligado");
      // Espera um tempo de 1 segundo
     delay(1000);
     // Senão   
     } else {
      // Enviará via serial, para o PC, a informação DESLIGADO
     Serial.println("Desligado");
   // Espera um tempo de 1 segundo
   delay(1000);
 }
  


  }



  


