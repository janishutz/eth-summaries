#include "01_func.h"
#include <stdio.h>

int get_user_input_int( char prompt[] ) {
    int input_data;
    printf( "%s", prompt );           // Always wrap strings like this for printf
    scanf( "%d", &input_data );       // Get user input from CLI
    int input_data_copy = input_data; // Value copied

    // If statements just like any other language
    if ( input_data )
        printf( "Not 0" );
    else
        printf( "Input is zero" );

    // Switch statements just like in any other language
    switch ( input_data ) {
        case 5:
            printf( "You win!" );
            break; // Doesn't fall through
        case 6:
            printf( "You were close" ); // Falls through
        default:
            printf( "No win" ); // Case for any not covered input
    }

    while ( input_data > 1 ) {
        input_data -= 1;
        printf( "Hello World\n" );
    }

    // Inversed while loop (executes at least once)
    do {
        input_data -= 1;
        printf( "Bye World\n" );
        if ( input_data_copy == 0 )
            goto this_is_a_label;
    } while ( input_data_copy > 1 );

this_is_a_label:
    printf( "Jumped to label" );
    return 0;
}
