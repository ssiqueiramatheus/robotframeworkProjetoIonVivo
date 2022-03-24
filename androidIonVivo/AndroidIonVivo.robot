*** Settings ***
Resource  ResourceAndroidIonVivo.robot

*** Test Cases ***
Caso de teste 01:Login
    Abrir aplicativo
    Entrando na tela de Login
    Digitando agencia e conta
    Digitando senha
    Fechar Stories
    Swipe Up
    Validar elemento na tela de login

Caso de teste 02:Status
    Clicar e validar stories
    Swipe Up
    Validar elemento na saida dos Stories

Caso de teste 03:Home
    Validar tela home e saldo

Caso de teste 04:Rentabilidade
    Swipe Left
    Validar tela de rentabilidade

Caso de teste 05:Carteira
    Swipe Right
    Valida elemnto na tela principal
    Swipe Down
    Clicar em todos os produtos
    Validar tela da carteira

Caso de teste 06:Sair
    fechar cenario carteira
    Clicar no perfil
    Clicar em sair

Fechar aplicativo
    close application





