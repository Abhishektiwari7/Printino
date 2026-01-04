#include <stdio.h>
#include "lcd.h"
#include "image.h"

//---bitbang pins------------------------------
const int _CS    = 40;
const int _RESET = 42;
const int _SCLK  = 44;
const int _SID   = 46; // Mosi
//Backlight Default Gpio4 //PWM BRIGHTNESS
Nokia105 display( _SID,  _SCLK, _RESET, _CS);

extern "C" int main(void) {

    display.initDisplay();
    display.PWMinit();
    display.setLcdBrightness(100);   //max 512, duty cycle
    display.setDrawPosition(128,160);
    display.backgroundColor(BLUE);
    display.displayClear();
    const char *vchar="Volt:";
       
    while (1) {
        //---------------------DISPLAY SETUP----------------------------------------
        display.printString(vchar,1,10,GREEN,BLACK); //there are problem in 0 printing
    }// end of while
}//end of main