Feature: Configure the values of a graphic

    As a company administrator
    I want to configure the values of a graphic
    So that I get to customise the the data I wanna see in the graphics

    Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Reportes" option
        And I press the "ReportesEventos" option

#Regionales
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And select "Telefonica" on the "Compañias:" field events
        Then "Regionales:" field shows a set of options as below
        |Ninguna|
        |Cochabamba |
        |La Paz |
        |Santa Cruz |

#Agencias
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And select "Telefonica" on the "Compañias:" field events
        Then "Agencias:" field shows a set of options as below
        |Ninguna|
        |Central |
        |Ventas |
        |Atencion al Cliente|

#servicios
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And select "Telefonica" on the "Compañias:" field events
        And select "Cochabamba" on the "Regionales:" field events
        And select "Agencia 1" on the "Agencias:" field events
        Then "Servicios:" field shows a set of options as below
        |Ninguno|
        |Cajas |
        |Plataforma |
    
#puntos de servicio
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And select "Telefonica" on the "Compañias:" field events
        And select "Cochabamba" on the "Regionales:" field events
        And select "Agencia 1" on the "Agencias:" field events
        And select "Cajas" on the "Servicios:" field events
        Then "Puntos de Servicio:" field shows a set of options as below
        |Ninguno|
        |Caja 1 |
        |Caja 2 |