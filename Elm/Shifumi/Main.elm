import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String
import Dict
import Random



main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { player_score : Int
  , ia_score : Int
  , message : String
  , seed : Random.Seed
  }


model : Model
model = {player_score = 0
        , ia_score = 0
        , message = ""
        , seed = Random.initialSeed 42
        --, seed = Time.now |> Tuple.second |> Time.inSeconds |> floor |> Random.initialSeed
        }



-- UPDATE


type Msg
  = Entree Int

update : Msg -> Model -> Model
update msg model =
  case msg of
    Entree nombre ->
      let
        (ia_choice, new_seed) = Random.step (Random.int 0 2) model.seed
      in
        if nombre == ia_choice then
          {player_score = model.player_score, ia_score = model.ia_score, message = "egalite", seed = new_seed}
        else if nombre > ia_choice || nombre + 2 == ia_choice then
          {player_score = model.player_score + 1, ia_score = model.ia_score, message = "gagne", seed = new_seed}
        else
          {player_score = model.player_score, ia_score = model.ia_score + 1, message = "perdu", seed = new_seed}





-- VIEW


view : Model -> Html Msg
view model =
  div []
      [ Html.p [] [Html.text ("Joueur : " ++ (toString model.player_score) ++ " Ia : " ++ (toString model.ia_score))]
      , Html.p [] [Html.text model.message]
      , Html.br [][]
      , Html.button [onClick (Entree 0)] [Html.text "Pierre"]
      , Html.button [onClick (Entree 1)] [Html.text "Papier"]
      , Html.button [onClick (Entree 2)] [Html.text "Ciseaux"]
      ]
