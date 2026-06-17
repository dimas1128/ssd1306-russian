#include "lib/ssd1306.h"
#include <util/delay.h>

int main(void)
{
    SSD1306_Init(SSD1306_ADDR);
    _delay_ms(100);
    SSD1306_ClearScreen();
    _delay_ms(50);
    
    // Английские буквы (тест)
    SSD1306_SetPosition(0, 0);
    SSD1306_DrawStringCP1251("TEST OK");
    
    // Русские буквы через HEX (работает 100%)
    SSD1306_SetPosition(0, 2);
    char rus1[] = {0xCF, 0xF0, 0xE8, 0xE2, 0xE5, 0xF2, 0x00}; // "привет"
    SSD1306_DrawStringCP1251(rus1);
    
    // Еще русские буквы
    SSD1306_SetPosition(0, 4);
    char rus2[] = {0xC0, 0xC1, 0xC2, 0xC3, 0xC4, 0x00}; // "АБВГД"
    SSD1306_DrawStringCP1251(rus2);
    
    // Полная фраза
    SSD1306_SetPosition(0, 6);
    char rus3[] = {0xCF, 0xF0, 0xE8, 0xE2, 0xE5, 0xF2, 0x20, 0xEC, 0xE8, 0xF0, 0x21, 0x00}; // "Привет мир!"
    SSD1306_DrawStringCP1251(rus3);
    
    SSD1306_UpdateScreen(SSD1306_ADDR);
    
    while(1) {}
    return 0;
}