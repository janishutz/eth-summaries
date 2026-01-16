#include <setjmp.h>
#include <stdio.h>

static jmp_buf buf;

void second( void ) {
    printf( "second\n" );
    longjmp( buf, 1 );
}

void first( void ) {
    second();
    printf( "first\n" ); // Never executed
}

int main() {
    if ( !setjmp( buf ) ) // returns 0 initially
        first();
    else
        printf( "main\n" ); // 1 is returned when longjmp is executed
    return 0;
}
