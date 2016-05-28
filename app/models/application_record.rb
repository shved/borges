class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.translates(*attrs)
    attrs.each do |attr|
      define_method "#{attr}" do
        self.send "#{attr}_#{I18n.locale}"
      end
    end
  end
end
