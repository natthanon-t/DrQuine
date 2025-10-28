# ==============================================================================
# VARIABLES
# ==============================================================================

PROGRAMS   = Colleen Grace Sully
CC         = clang
CFLAGS     = -Wall -Wextra -Werror

# ==============================================================================
# TARGETS (เป้าหมาย)
# ==============================================================================

.PHONY: all clean fclean re

all: $(PROGRAMS)

$(PROGRAMS): %: %.c
	@echo "Compiling $< to create executable: $@"
	@$(CC) $(CFLAGS) $< -o $@

clean:
	@echo "Removing executables: $(PROGRAMS)"
	@rm -f $(PROGRAMS)

fclean: clean

re: fclean all
