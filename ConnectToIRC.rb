require "socket"

class IRC

	attr_accessor :server, :nick, :channel

	# reader 
	def server
		@server
	end

	# writer
	def server=(server)
		@server = server
	end

	# self means its a class method

	def initialize(nick, channel)
		@server = "default value"
		@nick = nick
		@channel = channel
	end

	

	def login
		port = "6667"
		greeting_prefix = "privmsg #{@channel} :"
		greetings = ["goddamn batman"]
		irc_server = TCPSocket.open(@server,port)
#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"
		irc_server.puts "USER bChristianBale 0 * ChristianBale"
		irc_server.puts "NICK #{@nick}"
		irc_server.puts "JOIN #{@channel}"
		irc_server.puts "#{greeting_prefix} Hello!"
	end

end


#p server
p "What nickname did you want? No spaces!"
nick = gets.chomp
#p nick
p "Which channel did you want?"
channel = "#" + gets.chomp.to_s
#p channel
logon = IRC.new(nick, channel)
p logon
p "What server did you want to connect to?"
server = gets.chomp

logon.server = server

p logon


logon.login
