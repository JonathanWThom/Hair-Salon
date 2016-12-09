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

  describe('#save') do
    it('will save a stylist') do
      @stylist.save()
      expect(Stylist.all()).to(eq([@stylist]))
    end
  end

  describe('#==') do
    it('will treat stylists as equal if they have the same name and id') do
      stylist2 = Stylist.new({:name => 'Marge Simpson', :id => nil})
      expect(@stylist).to(eq(stylist2))
    end
  end

  describe('.find') do
    it('finds a stylist based on their id') do
      @stylist.save()
      stylist2 = Stylist.new({:name => 'Marge Simpson', :id => nil})
      stylist2.save()
      expect(Stylist.find(@stylist.id())).to(eq(@stylist))
    end
  end
  #clients
  #id
  #find - has saves in it

  #update
  #delete
end
