void acquire( int *lock ) {
    while ( TAS( lock ) == 1 );
}

void acquire_tatas( int *lock ) {
    do {
        while ( *lock == 1 );
    } while ( TAS( lock ) == 1 );
}

void release( int *lock ) {
    *lock = 0;
}
