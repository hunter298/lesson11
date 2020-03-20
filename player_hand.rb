class PlayerHand < Hand
  attr_reader :type, :name

  def initialize(name)
    super
    @type = :player
    @name = name
  end
end
