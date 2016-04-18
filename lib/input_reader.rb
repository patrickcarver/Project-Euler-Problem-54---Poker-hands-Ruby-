module PatrickCarver
  module ProjectEuler
    module Problem54
      class Hand
        attr_reader :suits, :values
        attr_accessor: rank

        def initialize(arr)
          @cards = []
          
          arr.each do |card|
            card = Card.new(card)
            @cards.push(card)
          end

          @suits = @cards.map  {|card| card.suit  }
          @values = @cards.map {|card| card.value }.sort
        end
      end

      class Card
        attr_reader :value, :suit

        def initialize(data)
          @value, @suit = @data.split("")
          clean_up_value
        end

        private

        def clean_up_value
          if @value = "T"
            @value = 10
          elsif @value = "J"
            @value = 11
          elsif @value = "Q"
            @value = 12
          elsif @value = "K"
            @value = 13
          elsif @value = "A"
            @value = 14
          else
            @value = @value.to_i
          end
        end
      end

      class InputParser
        def parse(input_file)
          File.open(input_file).each do |line|
            arr = line.split(" ")
            hand1 = Hand.new(arr[0..4])
            hand2 = Hand.new(arr[5..9])

            determine_rank(hand1)
            determine_rank(hand2)
          end
        end

        def determine_rank(hand)
          hand.rank = Ranks.HIGH_CARD


          ###############################
          is_flush = false
          is_straight = false

          # is flush?
          if hand.suits.uniq.length == 1
            hand.rank = Ranks.FLUSH
            is_flush = true
          end

          # is straight?
          if hand.values == (hand.values[0]..hand.values[4]).to_a || hand.values == [2, 3, 4, 5, 14]
            hand.rank = Ranks.STRAIGHT
            is_straight = true
          end

          # is straight flush?
          if is_straight && is_flush
            hand.rank = Ranks.STRAIGHT_FLUSH

            # is royal flush?
            if hand.values == [10..14].to_a
              hand.rank = Ranks.ROYAL_FLUSH
            end
          end
          ##############################

          

          
        end
      end
    end
  end
end