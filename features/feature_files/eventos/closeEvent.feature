Feature: close event
        As a company
        I want to close events
        So I can mark the event as finished

    Background: login as a master user
        Given I'm in the login page 
        And enter a username and a password
        And I press the " Iniciar Sesión " button
        And I press the "Eventos" option in the navbar

    Scenario: close an No Accionable event
        Given I'm in the Eventos page
        When I press the "Cerrar" button 
        And I choose "No Accionable" checkbox
        And I write "No comments" in "Comentarios"
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an Accionable and Offline event
        Given I'm in the "Eventos" page
        When I press the "icon close" button 
        And I choose "Accionable" checkbox
        And I choose "Offline" checkbox
        And I write "No comments" in "Comentarios"
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an Accionable, Online and Contactado event
        Given I'm in the "Eventos" page
        When I press the "icon close" button 
        And I choose "Accionable" checkbox
        And I choose "Online" checkbox
        And I choose "Contactado" checkbox
        And I write "No comments" in "Comentarios"
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"