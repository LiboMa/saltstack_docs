#### JINJA IN FILES
Jinja_ can be used in the same way in managed files:

## redis.sls
/etc/redis/redis.conf:
    file.managed:
        - source: salt://redis.conf
        - template: jinja
        - context:
            bind: 127.0.0.1
## lib.sls
{% set port = 6379 %}

## redis.conf
{% from 'lib.sls' import port with context %}
port {{ port }}
bind {{ bind }}

