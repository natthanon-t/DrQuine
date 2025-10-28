# ==============================================================================
# VARIABLES
# ==============================================================================

PROGRAMS   = Colleen Grace
NASM       = nasm
NASMFLAGS  = -f elf64
CC         = gcc
CFLAGS     = 
OBJS       = $(addsuffix .o, $(PROGRAMS))

# ==============================================================================
# TARGETS
# ==============================================================================

.PHONY: all clean fclean re

all: $(PROGRAMS)

%.o: %.s
	@echo "Assembling $< to create object: $@"
	@$(NASM) $(NASMFLAGS) $< -o $@

$(PROGRAMS): %: %.o
	@echo "Linking $< to create executable: $@"
	@$(CC) $(CFLAGS) -no-pie $< -o $@

clean:
	@echo "Removing object files: $(OBJS)"
	@rm -f $(OBJS)

fclean: clean
	@echo "Removing executables: $(PROGRAMS)"
	@rm -f $(PROGRAMS) tmp

re: fclean all
