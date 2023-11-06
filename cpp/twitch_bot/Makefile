# Compiler
CXX = clang++

# Compiler flags
CXXFLAGS = -std=c++14 -I lib

# Library directory and options
 LDFLAGS = -L../../../drogon

# Source files
SRC = src/main.cpp

# Destination dir
DEST = tmp

# Output executable name
EXECUTABLE = twitch_bot

# BIN = $(DEST)/$(EXECUTABLE)

all: $(EXECUTABLE)

$(EXECUTABLE): $(SRC)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $(DEST)/$@

clean:
	rm -f $(EXECUTABLE)

.PHONY: all clean
