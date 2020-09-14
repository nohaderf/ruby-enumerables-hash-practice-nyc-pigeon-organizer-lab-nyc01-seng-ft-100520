require 'pry'

def nyc_pigeon_organizer(data)
  new_data = { }                                               # new hash to put names and values into
  data.each do |first_level_keys, values|                      # iterate into first level in original data
    values.each do |second_level_keys, array|                  # iterate into second level
      array.each do |names|                                    # iterate into third level - into names array
        if new_data[names] == nil                              # if no name (:key) already exists in new_data,
          new_data[names] = { }                                # define the :name as a key in a new hash
          new_data[names][first_level_keys] = [ ]              # then, create new array as the :name's value
        else                                                   # else, if :name is already defined in new_data
          new_data[names][first_level_keys] = [ ]              # create a new array as :name's value
        end
      end
    end
  end
  new_data.each do |names, values|                            # access and iterating into new_data hash
    values.each do |name_hashvalue, array|                    # iterate into second level to access :names' values
      data.each do |first_level_keys, values|                 # access original data to grab values (color/gender/location)
        values.each do |second_level_keys, array|                         
          array.each do |element|                             # access into each original data value's array
            if element == names && name_hashvalue == first_level_keys
              new_data[names][name_hashvalue] << second_level_keys.to_s
            end                                               
          end                                                 # if element in data array matches :name and :name_hasvalue
        end                                                   # AND if it matches :first_level_keys from original data,
      end                                                     # then push element into the array
    end 
  end
  new_data                                                    # return new_data
end
