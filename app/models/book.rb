class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	
	has_many :book_comments, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	
	def self.search(methods,words)
    if methods == "perfect_match"
      @book = Book.where("title LIKE ?", "#{words}")
    elsif methods == "forward_match"
      @book = Book.where("title LIKE ?", "#{words}%")
    elsif methods == "backward_match"
      @book = Book.where("title LIKE ?", "%#{words}")
    else
      @book = Book.where("title LIKE ?","%#{words}%")
    end
  end
end