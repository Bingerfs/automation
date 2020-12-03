Feature: See campaign report graphic
        As a company administrator
        I want to see a campaign report
        So I can see the data report as feedback

    Background: login as a master user
        Given I'm on the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Reportes" option
        And I press the "Campaña" option

    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the eye icon on the "GraphicTest1" graphic of type "Barra Agrupada"
        Then I should see the same graphic "Barra Agrupada" as it was displayed on the list