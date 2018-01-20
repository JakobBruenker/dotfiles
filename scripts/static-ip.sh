#!/bin/sh

sudo ip link set enp9s0 up
sudo ip addr add 192.168.100.108/24 broadcast 192.168.100.255 dev enp9s0
sudo ip route add default via 192.168.100.1
