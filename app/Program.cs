using System;

namespace MyConsoleApp
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello, World!");

            NativeMethods.foo();
            NativeMethods.foo_malicious();
        }
    }
}
