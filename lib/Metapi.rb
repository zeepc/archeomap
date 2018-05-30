
require 'httparty'

class Metcollection
  include HTTParty
  format :json

   base_uri 'collectionapi.metmuseum.org'

   attr_accessor :object_id, :title, :pic_sm_url, :pic_lg_url, :alt_title, :audio, :location, :era, :timeline_url

   def initialize(data)
   	@object_id = data["objectID"]
   	@title = data["titles"]["primaryTitle"]
   	@pic_sm_url = data["media"]["images"]["primaryImage"]["imageUrl"]
   	@pic_lg_url =  data["media"]["images"]["primaryImage"]["webImageUrl"]
   	@alt_title = data["media"]["images"]["altText"]
   	@audio = data["media"]["audios"][0]["url"]
   	@location = data["facetInfo"]["geographicLocations"][2]["name"]
   	@era = data["facetInfo"]["dateEra"][0]["name"]
   	@timeline_url = data["onlineResources"]["toahTimelines"][0]["url"]
   end
   
   def self.artifact(objectID)
   	data = get("/api/collection/v1/object/#{objectID}.json", headers: {"Authorization" => "Bearer #{ENV['MET_API']}"})
   	if data.success?
   		new(data)
   	else
   		puts "uh oh, there's a problem"
   	end
   end
end