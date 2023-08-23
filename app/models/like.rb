class Like < ApplicationRecord
    belongs_to :author, class_name: :'User'
    belongs_to :post, counter_cache: true

    after_create :update_likes_counter
    after_distroy :update_likes_counter
    def update_likes_counter
        self.post.update(likes_counter: self.post.likes.count)
    end
end
