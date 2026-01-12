#include <stdarg.h> // Variadic function utilities
#include <stdio.h>

void print_int( unsigned int num_ints, char *msg, ... ) {
    va_list ap; // keeps track of current argument, similar (in concept) to iterator
    va_start( ap, msg ); // Initialize the iterator based on last fixed arg
    for ( int i = 0; i < num_ints; i++ )
        printf( "int %d = %d\n", i, va_arg( ap, int ) ); // Returns next arg cast to int
    va_end( ap ); // Free up iterator
}
