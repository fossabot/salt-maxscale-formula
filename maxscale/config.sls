{% from "maxscale/map.jinja" import maxscale as maxscale with context %}

include:
  - maxscale.service

maxscale_config_file:
  file.managed:
    - name: "{{ maxscale.etcdir }}/maxscale.cnf"
    - source: salt://maxscale/templates/maxscale.cnf.jinja
    - template: jinja
    - user: root
    - mode: 644
    - watch_in:
      - service: maxscale.service
    - require:
      - pkg: {{ maxscale.pkgname }}