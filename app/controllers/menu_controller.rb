class MenuController < ActionController::Base
	protect_from_forgery # https://techracho.bpsinc.jp/hachi8833/2021_11_26/46891
	def show
		# TODO: リクエストを受け取って適切なメニューを選択してきて、Viewに渡す処理を書く必要がある
		@cuisine = params[:cuisine]
		@main_ingredient = params[:main_ingredient]
		@is_soup = params[:soup] == "汁物"
		@is_noodle = params[:noodle] == "麺"
		@recommend = Menu.find_menu(@cuisine, @main_ingredient, @is_soup, @is_noodle)
	end
end