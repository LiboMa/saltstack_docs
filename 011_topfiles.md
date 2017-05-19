# Play with top file https://docs.saltstack.com/en/latest/ref/states/top.html

## set on the /etc/salt/master file

file_roots:
  dev:
    - /srv/salt/dev
  qa:
    - /srv/salt/qa
  prod:
    - /srv/salt/prod
    
## mkdir /srv/salt base dir

``` bash
mkdir /srv/salt

```

## create top file with multiple environment
``` bash
vi top.sls

dev:
  'webserver*':
    - webserver
  'db*':
    - db
qa:
  'webserver*':
    - webserver
  'db*':
    - db
prod:
  'webserver*':
    - webserver
  'db*':
    - db
 ```
 
