Feature: Configure the values of a graphic

    As a company administrator
    I want to configure the values of a graphic
    So that I get to customise the the data I wanna see in the graphics

    Scenario: Negative value four hour values
     Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "Campaign test" campaign
        And click on the "pollTest1" poll
        And all report graphics are displayed
        And click on the gear icon on the "GraphicTest1" graphic
        And fill the hour fields as below:
        |HoraInicial:   | -5    |
        |HoraFinal:     | -8    |
        Then the "Guardar" button is disabled