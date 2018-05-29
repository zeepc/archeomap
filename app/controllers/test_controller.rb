class TestController < ApplicationController

	def index
		response = HTTParty.get("https://collectionapi.metmuseum.org/api/collection/v1/object/329079", headers: {"Authorization" => "Bearer #{ENV['MET_API']}"})
		@artifact = JSON.parse(response.body.to_s)

	end

end
