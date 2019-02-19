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
import Iphod.Models as Models
import List.Extra exposing (getAt)
import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Bootstrap.Navbar as Navbar


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

type alias Service = List String
 
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
    { service: Service
    , readings: List Reading
    , reflection : Models.Reflection
    , navbarState : Navbar.State
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
            { service = []
            , readings = []
            , reflection = Models.initReflection
            , navbarState = navbarState
            }
            
    in
            
    ( initModel, Cmd.batch[requestOffice "acna_compline", navbarCmd] )



-- REQUEST PORTS


port requestReading : String -> Cmd msg
port requestOffice : String -> Cmd msg
port requestReflection : String -> Cmd msg


-- SUBSCRIPTIONS


--port receivedReading : (Reading -> msg) -> Sub msg
port receivedOffice : (Service -> msg) -> Sub msg
port receivedReflection : (Models.Reflection -> msg) -> Sub msg



subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ receivedOffice UpdateOffice
        , receivedReflection UpdateReflection
        ]



-- UPDATE


type ShowHide
    = Show
    | Hide


type Msg
    = NoOp
    | NavbarMsg Navbar.State
    | UpdateReading Reading
    | UpdateOffice Service
    | UpdateReflection Models.Reflection
    | Compline
    | MorningPrayer
    | MiddayPrayer
    | EveningPrayer


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        NavbarMsg state ->
            ( { model | navbarState = state}, Cmd.none)

        UpdateReading newReading ->
            ( model , Cmd.none )

        UpdateOffice newService ->
            ( {model | service = newService}, Cmd.none)

        UpdateReflection newReflection ->
            ( {model | reflection = newReflection}, Cmd.none )

        MorningPrayer ->
            (model, Cmd.batch [requestOffice "acna_morning_prayer", Cmd.none] )
                    
        MiddayPrayer ->
            (model, Cmd.none)
                    
        EveningPrayer ->
            (model, Cmd.none)
                    
        Compline ->
            ( model, Cmd.batch [requestOffice "acna_compline", Cmd.none] )

        


-- HELPERS

formatService : Service -> List (Html Msg) -> List (Html Msg)
formatService service htmlList =
    let
        buttons = []
        altList = []
        -- used for initializing building the alternative section
    in
            
    case service |> List.head of
        Nothing -> htmlList -- nothing left, return the list
        Just "--END--" -> htmlList  -- end of a section
        Just "title" -> oneArg service htmlList
        Just "rubric" -> oneArg service htmlList
        Just "line" -> oneArg service htmlList
        Just "indent" -> oneArg service htmlList  
        Just "prayer" -> oneArg service htmlList
        Just "section" -> oneArg service htmlList
        Just "psalm_name" -> psalmName service htmlList
        Just "psalm1" -> psalm1 service htmlList
        Just "psalm2" -> oneArg service htmlList   
        Just "versical" -> versical service htmlList  
        Just "ref" -> oneArg service htmlList
        Just "alternatives" -> 
            let
                resp = alternatives (service |> List.tail |> Maybe.withDefault []) htmlList altList buttons 
            in
            formatService (resp |> Tuple.first) (resp |> Tuple.second)

        _ ->
            formatService
                (service |> List.drop 1)
                htmlList


-- when you get here, the key word: "alternatives" should not be at the top of Service
alternatives : Service -> List (Html Msg) -> List (Html Msg) -> List (Html Msg) -> (Service, List (Html Msg))
alternatives service htmlList altHtml buttons =
    case service of
        [] -> (service, List.concat [buttons, altHtml, htmlList]) -- do something smart; you shouldn't get here
        [x] -> (service, List.concat [buttons, altHtml, htmlList]) -- you shouldnt get here either!
        "default" :: t -> build_alternatives "default" t htmlList altHtml buttons
        "alternative" :: t -> build_alternatives "alternative" t htmlList altHtml buttons
        "--END--" :: t -> (service, List.concat [altHtml, buttons, htmlList])
        _ ->
            let
                _ =
                    Debug.log "SOMETHING BAD HAPPENED: " "Inside or near alternatives"
                _ = Debug.log "SERVICE: " service
            in
            (service, List.concat [buttons, altHtml, htmlList])
                        
            

