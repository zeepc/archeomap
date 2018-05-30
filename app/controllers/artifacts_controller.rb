class ArtifactsController < ApplicationController

	def index
		@artifact = Artifact.all
	end

	def  show
	@artifact= Artifact.find(params[:id])	
	end

	def new
		@artifact= Artifact.new
	end

	def create
	@artifact = Artifact.create(artifact_params)
	redirect_to '/artifacts/new'
	end

	def edit
		@artifact= Artifact.find(params[:id])	
	end

	def update
		@artifact= Artifact.find(params[:id])	
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


