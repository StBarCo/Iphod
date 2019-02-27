port module Iphod exposing (..)

-- where

-- import Debug


-- import StartApp

import Browser exposing (Document)
import Html exposing (..)
import Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Platform.Sub as Sub exposing (batch)
import Platform.Cmd as Cmd exposing (Cmd)
import Markdown
import Update.Extra as Update exposing (andThen, filter)
import Iphod.Models as Models
import List.Extra exposing (getAt)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Navbar as Navbar
import Regex


-- MAIN
{-
main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
-}

main = 
    Browser.document
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


-- MODEL

-- type alias Service = List String
 
type alias Reading =
    { key: String
    , text: String
    }
initReading : Reading
initReading =
    { key = ""
    , text = ""
    }

type alias Model =
    { pageName: String
    , officeName: String
    , office: List (Html Msg)
    , navbarState : Navbar.State
    , builder : List String -- raw data
    , requestLesson : String
    }

{-
initModel : Model
initModel =
    let
        (navbarState, navbarCmd) =
            Navbar.initialState NavbarMsg
    in
            
    { service = []
    , readings = []
    , reflection = Models.initReflection
    , navbar = navbarState
    }
-}

init : () -> ( Model, Cmd Msg )
init _ =
    let
        (navbarState, navbarCmd) =
            Navbar.initialState NavbarMsg
        initModel =
            { pageName = "Legereme"
            , officeName = "currentOffice"
            , office = []
            , navbarState = navbarState
            , builder = []
            , requestLesson = ""
            }
            
    in
            
    ( initModel, Cmd.batch[requestOffice "currentOffice", navbarCmd] )



-- REQUEST PORTS


port requestReference : List String -> Cmd msg
port requestOffice : String -> Cmd msg
-- port requestReadings : String -> Cmd msg
port requestLesson : List String -> Cmd msg
port requestReflection : String -> Cmd msg
port toggleButtons: List String -> Cmd msg


-- SUBSCRIPTIONS


--port receivedReading : (Reading -> msg) -> Sub msg
port receivedOffice : (List String -> msg) -> Sub msg
port receivedReflection : (Models.Reflection -> msg) -> Sub msg
-- port receivedPsalms : (String -> msg) -> Sub msg
-- port receivedLesson1 : (String -> msg) -> Sub msg
-- port receivedLesson2 : (String -> msg) -> Sub msg
-- port receivedGospel : (String -> msg) -> Sub msg



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ receivedOffice UpdateOffice
        , receivedReflection UpdateReflection
--        , receivedPsalms UpdatePsalms
--        , receivedLesson1 UpdateLesson1
--        , receivedLesson2 UpdateLesson2
--        , receivedGospel UpdateGospel
        ]



-- UPDATE


type ShowHide
    = Show
    | Hide


type Msg
    = NoOp
    | NavbarMsg Navbar.State
    | UpdateReading Reading
    | UpdateOffice (List String)
    | AddToOffice
    | UpdateReflection Models.Reflection
    | Compline
    | MorningPrayer
    | MiddayPrayer
    | EveningPrayer
    | AltButton String String
    | RequestReference String String
