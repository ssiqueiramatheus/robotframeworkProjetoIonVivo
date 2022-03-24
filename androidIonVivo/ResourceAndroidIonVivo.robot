*** Settings ***
Library        AppiumLibrary

*** Variables ***



*** Keywords ***
Abrir aplicativo
    Open Application    http://10.100.9.90:4741/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=RX8R3039DTT
    ...                 udid=RX8R3039DTT
    ...                 systemPort= 8123
    ...                 appPackage=com.itau.investimentos
    ...                 appActivity=com.itau.investimentos.launcher.LauncherActivity

Entrando na tela de Login
   Sleep  10s
   ${NUMERO}=    Get Matching Xpath Count      //android.widget.ImageButton[@content-desc="Fechar"]
  IF    ${NUMERO} > 0
    click element    //android.widget.ImageButton[@content-desc="Fechar"]
  END

   ${ESQUECERAGENCIAECONTA}=    Get Matching Xpath Count      //android.widget.Button[@text='Olá, Leandro']
  IF    ${ESQUECERAGENCIAECONTA} > 0
    click element    //android.widget.Button[@text='Olá, Leandro']
    wait until element is visible   com.itau.investimentos:id/btnLeave
    click element                   com.itau.investimentos:id/btnLeave
  END

    Sleep   5s

    ${NOTIFICACAODEPERMITIR}=    Get Matching Xpath Count      //android.widget.Button[@text='Permitir']
  IF    ${NOTIFICACAODEPERMITIR} > 0
    click element    //android.widget.Button[@text='Permitir']
  END

    Wait Until Element Is Visible   //android.widget.TextView[@text='Já sou cliente Itaú']
    click element                   //android.widget.TextView[@text='Já sou cliente Itaú']
    Sleep  5s
    Capture Page Screenshot

Digitando agencia e conta
    Wait Until Element Is Visible   //android.view.View[@text='Agência']
    click element   //android.view.View[@text='Agência']
    Sleep   5s
    #---------------Agencia--------------------------
    #Coloque cada digito da sua agencia na Frente do press keycode
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    #---------------Conta----------------------------
    #Coloque cada digito da sua conta na Frente do press keycode
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    press keycode
    Sleep  3s
    press keycode
    Sleep  7s
    Capture Page Screenshot

Digitando senha
   #Coloque cada digito da sua senha dentro das aspas simples
   click element    //android.widget.Button[contains(@text, '')]
   Sleep  2s
   click element    //android.widget.Button[contains(@text, '')]
   Sleep  2s
   click element    //android.widget.Button[contains(@text, '')]
   Sleep  2s
   click element    //android.widget.Button[contains(@text, '')]
   Sleep  2s
   click element    //android.widget.Button[contains(@text, '')]
   Sleep  2s
   click element    //android.widget.Button[contains(@text, '')]
   Sleep  5s
   click element    //android.widget.Button[@text='Entrar']
   Sleep  10s


   wait until element is visible    com.android.permissioncontroller:id/permission_allow_foreground_only_button
   click element    com.android.permissioncontroller:id/permission_allow_foreground_only_button


Fechar Stories
    ${NUMERO}=    Get Matching Xpath Count      //android.widget.ImageButton[@content-desc="Fechar"]
  IF    ${NUMERO} > 0
    click element    //android.widget.ImageButton[@content-desc="Fechar"]
  END

Swipe Up
  ${element_size}=    Get Element Size    id=com.itau.investimentos:id/popup_card
  ${element_location}=    Get Element Location    id=com.itau.investimentos:id/popup_card
  ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
  ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
  ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
  Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
  Sleep  3

Validar elemento na tela de login
  wait until element is visible  //android.view.View[@content-desc="Perfil"]

  Capture Page Screenshot

#------------------------------------STORIES------------------------------------------------------

Clicar e validar stories
    wait until element is visible   com.itau.investimentos:id/ibStoriesButton
    click element   com.itau.investimentos:id/ibStoriesButton

    ${STORIES}=    Get Matching Xpath Count      //android.widget.ImageButton[@content-desc="Fechar"]
  IF    ${STORIES} > 0
    wait until element is visible   com.itau.investimentos:id/ionProgressStories
    Capture Page Screenshot
    click element    //android.widget.ImageButton[@content-desc="Fechar"]
  ELSE
    Log  Stories fechou antes de validar
  END

