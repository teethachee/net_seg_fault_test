#include "foo.h"

int main()
{
    install_failure_handler();

    foo();
    foo_malicious();

    return 0;
}