--    | RequestLessons
--    | UpdatePsalms String
--    | UpdateLesson1 String
--    | UpdateLesson2 String
--    | UpdateGospel String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NavbarMsg state ->
            ( { model | navbarState = state}, Cmd.none)

        UpdateReading newReading ->
            ( model , Cmd.none )

        UpdateOffice officeList ->
            let
                newModel =
                    { model 
                    | officeName = officeList |> getAt 0 |> Maybe.withDefault "currentOffice"
                    , office = []
                    , builder = officeList |> List.drop 1
                    }
            in
            ( newModel, Cmd.none )
                |> Update.andThen update AddToOffice

        AddToOffice ->
            let
                newOffice = formatOffice model
                resp = if newOffice.requestLesson |> String.isEmpty
                    then (newOffice, Cmd.none)
                    else
                        ( { newOffice | requestLesson = "" }
                        , Cmd.batch[ 
                            requestLesson [newOffice.officeName, newOffice.requestLesson], 
                            Cmd.none
                            ]
                        )
                    
            in
            resp
                |> Update.filter ( (newOffice.builder |> List.length) > 0 )
                    ( Update.andThen update AddToOffice)

        UpdateReflection newReflection ->
            -- ( {model | reflection = newReflection}, Cmd.none )
            (model, Cmd.none)

        MorningPrayer ->
            ( {model | pageName = "Morning Prayer", officeName = "morning_prayer"}
            , Cmd.batch [   requestOffice "morning_prayer"
                        ,   Cmd.none
                        ] 
            )
                    
        MiddayPrayer ->
            -- requestOffice "midday"
            ( {model | pageName = "Midday Prayer"}
            , Cmd.none
            )
                    
        EveningPrayer ->
            ( {model | pageName = "Evening Prayer"}
            , Cmd.batch [   requestOffice "evening_prayer"
                        ,   Cmd.none
                        ]
            )
                    
        Compline ->
            ( {model | pageName = "Compline", officeName = "compline"}
            , Cmd.batch [requestOffice "compline", Cmd.none] 
            )

        AltButton altDiv buttonLabel ->
            (model, Cmd.batch [toggleButtons [altDiv, buttonLabel], Cmd.none] )  

        RequestReference readingId ref ->
            (model, Cmd.batch [requestReference [readingId, ref], Cmd.none] )  

--         RequestLessons ->
--             let
--                 _ =
--                     Debug.log "Request Lessons" model.officeName
--             in
--                     
--             ( model
--             , Cmd.batch[ requestReadings model.officeName, Cmd.none ]
--             )

--        UpdatePsalms psalms -> 
--            let
--                _ =
--                    Debug.log "UPDATE PSALMS: " psalms
--            in
--                    
--            ( { model | psalms = psalms }, Cmd.none )         
--
--        UpdateLesson1 s -> 
--            ( { model | lesson1 = s }, Cmd.none )         
--
--        UpdateLesson2 s -> 
--            ( { model | lesson2 = s }, Cmd.none )         
--
--        UpdateGospel s -> 
--            ( { model | gospel = s }, Cmd.none )         




-- HELPERS

formatOffice : Model -> Model
formatOffice model =
    case (model.builder |> List.head) of
        Nothing -> model -- nothing left
        Just "--EOF--" ->
            { model | builder = model.builder |> List.drop 1 }

        Just "--END--" -> 
            { model | builder = model.builder |> List.drop 1 }

        Just "title" -> oneArg model
        Just "rubric" -> oneArg model
        Just "line" -> oneArg model
        Just "indent" -> oneArg model
        Just "prayer" -> oneArg model
        Just "section" -> oneArg model
        Just "psalm_name" -> psalmName model
        Just "psalm1" -> psalm1 model
        Just "psalm2" -> oneArg model 
        Just "versical" -> versical model
        Just "scripture" -> scripture model
        Just "reading" -> reading model
        Just "ref" -> reference model
        Just "referenceText" -> referenceText model
        Just "alternatives" -> 
            { model | builder = model.builder |> List.drop 1}

        _ ->
            { model | builder = model.builder |> List.drop 1 }


                    
            

dropThroughKey : a -> List a -> List a
dropThroughKey key list =
    case (list |> List.Extra.elemIndex key) of
        Just n -> 
            list |> List.drop (n + 1)
        Nothing -> list


addButton : String -> String -> String -> List (Html Msg) -> List (Html Msg)
addButton altDivId label className buttons =
    let
        buttonId =
            makeId "button_" label
        lowerClassName = makeId "class_" label
    in
            
    button  [ id buttonId
            , class className
            , onClick (AltButton altDivId buttonId) 
            ] 
            [ Markdown.toHtml [] label ] :: buttons 

-- addDiv : Model -> Model
-- addDiv model =
--     let
--         resp = model.build |> List.Extra.break ((==) "--END--")
--         lowerDivName = makeId "id_" divName
--         thisDiv = (formatList String model (resp |> Tuple.first) [] ) |> List.reverse
--             
--     in
--     { model
--     | office = model.office |> List.append [ div [ id lowerDivName, class altDivClass ] thisDiv ]
--     , builder = model.builder |> List.drop 2
--     }

