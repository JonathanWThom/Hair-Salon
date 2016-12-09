require('spec_helper')

describe(Stylist) do
  before() do
    @stylist = Stylist.new({:name => 'Marge Simpson', :id => nil})
  end

  describe('#name') do
    it('returns the name of the stylist') do
      expect(@stylist.name()).to(eq('Marge Simpson'))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  #all
  #save
  #==
  #clients
  #id
  #find - has saves in it
end
