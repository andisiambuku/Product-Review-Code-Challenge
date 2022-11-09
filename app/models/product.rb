class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through :reviews

    def write_review(user,star_rating,comment)
        Review.create(star_rating:star_rating, comment:comment, user_id:user.id, product_id:self.id)
    end

    def all_reviews
        self.reviews.map do |r|
            r.output_review
    end
    def mean_rating
        self.reviews.average(:star_rating).to_f
    end
    
end