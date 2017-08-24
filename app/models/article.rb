class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5 }
    validates :text, presence: true, length: { minimum: 10 }
    has_attached_file :image, styles: { large: "800x800>", medium: "300x300>"}, default_url: "/images/:style/missing.png"

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :admin
    acts_as_taggable
    acts_as_taggable_on :tags

    enum region: [ :undefined, :north_america, :south_america, :europe, :middle_east_and_north_africa, :africa, :asia_and_oceania ]

    extend FriendlyId
    friendly_id :title, use: :slugged
end
