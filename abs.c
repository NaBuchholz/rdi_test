#include "abs.h"

int	validate_params(int drink_type, int flavor, int size, int order_type)
{
	if (drink_type != SODA && drink_type != JUICE)
	{
		fprintf(stderr, "Error: Invalid Drink Type\n");
		return (EXIT_FAILURE);
	}
	if (order_type != TAKEOUT && order_type != DINEIN)
	{
		fprintf(stderr, "Error: Invalid Order Type\n");
		return (EXIT_FAILURE);
	}
	if (size != P && size != M && size != G)
	{
		fprintf(stderr, "Error: Invalid Size\n");
		return (EXIT_FAILURE);
	}
	if (flavor != SODA && flavor != JUICE)
	{
		fprintf(stderr, "Error: Invalid Flavor\n");
		return (EXIT_FAILURE);
	}
	return (EXIT_SUCCESS);
}
