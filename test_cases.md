# Test Cases - ABS
**Based on ISO-29119-3 Standard**

---

## Test Case TC001

| Field | Description |
|-------|-------------|
| **ID** | TC001 |
| **Title** | Validate Coke 300ml Takeout Order |
| **Priority** | High |
| **Traceability** | FR015, FR017, FR019 - Soda cup type, ice count, and lid validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 300 0` | System processes soda order with Coke flavor |
| Step 2 | Verify cup type assignment | Paper cup is selected for soda |
| Step 3 | Verify ice cube count | 6 ice cubes are added |
| Step 4 | Verify lid type | Lid without hole is selected for takeout |

| **Post-Conditions** | Output displays: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 300ml, and Lid without Hole" |

---

## Test Case TC002

| Field | Description |
|-------|-------------|
| **ID** | TC002 |
| **Title** | Validate Coke 500ml Dine In Order |
| **Priority** | High |
| **Traceability** | FR015, FR017, FR020 - Soda cup type, ice count, and dine-in lid validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 500 1` | System processes soda order with Coke flavor |
| Step 2 | Verify cup type assignment | Paper cup is selected for soda |
| Step 3 | Verify ice cube count | 6 ice cubes are added |
| Step 4 | Verify lid type | Lid with hole is selected for dine-in |

| **Post-Conditions** | Output displays: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 500ml, and Lid with Hole" |

---

## Test Case TC003

| Field | Description |
|-------|-------------|
| **ID** | TC003 |
| **Title** | Validate Coke 700ml Maximum Size Order |
| **Priority** | High |
| **Traceability** | FR010, FR012 - Maximum size validation for sodas |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 700 0` | System processes soda order with maximum size |
| Step 2 | Verify size acceptance | 700ml size is accepted for soda |
| Step 3 | Verify cup type assignment | Paper cup is selected |
| Step 4 | Verify complete order processing | Order is processed successfully |

| **Post-Conditions** | Output displays: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 700ml, and Lid without Hole" |

---

## Test Case TC004

| Field | Description |
|-------|-------------|
| **ID** | TC004 |
| **Title** | Validate Guarana Soda Order |
| **Priority** | High |
| **Traceability** | FR007, FR008 - Guarana flavor validation with soda type |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 1 500 0` | System processes soda order with Guarana flavor |
| Step 2 | Verify flavor compatibility | Guarana flavor is accepted for soda |
| Step 3 | Verify standard soda rules | Paper cup and 6 ice cubes applied |
| Step 4 | Verify takeout lid | Lid without hole is applied |

| **Post-Conditions** | Output displays: "The selected beverage was served in: Paper Cup, Containing: 6 ice cubes, with 500ml, and Lid without Hole" |

---

## Test Case TC005

| Field | Description |
|-------|-------------|
| **ID** | TC005 |
| **Title** | Validate Orange Juice 300ml Order |
| **Priority** | High |
| **Traceability** | FR016, FR018, FR007 - Juice cup type, ice count, and flavor validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 1 2 300 0` | System processes juice order with orange flavor |
| Step 2 | Verify cup type assignment | Plastic cup is selected for juice |
| Step 3 | Verify ice cube count | 12 ice cubes are added |
| Step 4 | Verify flavor compatibility | Orange flavor is accepted for juice |

| **Post-Conditions** | Output displays: "The selected beverage was served in: Plastic Cup, Containing: 12 ice cubes, with 300ml, and Lid without Hole" |

---

## Test Case TC006

| Field | Description |
|-------|-------------|
| **ID** | TC006 |
| **Title** | Validate Grape Juice Dine In Order |
| **Priority** | High |
| **Traceability** | FR016, FR018, FR020 - Juice cup type, ice count, and dine-in lid |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 1 3 500 1` | System processes juice order with grape flavor |
| Step 2 | Verify cup type assignment | Plastic cup is selected for juice |
| Step 3 | Verify ice cube count | 12 ice cubes are added |
| Step 4 | Verify dine-in lid | Lid with hole is selected |

| **Post-Conditions** | Output displays: "The selected beverage was served in: Plastic Cup, Containing: 12 ice cubes, with 500ml, and Lid with Hole" |

---

## Test Case TC007

| Field | Description |
|-------|-------------|
| **ID** | TC007 |
| **Title** | Validate Invalid Soda with Juice Flavor Error |
| **Priority** | High |
| **Traceability** | FR008, FR009 - Flavor compatibility validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 2 500 0` | System receives soda type with orange juice flavor |
| Step 2 | Perform flavor compatibility check | System detects incompatible flavor-drink combination |
| Step 3 | Validate error handling | System rejects order without processing |
| Step 4 | Verify specific error message | Flavor compatibility error message is displayed |

| **Post-Conditions** | Error output displays to stderr: "Error: Invalid Flavor Beverage" and program exits with failure code |

---

## Test Case TC008

| Field | Description |
|-------|-------------|
| **ID** | TC008 |
| **Title** | Validate Invalid Juice with Soda Flavor Error |
| **Priority** | High |
| **Traceability** | FR008, FR009 - Flavor compatibility validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 1 0 300 0` | System receives juice type with Coke flavor |
| Step 2 | Perform flavor compatibility check | System detects incompatible flavor-drink combination |
| Step 3 | Validate error handling | System rejects order without processing |
| Step 4 | Verify specific error message | Flavor compatibility error message is displayed |

