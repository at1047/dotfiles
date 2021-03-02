import os
import sys
import subprocess

path = os.getcwd()

try:
    junit_file = ' ' + sys.argv[1]
except:
    junit_file = ''

f = open('junit.txt', 'w').close()
cli = '"junit' + junit_file + '" >> junit.txt'
junit_results = subprocess.call(['/usr/local/bin/zsh', '-i', '-c', cli])
#print(junit_results)
