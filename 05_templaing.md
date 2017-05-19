# JINJA IN FILES
Jinja_ can be used in the same way in managed files:

## redis.sls
```python 
/etc/redis/redis.conf:
    file.managed:
        - source: salt://redis.conf
        - template: jinja
        - context:
            bind: 127.0.0.1
```
## lib.sls
```html
{% set port = 6379 %}
```

## redis.conf
```html
{% from 'lib.sls' import port with context %}
port {{ port }}
bind {{ bind }}
```

