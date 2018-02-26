class Code < ApplicationRecord
  def self.get_val_with_name_by_code(code)
  	codes = Code.where(type_code: code)

  	Hash[*codes.pluck(:type_val, :type_name).flatten]
  end
end
