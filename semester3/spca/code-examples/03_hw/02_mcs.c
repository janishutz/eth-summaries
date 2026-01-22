#include <stdlib.h>

struct qnode {
        struct qnode *next;
        int locked;
};
typedef struct qnode *lock_t;

void acquire( lock_t *lock, struct qnode *local ) {
    local->next = NULL;
    struct qnode *prev = XCHG( lock, local );
    if ( prev ) { // queue was non-empty
        local->locked = 1;
        prev->next = local;
        while ( local->locked )
            ; // spin
    }
}

void release( lock_t *lock, struct qnode *local ) {
    if ( local->next == NULL ) {
        if ( CAS( lock, local, NULL ) )
            return;
        while ( local->next == NULL )
            ; // spin
    }
    local->next->locked = 0;
}
