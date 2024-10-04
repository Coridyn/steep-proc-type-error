class KeywordArgument2
  has_paper_trail if: proc { |item| item.is_live? }
  
  def self.has_paper_trail(if:)
    # ...
  end
  
  def is_live?
    true
  end
end
