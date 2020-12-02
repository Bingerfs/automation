Feature: close event
        As a company
        I want to close events
        So I can mark the event as finished

    Background: login as a master user
        Given I'm on the login page 
        And I enter a username and a password
        And I press the "Iniciar Sesión" button
        And I press the "Eventos" option
        And I am in the "Eventos" page

    Scenario: close an No Accionable event
        When I press the "Cerrar" button 
        And I choose "No Accionable" checkbox
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an Accionable and Offline event
        When I press the "icon close" button 
        And I choose "Accionable" checkbox
        And I choose "Offline" checkbox
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an Accionable, Online and Contactado event
        When I press the "icon close" button 
        And I choose "Accionable" checkbox
        And I choose "Online" checkbox
        And I choose "Contactado" checkbox
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an Accionable, Online and No Contactado event
        When I press the "icon close" button 
        And I choose "Accionable" checkbox
        And I choose "Online" checkbox
        And I choose "No Contactado" checkbox
        And I write "No comments" in "Comentarios"
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an event without comments
        When I press the "icon close" button 
        And I choose "No Accionable" checkbox
        And I write "" in "Comentarios"
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"

    Scenario: close an event with some comment
        When I press the "icon close" button 
        And I choose "No Accionable" checkbox
        And I write "This is a comment" in "Comentarios"
        And I press "Cerrar" button
        Then I should see a green message that says "Evento cerrado con exito"