def nyc_pigeon_organizer(data)
  new_data = {}                                               # new hash to put names and values into
  data.each do |pigeon_info, info_details|                    # iterate into first level in original data
    info_details.each do |details, names|                     # iterate into second level
      names.each do |name|                                    # iterate into third level - into names array
        if new_data[name] == nil                              # if no name (:key) already exists in new_data,
          new_data[name] = {}                                 # define the :name as a key in a new hash
          new_data[name][pigeon_info] = []                    # then, create new array as the :name's value
        else                                                  # else, if :name is already defined in new_data
          new_data[name][pigeon_info] = []                    # create a new array as :name's value
        end                            
      end                    
    end
  end
  new_data.each do |pigeon_names, info|                        # access and iterate into new_data hash
    info.each do |characteristics, new_data_array|             # iterate into second level of new_data hash
      data.each do |pigeon_info, info_details|                 # access original data to grab values (color/gender/location)
        info_details.each do |details, names|
          names.each do |name|                                 # access into each original data value's array to grab names
            if name == pigeon_names && characteristics == pigeon_info
              new_data[pigeon_names][characteristics] << details.to_s
            end                                                # if name in original data array matches that of
          end                                                  # :pigeon_names, :characteristics
        end                                                    # AND if it matches :pigeon_info from original data,
      end                                                      # convert to string and then push element into the array
    end
  end
  new_data                                                     # return new_data
end