#ifndef ABS_H
# define ABS_H

# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>

typedef enum e_order_type
{
	TAKEOUT,
	DINE_IN
}			order_type_t;

typedef enum e_drink_type
{
	SODA,
	JUICE
}			drink_type_t;

typedef enum e_size
{
	P = 300,
	M = 500,
	G = 700
}			size_t;

typedef enum e_flavor
{
	COKE,
	GURANA,
	ORANGE_JUICE,
	GRAPE_JUICE
}			flavor_t;

typedef enum e_cup_type
{
	PAPER_CUP,
	PLASTIC_CUP
}			cup_type_t;

typedef enum e_lid_type
{
	LID_WITHOUT_HOLE,
	LID_WITH_HOLE
}			lid_type_t;

int			validate_params(int drink_type, int flavor, int size,
				int order_type);
int			validate_flavor_compatibility(int drink_type, int flavor);
int			validate_size_compatibility(int drink_type, int size);
int			make_soda(int flavor, int size, int order_type);
int			make_juice(int flavor, int size, int order_type);
cup_type_t	get_cup_type(int drink_type);
int			get_ice_count(int drink_type);
lid_type_t	get_lid_type(int order_type);
int			get_size_ml(int size);
const char	*get_flavor_name(int flavor);
const char	*get_cup_name(cup_type_t cup_type);
const char	*get_lid_name(lid_type_t lid_type);

#endif