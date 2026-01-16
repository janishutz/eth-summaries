#include <setjmp.h>
typedef void( co_start_fn )( void * );

struct coroutine {
        void *stack;        // The call stack
        jmp_buf env;        // The saved context
        co_start_fn *start; // Function to call
        void *arg;          // Argument to the function
};
struct coroutine *co_new( co_start_fn *start, void *ctxt );
void co_free( struct coroutine *self );
void *co_switchto( struct coroutine *next );
void co_init( void );
