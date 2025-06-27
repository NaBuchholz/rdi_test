#include "abs.h"

int	get_ice_count(int drink_type)
{
	switch (drink_type)
	{
	case SODA:
		return (SODA_ICE_CUBES);
	case JUICE:
		return (JUICE_ICE_CUBES);
	default:
		return (JUICE_ICE_CUBES);
	}
}

lid_type_t	get_lid_type(int order_type)
{
	switch (order_type)
	{
	case TAKEOUT:
		return (LID_WITHOUT_HOLE);
	case DINE_IN:
		return (LID_WITH_HOLE);
	default:
		return (LID_WITHOUT_HOLE);
	}
}

const char	*get_flavor_name(int flavor)
{
	switch (flavor)
	{
	case COKE:
		return ("Coke");
	case GUARANA:
		return ("Guarana");
	case GRAPE_JUICE:
		return ("Grape Juice");
	case ORANGE_JUICE:
		return ("Orange Juice");
	default:
		return ("Unknown Flavor");
	}
}

const char	*get_cup_name(cup_type_t cup_type)
{
	switch (cup_type)
	{
	case PAPER_CUP:
		return ("Paper Cup");
	case PLASTIC_CUP:
		return ("Plastic Cup");
	default:
		return ("Unknown Cup");
	}
}

const char	*get_lid_name(lid_type_t lid_type)
{
	switch (lid_type)
	{
	case LID_WITHOUT_HOLE:
		return ("Lid without Hole");
	case LID_WITH_HOLE:
		return ("Lid with Hole");
	default:
		return ("Unknown Lid");
	}
}

int	get_size_ml(int size)
{
	switch (size)
	{
	case P:
		return (300);
	case M:
		return (500);
	case G:
		return (700);
	default:
		return (0);
	}
}

cup_type_t get_cup_type(int drink_type) {
	switch (drink_type) {
	case SODA:
		return PAPER_CUP;
	case JUICE:
		return PLASTIC_CUP;
	default:
		return PAPER_CUP;
	}
}
