cd /etc/nginx/sites-enabled
rm default
git clone
cp

ln -s /etc/nginx/sites-available/golfsinteppadon.com golfsinteppadon.com
ln -s /etc/nginx/sites-available/madcastles.com madcastles.com
ln -s /etc/nginx/sites-available/figmagolf.com figmagolf.com
ln -s /etc/nginx/sites-available/sinteppadon.com sinteppadon.com
ln -s /etc/nginx/sites-available/virtuososheetmusic.com virtuososheetmusic.com

sudo certbot --nginx -d golfsinteppadon.com -d www.golfsinteppadon.com
sudo certbot --nginx -d madcastles.com -d www.madcastles.com
sudo certbot --nginx -d figmagolf.com -d www.figmagolf.com
sudo certbot --nginx -d virtuososheetmusic.com -d www.virtuososheetmusic.com
