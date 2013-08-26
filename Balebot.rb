require "socket"

class Connect_to_IRC
	attr_accessor :server, :nick, :channel

	def choose_server
		p "What server did you want to connect to?"
		server = gets.chomp
		#p server
	end

	def choose_nickname
		p "What nickname did you want? No spaces!"
		nick = gets.chomp.
		#p nick
	end

	def choose_channel
		p "Which channel did you want?"
		channel = "#" + gets.chomp.to_s
		#p channel
	end

	def login
		port = "6667"
		greeting_prefix = "privmsg #{channel} :"
		greetings = ["goddamn batman"]
		irc_server = TCPSocket.open(server,port)

		irc_server.puts "USER bChristianBale 0 * ChristianBale"
		irc_server.puts "NICK #{nick}"
		irc_server.puts "JOIN #{channel}"
	end

end

logon = Connect_to_IRC.new
logon.choose_server
logon.choose_nickname
logon.choose_channel
logon.login



#irc_server.puts "PRIVMSG #{channel} :Hello from IRB Bot"
end



# Hello, Bot!

class Bot

def listen 
	until irc_server.eof do
		msg = irc_server.gets.downcase
	puts msg

end

def check_for_greeting

end

until irc_server.eof? do
	msg = irc_server.gets.downcase
	puts msg

	wasGreeted = false
	greetings.each { |g| wasGreeted = true if msg.include? g }

if msg.include? greeting_prefix and wasGreeted
	response = "Um, actually, I'm Batman."
	irc_server.puts "PRIVMSG #{channel} :#{response}"
end
end