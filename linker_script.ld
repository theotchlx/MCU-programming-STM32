ENTRY(reset_handler)
/* Define memory regions, where FLASH and SRAM lie in the STM32 */
MEMORY
{
  FLASH (rx): ORIGIN = 0x08000000, LENGTH = 128K
  SRAM (rwx): ORIGIN = 0X20000000, LENGTH = 32K
}

/* Define memory sections */
SECTIONS
{
  .isr_vector :
  {
    KEEP(*(.isr_vector))
  } >FLASH  /* Specify which region this section should be placed in */

  .text :
  {
    . = ALIGN(4);
		
    *(.text)
    *(.rodata)
		
    . = ALIGN(4);
    _etext = .;
  } >FLASH

  .data :
  {
    . = ALIGN(4);
    _sdata = .;
		
    *(.data)

    . = ALIGN(4);
    _edata = .;
  } >SRAM AT> FLASH

  .bss :
  {
    . = ALIGN(4);
    _sbss = .;
		
    *(.bss)
		
    . = ALIGN(4);
    _ebss = .;
  } >SRAM
}

