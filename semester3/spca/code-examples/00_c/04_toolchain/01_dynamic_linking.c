#include <stdio.h>
#include <dlfcn.h>  // contains addvec

int x[2] = {1, 2}; int y[2] = {3, 4}; int z[2];

int main(int argc, char *argv[])
{
    void *handle;
    void (*addvec)(int *, int *, int *, int);       // Declaration
    char *error;

    handle = dlopen("./libvector.so", RTLD_LAZY);   // Load .so, makes addvec usable
    if (!handle) {
        fprintf(stderr, "%s\n", dlerror());
        exit(1);
    }

    addvec = dlsym(handle, "addvec");               // get a pointer to advec
    if ((error = dlerror()) != NULL) {
        fprintf(stderr, "%s\n", error);
        exit(1);
    }

    addvec(x, y, z, 2);                             // Now callable like any other function
    printf("z = [%d %d]\n", z[0], z[1]);

    if (dlclose(handle) < 0) {                      // Unload shared library
        fprintf(stderr, "%s\n", dlerror());
        exit(1);
    }
    return 0;
}