import Html
import Html.Attributes
import Html.Events
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
  { code : String
  , entry : String
  , output : String
  }


model : Model
model = { code = ""
        , entry = ""
        , output = ""
        }



-- UPDATE


type Msg
  = Update_code String
  | Update_entry String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Update_code str -> {code=str, entry=model.entry, output=str}
    Update_entry str -> {code=model.code, entry=str, output=model.output}






-- VIEW


view : Model -> Html.Html Msg
view model =
  Html.div []
      [ Html.text model.output
      , Html.br [] []
      , Html.textarea [Html.Events.onInput Update_code] []
      , Html.br [] []
      , Html.textarea [Html.Events.onInput Update_entry] []
      , Html.br [] []
      -- , Html.button [onClick (Entree 2)] [Html.text "Ciseaux"]
      ]
