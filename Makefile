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
	@echo ""
	@echo "Usage: ./$(TARGET) <drink_type> <flavor> <size> <order_type>"
	@echo ""
	@echo "Parameters:"
	@echo "  drink_type: 0=Soda | 1=Juice"
	@echo "  flavor:     0=Coke | 1=Guarana | 2=Orange Juice | 3=Grape Juice"
	@echo "  size:       300 | 500 | 700 (700ml only for sodas)"
	@echo "  order_type: 0=Takeout | 1=Dine In"
	@echo ""
	@echo "Coke 500ml Takeout: <./$(TARGET) 0 0 500 0>"
	@./$(TARGET) 0 0 500 0
	@echo ""

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