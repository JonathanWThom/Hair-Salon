class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec('SELECT * FROM stylists')
    stylists = []
    returned_stylists.each() do |stylist|
      name = attributes.fetch('name')
      id = attributes.fetch('id')
      stylists.push(Stylist.new({:name => name, :id => id}))
    end
    stylists
  end
end
