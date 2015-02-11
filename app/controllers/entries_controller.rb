class EntriesController < ApplicationController
	def index
		@proyect = Proyect.find(params[:proyect_id])
		@entries = @proyect.entries_in_month(2,2015)
		@time_string = @proyect.calculate_time_string(@entries)
	end

	def new
		@proyect = Proyect.find(params[:proyect_id])
		@entry = @proyect.entries.new		
	end

	def create
		@proyect = Proyect.find(params[:proyect_id])
		@entry = @proyect.entries.new entry_params
		if @entry.save
			flash[:notice] = "Entry created successfully"
			redirect_to action: 'index', controller: 'entries', proyect_id: @proyect.id
		else
			render 'new'
		end
	end


	def edit
		@proyect = Proyect.find(params[:proyect_id])
		@entry = Entry.find(params[:id])
	end
	
	def update
		@proyect = Proyect.find(params[:proyect_id])
		@entry = Entry.find(params[:id])
		if @entry.update_attributes entry_params
			flash[:notice] = "Entry updated successfully"
			redirect_to action: 'index'
		else
			flash.now[:errors] = @entry.errors.full_messages
			render 'new'
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy
		redirect_to action: 'index'
	end
	
	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)	
	end

end