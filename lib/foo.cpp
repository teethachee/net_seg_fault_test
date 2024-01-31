#define DLL_EXPORT
#include "foo.h"

#include <iostream>

#ifdef _MSC_VER
__declspec(noinline) void dereference_nullptr(int count_down)
#else
void __attribute__ ((noinline)) dereference_nullptr(int count_down)
#endif
{
    std::cout << "count down: " << count_down << std::endl;

    if (count_down > 0) {
        dereference_nullptr(--count_down);
    }

    std::cout << "Boom!" << std::endl;

    // boom
    int* ptr = nullptr;
    *ptr = 1;
}

extern "C" EXPORT void foo()
{
    std::cout << "Calling foo()" << std::endl;
}

extern "C" EXPORT void foo_malicious()
{
    std::cout << "Calling foo_malicious()" << std::endl;

    std::cout << "Attempting to dereference a nullptr" << std::endl;
    dereference_nullptr(10);
}
