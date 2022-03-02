args = -std=c++17 

all: main model PN noDelIntSet FlexIntStack IntUtil StringUtil recompile

recompile:
	g++ $(args) build/main.o build/Model.o build/ProgressionNetwork.o  build/noDelIntSet.o build/FlexIntStack.o build/IntUtil.o  build/StringUtil.o pandaPIengine/src/flags.h pandaPIengine/src/intDataStructures/IntPairHeap.h -o Main

main:
	g++ $(args) -c -o build/main.o src/main.cpp
model:
	g++ $(args) -c -o build/Model.o pandaPIengine/src/Model.cpp
PN:
	g++ $(args) -c -o build/ProgressionNetwork.o pandaPIengine/src/ProgressionNetwork.cpp
noDelIntSet:
	g++ $(args) -c -o build/noDelIntSet.o pandaPIengine/src/intDataStructures/noDelIntSet.cpp
FlexIntStack:
	g++ $(args) -c -o build/FlexIntStack.o pandaPIengine/src/intDataStructures/FlexIntStack.cpp
IntUtil:
	g++ $(args) -c -o build/IntUtil.o pandaPIengine/src/intDataStructures/IntUtil.cpp
StringUtil:
	g++ $(args) -c -o build/StringUtil.o pandaPIengine/src/intDataStructures/StringUtil.cpp

clean:
	rm -r build
