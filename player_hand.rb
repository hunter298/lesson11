class PlayerHand < Hand

  attr_reader :type, :name

  def initialize(params)
    super
    @type = :player
    @name = params[:name]
  end
end