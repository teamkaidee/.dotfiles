set-ansible-vault () {
  export ANSIBLE_VAULT_PASSWORD_FILE=.vault
}

unset-ansible-vault () {
  unset ANSIBLE_VAULT_PASSWORD_FILE
}
