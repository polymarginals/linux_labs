obj-m += intrpt.o

all:
	make -C /usr/src/linux-`uname -r` M=$(PWD) modules

clean:
	make -C /usr/src/linux-`uname -r` M=$(PWD) clean

test:
	sudo dmesg --clear
	sudo insmod intrpt.ko
	sudo rmmod intrpt.ko
	sudo dmesg
