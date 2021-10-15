defmodule LoorWeb.LandingControllerTest do
  use LoorWeb.ConnCase

  alias Loor.Landing

  # uuid = Nanoid.generate(21, "123456789")

  # @create_attrs %{title: "some title", header_text: "some header text", call_to_action: "some call to action", button_text: "some button text", slug: uuid }
  # @update_attrs %{title: "some awesome title", header_text: "some header text", call_to_action: "some call to action", button_text: "some button text", slug: uuid }
  # @invalid_attrs %{title: nil, header_text: nil, call_to_action: nil, button_text: nil, slug: uuid }

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Landings"
    assert html_response(conn, 200) =~ "Create new landing"
  end



  test "GET /landing/new", %{conn: conn} do
    conn = get conn, "/landing/new"
    assert html_response(conn, 200) =~ "Create New Landing"
  end

end
