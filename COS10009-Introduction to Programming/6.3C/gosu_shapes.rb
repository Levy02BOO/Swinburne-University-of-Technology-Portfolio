require 'rubygems'
require 'gosu'
require './circle'

# The screen has layers: Background, middle, top
module ZOrder
  BACKGROUND, MIDDLE, TOP = *0..2
end

class DemoWindow < Gosu::Window
  def initialize
    super(640, 400, false)
  end

  def draw
    # see www.rubydoc.info/github/gosu/gosu/Gosu/Color for colours
    draw_quad(0, 350, Gosu::Color::GREEN, 640, 350, Gosu::Color::GREEN, 0, 400, Gosu::Color::GREEN, 640, 400, Gosu::Color::GREEN, ZOrder::BACKGROUND)
    draw_quad(0, 0, Gosu::Color::AQUA, 640, 0, Gosu::Color::BLUE, 0, 350, Gosu::Color::YELLOW, 640, 350, Gosu::Color::BLUE, ZOrder::BACKGROUND)
    draw_triangle(275, 100, Gosu::Color::AQUA, 425, 100, Gosu::Color::AQUA, 350, 10, Gosu::Color::GREEN, ZOrder::MIDDLE, mode=:default)
    draw_quad(325, 130, Gosu::Color::WHITE, 375, 130, Gosu::Color::WHITE,325, 170, Gosu::Color::WHITE, 375, 170, Gosu::Color::WHITE, ZOrder::TOP, mode=:default)
    draw_line(350, 130, Gosu::Color::BLACK, 350, 170, Gosu::Color::BLACK, ZOrder::TOP, mode=:default)
    draw_line(325, 150, Gosu::Color::BLACK, 375, 150, Gosu::Color::BLACK, ZOrder::TOP, mode=:default)
    draw_line(350, 250, Gosu::Color::BLACK, 350, 350, Gosu::Color::BLACK, ZOrder::TOP, mode=:default)
    # draw_rect works a bit differently:
    Gosu.draw_rect(250, 200, 200, 150, Gosu::Color::CYAN, ZOrder::MIDDLE, mode=:default)
    Gosu.draw_rect(275, 100, 150, 100, Gosu::Color::BLACK, ZOrder::MIDDLE, mode=:default)
draw_quad(150, 100, Gosu::Color::GRAY, 170, 100, Gosu::Color::GRAY,140, 375, Gosu::Color::WHITE, 180, 375, Gosu::Color::WHITE, ZOrder::TOP, mode=:default)
    # Circle parameter - Radius
    img2 = Gosu::Image.new(Circle.new(100))
    # Image draw parameters - x, y, z, horizontal scale (use for ovals), vertical scale (use for ovals), colour
    # Colour - use Gosu::Image::{Colour name} or .rgb({red},{green},{blue}) or .rgba({alpha}{red},{green},{blue},)
    # Note - alpha is used for transparency.
    # drawn as an elipse (0.5 width:)
    img2.draw(50, 100, ZOrder::TOP, 1.0, 0.5, Gosu::Color::GREEN)
    img2.draw(100, 50, ZOrder::TOP, 0.5, 1.0, Gosu::Color::GREEN)
    # drawn as a red circle:
    img2 = Gosu::Image.new(Circle.new(50))
    img2.draw(500, 50, ZOrder::TOP, 1.0, 1.0, Gosu::Color::WHITE)
    # drawn as a red circle with transparency:
    img2.draw(300, 250, ZOrder::MIDDLE, 1.0, 1.0, Gosu::Color::YELLOW)

  end
end

DemoWindow.new.show
