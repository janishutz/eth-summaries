#include <stdlib.h>

int main( int argc, char *argv[] ) {
    long *arr = (long *) malloc( 10 * sizeof( long ) ); // Allocate on heap
    if ( arr == NULL )                                  // Check if successful
        return EXIT_FAILURE;
    arr[ 0 ] = 5;

    long *arr2;
    if ( ( arr2 = (long *) calloc( 10, sizeof( long ) ) ) == NULL )
        return EXIT_FAILURE; // Same as above, but fewer lines and memory zeroed

    // Reallocate memory (to change size). Always use new pointer and do check!
    if ( ( arr2 = (long *) realloc( arr2, 15 * sizeof( long ) ) ) == NULL )
        return EXIT_FAILURE;

    free( arr );    // Deallocate the memory
    arr = NULL;     // Best practice: NULL pointer
    free( arr2 );   // *Can* omit NULLing pointer because end

    long arr3[5];   // Allocate on Stack
                    // Deallocated automatically when returning

    return EXIT_SUCCESS;
}
