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
  | Loop Result String (List P_Code)

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

parse : String ->  Result String (List P_Code)
parse code =
  let
    aux acc new_str =
      case String.uncons new_str of
        Nothing -> Ok acc
        Just ('>', tl) -> aux (Move_Right :: acc) tl
        Just ('<', tl) -> aux (Move_Left :: acc) tl
        Just ('+', tl) -> aux (Increment :: acc) tl
        Just ('-', tl) -> aux (Decrement :: acc) tl
        Just ('.', tl) -> aux (Print :: acc) tl
        Just (',', tl) -> aux (Input :: acc) tl
        -- Just ('[', tl) -> aux (Loop temp :: acc) tl
        Just (_, tl) -> aux acc tl
  in
    aux [] code

make_loop str = case get_loop str of
  Nothing -> Err "Missing end loop"
  Just x -> let
    temp = parse (String.left x tl)
  in


get_loop str =
  let
    aux i counter new_str =
      case (String.uncons new_str, counter) of
        (Nothing, _) -> Nothing
        (Just (']', _), 0) -> Just i
        (Just (']', tl), _) -> aux (i+1) (counter-1) tl
        (Just ('[', tl), _) -> aux (i+1) (counter+1) tl
        (Just (_, tl), _) -> aux (i+1) counter tl
  in
    aux 0 0 str


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
      [ Html.text ("Output : " ++ model.output)
      , Html.br [] []
      , Html.text "Code"
      , Html.br [] []
      , Html.textarea [Html.Events.onInput Update_code] []
      , Html.br [] []
      , Html.text "Entree"
      , Html.br [] []
      , Html.textarea [Html.Events.onInput Update_entry] []
      , Html.br [] []
      , Html.button [Html.Events.onClick Interpret] [Html.text "Interpreter"]
      ]
