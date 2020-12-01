Feature: See campaigns list on campaign reports
        As a company administrator
        I want to see all campaigns and their polls
        So I can pick polls to create reports from

    Background: login as a master user
        Given I'm on the login page 
        And I enter a username and a password
        And I press the "Iniciar Sesión" button
        And I press the "Reportes" option
        And I press the "Campaña" option 

    Scenario: created campaign is within the list displayed
        Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        Then a campaign named "CasaMatriz" should be displayed inside the list
    
    Scenario: created campaign within the list displays the polls it was assigned to
        Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        Then the polls assigned to the campaign should be displayed as below:
        |Asignacion Cajas       |
        |Asignacion Plataforma  |

