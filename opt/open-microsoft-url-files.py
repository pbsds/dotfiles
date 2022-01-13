#1/usr/bin/env python
import configparser
import os
import urllib.parse
import shutil
import subprocess
import sys

c = configparser.RawConfigParser()
c.read(sys.argv[1])

def input(query):
    if shutil.which("zenity"):
        return subprocess.run(["zenity", "--forms", "--add-entry=" + query], capture_output=True).stdout.decode().strip()
    #if shutil.which("xdialog"): TODO
    assert 0

try:
    url=c["InternetShortcut"]["URL"]

    if not url.strip():
        c["InternetShortcut"]["URL"] = input("Set URL")
        with open(sys.argv[1], "w") as f:
            c.write(f, space_around_delimiters=False)
        exit(0)

    if urllib.parse.urlparse(url).scheme not in ["http","https","ftp","ssh","zotero"]:
        raise Exception("Invalid scheme in URI")

    os.execv(shutil.which("xdg-open"), ["xdg-open", url])
    assert 0

except Exception as e:
    print(f"{e.__class__.__name__}: {e}",file=sys.stderr)

exit(3)
