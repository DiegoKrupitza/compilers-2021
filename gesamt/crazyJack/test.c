#include <stdio.h>
#include <time.h>

extern long testclass[];
long heap[5000];
extern void heap_setup(long heap[]);

int fib(int x){
    if (x == 1)
    {
        return 1;
    }else{
        if (x == 2)
        {
            return 1;
        }else{
            return fib(x-1)+fib(x-2);
        }
    }
}

int main(){
    long obj[] = {-10,-10,3};
    long (*fun)() = testclass[0];

    clock_t begin = clock();
    heap_setup(heap);
    printf("result:\t%d\n",fun());
    /*
    clock_t end = clock();
    clock_t time = end-begin;
    begin = clock();
    printf("result:\t%d\n",fib(42));
    end = clock();
    clock_t time2 = end-begin;
    printf("mine: %d, c:%d\n",time,time2);
    */
    //printf("%d %d\n",&heap[0],bobbi);
    /*
    printf("bobbi   \t%d\n",bobbi);
    printf("bobbi_ggt   \t%d\n", bobbi[0]);
    printf("bobbi_hi   \t%d\n", bobbi[1]);
    printf("%d\n",bobbi[1]-bobbi[0]);
    //printf("(\%rax) \t\t%d\n", bobbi+8);*/
    return 0;
}