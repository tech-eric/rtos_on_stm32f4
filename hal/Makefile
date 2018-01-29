include ../Makefile.common

#Flags used by gcc
HAL_CFLAGS = $(COMMONFLAGS)
HAL_CFLAGS += -DSTM32F401xx

#Head file path
HAL_INC  += -I../inc

hal.a:
	@cd src/ && $(CC) -c -v $(HAL_INC) $(CFLAGS)  *.c *.s
	@$(AR) cr $@ src/*.o

clean:
	rm -f src/*.o
	rm -f *.a
