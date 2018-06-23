class ArtifactsController < ApplicationController

	respond_to :js, :json, :html

	
	def home
		@artifacts = Artifact.all	
		@baby = Artifact.where('location = ?' , 'Babylon')
		@city = params[:city]
		@arti = Artifact.where('location = ?' , @city)
	end


	def gallery
		@artifacts = Artifact.all
	end


	def index
	  # @art = Artifacts.where(location: "Babylon")
		@artifacts = Artifact.all
		@city = params[:city]
		@arti = Artifact.where('location = ?' , @city)
		@baby = Artifact.where('location = ?' , 'Babylon')
		# puts "88888888888888888"
		# puts @city
		# puts "22222222222222222"
		#  @arti.each do |a|
		# 	puts a.location
		# 	puts a.title
		# end
		puts "77777777777777777"
		# puts @arti
		# puts "55555555555555555"
	end

	def  show
	@artifact = Artifact.find(params[:id])	
	@related = Artifact.limit(4).order("RANDOM()")
	end

	def new
		@artifact = Artifact.new
	end

	def create
	@artifact = Artifact.create(artifact_params)

	redirect_to '/artifacts/new'
	end

	def edit
		@artifact = Artifact.find(params[:id])	
	end

	def update
		@artifact = Artifact.find(params[:id])	
		@artifact.update(artifact_params)
		redirect_to '/artifacts/new'
	end

	private
    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def artifact_params
      params.require(:artifact).permit(:objectID, :title, :alt_title , :pic_sm_url, :pic_lg_url, :audio, :location, :era, :timeline_url)
    end
end


