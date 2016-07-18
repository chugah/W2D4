class Weapon < Item

  attr_reader :damage

  def initialize(name, weight, damage)
    @damage = damage
    super(name, weight)
  end

  def hit(enemy)
    enemy.wound(damage)
  end
end
