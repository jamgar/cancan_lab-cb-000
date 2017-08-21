class Note < ActiveRecord::Base
  belongs_to :user
  has_many :viewers
  has_many :readers, through: :viewers, source: :user

  before_save :add_owner_as_reader

  def visible_to=(user_names)
    self.readers = user_names.split(',').map do |name|
      User.find_by(name: name.strip)
    end.compact
  end

  def visible_to
    readers.map { |reader| reader.name }.join(", ")
  end

  def add_owner_as_reader
    if user && !readers.include?(user)
      readers << user
    end
  end
end
