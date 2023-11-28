# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: OrioPrisco <47635210+OrioPrisco@users      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/04/11 11:29:48 by OrioPrisc         #+#    #+#              #
#    Updated: 2023/11/28 15:35:06 by OrioPrisc        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC				=	cc

SRC				=	
BONUS_SRC		=	

NAME			=	
BONUS			=	

OBJ_FOLDER		=	objs/

CFLAGS			=	-Wall -Wextra -Werror -g

SRC_FOLDER		=	srcs/

HEADERS_FOLDER	=	includes/\
					libft/includes/\

LIBS			=	libft/libft.a\
					libft/libftprintf.a\
					libft/libgetnextline.a\

#here to ensure things get pulled properly
SUBMODULES		=	libft/.git\
					libft/ftprintf/.git\
					libft/getnextline/.git\

LFLAGS			=	-Llibft -lft

DEPENDS		:=	$(patsubst %.c,$(OBJ_FOLDER)%.d,$(SRC) $(BONUS_SRC))
OBJS		:=	$(patsubst %.c,$(OBJ_FOLDER)%.o,$(SRC))
BONUS_OBJS	:=	$(patsubst %.c,$(OBJ_FOLDER)%.o,$(BONUS_SRC))
COMMANDS	:=	$(patsubst %.c,$(OBJ_FOLDER)%.cc,$(SRC) $(BONUS_SRC))

all: $(NAME) compile_commands.json

-include $(DEPENDS)

bonus: $(BONUS) compile_commands.json

$(BONUS) : $(LIBS) $(BONUS_OBJS)
	cc $(CFLAGS) $(BONUS_OBJS) $(LFLAGS) -o $@

$(SUBMODULES) :
	git submodule update --init --recursive libft

%.a: $(SUBMODULES)
	make -C $(@D)

$(NAME): $(LIBS) $(OBJS) $(SUBMODULES)
	$(CC) $(CFLAGS) $(OBJS) $(LFLAGS) -o $@

COMP_COMMAND = $(CC) -c $(CFLAGS) $(addprefix -I,$(HEADERS_FOLDER)) -MMD -MP $< -o $@
CONCAT = awk 'FNR==1 && NR!=1 {print ","}{print}'

$(OBJ_FOLDER)%.o $(OBJ_FOLDER)%.cc: $(SRC_FOLDER)%.c Makefile $(SUBMODULES)
	$(COMP_COMMAND)
	@printf '{\n\t"directory" : "$(shell pwd)",\n\t"command" : "$(COMP_COMMAND)",\n\t"file" : "$<"\n}' > $(OBJ_FOLDER)$*.cc

compile_commands.json : $(COMMANDS) Makefile
	@echo "Making compile_commands.json"
	@echo "[" > compile_commands.json
	@$(CONCAT) $(COMMANDS) >> compile_commands.json
	@echo "]" >> compile_commands.json

clean: $(SUBMODULES)
	rm -f $(OBJS) $(BONUS_OBJS) $(DEPENDS) $(COMMANDS)
	for lib in $(shell dirname $(LIBS)); do \
		make -C $$lib clean; \
	done

fclean: clean $(SUBMODULES)
	rm -f $(NAME) $(BONUS) compile_commands.json
	make -C libft fclean

re: fclean all

.PHONY: all clean fclean re bonus
.SUFFIXES:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
