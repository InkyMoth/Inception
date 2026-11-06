NAME = PmergeMe
SRCDIR = src/
OBJDIR = obj/

DFL_COLOR = \033[0m
GREEN = 	\033[1;32m
PURBLE = 	\033[1;35m
MAROOON = 	\033[1;33m
EVIL_RED = 	\033[1;31m

FILES = PmergeMe main
SRCS = $(addprefix $(SRCDIR), $(addsuffix .cpp, ${FILES}))
OBJS = $(addprefix $(OBJDIR), $(addsuffix .o, ${FILES}))
vpath %.cpp $(SRCDIR)

INCLUDES = include
CFLAGS = -Wall -Wextra -Werror -std=c++98 -g
CC = c++

all : ${NAME}

${OBJDIR}%.o : %.cpp ${INCLUDES}/*.hpp
	@mkdir -p ${OBJDIR}
	@${CC} ${CFLAGS} -I${INCLUDES} -c $< -o $@
	

${NAME} : ${OBJS}
	@echo "${MAROOON}Compiling file(s)...${DFL_COLOR}"
	${CC} ${CFLAGS} ${OBJS} -o ${NAME}
	@echo "${MAROOON}Done!${DFL_COLOR}"
	@echo "${GREEN}${NAME} ready!${DFL_COLOR}"

clean :
	@rm -rf ${OBJDIR}
	@echo "${PURBLE}obj(s) cleaned!${DFL_COLOR}"

fclean : clean
	@rm -f ${NAME} 
	@echo "${PURBLE}${NAME} fully cleaned!${DFL_COLOR}"

re : fclean all
	@echo "${GREEN}${NAME} cleaned and remade!${DFL_COLOR}"

.PHONY: re all clean fclean
