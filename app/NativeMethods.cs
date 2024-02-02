using System;
using System.Runtime.InteropServices;

namespace MyConsoleApp
{
    class NativeMethods
    {
        private const string pinvoke_dll = "foo";

        [DllImport(pinvoke_dll)]
        internal static extern void foo();

        [DllImport(pinvoke_dll)]
        internal static extern void foo_malicious();

        [DllImport(pinvoke_dll)]
        internal static extern void install_failure_handler();

        static NativeMethods()
        {
            var value = Environment.GetEnvironmentVariable("INSTALL_FAILURE_HANDLER");
            if (value != null)
            {
                install_failure_handler();
            }
        }
    }
}