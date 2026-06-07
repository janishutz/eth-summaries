// --- Constants -----------------------------------------------
// As C preprocessor macros
#define N 5

// Symbolic constant
mtype = { ack, req };


// --- Typedef -------------------------------------------------
// Structure declarations
typedef vector { int x; int y };


// --- Channels ------------------------------------------------
// Channels are used to exchange messages between processes
chan buf = [2] of { int }; // can store up to 2 integers
chan buf2 = [2] of { mtype, bit, chan }; // Messages are Triples
chan channel = [0] of { int }; // No buffer
chan unassigned_chan; // This channel is unassigned


// --- Variables -----------------------------------------------
// Note that there are no floats and unbounded integers.
// Variables are initialized to 0 (ish) values
// If defined outside a process, they are global, if inside,
// they are scoped to said process
bit bit_val; // 1 bit
bool bool_val; // Equivalent to bit, also 1 bit
byte counter; // 1 byte (0...255)
short short_val; // 2 bytes (-2^15 ... 2^15 - 1)
int val; // 4 bytes
int arr[4]; // 16 bytes, array of four integers
vector v; // using the custom vector type
mtype msg = ack; // Using the symbolic constant


// --- Processes -----------------------------------------------
// Process declarations
proctype myProc(int p) {
    // Like the init body, any promela statements go in here
    // This includes any variable or channel declarations
    printf("My process");
}

active [N] proctype myActiveProc(int p) {
    // Body goes here
}


// --- Initial state -------------------------------------------
init {
    printf("Hello World");
}
