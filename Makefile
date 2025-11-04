all:
	@$(MAKE) -C ASM
	@$(MAKE) -C C

clean:
	@$(MAKE) -C ASM clean
	@$(MAKE) -C C clean

fclean: clean
	@$(MAKE) -C ASM fclean
	@$(MAKE) -C C fclean

re: fclean all

.PHONY: all clean fclean re
