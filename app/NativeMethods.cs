using System.Runtime.InteropServices;

class NativeMethods
{
    private const string pinvoke_dll = "foo";

    [DllImport(pinvoke_dll)]
    internal static extern void foo();

    [DllImport(pinvoke_dll)]
    internal static extern void foo_malicious();
}