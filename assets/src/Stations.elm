port module Stations exposing (..)

-- where

import Browser
import Html exposing (..)
import Html
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (toInt)


-- import Regex exposing (..)

import Platform.Sub as Sub exposing (batch)
import Platform.Cmd as Cmd exposing (Cmd)
import Markdown
-- import Debug


-- MAIN

main =
    Browser.element
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { id : String
    , beforeMinister : String
    , beforeAll : String
    , afterAll : String
    , title : String
    , reading : String
    , images : String -- image urls, I think. eventually multiple images
    , aboutImage : String
    , reflections : String
    , prayer : String
    }


initModel : Model
initModel =
    { id = ""
    , beforeMinister = ""
    , beforeAll = ""
    , afterAll = ""
    , title = ""
    , reading = ""
    , images = ""
    , aboutImage = ""
    , reflections = ""
    , prayer = ""
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( initModel, requestStation "1" )



-- REQUEST PORTS


port requestStation : String -> Cmd msg



-- SUBSCRIPTIONS


port portStation : (Model -> msg) -> Sub msg


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ portStation UpdateStation
        ]



-- UPDATE


type Msg
    = NoOp
    | UpdateStation Model
    | Next
    | Prev
    | Station String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UpdateStation newModel ->
            ( newModel, Cmd.none )

        Next ->
            let
                x =
                    (String.toInt model.id |> Maybe.withDefault 0) + 1

                next =
                    if x > 14 then
                        1
                    else
                        x

                newCmd =
                    requestStation (String.fromInt next)
            in
                ( model, newCmd )

        Prev ->
            let
                x =
                   (String.toInt model.id |> Maybe.withDefault 0) - 1

                next =
                    if x < 1 then
                        14
                    else
                        x

                newCmd =
                    requestStation ( String.fromInt next)
            in
                ( model, newCmd )

        Station n ->
            ( model, requestStation n )


view : Model -> Html Msg
view model =
    div [ id "stations-container" ]
        [ aboutStations
        , navigationButtons model
        , p [ id "art" ]
            [ div [ class "art-figure" ]
                [ img [ class "art-image", src ("images/" ++ model.images), alt model.aboutImage ] []
                , br [] []
                , text model.aboutImage
                ]
            , Markdown.toHtml [] model.reading
            ]
        , reflections model
        , prayer model
        ]


navigationButtons : Model -> Html Msg
navigationButtons model =
    let
        stationClass n =
            if n == model.id then
                class "stn-button navigationButtonSytle"
            else
                class "stn-button"
    in
        p []
            [ button [ class "stn-button", onClick Next ] [ text "Next" ]
            , button [ id "stn-button1", stationClass "1", onClick (Station "1") ] [ text "1" ]
            , button [ id "stn-button2", stationClass "2", onClick (Station "2") ] [ text "2" ]
            , button [ id "stn-button3", stationClass "3", onClick (Station "3") ] [ text "3" ]
            , button [ id "stn-button4", stationClass "4", onClick (Station "4") ] [ text "4" ]
            , button [ id "stn-button5", stationClass "5", onClick (Station "5") ] [ text "5" ]
            , button [ id "stn-button6", stationClass "6", onClick (Station "6") ] [ text "6" ]
            , button [ id "stn-button7", stationClass "7", onClick (Station "7") ] [ text "7" ]
            , button [ id "stn-button8", stationClass "8", onClick (Station "8") ] [ text "8" ]
            , button [ id "stn-button9", stationClass "9", onClick (Station "9") ] [ text "9" ]
            , button [ id "stn-button10", stationClass "10", onClick (Station "10") ] [ text "10" ]
            , button [ id "stn-button11", stationClass "11", onClick (Station "11") ] [ text "11" ]
            , button [ id "stn-button12", stationClass "12", onClick (Station "12") ] [ text "12" ]
            , button [ id "stn-button13", stationClass "13", onClick (Station "13") ] [ text "13" ]
            , button [ id "stn-button14", stationClass "14", onClick (Station "14") ] [ text "14" ]
            , button [ class "stn-button", onClick Prev ] [ text "Previous" ]
            ]


reflections : Model -> Html Msg
reflections model =
    p [ class "reflection" ]
        [ h3 [] [ text "Reflection" ]
        , Markdown.toHtml [] model.reflections
        ]


prayer : Model -> Html Msg
prayer model =
    p [ class "prayer" ]
        [ h3 [] [ text "Prayer" ]
        , Markdown.toHtml [] model.prayer
        ]


aboutStations : Html Msg
aboutStations =
    p []
        [ h3 [] [ text "About" ]
        , Markdown.toHtml [] "The Scriptural Way of the Cross or Scriptural Stations of the Cross is a version of the\n    traditional Stations of the Cross inaugurated as a Roman Catholic devotion by Pope\n    John Paul II on Good Friday 1991. Thereafter John Paul II performed the scriptural\n    version many times at the Colosseum in Rome on Good Fridays during his reign. The\n    scriptural version was not intended to invalidate the traditional version, rather it was\n    meant to add nuance to an understanding of the Passion. _Wikipedia_"
        , Markdown.toHtml [] "**Also:** If you have suggestions for art and/or content, \n    please do send me an email (Use 'Contact' in the 'About' option ) \n    or join the Iphod Facebook group (to make suggests, report bugs, read about updates to the site)"
        , br [] []
        ]
