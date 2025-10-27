# ==============================================================================
# VARIABLES
# ==============================================================================

NAMES      = Colleen Grace
CC         = clang
CFLAGS     = -Wall -Wextra -Werror

# ==============================================================================
# TARGETS
# ==============================================================================

.PHONY: all clean fclean re $(NAMES)

all: $(NAMES)

$(NAMES):
	@echo "Compiling $^ to create executable: $@"
	@$(CC) $(CFLAGS) $@.c -o $@

clean:
	@echo "Removing executables: $(NAMES)"
	@rm -f $(NAMES)

fclean: clean

re: fclean all