Feature: Add new graphic to campaign 

    As a company administrator
    I want to add new graphics to a campaign
    So I can have a better report from the result data

    Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Eventos" option within "Reportes"

  Scenario: Recently created graphic is within the list of graphics
            Given I'm on the "Eventos" section of the "Reportes" page
            When click on the "Agregar Gráfica" button
            And fill the required graphic fields on the "event create report" as below
            |Nombre:            | EventGraphicTest2                         |
            |Tipo de gráfico:   | Barra Apilada                             |

            And click on the "Crear" button
            Then a message in green shows up "Gráfico agregado con éxito"