class Question < ActiveRecord::Base
  validates(:description, {:presence => true, :length => { :maximum => 150 }})
  belongs_to(:survey)
  before_save(:capitalize_description)

  private

    define_method(:capitalize_description) do
      self.description=(description().capitalize())
  end
end
