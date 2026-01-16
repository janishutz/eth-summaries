#include "10_coroutine.h"
#include <setjmp.h>
#include <stdio.h>
#include <stdlib.h>
#define CORO_STACK_SIZE 128
static struct coroutine *cur_co;
static struct coroutine *main_co;

void co_init() {
    main_co = (struct coroutine *) calloc( 1, sizeof( struct coroutine ) );
    cur_co = main_co;
    co_switchto( main_co );
}

void *co_switchto( struct coroutine *next, void *arg ) {
    if ( setjmp( cur_co->env ) == 0 ) {
        cur_co = next;
        cur_co->arg = arg;
        longjmp( cur_co->env, 1 );
    }
    return cur_co->arg;
}

static void start_cl( void ) {
    ( cur_co->start )( cur_co->arg );
    co_switchto( main_co );

    printf( "Error: returned from coroutine start closure.\n" );
    exit( -1 );
}

struct coroutine *co_new( co_start_fn *start, void *ctxt ) {
    struct coroutine *co = (struct coroutine *) calloc( 1, sizeof( struct coroutine ) );
    co->stack = calloc( 1, CORO_STACK_SIZE + 16 );
    co->start = start;
    co->arg = ctxt;
    setjmp( co->env );
    co->env[ 0 ].__jmpbuf[ 6 ] = ( (uint64_t) ( co->stack ) + CORO_STACK_SIZE ); // Machine specific
    co->env[ 0 ].__jmpbuf[ 7 ] = ( (uint64_t) ( start_cl ) );                    // Machine specific
}
