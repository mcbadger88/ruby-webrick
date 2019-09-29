require 'webrick'
require 'erb'
require_relative 'teamparser.rb'

class Routes < WEBrick::HTTPServlet::AbstractServlet
  
	def do_GET(request, response) 
		if "/" || "city" || "premierships"
			response.status = 200
			response['Content-Type'] = 'text/html'
			@data = parse_csv()		
			case request.path
			when "/"	
			# html_method just takes the logic elsewhere
			response.body = html_file("index.html.erb")	
			when "/city"
				response.body = html_file("city.html.erb")				
			when "/premierships"
				response.body = html_file("premierships.html.erb")
			end
		else
			response.status = 400
			response.body = "Route not found"
		end
	end

	private 
	def html_file(file) 
		path = File.join(__dir__, 'public', file)   
		# binding binds the @variables from the class to the view 
		html = ERB.new(File.open(path).read).result(binding)
		return html
	end
end

server = WEBrick::HTTPServer.new(Port: 3000)
trap 'INT' do server.shutdown end
server.mount '/', Routes
server.start
