-- Generative music code for VCV Rack Prototype Module
--     See: https://vcvrack.com/Prototype
-- Copyright (C) 2021 John Davies
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http:--www.gnu.org/licenses/>.

config.frameDivider = 32

-- Constants
-- Colours
led_red = { 255, 0, 0 }
led_green = { 0, 255, 0 }
led_off = { 0, 0, 0 }
led_yellow = { 255, 255, 0 }
led_blue = { 0, 0, 255 }

-- Numerical constants
enable_threshold = 0.1
clock_threshold_low = 0.1
clock_threshold_high = 0.1
clock_high = 10
clock_low = 0

-- Variables
first = true
current_clock = 0
octave_modifier = 0
mute_track = false
mute_switch = false

function process( block )

  -- Initialise the random number generator the first time through
  -- using the noise generator
  if first == true then
    math.randomseed( block.inputs[3][1] * block.inputs[3][1] )
    first = false
  end

  -- Text display
  offset = ( block.knobs[1] - 0.5 ) * 20
  scale = block.knobs[2]
  display("Min V: " .. string.format("%.2f", ( -( scale * 10 ) + offset + octave_modifier ) ) ..
           " Max V: " .. string.format("%.2f", ( scale * 10 ) + offset + octave_modifier ) )
  -- Octave Lights
  -- Set all lights off
  block.lights[2][1] = led_off[1]
  block.lights[2][2] = led_off[2]
  block.lights[2][3] = led_off[3]
  block.lights[3][1] = led_off[1]
  block.lights[3][2] = led_off[2]
  block.lights[3][3] = led_off[3]
  block.lights[4][1] = led_off[1]
  block.lights[4][2] = led_off[2]
  block.lights[4][3] = led_off[3]
  block.lights[5][1] = led_off[1]
  block.lights[5][2] = led_off[2]
  block.lights[5][3] = led_off[3]
  block.lights[6][1] = led_off[1]
  block.lights[6][2] = led_off[2]
  block.lights[6][3] = led_off[3]

  -- Check which one to light and set octave modifier value
  if block.knobs[4] < 0.2
  then
    block.lights[2][1] = led_yellow[1]
    block.lights[2][2] = led_yellow[2]
    block.lights[2][3] = led_yellow[3]
    octave_modifier = -2
  elseif block.knobs[4] < 0.4
  then
    block.lights[3][1] = led_yellow[1]
    block.lights[3][2] = led_yellow[2]
    block.lights[3][3] = led_yellow[3]
    octave_modifier = -1
  elseif block.knobs[4] < 0.6
  then
    block.lights[4][1] = led_blue[1]
    block.lights[4][2] = led_blue[2]
    block.lights[4][3] = led_blue[3]
    octave_modifier = 0
  elseif block.knobs[4] < 0.8
  then
    block.lights[5][1] = led_yellow[1]
    block.lights[5][2] = led_yellow[2]
    block.lights[5][3] = led_yellow[3]
    octave_modifier = 1
  else
    block.lights[6][1] = led_yellow[1]
    block.lights[6][2] = led_yellow[2]
    block.lights[6][3] = led_yellow[3]
    octave_modifier = 2
  end

  -- Check rising edge of mute switch
  if ( block.switches[1] == true ) and ( mute_switch == false ) then
    mute_track = not mute_track
  end
  mute_switch = block.switches[1]

  -- Check mute enable
  if mute_track == false then
    -- Set switch light to green
    block.switchLights[1][1] = led_green[1]
    block.switchLights[1][2] = led_green[2]
    block.switchLights[1][3] = led_green[3]
  else
    -- Set switch to red
    block.switchLights[1][1] = led_red[1]
    block.switchLights[1][2] = led_red[2]
    block.switchLights[1][3] = led_red[3]
  end

  -- Check for enable and not muted
  if ( block.inputs[2][1] > enable_threshold ) and ( mute_track == false ) then
    -- Set LED
    block.lights[1][1] = led_green[1]
    block.lights[1][2] = led_green[2]
    block.lights[1][3] = led_green[3]
    -- Check for a rising edge on the clock line
    new_clock = block.inputs[1][1]
    -- Rising edge so set output trigger
    if ( current_clock < clock_threshold_low ) and
       ( new_clock > clock_threshold_high )
    then
      -- Copy noise input to output, using scaling and limiting
      if( math.random() < block.knobs[3] )
      then
        op_volts = ( block.inputs[3][1] * scale ) + offset + octave_modifier
        if op_volts > 10 then
          op_volts = 10
        end
        block.outputs[2][1] = op_volts
        -- Set trigger
        block.outputs[1][1] = clock_high
      end
    end
    -- Clock low so clear trigger
    if new_clock < clock_threshold_low then
      block.outputs[1][1] = clock_low
    end

  else
    -- Not enabled so turn LED off
    block.lights[1][1] = led_off[1]
    block.lights[1][2] = led_off[2]
    block.lights[1][3] = led_off[3]
  end
  -- Update clock value
  current_clock = new_clock

end
