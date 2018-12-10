module Iphod.MPReading exposing (Model, init, Msg, update, view) -- where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Json.Decode as Json
import String
import Markdown

import Iphod.Models as Models
import Iphod.Helper exposing (hideableClass)




-- MODEL

type alias Model = Models.DailyMP

init: Model
init = Models.initDailyMP

-- UPDATE

type Section
  = MP1
  | MP2
  | MPP

type Msg
  = NoOp
  | GetText (List (String, String))
  | ChangeText String String
  | ToggleModelShow
  | ToggleShow Models.Lesson
  | ToggleCollect
  | SetReading Model
  | UpdateAltReading Models.Lesson String
  | RequestAltReading Models.Lesson


update: Msg -> Model -> Model
update msg model =
  case msg of
    NoOp -> model

    ToggleModelShow -> {model | show = not model.show}

    GetText list -> model

    ChangeText section ver ->
      let
        thisRef = case section of
          "mp1" -> getRef model.mp1
          "mp2" -> getRef model.mp2
          _     -> ""
        thisUpdate = Models.setSectionUpdate section ver thisRef

        newModel = case section of
          "mp1" -> {model | mp1 = changeText model ver model.mp1, sectionUpdate = thisUpdate}
          "mp2" -> {model | mp2 = changeText model ver model.mp2, sectionUpdate = thisUpdate}
          _     -> {model | mpp = changeText model ver model.mpp, sectionUpdate = thisUpdate}
      in
        newModel



    SetReading newModel -> newModel

    ToggleShow lesson ->
      let
        this_section = case lesson.section of
          "mp1" -> model.mp1
          "mp2" -> model.mp2
          _     -> model.mpp
        update_text this_lesson =
          if this_lesson.id == lesson.id
            then
              {this_lesson | show = not this_lesson.show}
            else
              this_lesson
        newSection = List.map update_text this_section
        newModel = case lesson.section of
          "mp1" -> {model | mp1 = newSection}
          "mp2" -> {model | mp2 = newSection}
          _     -> {model | mpp = newSection}
      in
        newModel

    ToggleCollect ->
      let
        collect = model.collect
        newCollect = {collect | show = not collect.show}
        newModel = {model | collect = newCollect}
      in
        newModel

    UpdateAltReading lesson str ->
      let
        this_section = thisSection model lesson
        update_altReading this_lesson =
          if this_lesson.id == lesson.id
            then
              {this_lesson | altRead = str}
            else
              this_lesson
        newSection = List.map update_altReading this_section
        newModel = updateModel model lesson newSection
      in
        newModel

    RequestAltReading lesson ->
      let
        thisUpdate = Models.setSectionUpdate lesson.section lesson.version lesson.altRead
        newLesson = [{lesson | cmd = "alt" ++ String.toUpper(lesson.section)}]
        newModel = case lesson.section of
          "mp1" -> {model | mp1 = newLesson, sectionUpdate = thisUpdate}
          "mp2" -> {model | mp2 = newLesson, sectionUpdate = thisUpdate}
          "mpp" -> {model | mpp = newLesson, sectionUpdate = thisUpdate}
          _     -> model
      in
        newModel



-- HELPERS

getRef: List Models.Lesson -> String
getRef lessons =
  let
    justRefs l = l.read
  in
    List.map justRefs lessons |> String.join ","

changeText: Model -> String -> List Models.Lesson -> List Models.Lesson
changeText model ver lessons =
  let
    mapLesson lesson = {lesson | version = ver}
  in
    List.map mapLesson lessons

thisSection: Model -> Models.Lesson -> List Models.Lesson
thisSection model lesson =
  case lesson.section of
    "mp1" -> model.mp1
    "mp2" -> model.mp2
    _     -> model.mpp

updateModel: Model -> Models.Lesson -> List Models.Lesson -> Model
updateModel model lesson newSection =
  case lesson.section of
    "mp1" -> {model | mp1 = newSection}
    "mp2" -> {model | mp2 = newSection}
    _     -> {model | mpp = newSection}


-- VIEW


view: Model -> Html Msg
view model =
  div
  []
  [ table [ hideableClass model.show "readings_table width100p" ]
      [ caption
        [ hideableClass model.show "MPEPtitleStyle" ]
        [ span [onClick ToggleModelShow] 
          [text (String.join " " ["Morning Prayer:", model.date])]
        ]
      , tr
          [ class "rowStyle" ]
          [ th [] [ text "Morning 1"]
          , th [] [ text "Morning 2"]
          , th [] [ text "Morning Ps"]
          ]
      , tr
          [ class "rowStyle" ]
          [ td
              [ class "tdStyle" ]
              [ ul [ hideableClass model.show "MPEPtextStyle" ] ( thisReading model MP1)]
          , td
              [ class "tdStyle" ]
              [ ul [ hideableClass model.show "MPEPtextStyle" ] ( thisReading model MP2)]
          , td
              [ class "tdStyle" ]
              [ ul [ hideableClass model.show "MPEPtextStyle" ] ( thisReading model MPP)]
          ] -- end of row
    ] -- end of table
    -- div [ id key, attribute "data-html" html ] []
    , div []  (thisText model model.mp1)
    , div []  (thisText model model.mp2)
    , div []  (thisText model model.mpp)
    , div [ hideableClass model.collect.show "MPEPcollectStyle" ] (thisCollect model.collect)
  ] -- end of div


