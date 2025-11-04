# ==============================================================================
# VARIABLES
# ==============================================================================

PROGRAMS   = Colleen Grace Sully
CC         = clang
CFLAGS     = -Wall -Wextra -Werror

# ==============================================================================
# TARGETS
# ==============================================================================

.PHONY: all clean fclean re

all: $(PROGRAMS)

$(PROGRAMS): %: %.c
	@echo "Compiling $< to create executable: $@"
	@$(CC) $(CFLAGS) $< -o $@

clean:
	@echo "Removing C executables: $(PROGRAMS)"
	@rm -f $(PROGRAMS) Sully_*

fclean: clean
	@rm -f Grace_kid.c tmp
	@rm -f Sully_0 Sully_1 Sully_2 Sully_3 Sully_4 Sully_5
	@rm -f Sully_0.c Sully_1.c Sully_2.c Sully_3.c Sully_4.c Sully_5.c

re: fclean all
