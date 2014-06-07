require_relative 'contact'
require_relative 'rolodex'


class CRM
	attr_reader :name 

	def self.run(name)
		crm  = new(name)
		crm.main_menu
	end 

	def self.create(contacts)
		# Do something awesome
		if contacts.are_cool
			return CRM.new
		else
			ERROR
		end
	end

	def initialize(name)
		@name = name
		@rolodex = Rolodex.new
		puts "Welcome to #{name}"
	end 


	def print_main_menu
		puts "[1] Add a new contact"
	  puts "[2] Modify an existing contact"
	  puts "[3] Display all the contacts"
	  puts "[4] Delete a contact"
	  puts "[5] Display a contact"
	  puts "[6] display an attribute"
	  puts "[7] Exit"
	  puts "Enter a number:"
	end 

	def main_menu
		print_main_menu
	  selection = gets.chomp.to_i
	  call_option(selection)
	end



	def call_option(selection)
		case selection
		when 1 then add_new_contact 
		when 2 then modify_contact 
		when 3 then display_all_contacts
		when 4 then delete_contact
		when 5 then display_contact
		when 6 then display_attribute
		when 7 then 
			puts "goodbye!"
			return
		else 
			puts "Invalid option, please try again!"
			main_menu
		end
	end	

	def add_new_contact()
		print "Enter First Name: "
	  first_name = gets.chomp
	  print "Enter Last Name: "
	  last_name = gets.chomp
	  print "Enter Email Address: "
	  email = gets.chomp
	  print "Enter a Note: "
	  note = gets.chomp
  
  new_contact = @rolodex.add_contact(Contact.new(first_name, last_name, email, note))
  
  puts new_contact
  main_menu
	end 

	def modify_contact()
		puts "What's the contact's ID that you want to modify?"
		contact_id = gets.chomp.to_i
		puts "What is the New first name?"
		new_first_name = gets.chomp
		puts "What is the New last name?"
		new_last_name = gets.chomp
		puts "What is the new email?"
		new_email = gets.chomp
		puts "what is the new note?"
		new_note = gets.chomp


		replacement_contact = Contact.new(new_first_name, new_last_name, new_email, new_note)
		@rolodex.edit_contact(contact_id, replacement_contact)
	end

	def delete_contact
		puts "What is the contact's ID that you want to delete?"
		contact_id = gets.chomp.to_i

		@rolodex.delete_contact(contact_id)
		puts "Contact deleted"

	end 

	def display_contact
		puts "What contact would you like to see?"
		contact_id = gets.chomp.to_i

		@rolodex.display_contact(contact_id)

	end 

	def display_attribute
		puts "Which contact would you like to see?"
		contact_id = gets.chomp.to_i

		puts "What property would you like to display?"
		puts "[1] for first name"
		puts "[2] for last name"
		puts "[3] for email"
		puts "[4] for note"

		property = gets.chomp.to_i

		@rolodex.display_attribute(property, contact_id)
	end 

	def display_all_contacts
		@rolodex.display_all_contacts
	end

end 





#CRM.run("Bitmaker labs CRM")

crm = CRM.new("Bitmaker labs CRM")
crm.main_menu
puts "Welcome to #{crm.name}"