module PackageHelper
  # after writing this: Could have just stored a plain string and
  # shown that plain string..
  def humanize_person_array(arr)
    arr.map do |person|
      text = person[:name].presence || '?'
      text += " <#{person[:email]}>" if person[:email].present?
      text
    end.join(', ')
  end
end
