class AddMenuController < ActionController::Base
	def new
		@menu = Menu.new
	end

	def create
		@menu = Menu.new(menu_params)
		if @menu.save
			respond_to do |format|
				format.html { redirect_to new_add_menu_path, notice: "#{@menu.name} を登録しました" }
			end
		else
			respond_to do |format|
				format.html { render :new, status: :unprocessable_entity }
			end
		end
	end

	private

	def menu_params
		params.require(:menu).permit(:name, :cuisine, :main_ingredient, :is_soup, :is_noodle)
	end
end
