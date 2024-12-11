defmodule Avatarex.TestAvatar do
  @moduledoc """
  Avatarex.TestAvatar is an example to demonstrate how use Avatarex to create avatars.

  This involves using the `Avatarex` module and invoking the `Avatarex.set/2` macro for
  each: set name, module.
  """

  use Avatarex

  alias Avatarex.Sets.{
    Birdy,
    Kitty,
    Monster,
    Robot,
    BotBlue,
    BotBrown,
    BotGreen,
    BotGrey,
    BotOrange,
    BotPink,
    BotPurple,
    BotRed,
    BotWhite,
    BotYellow
  }

  for {name, module} <- [
        birdy: Birdy,
        kitty: Kitty,
        monster: Monster,
        robot: Robot,
        bot_blue: BotBlue,
        bot_brown: BotBrown,
        bot_green: BotGreen,
        bot_grey: BotGrey,
        bot_orange: BotOrange,
        bot_pink: BotPink,
        bot_purple: BotPurple,
        bot_red: BotRed,
        bot_white: BotWhite,
        bot_yellow: BotYellow
      ] do
    set(name, module)
  end
end
