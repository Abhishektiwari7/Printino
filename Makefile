# Define the C++ compiler and flags
CXX = g++
CXXFLAGS = -Wall -g -DLINUX_PLATFORM

# Define the target executable name
TARGET = main

# Find all .cpp files in the current directory
SOURCES = $(wildcard *.cpp)

# Generate corresponding .o object file names from sources
OBJECTS = $(SOURCES:.cpp=.o)

# The default target (invoked by simply running 'make')
all: $(TARGET)

# Rule to link object files into the final executable
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $^

# Rule to compile .cpp files into .o object files
# Uses implicit rules (make knows how to make .o from .cpp)
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Phony targets prevent conflicts with files named 'clean' or 'all'
.PHONY: all clean

# The clean target removes all generated files
clean:
	rm -f $(OBJECTS) $(TARGET)
