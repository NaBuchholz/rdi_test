# ABS - Automated Beverage System

## Description
The ABS is an automated system for preparing beverages following specific rules according to type, flavor, size, and order modality.

## Build and Execution

### Quick Start

```bash
# Clone the repository
git clone <repository-url> abs
cd abs

# Build the project
make

# Run tests to verify everything works
make test

# Try some examples
make example
```

#### Using Makefile (Recommended)
```bash
# Build
make

# Run tests
make test

# Show examples
make example

# Clean
make clean
```

### Manual Compilation
```bash
# Compile
gcc -o abs src/main.c src/abs.c -Wall -Wextra

# Run
./abs <drink_type> <flavor> <size> <order_type>
```


## Parameters

### Drink Types
- `1` - Soda
- `2` - Juice

### Flavors
- `1` - Coke (soda only)
- `2` - Guarana (soda only)  
- `3` - Grape Juice (juice only)
- `4` - Orange Juice (juice only)

### Sizes
- `1` - 300ml
- `2` - 500ml
- `3` - 700ml (soda only)

### Order Types
- `1` - Takeout
- `2` - Dine In

## Usage Examples

```bash
# Coke 500ml takeout
./abs 1 1 2 1
# Output: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 500ml, and Lid without Hole"

# Grape juice 300ml dine in
./abs 2 3 1 2
# Output: "The selected beverage was served in: Plastic Cup, Containing: 12 ice cubes, with 300ml, and Lid with Hole"

# Invalid case: Soda with juice flavor
./abs 1 3 2 1
# Output: "Invalid Beverage"
```

## Business Rules

### Sodas
- Served in **paper cups**
- Receive **6 ice cubes**
- Available sizes: 300ml, 500ml, 700ml
- Flavors: Coke, Guarana

### Juices
- Served in **plastic cups**
- Receive **12 ice cubes**
- Available sizes: 300ml, 500ml
- Flavors: Grape, Orange

### Lid Types
- **Takeout**: Lid without hole
- **Dine In**: Lid with hole (for straw)

## Validations
- Flavors must be compatible with drink type
- Sizes must be available for the drink type
- All parameters must be within valid ranges

## Code Structure
- `src/abs.h` - Definitions and constants
- `src/abs.c` - Business logic and validations
- `src/main.c` - Command line interface
- `Makefile` - Build System
- `README.md` - Main documentation
- `test_cases.md` - ISO 29119-3 test cases
- `.gitignore` - Git ignore rules