class Product < ActiveRecord::Base
  validates :titulo, :descricao, presence: true
  validates :preco, numericality: {greater_than_or_equal_to: 0.01}
  validates :titulo, uniqueness: true
   
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :avatar, :presence => true
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :linha_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  
  private
  
  def ensure_not_referenced_by_any_line_item 
     if linha_items.empty? 
       return true
     else
       errors.add(:base, 'Item presente')
       return false 
     end
  end
end