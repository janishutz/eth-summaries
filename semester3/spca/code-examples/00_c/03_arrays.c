#include <stdint.h>
#include <stdio.h>

int main( int argc, char *argv[] ) {
    int data[ 10 ];                  // Initialize array of 10 integers
    data[ 5 ] = 5;                   // element 5 is now 5
    *data = 10;                      // element 0 is now 5
    printf( "%d\n", data[ 0 ] );     // print element 0 (prints 10)
    printf( "%d\n", *data );         // equivalent as above
    printf( "%d\n", data[ 5 ] );     // print element 5 (prints 5)
    printf( "%d\n", *( data + 5 ) ); // equivalent as above
    int multidim[ 5 ][ 5 ];          // 2-dimensional array
                                     // We can iterate over it using two for-loops
    int init_array[ 2 ][ 2 ] = {
        {1, 2},
        {3, 4}
    };                       // We can initialize an array like this
    int empty_arr[ 4 ] = {}; // Initialized to 0
    return 0;
}
