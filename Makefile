# Makefile for ABS - Automated Beverage System

# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99

# Source files
SRC = main.c abs.c utils.c
TARGET = abs

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) $(SRC) -o $(TARGET)

test: $(TARGET)
	@chmod +x ./run_tests.sh
	@./run_tests.sh

example: $(TARGET)
	@echo "=== Example Usage ==="
	@echo "Coke 500ml Takeout:"
	@./$(TARGET) 1 1 2 1
	@echo ""
	@echo "Grape Juice 300ml Dine In:"
	@./$(TARGET) 2 3 1 2

clean:
	rm -f *.o

fclean: clean
	rm -f $(TARGET)

re: fclean all

help:
	@echo "Available targets:"
	@echo "  all     - Build the executable (default)"
	@echo "  test    - Build and run tests"
	@echo "  example - Build and show examples"
	@echo "  clean   - Remove object files"
	@echo "  fclean  - Remove all generated files"
	@echo "  re      - Full rebuild (fclean + all)"
	@echo "  help    - Show this help"

.PHONY: all test example clean fclean re help