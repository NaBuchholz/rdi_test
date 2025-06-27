#!/bin/bash

# ABS - Automated Beverage System Test Script
# Based on ISO-29119-3 Standard Test Cases

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Test counters
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

ABS_EXEC="./abs"

print_test_header() {
    echo -e "\n${BLUE}=== $1 ===${NC}"
}

run_test() {
    local test_id="$1"
    local test_name="$2"
    local command="$3"
    local expected_output="$4"
    local expected_error="$5"
    local should_fail="$6"
    
    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    
    echo -e "\n${YELLOW}[$test_id] $test_name${NC}"
    echo "Command: $command"
    
    output_file=$(mktemp)
    error_file=$(mktemp)
    
    eval "$command" > "$output_file" 2> "$error_file"
    exit_code=$?
    
    actual_output=$(cat "$output_file")
    actual_error=$(cat "$error_file")
    
    rm -f "$output_file" "$error_file"
    
    # Check results
    test_passed=true
    
    if [ "$should_fail" = "true" ]; then
        if [ $exit_code -eq 0 ]; then
            echo -e "${RED}✗ FAIL: Expected failure but command succeeded${NC}"
            test_passed=false
        fi
        
        if [ -n "$expected_error" ] && [[ "$actual_error" != *"$expected_error"* ]]; then
            echo -e "${RED}✗ FAIL: Expected error message not found${NC}"
            echo "Expected: $expected_error"
            echo "Got: $actual_error"
            test_passed=false
        fi
    else
        if [ $exit_code -ne 0 ]; then
            echo -e "${RED}✗ FAIL: Expected success but command failed${NC}"
            echo "Error: $actual_error"
            test_passed=false
        fi
        
        if [ -n "$expected_output" ] && [[ "$actual_output" != *"$expected_output"* ]]; then
            echo -e "${RED}✗ FAIL: Expected output not found${NC}"
            echo "Expected: $expected_output"
            echo "Got: $actual_output"
            test_passed=false
        fi
    fi
    
    if [ "$test_passed" = true ]; then
        echo -e "${GREEN}✓ PASS${NC}"
        PASSED_TESTS=$((PASSED_TESTS + 1))
    else
        FAILED_TESTS=$((FAILED_TESTS + 1))
    fi
}

check_executable() {
    if [ ! -f "$ABS_EXEC" ]; then
        echo -e "${RED}Error: ABS executable not found at $ABS_EXEC${NC}"
        echo "Please compile the project first using 'make' or 'gcc -o abs src/*.c'"
        exit 1
    fi
    
    if [ ! -x "$ABS_EXEC" ]; then
        echo -e "${RED}Error: ABS executable is not executable${NC}"
        echo "Please run 'chmod +x $ABS_EXEC'"
        exit 1
    fi
}

