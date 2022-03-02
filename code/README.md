Makefile, or:

g++ -c -o build/test.o src/test.cpp
g++ -c -o build/Model.o pandaPIengine/src/Model.cpp 
g++ -c -o build/ProgressionNetwork.o pandaPIengine/src/ProgressionNetwork.cpp 
g++ -c -o build/noDelIntSet.o pandaPIengine/src/intDataStructures/noDelIntSet.cpp
g++ -c -o build/FlexIntStack.o  pandaPIengine/src/intDataStructures/FlexIntStack.cpp
g++ -c -o build/IntUtil.o pandaPIengine/src/intDataStructures/IntUtil.cpp
g++ -c -o build/StringUtil.o pandaPIengine/src/intDataStructures/StringUtil.cpp

g++ build/test.o build/Model.o build/ProgressionNetwork.o  build/noDelIntSet.o build/FlexIntStack.o build/IntUtil.o  build/StringUtil.o pandaPIengine/src/flags.h pandaPIengine/src/intDataStructures/IntPairHeap.h -o Main
