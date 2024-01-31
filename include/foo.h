#ifndef EXPORT
#ifdef _MSC_VER
#ifdef DLL_EXPORT
#define EXPORT __declspec(dllexport)
#else
#define EXPORT __declspec(dllimport)
#endif
#else
#define EXPORT __attribute__((visibility("default")))
#endif
#endif

extern "C" EXPORT void foo();
extern "C" EXPORT void foo_malicious();

