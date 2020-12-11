Feature: See event report graphic
        As a company administrator
        I want to see a event report
        So I can see the data report as feedback

        Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Eventos" option within "Reportes"

        Scenario: detailed graphic is the same as it was displayed on the list
        Given I'm on the "Eventos" section of the "Reportes" page
        And click on the eye icon on the "Barra Simple" graphic of type "Barra Simple"
        Then I see the same graphic "Barra Simple" of type "Barra Simple" as it was displayed on the list