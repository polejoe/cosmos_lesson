// 彭东 @ 2021.01.09
// Source: https://gitee.com/lmos/cosmos/blob/master/lesson02/HelloOS/main.c

#include "vgastr.h"

#define G1  (1024 * 1024 * 1024ULL)

void main()
{
    unsigned long long i = 0;

    for (i = 0; i < 0xffffffff; i++)
    {
        printf("Hello OS! ping ");
        unsigned long long j = 20ULL * G1;
        while(j--);
        printf("Hello OS! pong ");
        unsigned long long k = 100ULL * G1;
        while(k--);
    }
    
    return;
}
