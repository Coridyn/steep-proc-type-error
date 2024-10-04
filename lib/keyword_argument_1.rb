# This file fails with a different error:
# Cannot pass a value of type `::Proc` as an argument of type `^(::KeywordArgument1) -> bool`
class KeywordArgument1
  has_paper_trail if: proc { |item| item.is_live? }
  
  def self.has_paper_trail(if:)
    # ...
  end
  
  def is_live?
    true
  end
end
