#include <stdio.h>

void echo() {
    char buf[4];    // Limited size
    gets(buf);      // Assumes size matches, does not check!
    puts(buf);      
}

int main()
{
    printf("Type a string:");   // No size check enforced!
    echo();
    return 0;
}