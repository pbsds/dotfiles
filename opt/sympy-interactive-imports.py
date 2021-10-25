#!/usb/bin/env python3

#run with:
#gnome-terminal --hide-menubar --window-with-profile=manjaro -x python -i $HOME/.local/opt/sympy-interactive-imports.py

from sympy import *
x, y, z, t = symbols('x y z t')
k, m, n = symbols('k m n', integer=True)
f, g, h = symbols('f g h', cls=Function)
