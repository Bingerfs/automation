Feature: Add new graphic to a campaign poll

    As a company administrator
    I want to add new graphics to poll in a campaign
    So I can have a better report from the result data

    Background: login as a master user
        Given I'm on the login page 
        And I enter a username and a password
        And click on the "Iniciar Sesión" button
        And I press the "Reportes" option
        And I press the "Campaña" option

    @TouchPoint
    Scenario: Recently created graphic is within the list of graphics
        Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the "Agregar Gráfica" button
        And fill the required graphic fields as below
        |Nombre:            | GraphicTest                   |
        |Tipo de gráfico:   | Barra Agrupada                |
        |Pregunta:          | Que factores influyeron?      |

        And click on the "Crear" button
        Then a message in green shows up "Gráfico agregado con éxito"
        And "GraphicTest" shows up in the graphics list

    @TouchPoint
    Scenario: Poll Questions are selectionable when creating a graphic
        Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "Asignacion Cajas" poll
        And click on the "Agregar Gráfica" button
        Then "Pregunta:" field shows a set of options as below
        |Nos recomendaria a sus conocidos?  |
        |Que factores influyeron?           |

    @MysteryShopper
    Scenario: Recently created graphic is within the list of graphics
        Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "DemoPedidosYa" campaign
        And click on the "PedidosYa MS" poll
        And click on the "Agregar Gráfica" button
        And fill the required mystery poll graphic fields as below
        |Nombre:            | GraphicTest2                              |
        |Tipo de gráfico:   | Barra Horizontal                          |
        |Lista:             | Preparación                               |
        |Pregunta:          | Se conecta en la zona asignada            |

        And click on the "Crear" button
        Then a message in green shows up "Gráfico agregado con éxito"
        And "GraphicTest2" shows up in the graphics list


    @MysteryShopper
    Scenario: Poll List of Questions are selectionable when creating a graphic
    Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "DemoPedidosYa" campaign
        And click on the "PedidosYa MS" poll
        And click on the "Agregar Gráfica" button
        Then "Lista:" field shows a set of options as below
        |Preparación                |
        |Productividad              |
        |Antes de la Actividad      |
        |Durante la Actividad       |
        |Después de la Actividad    |

    @MysteryShopper
    Scenario: Poll List of Questions are selectionable when creating a graphic
    Given I'm on the "Campañas" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "DemoPedidosYa" campaign
        And click on the "PedidosYa MS" poll
        And click on the "Agregar Gráfica" button
        And fill the required mystery poll graphic fields as below
        |Lista:             | Preparación       |
        Then "Pregunta:" field shows a set of list related questions as below
        |Se conecta en la zona asignada             |
        |Tiene equipamento completo                 |
        |Demuestra seguridad al conducir            |
        |Atendió la llamada al primer intento       |
        |Notifica inconvenientes                    |
        |Aceptó el pedido                           |
        |Cumplió las normas de transporte y tóxicos |

    