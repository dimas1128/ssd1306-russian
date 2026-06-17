# SSD1306 OLED Library with Russian Language Support

Библиотека для работы с OLED-дисплеем SSD1306 на микроконтроллерах AVR (ATmega328P) с поддержкой **русского языка** (кодировка CP1251).

## 📦 Состав

- `lib/ssd1306.c/h` — основная библиотека
- `lib/font*.h` — шрифты (включая кириллицу)
- `lib/twio.c/h` — работа с I2C/TWI
- `main.c` — пример использования
- `Makefile` — сборка проекта

## 🔌 Подключение (I2C)

| OLED | Arduino (ATmega328P) |
|------|----------------------|
| VCC  | 5V                   |
| GND  | GND                  |
| SDA  | A4                   |
| SCL  | A5                   |

## 🚀 Сборка и заливка

```bash
make          # Собрать прошивку
make clean    # Очистить временные файлы