::RBNACL_LIBSODIUM_GEM_LIB_PATH = 'C:\Program Files (x86)\Lim\libsodium-1.0.10-msvc\Win32\Release\v120\dynamic\libsodium.dll'
require 'discordrb'

bot = Discordrb::Commands::CommandBot.new token: 'token', application_id: [app_id], prefix: '<'

bot.command(:KhioChirp) do |event, arg|

  if event.author.voice_channel == nil
    event << "Mreep! You need to be in a voice channel!!"
    break
  end

  if arg == "help"
    event << "Need help? This is what you can do. : `<KhioChirp [chill/VNR]`"
  elsif arg == "vnr" or arg == "VNR"
    bot.voice_connect(event.author.voice_channel)
    event.voice.play_file('KhioChirping.mp3')
    event.voice.stop_playing
    event.voice.destroy
  else
    bot.voice_connect(event.author.voice_channel)
    event.voice.play_file('KhioChirping.mp3')
    event.voice.stop_playing
    event.voice.destroy
  end
nil

end  

bot.command(:servers, help_available: false) do |event, arg|
  count = event.bot.servers.length
  
  if count == 1
    s = ""
  elsif count > 1
    s = "s"
  end 

  if arg == "count"
    event << "I'm currently on #{count} server#{s}."
  elsif arg == "list"
    event << bot.servers.values.map(&:name).join(', ')
  else
    event << "Mreep! Did you mean `#{event.bot.prefix}servers count`?"
  end
end  

bot.command(:ping, help_available: false) do |event|
  m = event.respond('*Mreep! Checking* 🕒')
  m.edit "It took me *#{Time.now - event.timestamp}* seconds."
  nil
end  

bot.command(:invite) do |event|
  event << "You wanna invite me to other servers? Okay, there: #{event.bot.invite_url}"
end

bot.command(:setgame) do |event, *game|
  g = "#{game.join(' ')}"
 
  event.bot.game = g
  
  if g == "Mako Mankanshoku" or g == "Mako"
    e = ":cat:"
    w = "with "
  else
    e = "🎮"  
    w = ""
  end

  if g == "" or g == " " or g == nil
    event.bot.game = nil
    event << "Successfuly unset the game."
    break
  end 

  event << "#{e}Okay, I'm now playing #{w}**#{g}**!"
end

bot.run