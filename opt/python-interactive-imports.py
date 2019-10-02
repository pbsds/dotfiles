#!/usb/bin/env python3

#run with:
#gnome-terminal --hide-menubar --window-with-profile=manjaro -x python -i $HOME/.local/opt/python-interactive-imports.py

from math import cos, pi, sin, exp, log, log10, sqrt, acos, asin, atan
from pprint import pprint
import numpy as np
import functools
from statistics import *

p = pprint

def plot(x, *args):
	import matplotlib.pyplot as plt
	for i in args:
		plt.plot(x[:len(i)], i)
	plt.show()


def hist(x, bins=20):
	import matplotlib.pyplot as plt
	plt.hist(x, bins)
	plt.show()

def scatter(x, *args):
	import matplotlib.pyplot as plt
	for i in args:
		plt.plot(x[:len(i)], i, ".")
	plt.show()


def rad(degrees):
	return degrees * pi / 180

def deg(radians):
	return radians / pi * 180

def clip(data):
	import subprocess
	p = subprocess.Popen(("xclip", "-sel", "clip"), stdin=subprocess.PIPE)
	p.communicate(data.encode("utf-8"))

def prod(args):
	return functools.reduce(lambda x, y: x*y, args)

def add(*args):
	return sum(args)

def mul(*args):
	return prod(args)
