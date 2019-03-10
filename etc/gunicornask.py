from multiprocessing import cpu_count
from math import ceil
# Socket, Threads number, Python Path
bind = "0.0.0.0:8000"
workers = ceil((cpu_count() * 2 + 1)/2)
pythonpath = "/vagrant/web2/ask"
# Logs
loglevel = 'debug'
accesslog = '/vagrant/web2/etc/logs/ask_access.log'
acceslogformat ="%(h)s %(l)s %(u)s %(t)s %(r)s %(s)s %(b)s %(f)s %(a)s"
errorlog = '/vagrant/web2/etc/logs/ask_error.log'
