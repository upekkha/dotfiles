Custom completion rules for bash-completion@2
=============================================

### ansible-vault

[Github](https://github.com/dysosmus/ansible-completion)

```sh
curl https://raw.githubusercontent.com/dysosmus/ansible-completion/master/ansible-vault-completion.bash -o ansible-vault
```

### pip

[Documentation](https://pip.pypa.io/en/stable/user_guide/#command-completion)

```sh
pip completion --bash > pip
```

### pipenv

[Documentation](https://pipenv.pypa.io/en/latest/advanced/#shell-completion)

```sh
echo "$(_PIPENV_COMPLETE=bash_source pipenv)" > pipenv
```

### python-argcomplete

[Documentation](https://kislyuk.github.io/argcomplete/#activating-global-completion)

```sh
activate-global-python-argcomplete --dest=- > python-argcomplete
```

### vagrant-completion

[GitHub](https://github.com/hashicorp/vagrant/blob/main/contrib/bash/completion.sh)

```sh
curl https://raw.githubusercontent.com/hashicorp/vagrant/main/contrib/bash/completion.sh -i vagrant
```
