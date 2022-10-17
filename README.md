<h1> Carol - Data Engineering - Challenge </h1>

Este repositório tem por objetivo apresentar como utilizar o processamento de dados SQL unificado na plataforma Carol.

O contexto é de um cliente que precisa visualizar por meio de um dashboard estatísticas de rotas de vôos.

As ferramentas utilizadas foram:

TOTVS Carol com processamento SQL <br>
SQL Server rodando dentro de um container Docker <br>
DBeaver	para visualização/manipulação dos dados no SQL Server <br>
ELT - Utilizamos a ferramenta 2c para fazer a ingestão de dados na Carol <br>
Carol Insights Studio para geração de gráficos e dashboard <br>

Instalação do SQL Server <br>

SQL Server - Material de apoio para instalação do Container:
 - https://learn.microsoft.com/en-us/sql/linux/quickstart-install-connect-docker?view=sql-server-ver16&pivots=cs1-bash <br><br>

Instalação do ELT 2c <br>

2c - Material de apoio para instalação do Container:
 - https://docs.carol.ai/docs/carol-connect-2c <br>
 Obs: Foi identificado no momento da instalação a necessidade de alterar a porta do container para 1434, visto que a porta padrão para rodar o SQL Server é 1433 <br><br> 

Ao final das configurações dos Containers, teremos o seguinte: <br>
![image](https://user-images.githubusercontent.com/32913011/195872338-58f71ca4-8d2f-4a17-b78b-81cb4c1f21ab.png) <br>

Criação das tabelas no SQL Server a partir dos arquivos .DAT. <br>

Para criar os scripts foi necessário seguir os seguintes passos: <br>
 1 - Renomear os arquivos .DAT para .CSV; <br>
 2 - Copiar os arquivos .CSV para /data dentro do Container do SQL Server através do comando <br>

 
