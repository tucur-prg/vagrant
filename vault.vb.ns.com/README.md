Initialize
==========

セットアップ後にやること

初期化処理
```
$ /opt/vault/bin/vault init
```

状態確認
```
$ /opt/vault/bin/vault status
```

利用できるようにするにはinitで発行した３種類のキーを登録する
```
$ /opt/vault/bin/vault unseal
Key (will be hidden):
$ /opt/vault/bin/vault unseal
Key (will be hidden):
$ /opt/vault/bin/vault unseal
Key (will be hidden):
```
