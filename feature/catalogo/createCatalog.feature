Feature: create catalog
        As a company
        I want to have catalogs
        So I can organize and clasify polls by category

    Background: login as a master user
        Given I'm in the login page 
        And a username "admin" and a password "admin1234."
        And I press the " Iniciar Sesión " button
        And I press the "Catalogo" option in the navbar

    Scenario: create new private catalog correctly
        Given I'm in the "Catalogo" page
        Then press the "add icon" on the ""       
        


