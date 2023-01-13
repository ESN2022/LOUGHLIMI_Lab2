#include "sys/alt_stdio.h"
#include "system.h"
#include "alt_types.h"
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer.h"
#include "altera_avalon_timer_regs.h"
#include "sys/alt_irq.h"
#include "sys/alt_sys_init.h"
#include <stdint.h>
#include "unistd.h"

/* Initialize variables */
uint16_t count = 0x0000;   // Counter
uint16_t timer_period_l = 0xf07f;  // Timer period for 1 second
uint16_t timer_period_h = 0x02fa;

/* Interrupt function that increments the counter and modifies the timer period based on switch state */
static void increment (void * context, alt_u32 id)
{
    /* Get switch state */
    uint8_t switch_state = IORD_ALTERA_AVALON_PIO_DATA(PIO_1_BASE);

    /* If switch 7 is not engaged, increment counter */
    if ((switch_state & 0x80) == 0)   
    {
        if (count == 0x03e7)    // If counter reaches 999, reset it to 0
        {
            count = 0x0000;
        }
        else
        {           
            count ++;
        }
    }

    /* Output counter value to PIO_0_BASE */
    IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE, count);
       
    /* Modify timer period based on switch state */
    IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, timer_period_l / ((switch_state & 0x7f) + 0x1));
    IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, timer_period_h / ((switch_state & 0x7f) + 0x1));
    
    /* Restart timer */
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x5);
    IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x2);
}

int main()
{
    /* Get switch state */
    uint8_t switch_state = IORD_ALTERA_AVALON_PIO_DATA(PIO_1_BASE);

    /* Modify timer period based on switch state */
    IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, timer_period_l / ((switch_state & 0x7f) + 0x1));
    IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, timer_period_h / ((switch_state & 0x7f) + 0x1));
   

    /* Start timer */
    IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE, 0x5);

    /* Register interrupt function to be called when timer reaches 0 */
    alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ, (void*)increment, NULL, 0x0);
    
    return 0;
}

