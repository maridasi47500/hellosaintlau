class Message < ApplicationRecord
  attr_accessor "input_11_1", "input_1", "input_2", "input_4", "input_5", "input_12", "input_13", "input_14", "input_7_4", "input_7_6", "input_8", "input_9", "is_submit_4", "gform_submit", "gform_unique_id", "state_4", "gform_target_page_number_4", "gform_source_page_number_4", "gform_field_values"
before_validation :entermyvalues
validates_presence_of :input_1, :input_2, :input_4, :input_5, :input_8, :input_9
  def entermyvalues
    self.prenom=self.input_1
    self.nom = self.input_2 
    self.email = self.input_4
    self.telephone = self.input_5
    self.adresse = self.input_12
    self.zip = self.input_13
    self.city = self.input_14
    self.country = self.send('input_7_6')
    self.message_type = self.input_8
    self.content =self.input_9
    self.receiveupdate = self.send("input_11_1") == "yes"
  end

end
