# libs Makefile
include ../Makefile.common

#CFLAGS used by libs
LIB_CFLAG = -D"assert_param(expr)=((void)0)"
LIB_CFLAG+= $(COMMONFLAGSlib)
LIB_CFLAG+= -DSTM32F401xx

#Head file used by libs
LIB_INC = -I../inc
LIB_INC+= -I../../hal/inc

#Build process
.PHONY: libs clean

libs.a:
	@cd src && $(CC) -c  $(LIB_CFLAG) $(LIB_INC) *.c
	@$(AR) cr $@ src/*.o

clean:
	rm -f src/*.o
	rm -f ./*.a
