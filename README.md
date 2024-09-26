**Steps to reproduce:**

1. Check out this repo
2. Run `bundle install`
3. Run `steep check`

**Expected behaviour**

Steep typechecking should pass because the `untyped` type should propagate to the proc parameter.

```
# model.rb
class Model
  has_paper_trail if: proc { |item| item.is_live? }
  
  def self.has_paper_trail(options = {})
    # ...
  end
  
  def is_live?
    true
  end
end
```

```
#model.rbs
class Model
  def self.has_paper_trail: (?untyped) -> void
  def is_live?: () -> true
end

```


**Actual behaviour**

The proc parameter gets a type of `nil` which causes all property accesses on that parameter to fail with a type error.

```
lib/model.rb:2:41: [error] Type `nil` does not have method `is_live?`
│ Diagnostic ID: Ruby::NoMethod
│
└   has_paper_trail if: proc { |item| item.is_live? }
                                           ~~~~~~~~

Detected 1 problem from 1 file
```
