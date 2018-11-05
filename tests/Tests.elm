module Tests exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main exposing (..)
import Test exposing (..)


type alias TestCase =
    String


mixtureMonsters2ViewModelTest : TestCase -> Maybe Monster -> Maybe Monster -> MixtureMonsterViewModel -> MixtureMonsterViewModel -> Test
mixtureMonsters2ViewModelTest testCase maybePedigree maybeTarget pedigreeMixtureMonsterViewModel targetMixtureMonsterViewModel =
    test testCase <|
        \_ ->
            let
                actual =
                    mixtureMonsters2ViewModel <| MixtureMonsters maybePedigree maybeTarget
            in
            Expect.equal actual <|
                MixtureViewModel
                    pedigreeMixtureMonsterViewModel
                    targetMixtureMonsterViewModel


suite : Test
suite =
    describe "Main module"
        [ describe "mixtureMonsters2ViewModel"
            [ mixtureMonsters2ViewModelTest
                "配合モンスターがいないとき、「けっとう」と「あいて」の文字が表示され、非選択classとなる。"
                Nothing
                Nothing
                (MixtureMonsterViewModel "けっとう" "no-select")
                (MixtureMonsterViewModel "あいて" "no-select")
            , mixtureMonsters2ViewModelTest
                "「けっとう」がスライムのとき、「スライム」と「あいて」の文字が表示され、「あいて」のみ非選択classとなる"
                (Just <| Monster "スライム")
                Nothing
                (MixtureMonsterViewModel "スライム" "")
                (MixtureMonsterViewModel "あいて" "no-select")
            , mixtureMonsters2ViewModelTest
                "「けっとう」がスライム、「あいて」がドラゴンのとき、「スライム」と「ドラゴン」の文字が表示される"
                (Just <| Monster "スライム")
                (Just <| Monster "ドラゴン")
                (MixtureMonsterViewModel "スライム" "")
                (MixtureMonsterViewModel "ドラゴン" "")
            ]
        ]