-- HELPERS

thisCollect: Models.SundayCollect -> List (Html Msg)
thisCollect sundayCollect =
  let
    this_collect c =
      p
      []
      ([text c.collect] ++ List.map thisProper c.propers)
  in
    [ p
        [class "collect_instruction"]
        [ text sundayCollect.instruction ]
    , button
        [ class "collect_hide"
        , onClick ToggleCollect
        ]
        [text "hide"]
    , p
        [class "collect_title"]
        [ text sundayCollect.title ]
    , div
        [class "collect_text"]
        (List.map this_collect sundayCollect.collects)
    ]

thisProper: Models.Proper -> Html Msg
thisProper proper =
  div []
      [ p [class "proper_title"] [text ("Proper: " ++ proper.title)]
      , p [class "proper_text"] [text proper.text]
      ]

thisText: Model -> List Models.Lesson -> List (Html Msg)
thisText model lessons =
  let
    this_text l =
      let
        getTranslation s =
          onClick (GetText [("ofType", "daily"), ("section", l.section), ("id", l.id), ("read", l.read), ("ver", s), ("fnotes", "True")])
      in
        if l.section == "mpp"
          then
            div [id l.id, hideableClass l.show "esv_text"]
               [ span
                  [ class "relativeTop1em" ]
                  [ button [class "translationButton", onClick (ToggleShow l)] [text "Hide"]
                  , button
                     [ class "translationButton", getTranslation "Coverdale"]
                     [ text "Coverdale"]
                  , button
                     [ class "translationButton", getTranslation "BCP"]
                     [ text "BCP"]
                  , versionSelect model l
                  , altReading model l
                  ]
               , Markdown.toHtmlWith {githubFlavored = Just { tables = False, breaks = False}, defaultHighlighting = Nothing, sanitize = False, smartypants = False} [] l.body
               ]
          else
            div [id l.id, hideableClass l.show "esv_text"]
            [ span [ class "relativeTop1em" ]
                [ button [class "translationButton", onClick (ToggleShow l)] [text "Hide"]
                , versionSelect model l
                , altReading model l
                ]
            , Markdown.toHtmlWith {githubFlavored = Just { tables = False, breaks = False}, defaultHighlighting = Nothing, sanitize = False, smartypants = False} [] l.body
            ]
  in
    List.map this_text lessons

versionSelect: Model -> Models.Lesson -> Html Msg
versionSelect model lesson =
  let
    thisVersion ver =
      option [value ver, selected (ver == lesson.version)] [text ver]
  in
    select
      [ on "change"
        (Json.map (ChangeText lesson.section) targetValue)
      ]
      (List.map thisVersion model.config.vers)


thisReading: Model -> Section -> List (Html Msg)
thisReading model section =
  let
    lessons = case section of
      MP1 -> model.mp1
      MP2 -> model.mp2
      MPP -> model.mpp

    req l = case section of
      MP1 -> [("ofType", "daily"), ("section", l.section), ("id", l.id), ("read", l.read), ("ver", model.config.ot), ("fnotes", model.config.fnotes)]
      MP2 -> [("ofType", "daily"), ("section", l.section), ("id", l.id), ("read", l.read), ("ver", model.config.nt), ("fnotes", model.config.fnotes)]
      MPP -> [("ofType", "daily"), ("section", l.section), ("id", l.id), ("read", l.read), ("ver", model.config.ps), ("fnotes", model.config.fnotes)]

    this_lesson l =
      if String.length l.body == 0
        then
          li
            (hoverable [this_style l, onClick (GetText (req l))] )
            [text l.read]
        else
          li
            (hoverable [this_style l, onClick (ToggleShow l)] )
            [text l.read]
  in
    List.map this_lesson lessons



this_style: Models.Lesson -> Attribute msg
this_style l =
  case l.style of
    "req"     -> class "req_style"
    "opt"     -> class "opt_style"
    "alt"     -> class "alt_style"
    "alt-req" -> class "alt_style"
    "alt-opt" -> class "altOpt_style"
    _         -> class "bogis_style"

hoverable: List (Attribute msg) -> List (Attribute msg)
hoverable attrs =
  -- hover [("background-color", "white", "skyblue")] ++ attrs
  attrs

altReading: Model -> Models.Lesson -> Html Msg
altReading model lesson =
  input [ placeholder "Alt Reading"
        , autofocus True
        , value lesson.altRead
        , name "altReading"
        , onInput (UpdateAltReading lesson)
        , onEnter (RequestAltReading lesson)
        ]
        []

onEnter : Msg -> Attribute Msg
onEnter msg =
  let
    tagger code =
      if code == 13 then
        msg
      else
        NoOp
  in
    on "keydown" (Json.map tagger keyCode)
