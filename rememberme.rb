#==============================================================================
# Remember Me v.1.0
#
# Merutochan (merutochan at gmail dot com)
#
# Many Special Thanks to:
#
# il Gruppo Skype Quello Bello Games aka La vita scifosa
# (http://lavitascifosa.wixsite.com/grupposkypegames) . . .
#
# for giving me the idea and actual reasons to make this little
# script. They make the most awesome and funny RPGMKR games I've EVER played.
#
# Took about one hour to figure out how to make it and to complete it.
#
# Purpose:
# This script emulates the very idea behind the Undertale's "remembering"
# system, in which the game remembers the actions from the previous game saves.
#
# In this particular case, when a player selects "New Game" from the title
# screen, the script checks out for existing save games.
# If they exist, it extracts one variable (READ_FROM) from the most
# recent save game, and proceeds to copy it inside of WRITE_ON in the
# new game being started.
# This allows the programmer to interact with statistics coming from
# a "parallel dimension" and allows further concepts like shifting,
# time loops à la Steins;Gate and even more disturbing ideas.
#
#==============================================================================

# Modify these two values to adapt them to the variables you mean to use

READ_FROM = 1
WRITE_ON = 2

module DataManager
  def self.load_check
    File.open(make_filename(latest_savefile_index), "rb") do |file|
      Marshal.load(file)
      extract_variables_only(Marshal.load(file))
    end
    return true
  end

  def self.extract_variables_only(contents)
    $old_sav_variables     = contents[:variables]
    $game_variables[WRITE_ON]     = $old_sav_variables[READ_FROM]
  end
end

class Scene_Title < Scene_Base

  alias command_new_game_old command_new_game

  def command_new_game
    DataManager.setup_new_game
    close_command_window
    fadeout_all
    if DataManager.save_file_exists?
      DataManager.load_check
    end
    $game_map.autoplay
    SceneManager.goto(Scene_Map)
  end
end
