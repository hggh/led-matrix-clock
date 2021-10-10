#include <Arduino.h>
#include <SPIFFS.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <time.h>
#include <Wire.h>
#include <FS.h>

#include <IS31FL3730.h>
#include <WiFiManager.h>
#include <Bounce2.h>

#include "chars.h"

#define M1 0
#define M2 1

#define IS31FL3730_SDB 26
#define BUTTON_WIFI_RESET 19
#define HOSTNAME "LM-CLOCKI"

IS31FL3730 m1;
IS31FL3730 m2;
IS31FL3730 m3;

WiFiManager wm;
Bounce2::Button wifi_cfg_reset = Bounce2::Button();
const long gmt_offset_sec = 3600;
const int  day_light_offset_sec = 3600;
bool update_matrix = false;
uint8_t time_hour = 255;
uint8_t time_minute = 255;


void display_number(IS31FL3730 *m, uint8_t i, uint8_t number) {
  for(uint8_t y = 0; y < 7; y++) {
    for(uint8_t x = 0; x < 5; x++) {
      m->set_pixel(i, x, y, char_5x7_NUM[number][y][x]);
    }
  }
}

void display_char(IS31FL3730 *m, uint8_t i, uint8_t c[7][5]) {
  for(uint8_t y = 0; y < 7; y++) {
    for(uint8_t x = 0; x < 5; x++) {
      m->set_pixel(i, x, y, c[y][x]);
    }
  }
}

void wm_config_mode_callback(WiFiManager *myWiFiManager) {
  Serial.println("Entering WiFI Manager configuration....");

  display_char(&m1, M2, char_5x7_W);
  display_char(&m1, M1, char_5x7_I);
  display_char(&m2, M2, char_5x7_F);
  display_char(&m2, M1, char_5x7_I);
  display_char(&m3, M2, char_5x7_EXCLA);

  m1.update();
  m2.update();
  m3.update();
}


void setup() {
  Serial.begin(115200);
  btStop();
  WiFi.mode(WIFI_STA);
  WiFi.setHostname(HOSTNAME);

  pinMode(IS31FL3730_SDB, OUTPUT);
  digitalWrite(IS31FL3730_SDB, HIGH);

  wifi_cfg_reset.attach(BUTTON_WIFI_RESET, INPUT_PULLUP);
  wifi_cfg_reset.interval(25);
  wifi_cfg_reset.setPressedState(LOW);

  m1.begin(0x60);
  m2.begin(0x63);
  m3.begin(0x61);
  m1.set_bright(80);
  m2.set_bright(80);
  m3.set_bright(80);
  m1.set_le(0x9);
  m2.set_le(0x9);
  m3.set_le(0x9);


  if(!SPIFFS.begin(true)){
    Serial.println("error on SPIFFS...");
  }
  wm.setAPCallback(wm_config_mode_callback);
  wm.autoConnect(HOSTNAME, "");

  configTime(gmt_offset_sec, day_light_offset_sec, "0.de.pool.ntp.org", "1.de.pool.ntp.org", "2.de.pool.ntp.org");
  setenv("TZ", "CET-1CEST,M3.5.0,M10.5.0/3", 1);
  tzset();
}

void loop() {
  wifi_cfg_reset.update();
  struct tm timedate;
  getLocalTime(&timedate);

  if (wifi_cfg_reset.pressed()) {
    // WiFi reset configuration button was pressed
    wm.resetSettings();
    Serial.println("WiFi reset configuration button was pressed......");
    Serial.flush();
    delay(500);
    ESP.restart();
  }

  if (timedate.tm_min != time_minute || timedate.tm_hour != time_hour || update_matrix == true) {
    update_matrix = false;

    time_minute = timedate.tm_min;
    time_hour = timedate.tm_hour;

    Serial.println("Time has changed...");
    Serial.print("Hour: ");
    Serial.println(time_hour);
    Serial.print("Minute: ");
    Serial.println(time_minute);

    uint8_t t_first_hour = ((time_hour / 10 ) % 10);
    uint8_t t_second_hour = (time_hour % 10 );
    uint8_t t_first_minute = ((time_minute / 10 ) % 10);
    uint8_t t_second_minute = (time_minute % 10 );

    display_number(&m1, M2, t_first_hour);
    display_number(&m1, M1, t_second_hour);
    display_char(&m2, M2, char_5x7_COLON);
    display_number(&m2, M1, t_first_minute);
    display_number(&m3, M2, t_second_minute);

    m1.update();
    m2.update();
    m3.update();
  }
  delay(1);
}
