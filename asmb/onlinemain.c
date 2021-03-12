#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define arraysizeof(x) (sizeof(x) / sizeof(x[0]))

/* x, y haben n Elemente, sum hat n+1 Elemente */
void asmbref(
    unsigned long x[],
    unsigned long y[],
    unsigned long sum[],
    size_t n)
{
    unsigned long carry, s;
    size_t i;
    carry = 0;
    for (i = 0; i < n; i++)
    {
        s = x[i] + y[i] + carry;
        carry = carry ? s <= x[i] : s < x[i];
        sum[i] = s;
    }
    sum[i] = carry;
}

void asmb(unsigned long x[], unsigned long y[], unsigned long sum[], size_t n);

void fail_on_null(void *ptr, char *reason)
{
    if (ptr == NULL)
    {
        fprintf(stderr, "%s\n", reason);
        exit(EXIT_FAILURE);
    }
}

void test_values(
    unsigned long x[],
    unsigned long y[],
    size_t n)
{
#define PAD_A "%16s"
#define PAD_B "%17lx"

    size_t buffersize = n * sizeof(unsigned long);
    size_t sumbuffersize = (n + 1) * sizeof(unsigned long);

    unsigned long *xcpy = (unsigned long *)malloc(buffersize);
    unsigned long *ycpy = (unsigned long *)malloc(buffersize);
    unsigned long *sumref = (unsigned long *)malloc(sumbuffersize);
    unsigned long *sumact = (unsigned long *)malloc(sumbuffersize);

    fail_on_null(xcpy, "ALLOCATION ERROR");
    fail_on_null(ycpy, "ALLOCATION ERROR");
    fail_on_null(sumref, "ALLOCATION ERROR");
    fail_on_null(sumact, "ALLOCATION ERROR");

    memcpy(xcpy, x, buffersize);
    memcpy(ycpy, y, buffersize);
    memset(sumref, 0, sumbuffersize);
    memset(sumact, 0, sumbuffersize);

    asmbref(x, y, sumref, n);
    asmb(x, y, sumact, n);

    if (memcmp(sumref, sumact, sumbuffersize) != 0)
    {

        fprintf(stderr, "[-] Test failure.\t Size: %lu\n" PAD_A, n, "x:");

        for (size_t i = 0; i < n; i++)
        {
            fprintf(stderr, PAD_B, x[i]);
        }
        fprintf(stderr, "\n" PAD_A, "y:");

        for (size_t i = 0; i < n; i++)
        {
            fprintf(stderr, PAD_B, y[i]);
        }
        fprintf(stderr, "\n" PAD_A, "reference:");

        for (size_t i = 0; i < n + 1; i++)
        {
            fprintf(stderr, PAD_B, sumref[i]);
        }
        fprintf(stderr, "\n" PAD_A, "actual:");

        for (size_t i = 0; i < n + 1; i++)
        {
            fprintf(stderr, PAD_B, sumact[i]);
        }
        fprintf(stderr, "\n");

        fprintf(stderr, "\n");
    }

    memset(sumref, 0xFF, sumbuffersize);
    memset(sumact, 0xFF, sumbuffersize);

    asmbref(x, y, sumref, n);
    asmb(x, y, sumact, n);

    if (memcmp(sumref, sumact, sumbuffersize) != 0)
    {
        fprintf(stderr, "Assembly is not correctly clearing the output buffer.\n");
        fprintf(stderr, "\n" PAD_A, "reference:");

        for (size_t i = 0; i < n + 1; i++)
        {
            fprintf(stderr, PAD_B, sumref[i]);
        }
        fprintf(stderr, "\n" PAD_A, "actual:");

        for (size_t i = 0; i < n + 1; i++)
        {
            fprintf(stderr, PAD_B, sumact[i]);
        }

        printf("\n\n");
    }

    // else
    // {
    //     fprintf(stderr, "[+] Test Success.\t Size: %lu\n" PAD_A, n, "x:");

    //     for (size_t i = 0; i < n; i++)
    //     {
    //         fprintf(stderr, PAD_B, x[i]);
    //     }
    //     fprintf(stderr, "\n" PAD_A, "y:");

    //     for (size_t i = 0; i < n; i++)
    //     {
    //         fprintf(stderr, PAD_B, y[i]);
    //     }
    //     fprintf(stderr, "\n" PAD_A, "reference:");

    //     for (size_t i = 0; i < n + 1; i++)
    //     {
    //         fprintf(stderr, PAD_B, sumref[i]);
    //     }
    //     fprintf(stderr, "\n" PAD_A, "actual:");

    //     for (size_t i = 0; i < n + 1; i++)
    //     {
    //         fprintf(stderr, PAD_B, sumact[i]);
    //     }
    //     fprintf(stderr, "\n");

    //     fprintf(stderr, "\n");
    // }

    free(xcpy);
    free(ycpy);
    free(sumref);
    free(sumact);

#undef PAD_A
#undef PAD_B
}

