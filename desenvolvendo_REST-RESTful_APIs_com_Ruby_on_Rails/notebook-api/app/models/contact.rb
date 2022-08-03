class Contact < ApplicationRecord
  belongs_to :kind#, optional: true

  has_many :phones
  accepts_nested_attributes_for :phones, allow_destroy: true

  has_one :address
  accepts_nested_attributes_for :address, update_only: true

  def birthdate_br
    self.birthdate.blank? ? self.birthdate : I18n.l(self.birthdate) 
  end

  # def author
  #   "MGF"
  # end

  # # reescreve o render json para conter tais informações
  # def as_json(options = {})
  #   super(
  #     root: true,
  #     methods: :author,
  #     include: {kind: {only: [:id, :description]}},
  #     except: :kind_id
  #   )
  # end

  def as_json(options = {})
    hash_birthdate = super(options)
    hash_birthdate[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
    hash_birthdate
  end
end
