class Model
  has_paper_trail if: proc { |item| item.is_live? }
  
  def self.has_paper_trail(options = {})
    # ...
  end
  
  def is_live?
    true
  end
end
