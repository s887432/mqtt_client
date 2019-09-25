#CC=gcc
CC=arm-linux-gnueabihf-gcc

# PAHO_INC = /home/user/WorkArea/buildroot-wlsom/buildroot-at91/output/build/paho-mqtt-c-v1.2.0/src/
# PAHO_LIB = /home/user/WorkArea/buildroot-wlsom/buildroot-at91/output/build/paho-mqtt-c-v1.2.0/src/
# SSL_LIB = /home/user/WorkArea/buildroot-wlsom/buildroot-at91/output/build/libopenssl-1.0.2n/

all: async_pub async_sub sync_pub
	
async_pub: async_pub.c
	$(CC) -o async_pub async_pub.c -lpaho-mqtt3cs -I$(PAHO_INC) -L$(PAHO_LIB) -Wl,-rpath-link=$(SSL_LIB)

async_sub: async_sub.c
	$(CC) -o async_sub async_sub.c -lpaho-mqtt3cs -I$(PAHO_INC) -L$(PAHO_LIB) -Wl,-rpath-link=$(SSL_LIB)

sync_pub: sync_pub.c
	$(CC) -o sync_pub sync_pub.c -lpaho-mqtt3cs -I$(PAHO_INC) -L$(PAHO_LIB) -Wl,-rpath-link=$(SSL_LIB)

clean:
	@rm -rf async_pub async_sub sync_pub

.PHONY: clean
