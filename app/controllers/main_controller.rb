class MainController < ApplicationController

	def index

	end

	def test
		require 'yaml'

		@input = params[:input]
		@output = "Nothing to parse."
		@safe = "avicus-awesome: true"
		@error = 0

		if @input != nil && @input != ""
			begin
				@output = YAML.load(@input.gsub(/\\\\/, "\\").gsub(/\\n/, "\n"))
				@error = 2
			rescue Exception => e
				@output = e
				@error = 1
			end

			@safe = @input
		end

		@safe.gsub!("\n", "")
		@safe.gsub!("\r", "\\n")

	end

end
