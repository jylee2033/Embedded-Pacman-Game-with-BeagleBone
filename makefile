TARGETS= main
DEPS= ghost.c map.c gameManager.c ledDisplay.c utility.c joycon.c udp.c shutdown.c zenCapeJoystick.c types.h

OUTFILE = game
OUTDIR = $(HOME)/cmpt433/public/myApps

CROSS_COMPILE = arm-linux-gnueabihf
CC_C = $(CROSS_COMPILE)-gcc
CFLAGS = -Wall -g -std=c99 -D _POSIX_C_SOURCE=200809L -Werror -Wshadow

all: $(TARGETS)

$(TARGETS):
	$(CC_C) $(CFLAGS) $@.c $(DEPS) -o $(OUTDIR)/$@ -lpthread -lusb-1.0
clean:
	rm $(OUTDIR)/$(OUTFILE)
