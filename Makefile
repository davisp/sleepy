OTPROOT=/usr/local/lib/erlang/
INCLUDES = -I$(OTPROOT)/erts-5.7.5/include/

# OS X flags.
GCCFLAGS = -O3 -fPIC -bundle -flat_namespace -undefined suppress -fno-common -Wall 

# Linux Flags
#GCCFLAGS = -O3 -fPIC -shared -fno-common -Wall

CFLAGS = $(GCCFLAGS) $(INCLUDES)
LDFLAGS = $(GCCFLAGS) $(LIBS)

OBJECTS = sleepy.o

DRIVER = sleepy.so
BEAM = sleepy.beam lockvm.beam

all: $(DRIVER) $(BEAM)

clean: 
	rm -f *.o *.beam $(DRIVER)

$(DRIVER): $(OBJECTS)
	gcc -o $@ $^ $(LDFLAGS)

%.beam: %.erl
	erlc $^

run: all
	erl -noshell -s lockvm lock -s init stop
