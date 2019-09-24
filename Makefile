CC=gcc
#CC=arm-linux-gnueabihf-gcc

PAHO_INC_PATH=./../paho.mqtt.c/src
PAHO_LIB_PATH=./../paho.mqtt.c/build/output

all: async_pub async_sub sync_pub
	
async_pub: async_pub.c
	@$(CC) -o async_pub async_pub.c -lpaho-mqtt3cs -I$(PAHO_INC_PATH) -L$(PAHO_LIB_PATH)

async_sub: async_sub.c
	@$(CC) -o async_sub async_sub.c -lpaho-mqtt3cs -I$(PAHO_INC_PATH) -L$(PAHO_LIB_PATH)

sync_pub: sync_pub.c
	@$(CC) -o sync_pub sync_pub.c -lpaho-mqtt3cs -I$(PAHO_INC_PATH) -L$(PAHO_LIB_PATH)

clean:
	@rm -rf async_pub async_sub sync_pub

.PHONY: clean