int main(void)
{
    printf("Running tests...\n");
    for (unsigned long i = 0x0; i <= 0xFF; i++)
    {
        unsigned long value = i;
        value |= value << 8;
        value |= value << 16;
        value |= value << 32;

        size_t size = (size_t)i;

        unsigned long *x = (unsigned long *)malloc(size * sizeof(unsigned long));
        unsigned long *y = (unsigned long *)malloc(size * sizeof(unsigned long));

        fail_on_null(x, "ALLOCATION ERROR");
        fail_on_null(y, "ALLOCATION ERROR");

        for (size_t j = 0; j < size; j++)
        {
            x[j] = value;
            y[j] = value;
        }

        test_values(x, y, size);

        free(x);
        free(y);
    }
    {
        unsigned long x[] = {0xffffffffffffffffL, 0x0000000000000003L};
        unsigned long y[] = {0x0000000000000001L, 0x0000000000000004L};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xffffffffffffffffL, 0x0000000000000003L};
        unsigned long y[] = {0x0000000000000001L, 0x0000000000000004L};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xffffffffffffffffL, 0x0000000000000003L};
        unsigned long y[] = {0x0000000000000000L, 0x0000000000000001L};

        test_values(x, y, arraysizeof(x));
    }

    {
        unsigned long x[] = {0x0000000000000003L, 0xffffffffffffffffL};
        unsigned long y[] = {0x0000000000000004L, 0x0000000000000001L};

        test_values(x, y, arraysizeof(x));
    }

    {
        unsigned long x[] = {0x0000000000000003L, 0xffffffffffffffffL};
        unsigned long y[] = {0x0000000000000001L, 0x0000000000000000L};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0x0000000000000004L, 0x0000000000000001L};
        unsigned long y[] = {0x0000000000000003L, 0xffffffffffffffffL};

        test_values(x, y, arraysizeof(x));
    }

    {
        unsigned long x[] = {0x8000000000000000L, 0x8000000000000000L};
        unsigned long y[] = {0x8000000000000000L, 0x8000000000000000L};

        test_values(x, y, arraysizeof(x));
    }

    {
        unsigned long x[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL};
        unsigned long y[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL};

        test_values(x, y, arraysizeof(x));
    }

    {
        unsigned long x[] = {0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L, 0x0000000000000001L, 0x0000000000000000L, 0x0000000000000004L, 0x0000000000000001L, 0x000000000000000L, 0x3fffffffffffffffL, 0xfL};
        unsigned long y[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L, 0x0000000000000001L, 0x0000000000000000L, 0x000000000000000L, 0x4000000000000000L, 0x1L};

        test_values(x, y, arraysizeof(x));
    }

    {
        unsigned long x[] = {0x8000000000000000L, 0x0000000000000001L, 0x0000000000000000L, 0x0000000000000004L, 0x0000000000000001L, 0x0000000000000003L, 0xffffffffffffffffL};
        unsigned long y[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L, 0x0000000000000001L, 0x0000000000000000L};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L, 0x0000000000000001L, 0x0000000000000000L, 0x000000000000000L, 0x4000000000000000L, 0x1L};
        unsigned long y[] = {0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L, 0x0000000000000001L, 0x0000000000000000L, 0x0000000000000004L, 0x0000000000000001L, 0x000000000000000L, 0x3fffffffffffffffL, 0xfL};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L};
        unsigned long y[] = {0xffffffffffffffffL, 0xffffffffffffffffL, 0xffffffffffffffffL, 0x8000000000000000L, 0x8000000000000000L};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xffffffffffffffffL};
        unsigned long y[] = {0xffffffffffffffffL};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xfffffffffffffffeL, 0xffffffffffffffffL};
        unsigned long y[] = {0x0000000000000001L, 0xffffffffffffffffL};

        test_values(x, y, arraysizeof(x));
    }
    {
        unsigned long x[] = {0xffffffffffffffffL, 0xfffffffffffffffeL};
        unsigned long y[] = {0xffffffffffffffffL, 0x0000000000000001L};

        test_values(x, y, arraysizeof(x));
    }

    printf("Tests done.\n");
}