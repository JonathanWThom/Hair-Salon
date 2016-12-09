require('spec_helper')

describe(Client) do
  before() do
    @client = Client.new({:name => 'Homer Simpson', :stylist_id => 1, :id => nil})
  end

  describe('#name') do
    it('returns the name of the client') do
      expect(@client.name()).to(eq('Homer Simpson'))
    end
  end

  describe('#stylist_id') do
    it('returns the stylist id') do
      expect(@client.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a client') do
      @client.save()
      expect(Client.all()).to(eq([@client]))
    end
  end

  describe('#==') do
    it('sets clients equal if they have the same name and stylist id') do
      client2 = Client.new({:name => 'Homer Simpson', :stylist_id => 1, :id => nil})
      expect(@client).to(eq(client2))
    end
  end

  describe('update') do
    it('updates a client\'s name') do
      @client.save()
      @client.update({:name => 'Ned Flanders'})
      expect(@client.name()).to(eq('Ned Flanders'))
    end
  end

  describe('delete') do
    it('deletes a client') do
      @client.save()
      @client.delete()
      expect(Client.all()).to(eq([]))
    end
  end
  
end
