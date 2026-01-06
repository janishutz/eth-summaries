#include <stdio.h>
#include <string.h>

int main( int argc, char *argv[] ) {
    char hello[ 6 ] = "hello";                           // Using double quotes
    char world[ 6 ] = { 'w', 'o', 'r', 'l', 'd', '\0' }; // As array

    char src[ 12 ], dest[ 12 ];
    strncpy( src, "ETHZ", 12 );     // Copy strings (extra elements will be set to \0)
    strncpy( dest, src, 12 );       // Copy strings (last arg is first n chars to copy)
    if ( strncmp( src, dest, 12 ) ) // Compare two strings. Returns 1 if src > dest
        printf( "Hello World" );
    strncat( dest, " is in ZH", 12 ); // Concatenate strings
    return 0;
}
