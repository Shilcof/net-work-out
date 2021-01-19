class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Formattable
  include ActiveModel::Validations
end
