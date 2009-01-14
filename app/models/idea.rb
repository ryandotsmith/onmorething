class Idea < ActiveRecord::Base
  validates_presence_of :jist, :message => "are you some sort of nihilist? "
  validates_length_of   :jist,:maximum => 144, :message => "please keep your idea compact & concise "
end
