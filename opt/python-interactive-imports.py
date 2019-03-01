#!/usb/bin/env python3

#run with:
#gnome-terminal --hide-menubar --window-with-profile=manjaro -x python -i $HOME/.local/opt/python-interactive-imports.py

from math import cos, pi, sin, exp, log, log10, sqrt
import numpy as np
from statistics import *

def plot(x, *args):
    import matplotlib.pyplot as plt
    for i in args:
        plt.plot(x[:len(i)], i)
    plt.show()

def rad(degrees):
    return degrees * pi / 180

def deg(radians):
    return radians / pi * 180
