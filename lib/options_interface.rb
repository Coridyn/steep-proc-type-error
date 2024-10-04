class OptionsInterface
  has_paper_trail
  has_paper_trail on: [:destroy]
  has_paper_trail on: [:destroy], if: proc { |item| item.is_live? }
  
  def self.has_paper_trail(options = {})
    # ...
  end
  
  def is_live?
    true
  end
end
