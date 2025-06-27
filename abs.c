#include "abs.h"

int	validate_flavor_compatibility(int drink_type, int flavor)
{
	if (drink_type == SODA)
	{
		if (flavor == COKE || flavor == GUARANA)
			return (EXIT_SUCCESS);
	}
	if (drink_type == JUICE)
	{
		if (flavor == GRAPE_JUICE || flavor == ORANGE_JUICE)
			return (EXIT_SUCCESS);
	}
	return (EXIT_FAILURE);
}

int	validate_size_compatibility(int drink_type, int cup_size)
{
	if (cup_size != P && cup_size != M && cup_size != G)
		return (EXIT_FAILURE);
	if (drink_type == JUICE)
	{
		if (cup_size == G)
			return (EXIT_FAILURE);
	}
	return (EXIT_SUCCESS);
}

int	validate_params(int drink_type, int flavor, int cup_size, int order_type)
{
	if (order_type != TAKEOUT && order_type != DINE_IN)
	{
		fprintf(stderr, "Error: Invalid Order Type\n");
		return (EXIT_FAILURE);
	}
	if (validate_flavor_compatibility(drink_type, flavor) != EXIT_SUCCESS)
	{
		fprintf(stderr, "Error: Invalid Flavor Beverage\n");
		return (EXIT_FAILURE);
	}
	if (validate_size_compatibility(drink_type, cup_size) != EXIT_SUCCESS)
	{
		fprintf(stderr, "Error: Invalid Cup Size\n");
		return (EXIT_FAILURE);
	}
	return (EXIT_SUCCESS);
}

int	make_soda(int cup_size, int order_type)
{
	cup_type_t	cup;
	int			ice;
	lid_type_t	lid;
	int			size_ml;

	cup = get_cup_type(SODA);
	ice = get_ice_count(SODA);
	lid = get_lid_type(order_type);
	size_ml = get_size_ml(cup_size);
	printf("The selected beverage was served in: %s, Containing: %d ice cubes, with %dml, and %s\n ", 
		get_cup_name(cup), ice, size_ml, get_lid_name(lid));
	return (EXIT_SUCCESS);
}

int	make_juice(int cup_size, int order_type)
{
	cup_type_t	cup;
	int			ice;
	lid_type_t	lid;
	int			size_ml;

	cup = get_cup_type(JUICE);
	ice = get_ice_count(JUICE);
	lid = get_lid_type(order_type);
	size_ml = get_size_ml(cup_size);
	printf("The selected beverage was served in: %s, Containing: %d ice cubes, with %dml, and %s\n ", 
		get_cup_name(cup), ice, size_ml, get_lid_name(lid));
	return (EXIT_SUCCESS);
}