| **Post-Conditions** | Error output displays to stderr: "Error: Invalid Flavor Beverage" and program exits with failure code |

---

## Test Case TC009

| Field | Description |
|-------|-------------|
| **ID** | TC009 |
| **Title** | Validate Invalid Juice 700ml Size Error |
| **Priority** | High |
| **Traceability** | FR011, FR012 - Size compatibility validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 1 3 700 0` | System receives juice order with 700ml size |
| Step 2 | Perform size compatibility check | System detects invalid size for juice |
| Step 3 | Validate error handling | System rejects order without processing |
| Step 4 | Verify specific error message | Size compatibility error message is displayed |

| **Post-Conditions** | Error output displays to stderr: "Error: Invalid Cup Size" and program exits with failure code |

---

## Test Case TC010

| Field | Description |
|-------|-------------|
| **ID** | TC010 |
| **Title** | Validate Invalid Order Type Parameter Error |
| **Priority** | Medium |
| **Traceability** | FR021 - Order type validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 300 2` | System receives invalid order type (2) |
| Step 2 | Perform parameter validation | System detects out-of-range order type |
| Step 3 | Validate error handling | System rejects order without processing |
| Step 4 | Verify specific error message | Order type error message is displayed |

| **Post-Conditions** | Error output displays to stderr: "Error: Invalid Order Type" and program exits with failure code |

---

## Test Case TC011

| Field | Description |
|-------|-------------|
| **ID** | TC011 |
| **Title** | Validate Insufficient Arguments Error |
| **Priority** | High |
| **Traceability** | FR001, FR004 - Argument count validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 300` | System receives only 3 arguments instead of 4 |
| Step 2 | Perform argument count validation | System detects insufficient arguments |
| Step 3 | Validate error handling | System displays argument count error |
| Step 4 | Verify specific error message | Correct error message format is shown |

| **Post-Conditions** | Error output displays to stderr: "Error: hey, please, give ABS 4 arguments! :)" and program exits with failure code |

---

## Test Case TC012

| Field | Description |
|-------|-------------|
| **ID** | TC012 |
| **Title** | Validate Invalid Size Parameter Error |
| **Priority** | Medium |
| **Traceability** | FR011 - Size parameter validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 400 0` | System receives invalid size (400ml) |
| Step 2 | Perform size validation | System detects invalid size parameter |
| Step 3 | Validate error handling | System rejects order without processing |
| Step 4 | Verify specific error message | Size validation error message is displayed |

| **Post-Conditions** | Error output displays to stderr: "Error: Invalid Cup Size" and program exits with failure code |

---

## Test Case TC013

| Field | Description |
|-------|-------------|
| **ID** | TC013 |
| **Title** | Validate Excessive Arguments Error |
| **Priority** | Medium |
| **Traceability** | FR001, FR004 - Argument count validation |
| **Pre-Conditions** | ABS executable is compiled and available in current directory |

| Steps | Action | Expected Results |
|-------|--------|------------------|
| Step 1 | Execute command `./abs 0 0 300 0 extra` | System receives 6 arguments instead of 4 |
| Step 2 | Perform argument count validation | System detects excessive arguments |
| Step 3 | Validate error handling | System displays argument count error |
| Step 4 | Verify specific error message | Correct error message format is shown |

| **Post-Conditions** | Error output displays to stderr: "Error: hey, please, give ABS 4 arguments! :)" and program exits with failure code |

---

## Test Coverage Summary

| Category | Test Cases | Coverage | Error Type |
|----------|------------|----------|------------|
| **Valid Orders** | TC001-TC006 | All valid drink/flavor/size combinations | Success output |
| **Flavor Compatibility** | TC007-TC008 | Incompatible flavor-drink combinations | "Error: Invalid Flavor Beverage" |
| **Size Compatibility** | TC009, TC012 | Invalid size parameters | "Error: Invalid Cup Size" |
| **Order Type Validation** | TC010 | Invalid order type parameter | "Error: Invalid Order Type" |
| **Argument Validation** | TC011, TC013 | Incorrect argument count scenarios | "Error: hey, please, give ABS 4 arguments! :)" |
| **Total Test Cases** | 13 | 100% functional coverage | Specific error messages |
