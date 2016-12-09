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

end
