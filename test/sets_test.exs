defmodule Avatarex.SetsTest do
  use ExUnit.Case

  alias Avatarex.Sets.{Birdy, BotBlue, Kitty, Monster, Robot}

  doctest Birdy
  doctest Kitty

  sets = [
    birdy: %{
      set: Birdy,
      layers: ~w[body hoop tail wing eyes bec accessorie],
      counts: [9, 10, 9, 9, 9, 9, 20]
    },
    bot_blue: %{
      set: BotBlue,
      layers: ~w[body face eyes mouth accessory],
      counts: [10, 10, 10, 10, 10]
    },
    kitty: %{set: Kitty, layers: ~w[body eye fur mouth accessorie], counts: [15, 15, 10, 10, 20]},
    monster: %{
      set: Monster,
      layers: ~w[body_color body face_color face eyes mouth nose],
      counts: [10, 10, 10, 16, 10, 10, 10]
    },
    robot: %{
      set: Robot,
      layers: ~w[wave face eyes mouth nose eyebrows antenna],
      counts: [2, 90, 12, 9, 11, 12, 10]
    }


  ]

  for {name, %{set: set, layers: layers, counts: counts}} <- sets do
    test "get #{name} layers" do
      assert unquote(set).get_layers() == unquote(layers)
    end

    test "get #{name} path" do
      assert unquote(set).get_path() =~ "avatarex/priv/sets/#{unquote(name)}"
    end

    test "get #{name} image count" do
      for {f, c} <- Enum.zip(unquote(layers), unquote(counts)) do
        assert unquote(set).get_image_count(f) == c
      end
    end

    test "get #{name} images paths" do
      for f <- unquote(layers) do
        for path <- unquote(set).get_images_paths(f) do
          assert path =~ "avatarex/priv/sets/#{unquote(name)}/#{f}"
        end
      end
    end

    test "get #{name} image path by index" do
      base_path = "avatarex/priv/sets/#{unquote(name)}"

      for {f, c} <- Enum.zip(unquote(layers), unquote(counts)) do
        for i <- 0..(c - 1) do
          assert unquote(set).get_image_path_by_index(f, i) =~ "#{base_path}/#{f}/#{f}_"
        end
      end
    end
  end
end
