#include "abs.h"

int	main(int ac, char **av)
{
	int drink_type;
	int order_type;
	int cup_size;
	int flavor;
	int result;

	if (ac != 5)
	{
		fprintf(stderr, "Error: hey, please, give ABS 4 arguments! :)");
		return (EXIT_FAILURE);
	}
	drink_type = atoi(av[1]);
	order_type = atoi(av[2]);
	cup_size = atoi(av[3]);
	flavor = atoi(av[4]);
	if (validate_params(drink_type, flavor, cup_size,
			order_type) != EXIT_SUCCESS)
		return (EXIT_FAILURE);
	result = EXIT_SUCCESS;
	if (drink_type == SODA)
		result = make_soda(cup_size, order_type);
	else if (drink_type == JUICE)
		result = make_juice(cup_size, order_type);
	if (result != EXIT_SUCCESS)
	{
		fprintf(stderr, "Error: ABS failed to make drink! :(");
		return (EXIT_FAILURE);
	}
	return (EXIT_SUCCESS);
}