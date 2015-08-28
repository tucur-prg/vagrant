
# Ansible

## 疎通確認
```
$ ansible <host> -i <hostsfile> -m ping
```

## Syntac Chedk
```
ansible-playbook httpd.yml -i hosts --syntax-check
```

## タスク一覧
```
ansible-playbook httpd.yml -i hosts --list-tasks
```

## 動作確認
```
ansible-playbook httpd.yml -i hosts --check
```

## 実行
```
ansible-playbook httpd.yml -i hosts
```
