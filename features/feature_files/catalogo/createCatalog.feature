Feature: create catalog
        As a company
        I want to have catalogs
        So I can organize and clasify polls by category

    Background: login as a master user
        Given I am in the login page 
        And I enter a username and a password
        And I press the "Iniciar Sesión" button
        And I press the "Catálogo" option 

    Scenario: create new private catalog correctly
        Given I'm in the "Catalogo" page
        When I'm on the "CATALOGOS PRIVADOS" section and I press "+"
        And enter the required fields as shown below
        |Nombre:            | CatalogoPrivTest      |
        |Descripcion:       | DescripcionTest       | 
        |Compañia:          | UCB                   |
        Then a message in green should appear "Catalogo creado con exito"
    
    Scenario: create new public catalog correctly
        Given I'm in the "Catalogo" page
        When press the "add icon" button next to "CATÁLOGOS PÚBLICOS" 
        And enter the required fields on the modal as shown
        |Nombre:            | CatalogoPubTest       |
        |Descripcion:       | DescripcionTest       |
        Then a message in green should appear "Catalogo creado con exito" 


