# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: OrioPrisco <47635210+OrioPrisco@users      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/23 15:27:59 by OrioPrisc         #+#    #+#              #
#    Updated: 2023/04/21 12:00:31 by OrioPrisc        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = do-op

SRC = ft_putchar.c\
	ft_swap.c\
	ft_putstr.c\
	ft_strlen.c\
	ft_strcmp.c \
	main.c

SRC_FOLDER = srcs/

HEADERS_FOLDER = includes/

OBJS = $(patsubst %.c,$(OBJ_FOLDER)%.o,$(SRC))

OBJ_FOLDER = $(SRC_FOLDER)

CFLAGS = -Wall -Wextra -Werror

all: $(NAME)
	
$(NAME): $(OBJS)
	 gcc -c $(CFLAGS) -I$(HEADER_FOLDER) $(OBJS) -o $(NAME)

$(OBJ_FOLDER)%.o : $(SRC_FOLDER)%.c
	gcc -c $(CFLAGS) -I$(HEADERS_FOLDER) $< -o $@

clean:
ifneq ($(strip $(foreach f,$(OBJS),$(wildcard $(f)))),)
	rm -f $(strip $(foreach f,$(OBJS),$(wildcard $(f))))
endif

fclean: clean
ifneq ($(wildcard($(NAME)),)
	rm $(NAME)
endif

re: fclean all
