Feature: re open event
        As a company
        I want to re open events
        So I can enable event 

    Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And I press the "Iniciar Sesión" button
        And I press the "Eventos" option
        And I filter all "closed" events

    Scenario: re open an event
        When I press the "Re-abrir" button
        Then a message in green shows up "Evento re-abierto con éxito"