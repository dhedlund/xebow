defmodule Xebow.RGBMatrix.Animations.CycleLeftToRight do
  @moduledoc """
  Cycles hue left to right.
  """

  alias Chameleon.HSV
  alias Xebow.RGBMatrix
  alias Xebow.RGBMatrix.Animation

  import Xebow.Utils, only: [mod: 2]

  @behaviour Animation

  @impl true
  @spec tick(tick :: RGBMatrix.tick()) :: map
  def tick(tick) do
    speed = 100
    time = div(tick * speed, 100)

    %{time: time}
  end

  @impl true
  @spec color(
          x :: RGBMatrix.coordinate(),
          y :: RGBMatrix.coordinate(),
          tick :: RGBMatrix.tick(),
          tick_result :: map
        ) :: list(RGBMatrix.color())
  def color(x, _y, _tick, %{time: time}) do
    hue = mod(x * 10 - time, 360)
    HSV.new(hue, 100, 100)
  end
end
