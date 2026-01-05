int my_int;              // Allocates memory on the stack.
                         // Variable is global (read / writable by entire program)
static int my_local_int; // only available locally (in this file)
const int MY_CONST = 10; // constant (immutable), convention: SCREAM_CASE

enum { ONE, TWO } num; // Enum. ONE will get value 0, TWO has value 1

enum { O = 2, T = 1 } n; // Enum with values specified

// Structs are like classes, but contain no logic
struct MyStruct {
        int el1;
        int el2;
};

int fun( int j ) {
    static int i = 0;              // Persists across calls of fun
    short my_var = 1;              // Block scoped (deallocated when going out of scope)
    int my_var_dbl = (int) my_var; // Explicit casting (works between almost all types)
    return i;
}

int main( int argc, char *argv[] ) {
    if ( ( my_local_int = fun( 10 ) ) ) {
        // Every c statement is also an expression, i.e. you can do the above!
    }
    struct MyStruct test;            // Allocate memory on stack for struct
    struct MyStruct *test_p = &test; // Pointer to memory where test resides
    test.el1 = 1;                    // Direct element access
    test_p->el2 = 2;                 // Via pointer
    return 0;
}
