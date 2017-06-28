class Blog < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  after_initialize :set_defaults

  enum status: {
    draft:     0,
    published: 1
  }
  validates_presence_of :title, :body, :topic_id
  belongs_to :topic#, optional: true
  
  private 
    def set_defaults
      self.topic_id ||= Topic.order("Rand()").first.id
    end
end
