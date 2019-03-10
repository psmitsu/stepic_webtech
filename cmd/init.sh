#!/usr/bin/sh
cdir=$( pwd )
# ensure appropriate file paths in nginx and gunicorn configs
sed -i s:/.*/web/:$cdir/:g $cdir/etc/nginx.conf
sed -i s:/.*/web/:$cdir/:g $cdir/etc/gunicornask.py
# specify new nginx config and run server
sudo rm /etc/nginx/sites-enabled/default
sudo ln -sf $cdir/etc/nginx.conf /etc/nginx/sites-enabled/test.conf
sudo /etc/init.d/nginx restart
# start gunicorn app
#sudo gunicorn -c $cdir/etc/gunicornhello.py --daemon hello:wsgi_app --pid $cdir/etc/hello.pid
sudo kill $(cat $cdir/etc/ask.pid)
sudo gunicorn -c $cdir/etc/gunicornask.py --daemon ask.wsgi --pid $cdir/etc/ask.pid
