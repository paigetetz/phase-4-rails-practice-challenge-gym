class ClientSerializer < ActiveModel::Serializer
  attributes :name, :age, :total

  def total
    object.memberships.sum(:charge)
  end
end
