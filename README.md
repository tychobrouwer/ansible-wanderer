Install and configure wanderer
=========

The role installs and configures Wanderer.

Role Variables
--------------

Example Playbook
----------------

```yaml
- hosts: all
  vars:
    wanderer_meili_master_key: your_meilisearch_master_key
    wanderer_pocketbase_encryption_key: your_pocketbase_encryption_key

  roles:
    - role: tychobrouwer.wanderer

    - role: ansible-wanderer
      wanderer_install_dir: /opt/wanderer
      wanderer_disable_signup: true
      wanderer_private_instance: true
```

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
