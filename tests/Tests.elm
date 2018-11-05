module Tests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Main module"
        [ describe "mixtureMonsters2ViewModel"
            [ test "配合モンスターがいないとき、「けっとう」と「あいて」の文字が表示され、非選択classとなる。" <|
                \_ ->
                    let
                        actual =
                            mixtureMonsters2ViewModel <| MixtureMonsters Nothing Nothing
                    in
                    Expect.equal actual <|
                        MixtureViewModel
                            (MixtureMonsterViewModel "けっとう" "no-select")
                            (MixtureMonsterViewModel "あいて" "no-select")
            , test "「けっとう」がスライムのとき、「スライム」と「あいて」の文字が表示され、「あいて」のみ非選択classとなる" <|
                \_ ->
                    let
                        actual =
                            mixtureMonsters2ViewModel <|
                                MixtureMonsters (Just <| Monster "スライム") Nothing
                    in
                    Expect.equal actual <|
                        MixtureViewModel
                            (MixtureMonsterViewModel "スライム" "")
                            (MixtureMonsterViewModel "あいて" "no-select")
            ]
        ]
