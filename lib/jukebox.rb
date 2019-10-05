songs = [
  "Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "Phoenix - Consolation Prizes",
  "Harry Chapin - Cats in the Cradle",
  "Amos Lee - Keep It Loose, Keep It Tight"
]

# Method to output instructions for the user on how to use the jukebox

def help()
    puts "I accept the following commands:"
    puts "- help : displays this help message"
    puts "- list : displays a list of songs you can play"
    puts "- play : lets you choose a song to play"
    puts "- exit : exits this program"
end


# Method to output a list of songs that the user can play

def list(songs)
    songs.each_with_index { |song_name, i| puts "#{i + 1}. #{song_name}" }
end


# Method to ask a user to input a song name or track number and then output the appropriate song name

def play(songs)
    prompt = "Please enter a song name or number:"
    warning = "Invalid input, please try again"

    puts prompt
    song_name_or_num = gets.strip

    # If the songs array includes the supplied song name as a valid element then display the favourable message
    if songs.include?(song_name_or_num)
        puts "Playing #{song_name_or_num}"

    # Else if the supplied song number is a valid index for elements of the songs array and that index doesn't compute to -1 since unrecognised song names to_i compute to 0, which would pull the -1 element and we don't want that
    elsif !songs[song_name_or_num.to_i - 1].nil? && (song_name_or_num.to_i - 1 != -1)
        puts "Playing #{songs[song_name_or_num.to_i - 1]}"

    # Otherwise, display the warning message
    else
        puts warning
    end
end


# Method for jukebox should say goodbye and the program should shut down

def exit_jukebox()
    puts "Goodbye"
end


# Method for running the jukebox

def run(songs)
    puts "Please enter a command:"
    command = gets.strip

    case command
        when "help"
            help()
        when "list"
            list(songs)
        when "play"
            play(songs)
        when "exit"
            exit_jukebox()
        else 
            puts "This is not a valid command!"
    end
end