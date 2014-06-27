class Product < ActiveRecord::Base
  validates :titulo, :descricao, presence: true
  validates :preco, numericality: {greater_than_or_equal_to: 0.01}
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar, :presence => true
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end