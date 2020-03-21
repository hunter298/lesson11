class Card
  SUITS = %i[h d s c]
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A]

  def initialize(rank, suit)
    @rank = rank.to_s.upcase
    @suit = suit
  end

  def value
    case @rank
    when /[2345678910]/
      @rank.to_i
    when /[jqkJQK]/
      10
    when /[aA]/
      11
    end
  end

  def ace?
    @rank == 'A'
  end

  def to_s
    @rank + case @suit
            when :h
              "\u2665"
            when :d
              "\u2666"
            when :s
              "\u2660"
            when :c
              "\u2663"
            end
  end
end
