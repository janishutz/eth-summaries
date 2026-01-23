#include <stdlib.h>

int main( int argc, char **argv ) {
    int a[ 2 ];
    int *b = (int *) malloc( 2 * sizeof( int ) ), *c;
    a[ 2 ] = 5;          // assign past the end of an array
    b[ 0 ] += 2;         // assume malloc zeroes out memory
    c = b + 3;           // mess up your pointer arithmetic
    free( &( a[ 0 ] ) ); // pass pointer to free() that wasn't malloc'ed
    free( b );
    free( b );  // double-free the same block
    b[ 0 ] = 5; // use a free()'d pointer
    // any many more!
    return 0;
}
