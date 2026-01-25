#include <stdio.h>
#include <stdlib.h>
#define FOO      BAZ
#define BAR( x ) ( x + 3 )
#define SKIP_SPACES( p )                                        \
    do {                                                        \
        while ( p > 0 ) { p--; }                                \
    } while ( 0 )
#define COMMAND( c ) { #c, c##_command } // Produces { "<val(c)>", "<val(c)>_command" }

#ifdef FOO // If macro is defined, ifndef for if not defined
    #define COURSE "SPCA"
#else
    #define COURSE "Systems Programming and Computer Architecture"
#endif

#if 1
    #define OUT HELLO // if statement
#endif

int main( int argc, char *argv[] ) {
    int i = 10;
    SKIP_SPACES( i );

    printf( "%s", COURSE );

    return EXIT_SUCCESS;
}
