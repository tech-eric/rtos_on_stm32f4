include ../Makefile.common

#Flags used by gcc
OS_CFLAGS = $(COMMONFLAGS)
#OS_CFLAGS+= -v

#Head file path
OS_INC   = -I../../hal/inc
OS_INC  += -I../inc

os.a:
	@cd src/ && $(CC) -c $(OS_INC) $(CFLAGS)  *.c
	@$(AR) cr $@ src/*.o

clean:
	rm -f src/*.o
	rm -f *.a
