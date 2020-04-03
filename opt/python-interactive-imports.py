#!/usb/bin/env python3

#run with:
#gnome-terminal --hide-menubar --window-with-profile=manjaro -x python -i $HOME/.local/opt/python-interactive-imports.py

import numpy as np
from numpy import gcd, array, arange, linspace, meshgrid
from numpy import cos, pi, sin, exp, log, log10, sqrt
#from math import cos, pi, sin, exp, log, log10, sqrt, acos, asin, atan
from math import acos, asin, atan, factorial
from statistics import *
from pprint import pprint
from dis import dis
import os, sys
import functools

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

def imshow(image, cmap="gray"):
	import matplotlib.pyplot as plt
	plt.imshow(image.astype(np.float32), cmap=cmap)
	plt.show()

def image(filepath=None, gray=False):
	if not filepath:
		import cv2
		cam = cv2.VideoCapture(0)
		s, im = cam.read() # captures image
		cv2.destroyAllWindows()
		im = im.astype(np.float64) / 256
		if not gray:
			return np.dstack((
					im[:,:,2],
					im[:,:,1],
					im[:,:,0],
				))
		else:
			return ( im[:,:,2] + im[:,:,1] + im[:,:,0]) / 3
	else:
		import matplotlib.image as mpimg
		img=mpimg.imread('image_name.png')


def rad(degrees):
	return degrees * pi / 180

def deg(radians):
	return radians / pi * 180

def clip(data):
	"xclip -sel clip"
	import subprocess
	p = subprocess.Popen(("xclip", "-sel", "clip"), stdin=subprocess.PIPE)
	p.communicate(str(data).encode("utf-8"))

def prod(args):
	return functools.reduce(lambda x, y: x*y, args)

def add(*args):
	return sum(args)

def mul(*args):
	return prod(args)


def history(n=None):
	import readline
	return "\n".join([
		readline.get_history_item(i + 1)
		for i in range(readline.get_current_history_length())
	][-(n+1) if n is not None else 0:-1])


def integral(data, initial=0, step=None):
    if step is None:
        step = (data[-1] - data[0]) / len(data)
    out = [initial]
    for i in data:
        out.append(out[-1] + i*step)
    return out[1:]
