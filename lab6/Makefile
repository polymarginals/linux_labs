obj-m += hello-1.o
obj-m += hello-1-edited.o
obj-m += hello-2.o
obj-m += hello-3.o
obj-m += hello-4.o
obj-m += hello-5.o
obj-m += startstop.o
startstop-objs := start.o stop.o

all:
	make -C /usr/src/linux-`uname -r` M=$(PWD) modules

clean:
	make -C /usr/src/linux-`uname -r` M=$(PWD) clean

test:
	sudo dmesg --clear

	sudo insmod hello-1.ko
	sudo rmmod hello-1.ko

	sudo insmod hello-1-edited.ko
	sudo rmmod hello-1-edited.ko

	sudo insmod hello-2.ko
	sudo rmmod hello-2.ko

	sudo insmod hello-3.ko
	sudo rmmod hello-3.ko

	sudo insmod hello-4.ko
	sudo rmmod hello-4.ko

	sudo insmod hello-5.ko
	sudo rmmod hello-5.ko

	sudo insmod startstop.ko
	sudo rmmod startstop.ko

	sudo dmesg
