# Como rodar essa bagaça

1. Jogar os arquivos da pasta mysql-connector-java-5.1.12 dentro da pasta lib do tomcat
1. Criar um projeto WEB no netbeans (sistema_loja2023) -> Criar o pacote tipo "conexao_notafiscal" -> nesse pacote, cria uma classe tipo "Conexao_notafiscal" -> cola as coisas da nota fiscal lá e altera pra tabela desejada -> Tenta rodar a classe -> cancela quando pedir a senha e dale
4. Pega a pasta do pacote gerado em (`C:\Users\Aluno\Documents\NetBeansProjects\sistema_loja2023\build\web\WEB-INF\classes`)
5. Cola essa pasta em (`C:\Program Files\Apache Software Foundation\Tomcat 8.0\lib`)
6. reinicia o servidor
1. cria um arquivo para alterar_nometabela, cadastrar_nometabela, excluir_nometabela, listar_nometabela, consultar_nometabela, na pasta root
2. seja feliz!

# Live reloading
Para utilizá-lo precisará do node instalado e rodar o comando, para instalar a biblioteca de detecção de alteração de arquivos:
```node
npm install -g nodemon
```

Todos os arquivos .java deverão estar na pasta ./src/sistema_loja2023

Execute o comando num terminal como administrador
```bat
./start.bat {caminho-do-local-da-compilacao-do-tomcat | caminho da pasta lib\sistema2023_jsp}
```

Ao salvar um arquivo, os antigos serão excluídos, os novos serão compilados e enviados a pasta e o servidor será reinicializado automaticamente, podendo demorar uns 3 segundos

