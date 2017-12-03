module FileOwners

  def self.group_by_owners(files)
    owners = {}
    files.each do |key, value|
      if owners[value]
        owners[value] << key
      else
        owners[value] = [key]
      end
    end
    owners
  end

end