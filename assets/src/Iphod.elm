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
import List.Extra exposing (getAt, splitWhen)
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
    , currentAlt : String
    , day : String
    , week : String
    , year : String
    , season : String
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
            , currentAlt = ""
            , day = ""
            , week = ""
            , year = ""
            , season = ""
            }
            
    in
            
    ( initModel, Cmd.batch[requestOffice "currentOffice", navbarCmd] )

-- tempModel is used to build protions of a page to be embedded in div's etc
tempModel : String -> Model -> Model
tempModel label model =
    { model 
    | office = []
    , requestLesson = ""
    , currentAlt = label
    }


-- REQUEST PORTS


port requestReference : List String -> Cmd msg
port requestOffice : String -> Cmd msg
-- port requestReadings : String -> Cmd msg
port requestLessons : String -> Cmd msg
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
                    formatOffice <|
                        { model 
                        | office = []
                        , day = officeList |> getAt 0 |> Maybe.withDefault "Sunday" 
                        , week = officeList |> getAt 1 |> Maybe.withDefault "1"
                        , year = officeList |> getAt 2 |> Maybe.withDefault "a"
                        , season = officeList |> getAt 3 |> Maybe.withDefault "anytime"
                        , officeName = officeList |> getAt 4 |> Maybe.withDefault "currentOffice"
                        , builder = officeList |> List.drop 5
                        }
            in
            ( newModel, Cmd.batch[ requestLessons newModel.officeName, Cmd.none ] )
                -- |> Update.andThen update AddToOffice

        UpdateReflection newReflection ->
            -- ( {model | reflection = newReflection}, Cmd.none )
            (model, Cmd.none)

        MorningPrayer ->
            ( {model | pageName = "Morning Prayer", officeName = "morning_prayer", office = []}
            , Cmd.batch [   requestOffice "morning_prayer"
                        ,   Cmd.none
                        ] 
            )
                    
        MiddayPrayer ->
            -- requestOffice "midday"
            ( {model | pageName = "Midday Prayer", officeName = "midday", office = []}
            , Cmd.batch [   requestOffice "midday"
                        ,   Cmd.none
                        ]
            )
                    
        EveningPrayer ->
            ( {model | pageName = "Evening Prayer", officeName = "evening_prayer", office = []}
            , Cmd.batch [   requestOffice "evening_prayer"
                        ,   Cmd.none
                        ]
            )
                    
        Compline ->
            ( {model | pageName = "Compline", officeName = "compline", office = []}
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

        Just "alternatives" -> 
            alternatives model |> formatOffice
        Just "alternative" -> 
            alternative model "alternative" |> formatOffice
        Just "collect" -> collect model |> formatOffice
        Just "default" -> 
            alternative model "alternative default" |> formatOffice
        Just "indent" -> oneArg model |> formatOffice
        Just "line" -> oneArg model |> formatOffice
        Just "prayer" -> oneArg model |> formatOffice
        Just "psalm_name" -> psalmName model |> formatOffice
        Just "psalm1" -> psalm1 model |> formatOffice
        Just "psalm2" -> oneArg model  |> formatOffice
        Just "reading" -> reading model |> formatOffice
        Just "ref" -> reference model |> formatOffice
        Just "referenceText" -> referenceText model |> formatOffice
        Just "rubric" -> oneArg model |> formatOffice
        Just "scripture" -> scripture model |> formatOffice
        Just "section" -> oneArg model |> formatOffice
        Just "title" -> oneArg model |> formatOffice
        Just "versical" -> versical model |> formatOffice
        _ ->
            { model | builder = model.builder |> List.drop 1 } |> formatOffice


-- create and div to hold all the alternatives
-- the buttons go into sub div class "altButtons"                
alternatives : Model -> Model
alternatives model =
    let
        c = model.builder |> getAt 0 |> Maybe.withDefault ""
        label = model.builder |> getAt 2 |> Maybe.withDefault ""
        altsId =  label |> makeId "alternatives_"
        temp = { model | builder = model.builder |> List.drop 3 } |> tempModel label
        subModel =  temp |> formatOffice
        newDiv =
            div [ id altsId, class c ]
            (   (div [ class "altButtons" ] ( buttonBuilder temp.builder label [] )
                ) :: subModel.office
            )
                    
            -- do some smart stuff here
    in
    { model
    | office = [newDiv] |> List.append model.office
    , builder = subModel.builder
    }

alternative : Model -> String -> Model
alternative model ofType =
    let
        -- c = model.builder |> getAt 0 |> Maybe.withDefault ""
        label = model.currentAlt
        altId = model.builder |> getAt 2 |> Maybe.withDefault "" |> makeId (label ++ "Id_")
        subModel = { model | builder = model.builder |> List.drop 3 } |> (tempModel label) |> formatOffice
        newDiv = 
            div [ id altId, class ofType ] subModel.office
    in
    { model 
    | office = [newDiv] |> List.append model.office
    , builder = subModel.builder
    }


dropThroughKey : a -> List a -> List a
dropThroughKey key list =
    case (list |> List.Extra.elemIndex key) of
        Just n -> 
            list |> List.drop (n + 1)
        Nothing -> list


buttonBuilder : List String -> String -> List (Html Msg) -> List (Html Msg)
buttonBuilder list superClass buttons =
    let
        subLists = subListTuple list "--END--"
        subList1 = subLists |> Tuple.first
        subList2 = subLists |> Tuple.second
        allDone = subList1 |> List.isEmpty
            
    in
    case allDone of
        True -> buttons |> List.reverse            
        False ->
            let
                cls = subList1 |> getAt 0 |> Maybe.withDefault "" |> makeId "button_"
                label = subList1 |> getAt 2 |> Maybe.withDefault ""
                -- altDivId = label |> makeId ""
                buttonId = label |> makeId (superClass ++ "Button_")
        
            in
            ( button  [ id buttonId
                    , class cls
                    , onClick (AltButton superClass buttonId)
                    ]                    
                    [ Markdown.toHtml [] label ] :: buttons
            ) |> buttonBuilder subList2 superClass


collect : Model -> Model
collect model =
    let
        cls = "collectContent"
        s = model.builder |> getAt 4 |> Maybe.withDefault ""
        title = if s |> String.isEmpty 
            then "" 
            else  
                   (model.builder |> getAt 1 |> Maybe.withDefault "")
                ++ " _"
                ++ (model.builder |> getAt 2 |> Maybe.withDefault "")
                ++ "_"     

        collectId = if s |> String.isEmpty
            then "collectOfDay"
            else title |> makeId "collect_"
            
    in
    { model 
    | office = 
        [ div [ id collectId, class cls ] 
            [ div [ class "collectTitle" ] [ Markdown.toHtml [] title ]
            , div [ class cls ] [ Markdown.toHtml [] s ] 
            ]
        ] |> List.append model.office
    , builder = model.builder |> List.drop 5
    }
            

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
            
    in
            
    (idType ++ labelName) |> String.toLower

subListTuple : List String -> String -> (List String, List String)
subListTuple list splitHere =
    case ( list |> splitWhen (\s -> s == splitHere) ) of
        Just (a, b) -> (a,  b |> List.drop 1 )
        Nothing -> ([], [])

-- VIEW


view : Model -> Document Msg
view model =
    { title = model.pageName
    , body = navigation model :: [ div [ id "service"] model.office ]
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
