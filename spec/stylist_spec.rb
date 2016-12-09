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

  describe('#id') do
    it('returns the id of the stylist, once it has been saved') do
      @stylist.save()
      expect(@stylist.id()).to(be_an_instance_of(Fixnum))
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

  describe('#clients') do
    it('returns all clients of a given stylist') do
      @stylist.save()
      client = Client.new({:name => 'Bart Simpson', :stylist_id => @stylist.id(), :id => nil})
      client.save()
      client2 = Client.new({:name => 'Lisa Simpson', :stylist_id => @stylist.id(), :id => nil})
      client2.save()
      expect(@stylist.clients()).to(eq([client, client2]))
    end
  end

  describe('#update') do
    it('updates a stylist\'s name') do
      @stylist.save()
      @stylist.update({:name => 'Maggie Simpson'})
      expect(@stylist.name()).to(eq('Maggie Simpson'))
    end
  end

  describe('#delete') do
    it('deletes a stylist') do
      @stylist.save()
      @stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end
  #delete
end
