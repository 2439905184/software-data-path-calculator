nim c -d:release -o:main_x64.exe main.nim 
nim c --cpu:i386 -d:release  -o:main_x86.exe main.nim
g++ main.cpp -o main_cpp.exe