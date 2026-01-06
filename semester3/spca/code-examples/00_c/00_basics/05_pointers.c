#include <stdio.h>
#include <stdlib.h>

int main( int argc, char *argv[] ) {
    int x = 0;
    int *p = &x;          // Get x's memory address
    printf( "%p\n", p );  // Print the address of x
    printf( "%d\n", *p ); // Dereference pointer (get contents of memory location)
    *p = 10;              // Dereference assign
    int **dbl_p = &p;     // Double pointer (pointer to pointer to value)
    int *null_p = NULL;   // Create NULL pointer
    *null_p = 1;          // Segmentation fault due to null pointer dereference

    // ── pointer arithmetic ───────────────────────────────────────────
    // Already seen a bit in the c arrays section
    int arr[ 3 ] = { 2, 3, 4 };
    char c_arr[ 3 ] = { 'A', 'B', 'C' };
    int *arr_p = &arr[ 1 ];
    char *c_arr_p = &c_arr[ 1 ];
    c_arr_p += 1; // Now points to c_arr[2]
    arr_p -= 1;   // Now points to arr[0]

    char *arr_p_c = (char *) arr_p; // Cast to char pointer (points to first byte of arr[0])
    printf( "%d", *( arr_p - 5 ) ); // No boundary checks (can access any memory)

    return EXIT_SUCCESS;
}
