require 'pry'

def pigeon_namer(data)
  pigeon_names = []
  data.each do |k,v|
    v.values.each do |names|
      names.each do |name|
        pigeon_names << name unless pigeon_names.include?(name)
      end
    end
  end
  pigeon_names
end

def nyc_pigeon_organizer(data)
  pigeon_names = pigeon_namer(data)
  pigeon_list = {}
  pigeon_names.each do |pigeon|
    pigeon_list.merge!(pigeon => {})
    data.each do |key,value|
      pigeon_list[pigeon].merge!(key => [])
      value.each do |k,v|
        pigeon_list[pigeon][key].push(k.to_s) if v.include?(pigeon)
      end
    end
  end
  pigeon_list
end
