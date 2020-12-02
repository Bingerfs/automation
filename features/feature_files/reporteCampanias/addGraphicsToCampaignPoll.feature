Feature: Add new graphic to a campaign poll

    As a company administrator
    I want to add new graphics to poll in a campaign
    So I can have a better report from the result data

    @TouchPoint
    Scenario: Recently created graphic is within the list of graphics
        Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "CasaMatriz" campaign
        And click on the "pollTest1" TouchPoint poll
        And click on the "Agregar Gráfica" button
        And fill the required fields as below
        |Nombre:            | GraphicTest       |
        |Tipo de gráfico:   | Barra Agrupada    |
        |Pregunta:          | testQuestion      |

        And press the "Crear" button
        Then a message in green shows up "Grafico agregado con exito"
        And "GraphicTest" shows up in the graphics list

    @TouchPoint
    Scenario: Poll Questions are selectionable when creating a graphic
        Given Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "Campaign test" campaign
        And click on the "pollTest1" TouchPoint poll
        And click on the "Agregar Gráfica" button
        Then "Pregunta" field shows a set of questions as below
        |Preguntas      |
        |testQuestion   |
        |testQuestion2  |

    @MysteryShopper
    Scenario: Recently created graphic is within the list of graphics
        Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "Campaign test" campaign
        And click on the "pollTest2" MysteryShopper poll
        And click on the "Agregar Gráfica" button
        And fill the required fields as below
        |Nombre:            | GraphicTest2          |
        |Tipo de gráfico:   | Barra Horizontal      |
        |Lista:             | listTest              |
        |Pregunta:          | testQuestion          |
        Then a message in green shows up "Grafico agregado con exito"
        And "GraphicTest2" shows up in the graphics list


    @MysteryShopper
    Scenario: Poll List of Questions are selectionable when creating a graphic
    Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "Campaign test" campaign
        And click on the "pollTest2" MysteryShopper poll
        And click on the "Agregar Gráfica" button
        Then "Lista" field shows a set of questions as below
        |Lista      |
        |listTest   |
        |listTest2  |

    @MysteryShopper
    Scenario: Poll List of Questions are selectionable when creating a graphic
    Given I'm on the "Campaña" section of the "Reportes" page
        When I'm on the "CAMPAÑAS DISPONIBLES " section
        And click on the "Campaign test" campaign
        And click on the "pollTest2" MysteryShopper poll
        And click on the "Agregar Gráfica" button
        Then "Pregunta" field shows a set of questions as below
        |Preguntas      |
        |testQuestion1  |
        |testQuestion2  |

    