class Robot
  STARTING_POSITION = [0,0]
  MAX_HEALTH = 100
  DEFAULT_DAMAGE = 5

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon

  def initialize
    @position = STARTING_POSITION.dup
    @items = []
    @health = MAX_HEALTH
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def pick_up(item)
    if item.is_a? Weapon
      self.equipped_weapon = item
    else
      @items << item if items_weight + item.weight <= 250
    end
  end

  def items_weight
    # weigth = 0
    # @items.each do |item|
    #   weight += item.weight
    # end
    # weight

    @items.reduce(0) { |total, item| total + item.weight }
  end

  def wound(damage)
    @health -= damage
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = MAX_HEALTH if @health > MAX_HEALTH
  end

  def attack(enemy)
    if equipped_weapon
      equipped_weapon.hit(enemy)
    else
      enemy.wound(DEFAULT_DAMAGE)
    end
  end

end
