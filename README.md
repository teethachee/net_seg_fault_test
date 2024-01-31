# net_seg_fault_test

Sample repo to reproduce segment fault in netcore.

Build the native lib:
```
mkdir build
cd build
cmake ..
cmake --build . --config Release
```

Build and run the netcore app:
```
cd app
dotnet run
```
