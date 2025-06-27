#ifndef ABS_H
# define ABS_H

# include <fcntl.h>
# include <stdio.h>
# include <stdlib.h>

typedef enum e_order_type
{
	TAKEOUT,
	DINEIN
}	t_order_type;

typedef enum e_drink_type
{
	SODA,
	JUICE
}	t_drink_type;

typedef enum e_size
{
	P = 300,
	M = 500,
	G = 700
}	t_size;

typedef enum e_flavor
{
	COKE,
	GURANA,
	ORANGEJUICE,
	GRAPEJUICE
}	t_flavor;

int	validate_params(int drink_type, int flavor, int size, int order_type);

#endif