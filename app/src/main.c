/*#include "FreeRTOS.h"
#include "FreeRTOSConfig.h"

#include "task.h"

#include "timers.h"

#include "semphr.h"
*/

#define RCC_AHB1ENR  (*((volatile unsigned long *)(0x40023800 + 0x30)))
#define GPIOA_BASE    0x40020000UL

typedef struct {
    unsigned long GPIO_Mode;
    unsigned long GPIO_Type;
    unsigned long GPIO_Speed;
    unsigned long GPIO_Pupd;
    unsigned long GPIO_IDR;
    unsigned long GPIO_ODR;
    unsigned long GPIO_BSRR;
}GPIO_Def;


int main()
{
    GPIO_Def *GPIOA = (GPIO_Def *)(GPIOA_BASE);
    //Enable GPIOA clock
    RCC_AHB1ENR |= (0x01 << 0);

    GPIOA->GPIO_Mode = (0x01 << 10);
    GPIOA->GPIO_Type = (0x0 << 5);//Push pull
    GPIOA->GPIO_Speed = (0x02 << 10);//50M
    GPIOA->GPIO_Pupd = 0x0; //All GPIOA none pull
    GPIOA->GPIO_BSRR = (0x01 << 5); //Set GPIOA_Pin_5 High

    while(1);

    return 0;
}
/*
void vApplicationIdleHook(void)
{

}

void vApplicationTickHook(void)
{
#if ( mainCREATE_SIMPLE_BLINKY_DEMO_ONLY == 0 )
    {
        // In this case the tick hook is used as part of the queue set test. 

    }
#endif // mainCREATE_SIMPLE_BLINKY_DEMO_ONLY 
}

void vApplicationMallocFailedHook(void)
{
    taskDISABLE_INTERRUPTS();

    for(;;);

}*/
