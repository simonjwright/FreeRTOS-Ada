all:

include ../stm32f429i-disco-rtos/Makefile.inc

# Definitions for C, C++
INCLUDES += -I$(STM32CUBE)/Projects/STM32F429I-Discovery/Examples/BSP/Inc
DEBUG = -g -O0
CC = arm-eabi-gcc
CXX = arm-eabi-g++
CFLAGS = $(INCLUDES) $(DEFINES) $(DEBUG) $(EXTRA_CFLAGS) $(TARGET_OPTS)
CXXFLAGS = $(INCLUDES) $(DEFINES) $(DEBUG) $(EXTRA_CFLAGS) $(TARGET_OPTS)
LIBS    = -L$(BSP)/adalib -lbsp-rtos
LDC     = stm32f429i-flash.ld

# Definitions for all links
LDFLAGS = -Wl,-v
LDFLAGS += -nostdlib
LDFLAGS += -nodefaultlibs

# Omitted eeprom.c
# Omitted log.c, $(STM32CUBE)/Utilities/Log/lcd_log.c (because stdio)
MAIN_SRC =					\
  lcd.c						\
  main.c					\
  mems.c					\
  touchscreen.c					\
  ts_calibration.c
MAIN_OBJ = \
  $(addsuffix .o,$(basename $(MAIN_SRC)))

main: $(MAIN_OBJ)
	$(CC) $(DEBUG) $^ -o $@			\
	  $(LIBS) $(LDFLAGS)			\
	  -Wl,-T,$(LDC) -Wl,-Map,$@.map
main.c: main.h

DELAY_SRC = delay.c stdio.c
DELAY_OBJ = \
  $(addsuffix .o,$(basename $(DELAY_SRC)))

delay: $(DELAY_OBJ)
	$(CC) $(DEBUG) $(TARGET_OPTS) $^ -o $@			\
	  $(LIBS) $(LDFLAGS)			\
	  -Wl,-T,$(LDC) -Wl,-Map,$@.map

SOME_TICKS_SRC = some_ticks.c
SOME_TICKS_OBJ = \
  $(addsuffix .o,$(basename $(SOME_TICKS_SRC)))

some_ticks: $(SOME_TICKS_OBJ)
	$(CC) $(DEBUG) $^ -o $@			\
	  $(LIBS) $(LDFLAGS)			\
	  -Wl,-T,$(LDC) -Wl,-Map,$@.map

CC_DELAY_SRC = cc_delay.cc stdio.c
CC_DELAY_OBJ = \
  $(addsuffix .o,$(basename $(CC_DELAY_SRC)))

cc_delay: $(CC_DELAY_OBJ)
	$(CXX) $(DEBUG) $(TARGET_OPTS) $^ -o $@		\
	  -lstdc++ $(LIBS) -Wl,-v		\
	  -Wl,-T,$(LDC) -Wl,-Map,$@.map
cc_delay.cc: cc_delay.hh

ada_delay: force
	gprbuild --target=arm-eabi -p -P ada_delay -largs $(LDFLAGS)

lcd: force
	gprbuild --target=arm-eabi -p -P lcd -largs $(LDFLAGS)

%.bin: %
	arm-eabi-objcopy -O binary $< $@

clean:
	rm -f main delay some_ticks cc_delay ada_delay
	rm -f *~ *.bin *.o
	gprclean -P ada_delay

.PHONY: clean force
