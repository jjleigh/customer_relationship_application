class Rolodex
	def initialize()
		@contacts = [
			Contact.new("justine", "jon", "goat", "bye"),
			Contact.new("justine", "jon", "goat", "bye"),
			Contact.new("justine", "jon", "goat", "bye"),
			Contact.new("justine", "jon", "goat", "bye")
		]
		@contact_id = 1000
	end 

	def add_contact(contact)
		contact.id = @contact_id
		@contacts << contact
		@contact_id += 1

		return contact.id
	end

	def edit_contact(id, replacement)
		contact_index = @contacts.index(find_contact(id))
		
		if !contact_index
		 	puts "Sorry!, not found"
		else
			@contacts[contact_index] = replacement
		end 
	end

	def find_contact(id)
		@contacts.find {|c| @contact_id == id}
	end
	
	def delete_contact(id)
		contact_index = @contacts.index(find_contact(id))
		

		if !contact_index
		 	puts "Sorry!, not found"
		else
			@contacts[contact_index].delete
		end 
	end

	def display_all_contacts
		@contacts.each do |c| 

			puts "#{c.first_name}, #{c.last_name}, #{c.email}, #{c.note}"
		end

	end 

	def display_contact(id)
		contact_index = @contacts.index(find_contact(id))

		if !contact_index
		 	puts "Sorry!, not found"
		else
			 puts @contacts[contact_index]
		end
	end

	def display_attribute(property,id)
		contact_index = @contacts.index(find_contact(id))

		if !contact_index
		 	puts "Sorry!, not found"
		else
			
			case property
			when 1 then puts "#{@contacts[contact_index].first_name}" 
			when 2 then puts "#{@contacts[contact_index].last_name}"
			when 3 then puts "#{@contacts[contact_index].email}"
			when 4 then puts "#{@contacts[contact_index].note}"
			end
		end
	end 
		
end
