import Html
import Html.Attributes
import Html.Events
import String
import Dict
import Random
import Array
import Char

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
  | Loop (List P_Code)

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
    run pseudo_code

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
        Just ('[', tl) ->
          let (temp, tempb) = case get_loop tl of
            Nothing -> (tl, "")
            Just x -> (String.left x tl, String.dropLeft (x+1) tl)
          in
            aux ((Loop (parse temp)) :: acc) tempb
        Just (_, tl) -> aux acc tl
  in
    aux [] code

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
    List.reverse (aux 0 0 str)

-- run code entry =
--   let
--     aux new_code new_entry output pointeur tableau = case new_code of
--       [] -> output
--       Move_Right :: tl ->
--         let new_pointeur = if pointeur < 127 then pointeur + 1 else pointeur
--         in aux tl entry output new_pointeur tableau
--       Move_Left :: tl ->
--         let new_pointeur = if pointeur > 0 then pointeur - 1 else pointeur
--         in aux tl entry output new_pointeur tableau
--       Increment :: tl ->
--         let new_tableau = may_increment tableau pointeur
--         in aux tl entry output pointeur new_tableau
--       Decrement :: tl ->
--         let new_tableau = may_decrement tableau pointeur
--         in aux tl entry output pointeur new_tableau
--       Print :: tl ->
--         let new_output = String.cons (Char.fromCode (may_get tableau pointeur)) output
--         in aux tl entry new_output pointeur tableau
--       Input :: tl ->
--         let (new_tableau, new_entry) = case String.uncons entry of
--           Nothing -> (Array.set pointeur 49 tableau, "")
--           Just (chr, str) -> (Array.set pointeur (Char.toCode chr) tableau, str)
--         in aux tl new_entry output pointeur new_tableau
--       (Loop tab) :: tl ->
--         let
--           runing = case Array.get pointeur tableau of
--             Nothing -> False
--             Just x -> x == 0
--           (new_code, new_output) = if runing then (code, String.reverse (run tab)) else (tl, "")
--         in
--           aux new_code entry (new_output ++ output) pointeur tableau
--   in
--       String.reverse (aux code entry "" 0 (Array.repeat 128 0))

may_increment arr index =
  case Array.get index arr of
    Just x -> Array.set index (x+1) arr
    Nothing -> arr

may_decrement arr index =
  case Array.get index arr of
    Just x -> Array.set index (x-1) arr
    Nothing -> arr

may_get arr index =
  case Array.get index arr of
    Just x -> x
    Nothing -> 49


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
