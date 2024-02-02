# net_seg_fault_test

Sample repo to reproduce segment fault in netcore.

## Run the tests
Invoke the run.sh script with the desired netcore version as argument. For example, to run the tests with netcore 6.0, run the following command:
```:
./run.sh 6.0
```

The script will invoke docker commands to build the code and run the tests in a container with the specified netcore version.

## Build the codes
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
