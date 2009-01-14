class Idea < ActiveRecord::Base
  validates_presence_of :jist, 
    :message => " it seems that you do not have much of an idea."
  validates_length_of   :jist,:maximum => 144, :message => "please keep your idea compact & concise "

  def self.human_attribute_name(attribute_key_name)
        if attribute_key_name.to_sym == :jist
          " "
        else
          super
        end
      end

end
