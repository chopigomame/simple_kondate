class Menu < ApplicationRecord
	validates :cuisine, inclusion: { in: ["中華", "和食", "洋食"], message: "%{value} は無効なcuisineの指定です。"}
	validates :name, presence: true, length: { minimum: 1, message: "は1文字以上である必要があります。" }
	
	def self.find_menu(cuisine, main_ingredient, is_soup, is_noodle)
		matches = Menu.where(
			cuisine: cuisine,
			main_ingredient: main_ingredient,
			is_soup: is_soup,
			is_noodle: is_noodle,
		)
		if matches.sample
			return matches.sample.name
		else
			return "見つかりませんでした"
		end
	end
end
