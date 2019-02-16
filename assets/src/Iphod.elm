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
formatService service list =
    case service |> List.head of
        Nothing -> list -- nothing left, return the list
        Just "title" -> oneArg service list
        Just "rubric" -> oneArg service list
        Just "line" -> oneArg service list
        Just "indent" -> oneArg service list  
        Just "prayer" -> oneArg service list
        Just "section" -> oneArg service list
        Just "psalm_name" -> psalmName service list
        Just "psalm1" -> psalm1 service list
        Just "psalm2" -> oneArg service list   
        Just "versical" -> versical service list  
        Just "ref" -> oneArg service list
        -- Just "alternatives" -> alternatives service list
        _ ->
            formatService
                (service |> List.drop 1)
                list

-- alternatives : Service -> List (Html Msg) -> List (Html Msg)
-- alternatives service list =

oneArg : Service -> List (Html Msg) -> List (Html Msg)
oneArg service list =
    let
        s = service |> getAt 1 |> Maybe.withDefault ""
        c = service |> getAt 0 |> Maybe.withDefault ""
    in
            
    formatService
        (service |> List.drop 2)
        (List.append list ([ p [ class c ] [ text s ] ]) )

psalmName : Service -> List (Html Msg) -> List (Html Msg)
psalmName service list =
    let
        c = service |> getAt 0 |> Maybe.withDefault ""
        name = service |> getAt 1 |> Maybe.withDefault ""
        title = service |> getAt 2 |> Maybe.withDefault ""
            
    in
    formatService
        (service |> List.drop 3)
        (List.append list ( [p [class c] [text name, span [] [ text title ] ] ]) )
            

psalm1 : Service -> List (Html Msg) -> List (Html Msg)
psalm1 service list =
    let
        c = service |> getAt 0 |> Maybe.withDefault ""
        n = service |> getAt 1 |> Maybe.withDefault ""
        s = service |> getAt 2 |> Maybe.withDefault ""
            
    in
    formatService
        (service |> List.drop 3)
        (List.append list ( [p [ class c ] [ sup [] [text n], text s ] ]) )
            

versical : Service -> List (Html Msg) -> List (Html Msg)
versical service list =
    let
        c = service |> getAt 0 |> Maybe.withDefault ""
        speaker = service |> getAt 1 |> Maybe.withDefault ""
        says = service |> getAt 2 |> Maybe.withDefault ""
            
    in
    formatService
        (service |> List.drop 3)
        (List.append list ( [
            Grid.simpleRow
                [ Grid.col [ Col.xs2, Col.sm2, Col.md1, Col.lg1] [ em [] [ text speaker ] ]
                , Grid.col [ Col.xs8, Col.sm8, Col.md4, Col.lg4] [ text says ]
                ]
            ]
        ))
            


-- VIEW


view : Model -> Document Msg
view model =
        { title = "Compline"
        , body = [ navigation model, div [] (formatService model.service [] ) ]
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