Validar elemento na saida dos Stories
    wait until element is visible   com.itau.investimentos:id/ibStoriesButton

    Capture Page Screenshot

#----------------------------------------HOME--------------------------------------------------------

Validar tela home e saldo
    ${SALDO}=    Get Matching Xpath Count      //android.widget.Button[@content-desc="Exibir valores"]
   IF    ${SALDO} > 0
    click element    //android.widget.Button[@content-desc="Exibir valores"]
   END

   wait until element is visible    com.itau.investimentos:id/tv_header_total_value_invested

   Capture Page Screenshot

#----------------------------------RENTABILIDADE------------------------------------------------------
Swipe Left
    wait until element is Visible     id=com.itau.investimentos:id/tv_header_total_value_invested
    ${element_size}=    Get Element Size    id=com.itau.investimentos:id/tv_header_total_value_invested
    ${element_location}=    Get Element Location    id=com.itau.investimentos:id/tv_header_total_value_invested
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  1500
    Sleep  5

Validar tela de rentabilidade
    wait until element is visible   com.itau.investimentos:id/tvPeriodBenchmarkTitle

    Capture Page Screenshot

#--------------------------------------CARTEIRA---------------------------------------------------------

Swipe Right
    wait until element is Visible     id=com.itau.investimentos:id/tvPeriodBenchmarkTitle
    ${element_size}=    Get Element Size    id=com.itau.investimentos:id/tvPeriodBenchmarkTitle
    ${element_location}=    Get Element Location    id=com.itau.investimentos:id/tvPeriodBenchmarkTitle
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.1)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 1)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.1)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  1500
    Sleep  5

Valida elemnto na tela principal
    wait until element is visible    com.itau.investimentos:id/tv_header_total_value_invested

Swipe Down
    wait until element is visible    id=com.itau.investimentos:id/tv_portfolio_profitability_percent_description
    ${element_size}=    Get Element Size    id=com.itau.investimentos:id/tv_portfolio_profitability_percent_description
    ${element_location}=    Get Element Location    id=com.itau.investimentos:id/tv_portfolio_profitability_percent_description
    ${start_x}=         Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}=         Evaluate      ${element_location['y']} + (${element_size['height']} * 0.3)
    ${end_x}=           Evaluate      ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}=           Evaluate      ${element_location['y']} + (${element_size['height']} * 0.7)
    Swipe               ${start_x}    ${start_y}  ${end_x}  ${end_y}  500
    Sleep  5

Clicar em todos os produtos
    wait until element is visible   //android.widget.TextView[@content-desc="investido em Todos os produtos"]
    click element   //android.widget.TextView[@content-desc="investido em Todos os produtos"]

Validar tela da carteira
    Sleep  6s
    wait until element is visible   com.itau.investimentos:id/tvPortfolioPercent
    Capture Page Screenshot

#---------------------------------------SAIR--------------------------------------------------
fechar cenario carteira
    ${FECHARCART}=    Get Matching Xpath Count      //android.widget.ImageButton[@content-desc="Fechar"]
   IF    ${FECHARCART} > 0
    click element    //android.widget.ImageButton[@content-desc="Fechar"]
   END

Clicar no perfil
    wait until element is visible   //android.view.View[@content-desc="Perfil"]
    click element                   //android.view.View[@content-desc="Perfil"]

Clicar em sair
    wait until element is visible   com.itau.investimentos:id/btnLogout
    click element   com.itau.investimentos:id/btnLogout

    wait until element is visible   	 com.itau.investimentos:id/btLogout
    click element   	                 com.itau.investimentos:id/btLogout

    wait until element is visible   com.itau.investimentos:id/btnLogoutAndDontRemember
    click element                   com.itau.investimentos:id/btnLogoutAndDontRemember
    Sleep  5s
    Capture Page Screenshot

Fechar app
    close application