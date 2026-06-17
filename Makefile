# Базовые настройки проекта
TARGET        = main
LIBDIR        = lib
DEVICE        = atmega328p
FCPU          = 16000000
OPTIMIZE      = Os

# Компилятор и флаги
CC            = avr-gcc
CFLAGS        = -g -Wall -DF_CPU=$(FCPU) -mmcu=$(DEVICE) -$(OPTIMIZE)
OBJCOPY       = avr-objcopy
OBJFLAGS      = -j .data -j .text -O ihex
AVRSIZE       = avr-size

# Настройки программатора USBasp
AVRDUDE       = avrdude
AVRDUDE_MMCU  = m328p
AVRDUDE_PROG  = usbasp
AVRDUDE_PORT  = usb
AVRDUDE_FLAGS = -p $(AVRDUDE_MMCU) -c $(AVRDUDE_PROG) -P $(AVRDUDE_PORT)

# Поиск всех файлов .c в корне и в папке lib
SOURCES      := $(wildcard *.c $(LIBDIR)/*.c)
OBJECTS       = $(SOURCES:.c=.o)

# Главная цель сборки: сначала делает HEX, потом САМА прошивает
all: $(TARGET).hex flash

$(TARGET).hex: $(TARGET).elf
	$(OBJCOPY) $(OBJFLAGS) $(TARGET).elf $(TARGET).hex
	@echo "-----------------------------------------------------------------------" 
	$(AVRSIZE) $(TARGET).elf

$(TARGET).elf: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $(TARGET).elf

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Команда автоматической прошивки
flash:
	@echo "-----------------------------------------------------------------------"
	@echo "Flashing $(TARGET).hex into $(DEVICE) via USBasp..."
	$(AVRDUDE) $(AVRDUDE_FLAGS) -U flash:w:$(TARGET).hex:i

# Очистка проекта
clean:
	@echo "-----------------------------------------------------------------------"
	rm -f *.o $(LIBDIR)/*.o $(TARGET).elf $(TARGET).hex