build_alternatives : String -> Service -> List (Html Msg) -> List (Html Msg) -> List (Html Msg) -> (Service, List (Html Msg))
build_alternatives alt service htmlList altHtml buttons =
    let
        label = service |> getAt 1 |> Maybe.withDefault "?"
        newAltHtml = addDiv label (service |> List.drop 2) altHtml 
        newService = service |> dropThroughKey "--END--"
        newButtons = case alt of
            "default" -> buttons |> addButton label "default_button"
            "alternative" -> buttons |> addButton label "alt_button"
            _ -> 
                let
                    _ =
                        Debug.log "BUILD ALTERNATIVES SOMETHING BAD HAPPENED: " alt
                in
                buttons
        _ = Debug.log "debug 237:" (label, newButtons)
                        
    in
    alternatives newService htmlList newAltHtml newButtons
                    
            

dropThroughKey : a -> List a -> List a
dropThroughKey key list =
    case (list |> List.Extra.elemIndex key) of
        Just n -> 
            list |> List.drop (n + 1)
        Nothing -> list
            
addButton : String -> String -> List (Html Msg) -> List (Html Msg)
addButton label className buttons =
    button [ class className ] [ text label ] :: buttons 

addDiv : String -> Service -> List (Html Msg) -> List (Html Msg)
addDiv className service htmlList =
    ( div [ id className ]
        ( ( formatService service [] ) |> List.reverse )
    ) :: htmlList          

oneArg : Service -> List (Html Msg) -> List (Html Msg)
oneArg service htmlList =
    let
        s = service |> getAt 1 |> Maybe.withDefault ""
        c = service |> getAt 0 |> Maybe.withDefault ""
    in
            
    formatService
        (service |> List.drop 2)
        ( p [ class c ] [ text s ]  :: htmlList)

psalmName : Service -> List (Html Msg) -> List (Html Msg)
psalmName service htmlList =
    let
        c = service |> getAt 0 |> Maybe.withDefault ""
        name = service |> getAt 1 |> Maybe.withDefault ""
        title = service |> getAt 2 |> Maybe.withDefault ""
            
    in
    formatService
        (service |> List.drop 3)
        ( p [class c] [text name, span [] [ text title ] ] :: htmlList)
            

psalm1 : Service -> List (Html Msg) -> List (Html Msg)
psalm1 service htmlList =
    let
        c = service |> getAt 0 |> Maybe.withDefault ""
        n = service |> getAt 1 |> Maybe.withDefault ""
        s = service |> getAt 2 |> Maybe.withDefault ""
            
    in
    formatService
        (service |> List.drop 3)
        ( p [ class c ] [ sup [] [text n], text s ]  :: htmlList)
            

versical : Service -> List (Html Msg) -> List (Html Msg)
versical service htmlList =
    let
        c = service |> getAt 0 |> Maybe.withDefault ""
        speaker = service |> getAt 1 |> Maybe.withDefault ""
        says = service |> getAt 2 |> Maybe.withDefault ""
            
    in
    formatService
        (service |> List.drop 3)
        ( Grid.simpleRow
            [ Grid.col [ Col.xs2, Col.sm2, Col.md1, Col.lg1] [ em [] [ text speaker ] ]
            , Grid.col [ Col.xs8, Col.sm8, Col.md4, Col.lg4] [ text says ]
            ]
         :: htmlList
        )
            


-- VIEW


view : Model -> Document Msg
view model =
        { title = "Compline"
        , body = [ navigation model, div [] (formatService model.service [] |> List.reverse ) ]
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
