Feature: See campaign report graphic
        As a company administrator
        I want to see a campaign report
        So I can see the data report as feedback

    Background: login as a master user
        Given I'm on the login page 
        And I enter a username and a password
        And I press the "Iniciar Sesión" button
        And I press the "Reportes" option
        And I press the "Campaña" option

    Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "Campaign test" campaign
        And click on the "pollTest1" poll
        And all report graphics are displayed
        And click on the eye icon on the "GraphicTest1" graphic
        Then I should see the same graphic as it was displayed on the list