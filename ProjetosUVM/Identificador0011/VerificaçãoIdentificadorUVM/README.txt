UVM Verification for Identificador de Sequência "0011"
Descrição
Este projeto consiste em uma verificação UVM (Universal Verification Methodology) para um identificador de sequência "0011". O identificador é projetado para reconhecer a sequência específica "0011" na entrada e produzir uma saída correspondente.

Estrutura do Projeto
O projeto está organizado nas seguintes classes:

seq_agente: A classe de sequência (seq_agente) pode ser usada para gerar ou verificar padrões específicos de dados, instruções ou operações em um agente específico..

seq_env: Ambiente UVM que instância e configura as classes necessárias, como a sequência de teste e o teste UVM.

seq_if: se refere a uma interface de sequência que encapsula a comunicação entre componentes

seq_item: representa um item de sequência,

seq_monitor: é uma classe responsável por observar e analisar transações de sequência geradas ou recebidas 

seq_sequence:  reflete o comportamento ou a funcionalidade da sequência

seq_sequencer:gerencia o fluxo de sequências de teste, controlando quando as sequências começam e param de executar, e como elas interagem 

seq_top  nível superior de um ambiente de verificação

seq_driver componente que faz parte do ambiente de teste e é responsável por dirigir (ou "dirigir") as transações de sequência no design sob teste (DUT)

testbench  nível superior de um ambiente de verificação


Inicialização
Simulação: Para simular o testbench, execute a simulação com seu simulador preferido. Certifique-se de incluir todos os arquivos necessários.
bash
Copy code
<comando_simulador> testbench .sv

Visualização de Resultados: Após a conclusão da simulação, você pode visualizar os resultados no arquivo de despejo VCD (dump.vcd). Isso permitirá a análise da forma de onda.
Resultados Esperados

Ao final da simulação, os resultados esperados incluem a identificação bem-sucedida da sequência "0011" no identificador, tanto para estímulos aleatórios quanto para entradas direcionadas.

Observações
Certifique-se de ajustar o código conforme necessário para atender aos requisitos específicos do seu ambiente de verificação. Adicione a lógica de sequência e a lógica de inicialização do teste conforme a lógica de verificação desejada.

