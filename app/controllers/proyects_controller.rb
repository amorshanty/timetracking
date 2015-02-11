class ProyectsController < ApplicationController
	
	def index
		@proyects = Proyect.last_created_proyects(10)
		if @proyects.empty?
			render 'no_proyects_found'
		else
			@proyects
		end
	end

	def show
		begin
			@proyect = Proyect.find params[:proyect_id]
		rescue ActiveRecord::RecordNotFound
			render 'no_proyects_found'
		end
	end

	def new	
		@proyect = Proyect.new			
	end

	def create
		@proyect = Proyect.new proyect_params
		if @proyect.save
			redirect_to action: 'index'
		else
			render 'new'
		end
	end

	def proyect_params
		params.require(:proyect).permit(:name, :description, :name, :logo)
	end

	def destroy
		@proyect = Proyect.find(params[:id])
		@proyect.destroy
		redirect_to action: 'index'
	end

	def edit
		@proyect = Proyect.find(params[:id])		
	end

	def update
		@proyect = Proyect.find(params[:id])
		
		if @proyect.update_attributes proyect_params
			flash[:notice] = "Proyect updated successfully"
			redirect_to action: 'index'
		else
			flash.now[:errors] = @proyect.errors.full_messages
			render 'new'
		end		
	end
	
end


