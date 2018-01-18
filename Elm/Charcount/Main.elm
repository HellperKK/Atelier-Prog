import Html exposing (Html, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String
import Dict



main =
  Html.beginnerProgram
    { model = model
    , view = view
    , update = update
    }



-- MODEL


type alias Model =
  { content : String
  , dico : Dict.Dict Char Int
  }


model : Model
model = {content = "", dico = Dict.empty}



-- UPDATE


type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent -> {content = newContent, dico = dict_update newContent Dict.empty}


dict_teller dic =
  Dict.toList dic |>
    List.map (\(key, value) -> div [] [text ("Le caractere " ++ (String.fromChar key) ++ " est present " ++ (toString value) ++ " fois")])

dict_update chaine dic =
  String.foldl (\char dico -> Dict.update char may_increment dico) dic chaine

may_increment value = case value of
  Just x ->
    Just (x + 1)
  Nothing ->
    Just 1


-- VIEW


view : Model -> Html Msg
view model =
  div []
    (List.append
      [ input [ placeholder "Text to reverse", onInput Change] []
      , Html.br [][]
      ]
      (dict_teller model.dico))
