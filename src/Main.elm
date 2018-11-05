module Main exposing
    ( MixtureMonsterViewModel
    , MixtureMonsters
    , MixtureViewModel
    , mixtureMonsters2ViewModel
    )

import Browser
import Html exposing (..)
import Html.Attributes exposing (class, src)



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


mixtureMonsters2ViewModel : MixtureMonsters -> MixtureViewModel
mixtureMonsters2ViewModel mixtureMonsters =
    MixtureViewModel
        (MixtureMonsterViewModel "けっとう" "no-select")
        (MixtureMonsterViewModel "あいて" "no-select")


mixtureViewModel2View : MixtureViewModel -> Html Msg
mixtureViewModel2View { pedigree, target } =
    div []
        [ a [ class <| "button is-medium " ++ pedigree.className ]
            [ text pedigree.text
            , span [ class "nav-icon" ] []
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
