/*ENTRY(Reset_Handler)*/
ENTRY(Reset_Handler)

MEMORY {
	FLASH (RX) : ORIGIN = 0x08000000 , LENGTH = 508K
	RAM (RWX) : ORIGIN = 0x20000000 , LENGTH = 112K
}
_estack	= ORIGIN(RAM)+LENGTH(RAM);	/* end of the stack */

SECTIONS {
	/* vector table and program code goes into FLASH */
    .text :
    {
        . = ALIGN(4);
        _stext = .;
        KEEP(*(.isr_vector))
        *(.text)
        *(.text.*)
        *(.rodata)
        *(.rodata.*)
        . = ALIGN(4);
        _etext = .;
        _sidata = _etext;
	} > FLASH

    .data : AT(_sidata)
    {
        . = ALIGN(4);
        _sdata = .;
        *(.data)
        *(.data.*)
        . = ALIGN(4);
        _edata = .;
    } > RAM

    .bss : {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } > RAM

    PROVIDE( end = _ebss );
    PROVIDE( _end = _ebss );
}
