class DemoController < ApplicationController
 
	layout false

  	def index
  	end

	def hello
		@array = [1,2,3,4,5]
		# Defyning the @instance_variables in my controller
		@id = params['id'].to_i
		# I wanna read the parameter id, so here I am calling
		# the string 'id' from the view index.html.erb
		# using an @instance_variable @id
		# The method "to_i" converts a string to an integer
		@page = params[:page].to_i
		# I wanna read the parameter page, I'm using the symbol
		# this time :page ,from index.html.erb
		# using @instance_variable @page
		# The method "to_i" converts a string to an integer

	end	

	def other_hello
		redirect_to(:controller => 'demo', :action => 'index')
	end	

	def lynda
		redirect_to("http://lynda.com")
	end	

end
