class User < ActiveRecord::Base
    has_many :reviews
    has_many :products, through :reviews

    def liked_product
        self.reviews.order(:star_rating).last
    end

    def delete_reviews(product)
        self.reviews.where(product_id: product.id).destroy_all
    end
    
end