Feature: Configure the values of a graphic

    As a company administrator
    I want to configure the values of a graphic
    So that I get to customise the the data I wanna see in the graphics

    Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Reportes" option
        And I press the "Campaña" option

    @TouchPoint
    Scenario: Poll questions are available to be selected while configuring a graphic
     Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the gear icon on the "GraphicTest1" graphic
        Then "Pregunta:" field shows a set of options as below
        |Nos recomendaria a sus conocidos?  |
        |Que factores influyeron?           |

    @TouchPoint
    Scenario: Company regional venues are available to be selected while configuring a graphic
    Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the gear icon on the "GraphicTest1" graphic
        Then "Regionales:" field shows a set of options as below
        |Gerencia Regional  |

    @TouchPoint
    Scenario: Company agency venues are available to be selected while configuring a graphic
    Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the gear icon on the "GraphicTest1" graphic
        And select "Gerencia Regional" on the "Regionales:" field
        Then "Agencias:" field shows a set of options as below
        |Agencia Central 1 |
        |Agencia Central 2 |
    
    @TouchPoint
    Scenario: Company services are available to be selected while configuring a graphic
    Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the gear icon on the "GraphicTest1" graphic
        And select "Gerencia Regional" on the "Regionales:" field
        And select "Agencia Central 1" on the "Agencias:" field
        Then "Servicios:" field shows a set of options as below
        |Plataforma Servicio    |
        |Plataforma Negocios    |
        |Cajas                  |

    @TouchPoint
    Scenario: Company service venues are available to be selected while configuring a graphic
    Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the gear icon on the "GraphicTest1" graphic
        And select "Gerencia Regional" on the "Regionales:" field
        And select "Agencia Central 1" on the "Agencias:" field
        And select "Cajas" on the "Servicios:" field
        Then "Puntos de Servicio:" field shows a set of options as below
        |Ninguno    |