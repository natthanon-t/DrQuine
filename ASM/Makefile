# ==============================================================================
# VARIABLES
# ==============================================================================

PROGRAMS   = Colleen Grace Sully
NASM       = nasm
NASMFLAGS  = -f elf64
CC         = gcc
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
	@$(CC) $(CFLAGS) $< -o $@

clean:
	@echo "Removing ASM object files: $(OBJS)"
	@rm -f $(OBJS)

fclean: clean
	@echo "Removing ASM executables: $(PROGRAMS)"
	@rm -f $(PROGRAMS) Grace_kid.s tmp
	@rm -f Sully_0 Sully_1 Sully_2 Sully_3 Sully_4 Sully_5
	@rm -f Sully_0.s Sully_1.s Sully_2.s Sully_3.s Sully_4.s Sully_5.s
	@rm -f Sully_0.o Sully_1.o Sully_2.o Sully_3.o Sully_4.o Sully_5.o

re: fclean all
