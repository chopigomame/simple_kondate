class AddMenuController < ActionController::Base
	def new
		@menu = Menu.new
	end

	def create
		@menu = Menu.new(menu_params)
		if @menu.save
			respond_to do |format|
				format.json { render json: {message: "#{@menu.name} を登録しました", status: :created }}
			end
		else
			respond_to do |format|
				format.json { render json: { errors: @menu.erros.full_messages }, status: :unprocessable_entity }
			end
		end
	end

	private

	def menu_params
		params.require(:menu).permit(:name, :cuisine, :main_ingredient, :is_soup, :is_noodle)
	end
end
