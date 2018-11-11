module Main exposing
    ( MixtureMonsterViewModel
    , MixtureMonsters
    , MixtureViewModel
    , Monster(..)
    , mixtureMonsters2ViewModel
    )

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, src, style)



---- MODEL ----


type alias Name =
    String


type Monster
    = Monster Name


type alias MixtureMonsters =
    { pedigree : Maybe Monster, target : Maybe Monster }


type alias Model =
    { mixtureMonsters : MixtureMonsters }


defaultMixtureMonsters : MixtureMonsters
defaultMixtureMonsters =
    { pedigree = Nothing, target = Nothing }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { mixtureMonsters = defaultMixtureMonsters }, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW MODEL ----


type alias MixtureMonsterViewModel =
    { text : String, className : String }


type alias MixtureViewModel =
    { pedigree : MixtureMonsterViewModel, target : MixtureMonsterViewModel }



---- VIEW ----


view : Model -> Html Msg
view model =
    mixtureViewModel2View
        { pedigree = { text = "けっとう", className = "no-select" }
        , target = { text = "あいて", className = "no-select" }
        }



---- PRESENTER ----


mixtureMonsters2ViewModel : MixtureMonsters -> MixtureViewModel
mixtureMonsters2ViewModel { pedigree, target } =
    let
        toNameClass maybeMonster isPedigree =
            case maybeMonster of
                Just (Monster name) ->
                    { name = name, className = "" }

                Nothing ->
                    { name =
                        if isPedigree then
                            "けっとう"

                        else
                            "あいて"
                    , className = "no-select"
                    }

        pedigreeNameClass =
            toNameClass pedigree True

        targetNameClass =
            toNameClass target False
    in
    MixtureViewModel
        (MixtureMonsterViewModel pedigreeNameClass.name pedigreeNameClass.className)
        (MixtureMonsterViewModel targetNameClass.name targetNameClass.className)


mixtureViewModel2View : MixtureViewModel -> Html Msg
mixtureViewModel2View { pedigree, target } =
    div []
        [ a [ class <| "button hovered-category is-medium " ++ pedigree.className ]
            [ text pedigree.text
            , span [ class "nav-icon" ] []
            , div [ class "category active-category" ]
                [ p [] [ text "モンスターの種類" ]
                , ul []
                    [ li [ class "hovered-hoge" ]
                        [ text "スライム系"
                        , div [ class "active-hoge" ]
                            [ ul []
                                [ li [] [ text "ドラゴスライム" ]
                                , li [] [ text "ぶちスライム" ]
                                , li [] [ text "はねスライム" ]
                                , li [] [ text "スライムツリー" ]
                                , li [] [ text "スライムつむり" ]
                                , li [] [ text "スライムナイト" ]
                                ]
                            ]
                        ]
                    , li [ class "" ]
                        [ text "ドラゴン系"
                        , div []
                            [ ul []
                                [ li [] [ text "ドラゴンキッズ" ]
                                , li [] [ text "ガメゴン" ]
                                , li [] [ text "プテラノドン" ]
                                , li [] [ text "フーセンドラゴン" ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        , span [] [ text "X" ]
        , a [ class <| "button is-medium " ++ target.className ]
            [ text target.text
            , span [ class "nav-icon" ] []
            ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
