# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: kjimenez <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/09/29 11:53:31 by kjimenez          #+#    #+#              #
#    Updated: 2023/02/19 14:15:35 by kjimenez         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIR_BIN			:= bin
DIR_BUILD		:= build
DIR_SRC			:= src

MODULES_NAMES	:= ctype list stdio stdlib string
MAKEFLAGS		:= --no-print-directory
CP				:= cp --verbose -u

all:
	@for module in $(MODULES_NAMES); do \
		$(MAKE) $(MAKEFLAGS) -C $(DIR_SRC)/$$module; \
		$(CP) $(DIR_SRC)/$$module/$(DIR_BIN)/libft_$$module.a $(DIR_BIN); \
	done

clean:
	@for module in $(MODULES_NAMES); do \
		$(MAKE) $(MAKEFLAGS) -C $(DIR_SRC)/$$module clean; \
	done

fclean:
	@for module in $(MODULES_NAMES); do \
		$(MAKE) $(MAKEFLAGS) -C $(DIR_SRC)/$$module fclean; \
		$(RM) $(DIR_BIN)/libft_$$module.a; \
	done

re: fclean $(NAME)

.PHONY: all clean fclean re
