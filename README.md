fetch-wcommand-out
=========

Ansible Role: fetch-wcommand-out
------------

As executing the playbook, the role is copied from the target host in background and save it as a text file.
The role allows to get the command list of specific output files simply for Windows.

Install
------------

```
# ansible-galaxy install --roles-path ./roles tksarah.fetch-wcommand-out
```


Requirements
------------

* Ansible version 2.0 <

Role Variables
--------------

Available variables are listed below,

**defaults/main.yml:**
```
savedir: "fetched"
remtemp: "C:\\ansible_remtemp"
```

All you have to do is create a text file as below.


```
1,<command>,<output file>
2,<command>,<output file>
3,<command>,<output file>
```

**Ex) sample_comlist.txt:**

```
1,"Get-Date -displayhint tim","timeout.txt"
2,"$PSVersionTable","psversion.txt"
```

Notes: "commna" is not supported.

Dependencies
------------

None

Example Playbook
----------------

```
- name: Playbook for fetching files
  hosts: "{{ target }}"
  gather_facts: no

  vars_prompt:
    - { name: "target" , prompt: "Input target host" ,  default: all , private: no }
    - { name: "inputcommand" , prompt: "Input your command list" , default: sample_comlist.txt , private: no }
    - { name: "remtemp" , prompt: "Input remote temp directory " , default: "C:\\ansible_remtemp" , private: no }
    - { name: "savedir" , prompt: "Input a save directory" , default: fetched , private: no }

  roles:
    - tksarah.fetch-wcommand-out
```

License
-------

BSD

Author Information
------------------

fetch-wcommand-out role was written by: T.Kuramochi