oneArg : Model -> Model
oneArg model =
    let
        s = model.builder |> getAt 1 |> Maybe.withDefault ""
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
    in
    { model
    | office = [ div [ class c ] [ Markdown.toHtml [] s ] ] |> List.append model.office 
    , builder = model.builder |> List.drop 2
    }

psalmName : Model -> Model
psalmName model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        name = model.builder |> getAt 1 |> Maybe.withDefault ""
        title = model.builder |> getAt 2 |> Maybe.withDefault ""
            
    in
    { model
    | office = [ p [ class c ] [ text name, span [] [ text title ] ] ] |> List.append model.office
    , builder = model.builder |> List.drop 2
    }
            

psalm1 : Model -> Model
psalm1 model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        n = model.builder |> getAt 1 |> Maybe.withDefault ""
        s = model.builder |> getAt 2 |> Maybe.withDefault ""
            
    in
    { model
    | office = [ p [ class c ] [ sup [] [ text n], text s ] ] |> List.append model.office 
    , builder = model.builder |> List.drop 3
    }
            
scripture : Model -> Model
scripture model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        s = model.builder |> getAt 1 |> Maybe.withDefault ""
        ref = model.builder |> getAt 2 |> Maybe.withDefault ""
            
    in
    { model
    | office = [ div [ class c ] [ text s, span [ class "ref" ] [ text ref ]] ] |> List.append model.office 
    , builder = model.builder |> List.drop 2
    }

versical : Model -> Model
versical model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        speaker = model.builder |> getAt 1 |> Maybe.withDefault ""
        says = model.builder |> getAt 2 |> Maybe.withDefault ""
            
    in
    { model
    | office = 
        [ Grid.simpleRow
            [ Grid.col [ Col.xs2, Col.sm2, Col.md1, Col.lg1] [ em [] [ text speaker ] ]
            , Grid.col [ Col.xs8, Col.sm8, Col.md4, Col.lg4] [ text says ]
            ]
        ] |> List.append model.office 
    , builder = model.builder |> List.drop 3
    }

reading : Model -> Model
reading model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        mpep = model.builder |> getAt 1 |> Maybe.withDefault ""
        thisReading = mpep
              
    in
    { model
    | office = [ div [ id mpep ] [] ] |> List.append model.office 
    , builder = model.builder |> List.drop 2
    , requestLesson = mpep
    }

reference : Model -> Model
reference model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        ref = model.builder |> getAt 1 |> Maybe.withDefault ""
            
    in
    { model
    | office = [ p [class c] [text ref] ] |> List.append model.office 
    , builder = model.builder |> List.drop 2
    }


referenceText : Model -> Model
referenceText model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        ref = model.builder |> getAt 1 |> Maybe.withDefault ""
        readingId = ref |> makeId "button_"
               
    in
    { model
    | office =
        [ p [ class c ] 
            [ button [ id readingId, onClick (RequestReference readingId ref) ] 
              [ text ref ] 
            ]
        ] |> List.append model.office 
    , builder = model.builder |> List.drop 2
    }

userReplace : String -> (Regex.Match -> String) -> String -> String
userReplace userRegex replacer string =
    case Regex.fromString userRegex of
        Nothing -> string
        Just regex ->
            Regex.replace regex replacer string

makeId : String -> String -> String
makeId idType string =
    let
        labelName =
            (userReplace "[^a-zA-Z0-9]" (\_ -> "_") string)
            |> String.toLower
    in
            
    idType ++ labelName
    

-- VIEW


view : Model -> Document Msg
view model =
    { title = model.pageName
    , body = navigation model :: model.office
    }
            
navigation : Model -> Html Msg
navigation model =
    Navbar.config NavbarMsg
        |> Navbar.brand [ href "#" ] [ text "Legereme"]
        |> Navbar.items
            [ Navbar.itemLink [ href "#", onClick MorningPrayer ] [ text "Morning Prayer" ]
            , Navbar.itemLink [ href "#", onClick MiddayPrayer ] [ text "Midday Prayer" ]
            , Navbar.itemLink [ href "#", onClick EveningPrayer ] [ text "Evening Prayer" ]
            , Navbar.itemLink [ href "#", onClick Compline ] [ text "Compline" ]
            ]
        |> Navbar.view model.navbarState
