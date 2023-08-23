class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User' 
    belongs_to :post
    after_create :update_comments_counter
    after_destroy :update_comments_counter
    def update_comments_counter
        self.post.update(comments_counter: self.post.comments.count)
    end
end
