# Implementação de Terraform para Admin Console do Google Workspace

Neste projeto, vamos implementar o Admin Console do Google Workspace através do processo automatizado do terraform.

* Verifique se o admin SDK está habilitado no seu projeto de devops.

https://console.cloud.google.com/apis/library/admin.googleapis.com


* Configure a Tela de Consentimento do Google para o seu projeto.

https://console.cloud.google.com/apis/credentials/consent


* Criação da Service Account.

Faça a criação da conta de serviço para que o terraform consiga se autenticar e criar os recursos.
https://console.cloud.google.com/iam-admin/serviceaccounts


* Crie a chave Json da service account.

https://console.cloud.google.com/iam-admin/serviceaccounts


* Copie a chave gerada da service account para dentro do projeto.


* Aplicar as alterações no arquivo main.tf

1. No customer id informar o customer id do seu painel do Google Workspace.

https://admin.google.com/ac/accountsettings

Abaixo segue a imagem onde consegue visualizar o customer ID.


2. Na opção credentials informar o nome da chave json gerada da conta de serviço.

3. Na opção impersonated_user_email informar o email do usuário administrador do cloud identity ou admin console.

* Adcionar a conta de serviço como domain delegate no painel do admin console.

https://admin.google.com/ac/owl



As informações de client id encontram-se na chave json da sua conta de serviço.

Será necessário também informar os escopos de acesso as apis do admin sdk.
Para criação de usuários e grupos os escopos necessários são:

    "https://www.googleapis.com/auth/admin.directory.user",
    "https://www.googleapis.com/auth/admin.directory.userschema",
    "https://www.googleapis.com/auth/admin.directory.group"

* Conclusão
Após estas configurações o terraform irá criar os recursos no Google Workspace através de processos automatizados.

Para testar faça o seguinte:


    terraform plan
    terraform apply
    terraform destroy