include ../Makefile.common

#Flags used by gcc
APP_CFLAGS = $(COMMONFLAGS)
APP_CFLAGS+= -DSTM32F401xx

#Head file path
APP_INC   = -I../../hal/inc
APP_INC  += -I../inc
APP_INC  += -I../../libs/inc
APP_INC  += -I../../os/inc

app.a:
	@echo $(APP_CFLAGS)
	@cd src/ && $(CC) -c $(APP_INC) $(CFLAGS) *.c
	@$(AR) cr $@ src/*.o

clean:
	rm -f src/*.o
	rm -f *.a
