# ABS - Automated Beverage System

## Description
The ABS is an automated system for preparing beverages following specific rules according to type, flavor, size, and order modality.

## Build and Execution

### Quick Start

```bash
# Clone the repository
git clone https://github.com/NaBuchholz/rdi_test.git abs
cd abs

# Build the project
make

# Run tests to verify everything works
make test

# Try some examples
make example
```

#### Using Makefile 
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

## Parameters

### Drink Types
- `0` - Soda
- `1` - Juice

### Flavors
- `0` - Coke (soda only)
- `1` - Guarana (soda only)  
- `2` - Grape Juice (juice only)
- `3` - Orange Juice (juice only)

### Sizes
- `300` - 300ml
- `500` - 500ml
- `700` - 700ml (soda only)

### Order Types
- `0` - Takeout
- `1` - Dine In

## Usage Examples

```bash
# Coke 500ml takeout
./abs 0 0 500 0
# Output: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 500ml, and Lid without Hole"

# Grape juice 300ml dine in
./abs 1 3 300 1
# Output: "The selected beverage was served in: Plastic Cup, Containing: 12 ice cubes, with 300ml, and Lid with Hole"

# Guarana 700ml dine in
./abs 0 1 700 1
# Output: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 700ml, and Lid with Hole"

# Invalid case: Soda with juice flavor
./abs 0 2 500 0
# Output: "Invalid Beverage"

# Invalid case: Juice 700ml (not available)
./abs 1 3 700 0
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
- `abs.h` - Header file with type definitions and function declarations
- `abs.c` - Core business logic and validation functions
- `main.c` - Command line interface and main program entry point
- `utils.c` - Utility functions for data conversion and string handling
- `Makefile` - Build system and automation scripts
- `README.md` - Project documentation and usage guide
- `test_cases.md` - ISO 29119-3 compliant test case documentation
- `run_tests.sh` - Automated test execution script
- `.gitignore` - Git version control ignore rules
