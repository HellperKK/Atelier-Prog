import Html
import Html.Attributes
import Html.Events
import String
import Dict
import Random
import Array


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
  | Interpret

type P_Code
  = Move_Right
  | Move_Left
  | Increment
  | Decrement
  | Print
  | Input
  | Loop List P_Code

update : Msg -> Model -> Model
update msg model =
  case msg of
    Update_code str -> {code=str, entry=model.entry, output=model.output}
    Update_entry str -> {code=model.code, entry=str, output=model.output}
    Interpret -> {code=model.code, entry=model.entry, output=(interpret model.code model.entry)}

interpret code entry =
  let
    pseudo_code = parse code
  in
    code

parse code =
  let
    aux acc new_str =
      case String.uncons new_str of
        Nothing -> acc
        Just ('>', tl) -> aux (Move_Right :: acc) tl
        Just ('<', tl) -> aux (Move_Left :: acc) tl
        Just ('+', tl) -> aux (Increment :: acc) tl
        Just ('-', tl) -> aux (Decrement :: acc) tl
        Just ('.', tl) -> aux (Print :: acc) tl
        Just (',', tl) -> aux (Input :: acc) tl
        Just ('[', tl) -> aux (Input :: acc) tl
        Just (_, tl) -> aux acc tl
  in
    aux [] code

may_increment arr index =
  case Array.get index arr of
    Just x -> Array.set index (x+1) arr
    Nothing -> arr

may_decrement arr index =
  case Array.get index arr of
    Just x -> Array.set index (x-1) arr
    Nothing -> arr


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
      , Html.button [Html.Events.onClick Interpret] [Html.text "Interpreter"]
      ]
