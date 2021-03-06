class V1Migration < ActiveRecord::Migration
	def change

		create_table :contacts do |t|
			t.string		:email
			t.string		:subject
			t.text			:message
			t.string		:ip
			t.string		:contact_type
			t.string		:http_referrer
			t.string		:status, default: :active 
			t.timestamps
		end
		add_index :contacts, :email

		create_table :documents do |t|
			t.string	:name
			t.string	:slug
			t.string	:type
			t.string	:category
			t.string	:path
			t.string	:language, default: 'English'
			t.boolean	:require_email, default: false
			t.string 	:status, default: :active 
			t.timestamps
		end
		add_index :documents, :slug, unique: true

		create_table :roles do	|t|
			t.string 		:name
			t.timestamps
		end
		add_index :roles, :name


		create_table :user_roles do |t|
			t.references 	:user
			t.references	:granting_user
			t.references 	:role
			t.timestamps
		end

		add_index :user_roles, :user_id
		add_index :user_roles, :granting_user_id
		add_index :user_roles, :role_id


		create_table :users do |t|
			t.string		:name
			t.string 		:slug
			t.string 		:first_name
			t.string 		:last_name
			t.string 		:avatar
			t.datetime 		:dob
			t.string		:gender
			t.string		:address1
			t.string		:address2
			t.string		:city
			t.string		:state 
			t.string		:zip 
			t.string		:phone
			t.string		:status,				default: 'active'
			t.string 		:website_url
			t.text 			:bio
			t.text 			:sig
			t.string		:ip
			t.float			:latitude
			t.float 		:longitude

			## Database authenticatable
			t.string		:email,					null: false, default: ""
			t.string		:encrypted_password,	null: false, default: ""

			## Recoverable
			t.string		:reset_password_token
			t.datetime		:reset_password_sent_at

			t.string		:password_hint
			t.string		:password_hint_response

			## Rememberable
			t.datetime		:remember_created_at

			## Trackable
			t.integer		:sign_in_count, :default => 0
			t.datetime		:current_sign_in_at
			t.datetime		:last_sign_in_at
			t.string		:current_sign_in_ip
			t.string		:last_sign_in_ip

			## Confirmable
			t.string		:confirmation_token
			t.datetime		:confirmed_at
			t.datetime		:confirmation_sent_at
			t.string		:unconfirmed_email # Only if using reconfirmable

			## Lockable
			t.integer		:failed_attempts, 		default: 0 # Only if lock strategy is :failed_attempts
			t.string		:unlock_token # Only if unlock strategy is :email or :both
			t.datetime		:locked_at

			## Token authenticatable
			t.string		:authentication_token

			t.timestamps
		end

		add_index :users, :name,					unique: true
		add_index :users, :slug, 					unique: true
		add_index :users, :email, 					unique: true
		add_index :users, :reset_password_token,	unique: true
		add_index :users, :confirmation_token,		unique: true
		add_index :users, :unlock_token,			unique: true
		add_index :users, :authentication_token,	unique: true

	end
end
