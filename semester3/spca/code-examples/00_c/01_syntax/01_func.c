#include "01_func.h"

int get_user_input_int( char prompt[] ) {
    int input_data;
    printf( "%s", prompt );     // Always wrap strings like this for printf
    scanf( "%d", &input_data ); // Get user input from CLI

    // If statements just like any other language
    if ( input_data )
        printf( "Not 0" );
    else
        printf( "Input is zero" );

    switch ( input_data ) {
        case 5:
            printf( "You win!" );
            break; // Doesn't fall through
        case 6:
            printf( "You were close" ); // Falls through
        default:
            printf( "No win" ); // Case for any not covered input
    }

    int input_data_copy = input_data;

    while ( input_data > 1 ) {
        input_data -= 1;
        printf( "Hello World" );
    }

    do {
        input_data -= 1;
        printf( "Bye World" );
    } while ( input_data_copy > 1 );

    return 0;
}
