require('spec_helper')

describe(Client) do
  before() do
    @client = Client.new({:name => 'Homer Simpson', :stylist_id => 1})
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
      client2 = Client.new({:name => 'Homer Simpson', :stylist_id => 1})
      expect(@client).to(eq(client2))
    end
  end

end
