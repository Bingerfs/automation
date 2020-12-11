Feature: Configure the values of a graphic

    As a company administrator
    I want to configure the values of a graphic
    So that I get to customise the the data I wanna see in the graphics

    Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Eventos" option within "Reportes"

#Regionales
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And fill the required graphic fields on the "event configure report" as below
        |Compañias:             | Telefonica       |
        Then "Regionales:" field on the "event configure report" shows a set of options as below
        |Ninguna|
        |Cochabamba |
        |La Paz |
        |Santa Cruz |

#Agencias
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And fill the required graphic fields on the "event configure report" as below
        |Compañias:             | Telefonica       |
        |Regionales:            |Cochabamba        |
        Then "Agencias:" field on the "event create report" shows a set of options as below
        |Agencia 1|
        |Agencia 2 |

#servicios
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And fill the required graphic fields on the "event configure report" as below
        |Compañias:             | Telefonica       |
        |Regionales:            |Cochabamba        |
        |Agencias:              |Agencia 1         |
        Then "Servicios:" field on the "event configure report" shows a set of options as below
        |Ninguno|
        |Cajas |
        |Plataforma |
    
#puntos de servicio
    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        When click on the gear icon on the "Barra Simple" graphic
        And fill the required graphic fields on the "event configure report" as below
        |Compañias:             | Telefonica       |
        |Regionales:            |Cochabamba        |
        |Agencias:              |Agencia 1         |
        |Servicios:             |Cajas             |
        Then "Puntos de Servicio:" field on the "event configure report" shows a set of options as below
        |Ninguno|
        |Caja 1 |
        |Caja 2 |