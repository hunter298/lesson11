class DealerHand < Hand
  attr_reader :type

  def initialize(_name)
    super
    @type = :dealer
  end
end