main() {
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    ABS Test Suite                            ║"
    echo "║              Automated Beverage System                       ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    
    check_executable
    
    print_test_header "VALID ORDER TESTS"
    
    # TC001: Coke 300ml Takeout
    run_test "TC001" "Coke 300ml Takeout Order" \
        "$ABS_EXEC 0 0 300 0" \
        "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 300ml, and Lid without Hole" \
        "" \
        "false"
    
    # TC002: Coke 500ml Dine In
    run_test "TC002" "Coke 500ml Dine In Order" \
        "$ABS_EXEC 0 0 500 1" \
        "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 500ml, and Lid with Hole" \
        "" \
        "false"
    
    # TC003: Coke 700ml Maximum Size
    run_test "TC003" "Coke 700ml Maximum Size Order" \
        "$ABS_EXEC 0 0 700 0" \
        "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 700ml, and Lid without Hole" \
        "" \
        "false"
    
    # TC004: Guarana Soda
    run_test "TC004" "Guarana Soda Order" \
        "$ABS_EXEC 0 1 500 0" \
        "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 500ml, and Lid without Hole" \
        "" \
        "false"
    
    # TC005: Orange Juice 300ml
    run_test "TC005" "Orange Juice 300ml Order" \
        "$ABS_EXEC 1 2 300 0" \
        "The selected beverage was served in: Plastic Cup, Containing: 12 ice cubes, with 300ml, and Lid without Hole" \
        "" \
        "false"
    
    # TC006: Grape Juice Dine In
    run_test "TC006" "Grape Juice Dine In Order" \
        "$ABS_EXEC 1 3 500 1" \
        "The selected beverage was served in: Plastic Cup, Containing: 12 ice cubes, with 500ml, and Lid with Hole" \
        "" \
        "false"
    
    print_test_header "ERROR VALIDATION TESTS"
    
    # TC007: Invalid Soda with Juice Flavor
    run_test "TC007" "Invalid Soda with Juice Flavor Error" \
        "$ABS_EXEC 0 2 500 0" \
        "" \
        "Error: Invalid Flavor Beverage" \
        "true"
    
    # TC008: Invalid Juice with Soda Flavor
    run_test "TC008" "Invalid Juice with Soda Flavor Error" \
        "$ABS_EXEC 1 0 300 0" \
        "" \
        "Error: Invalid Flavor Beverage" \
        "true"
    
    # TC009: Invalid Juice 700ml Size
    run_test "TC009" "Invalid Juice 700ml Size Error" \
        "$ABS_EXEC 1 3 700 0" \
        "" \
        "Error: Invalid Cup Size" \
        "true"
    
    # TC010: Invalid Order Type
    run_test "TC010" "Invalid Order Type Parameter Error" \
        "$ABS_EXEC 0 0 300 2" \
        "" \
        "Error: Invalid Order Type" \
        "true"
    
    # TC011: Insufficient Arguments
    run_test "TC011" "Insufficient Arguments Error" \
        "$ABS_EXEC 0 0 300" \
        "" \
        "Error: hey, please, give ABS 4 arguments! :)" \
        "true"
    
    # TC012: Invalid Size Parameter
    run_test "TC012" "Invalid Size Parameter Error" \
        "$ABS_EXEC 0 0 400 0" \
        "" \
        "Error: Invalid Cup Size" \
        "true"
    
    # TC013: Excessive Arguments
    run_test "TC013" "Excessive Arguments Error" \
        "$ABS_EXEC 0 0 300 0 extra" \
        "" \
        "Error: hey, please, give ABS 4 arguments! :)" \
        "true"
    
    print_test_header "TEST SUMMARY"
    
    echo -e "\n${BLUE}╔══════════════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║                        RESULTS                       ║${NC}"
    echo -e "${BLUE}╠══════════════════════════════════════════════════════╣${NC}"
    echo -e "${BLUE}║${NC} Total Tests:  ${YELLOW}$TOTAL_TESTS${NC}                                     ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC} Passed:       ${GREEN}$PASSED_TESTS${NC}                                     ${BLUE}║${NC}"
    echo -e "${BLUE}║${NC} Failed:       ${RED}$FAILED_TESTS${NC}                                      ${BLUE}║${NC}"
    
    if [ $FAILED_TESTS -eq 0 ]; then
        echo -e "${BLUE}║${NC}                                                      ${BLUE}║${NC}"
        echo -e "${BLUE}║${NC} ${GREEN}🎉 ALL TESTS PASSED! 🎉${NC}                              ${BLUE}║${NC}"
        echo -e "${BLUE}╚══════════════════════════════════════════════════════╝${NC}"
        exit 0
    else
        echo -e "${BLUE}║${NC}                                      ${BLUE}║${NC}"
        echo -e "${BLUE}║${NC} ${RED}❌ SOME TESTS FAILED ❌${NC}                             ${BLUE}║${NC}"
        echo -e "${BLUE}╚══════════════════════════════════════════════════════╝${NC}"
        exit 1
    fi
}

# Run main function
main "$@"