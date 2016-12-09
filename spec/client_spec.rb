require('spec_helper')

describe(Client) do
  before() do
    @client = Client.new({:name => 'Homer Simpson'})
  end

  describe('#name') do
    it('returns the name of the client') do
      expect(@client.name()).to(eq('Homer Simpson'))
    end
  end


end
