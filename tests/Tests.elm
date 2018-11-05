module Tests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Main module"
        [ describe "mixtureMonsters2ViewModel"
            [ test "配合モンスターが選ばれていないとき、「けっとう」と「あいて」の文字が、灰色で表示される。" <|
                \_ ->
                    let
                        actual =
                            mixtureMonsters2ViewModel <| MixtureMonsters Nothing Nothing
                    in
                    Expect.equal actual <|
                        MixtureViewModel
                            (MixtureMonsterViewModel "けっとう" "no-select")
                            (MixtureMonsterViewModel "あいて" "no-select")
            ]
        ]
