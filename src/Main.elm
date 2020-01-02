module Main exposing (Model, Msg(..), init, main, subscriptions, update, view, viewLink)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Landing
import String.Interpolate exposing (interpolate)
import Url



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }



-- MODEL


type Model
    = NotFound
    | Landing Landing.Model


init : flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url navKey =
    case url.path of
        "/" ->
            ( Landing Landing.init, Cmd.none )

        _ ->
            ( NotFound, Cmd.none )



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotLandingMsg Landing.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        _ ->
            ( model, Cmd.none )


updateWith : (subModel -> Model) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toModel toMsg model ( subModel, subCmd ) =
    ( toModel subModel
    , Cmd.map toMsg subCmd
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    case model of
        Landing landing ->
            --Landing.view Landing
            let
                content =
                    Landing.view landing
            in
            { title = "John Doneth - Software Developer"
            , body =
                List.map (Html.map GotLandingMsg) [ content ]
            }

        _ ->
            { title = "404"
            , body =
                [ text "Error! Unknown route" ]
            }


viewLink : String -> Html msg
viewLink path =
    li [] [ a [ href path ] [ text path ] ]
