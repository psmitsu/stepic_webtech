cdir=$( pwd )
# ensure appropriate file paths in nginx and gunicorn configs
sed -i s:/.*/web/:$cdir/:g $cdir/etc/gunicornask.py
# clean logs
sudo rm -r $cdir/etc/logs/ask_*
# start gunicorn app
sudo kill $(cat $cdir/etc/ask.pid)
sudo gunicorn -c $cdir/etc/gunicornask.py --daemon ask.wsgi --pid $cdir/etc/ask.pid
