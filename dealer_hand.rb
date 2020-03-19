class DealerHand < Hand

  attr_reader :type

  def initialize(params)
    super
    @type = :dealer
  end
end