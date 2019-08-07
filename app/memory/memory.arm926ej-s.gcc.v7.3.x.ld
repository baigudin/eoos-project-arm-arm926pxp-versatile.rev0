OUTPUT_FORMAT("elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_c_int00)

IRQ_STACK_SIZE = 0x2000;
FIQ_STACK_SIZE = 0x2000;
ABT_STACK_SIZE = 0x2000;
UND_STACK_SIZE = 0x2000;
SVC_STACK_SIZE = 0x2000;
USR_STACK_SIZE = 0x2000;

MEMORY
{
    /** ARM Exceptions */
    HWI                   : o = 0x00010000, l = 0x00000040

    /** 64MB SDRAM - 64B */
    MPMC_SDRAM            : o = 0x00010040, l = 0x03FFFFC0
}

SECTIONS
{
  	.text.hwi : {
        *( .text.hwi )
    } > HWI

    .text : {
        *( .text )
    } > MPMC_SDRAM

    .ctors : {
        KEEP (*crtbegin.o(.ctors))
        KEEP (*(EXCLUDE_FILE (*crtend.o ) .ctors))
        KEEP (*(SORT(.ctors.*)))
        KEEP (*(.ctors))
    } > MPMC_SDRAM

    .dtors : {
        KEEP (*crtbegin.o(.dtors))
        KEEP (*(EXCLUDE_FILE (*crtend.o ) .dtors))
        KEEP (*(SORT(.dtors.*)))
        KEEP (*(.dtors))
    } > MPMC_SDRAM

    . = ALIGN(4);
    .init_array :
    {
        __init_array_start = .;
        KEEP (*(.init_array*))
        __init_array_end = .;
    } > MPMC_SDRAM

    .data : {
        *( .data )
    } > MPMC_SDRAM

    .bss : {
        __bss_start__ = .;
        *( .bss )
        . = ALIGN(8);
        __bss_end__ = . ;
        end = . ;
        __end__ = . ;
    } > MPMC_SDRAM

    .stack : {
        __stack_start__ = .;

        . += IRQ_STACK_SIZE;
        . = ALIGN(8);
        __irq_stack_top__ = . ;

        . += FIQ_STACK_SIZE;
        . = ALIGN(8);
        __fiq_stack_top__ = . ;

        . += ABT_STACK_SIZE;
        . = ALIGN(8);
        __abt_stack_top__ = . ;

        . += UND_STACK_SIZE;
        . = ALIGN(8);
        __und_stack_top__ = . ;

        . += SVC_STACK_SIZE;
        . = ALIGN(8);
        __svc_stack_top__ = . ;

        . += USR_STACK_SIZE;
        . = ALIGN(8);
        __usr_stack_top__ = . ;

        __stack_end__ = .;

    } > MPMC_SDRAM

    /* The section containing information for unwinding the stack */
    .ARM.exidx : {
        __exidx_start = .;
        *(.ARM.exidx* .gnu.linkonce.armexidx.*)
        __exidx_end = .;
    } > MPMC_SDRAM

    /* The section is for a Build ID that is a unique identification 160-bit SHA-1 string */
    .note.gnu.build-id : {
        *( .note.gnu.build-id )
    } > MPMC_SDRAM
}
