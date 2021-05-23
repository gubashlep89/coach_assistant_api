module ErrorDetailsCode
  def detail_codes
    details_array = details.map do |key, val|
      val.map do |v|
        "#{key}_#{v[:error]}"
      end
    end

    details_array&.flatten || []
  end
end

ActiveModel::Errors.include ErrorDetailsCode
