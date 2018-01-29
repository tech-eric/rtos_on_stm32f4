# general Makefile
include Makefile.common

#Needed modules
LDHAL  = ./hal/hal.a
LDLIBS = ./libs/libs.a
LDAPP  = ./app/app.a
LDOS = ./os/os.a

STARTUP=startup.c

all:  app hal
	$(CC)  -o $(PROGRAM).elf  $(LDFLAGS)\
		-Wl,--whole-archive $(LDAPP) $(LDHAL)
		#-Wl,--no-whole-archive $(LDLIBS)

	$(OBJCOPY) -O ihex $(PROGRAM).elf $(PROGRAM).hex
	$(OBJCOPY) -O binary $(PROGRAM).elf $(PROGRAM).bin
#Extract info contained in ELF to readable text-files:
	arm-none-eabi-readelf -a $(PROGRAM).elf > $(PROGRAM).info_elf
	arm-none-eabi-size -d -B -t $(PROGRAM).elf > $(PROGRAM).info_size
	arm-none-eabi-objdump -S $(PROGRAM).elf > $(PROGRAM).info_code
	arm-none-eabi-nm -t d -S --size-sort -s $(PROGRAM).elf > $(PROGRAM).info_symbol

.PHONY: all libs app hal os clean tshow

hal:
	make -C hal
libs:
	make -C libs
app:
	make -C app

os:
	make -C os

clean:
	$(MAKE) -C app clean
	$(MAKE) -C hal clean
	$(MAKE) -C libs clean
	$(MAKE) -C os clean
	rm -f $(PROGRAM).elf $(PROGRAM).hex $(PROGRAM).bin $(PROGRAM).info_elf $(PROGRAM).info_size
	rm -f $(PROGRAM).info_code
	rm -f $(PROGRAM).info_symbol
