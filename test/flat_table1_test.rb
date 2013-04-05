#!/usr/bin/ruby

require 'test/unit'
require 'mysql'

class Con < Test::Unit::TestCase

	$con = Mysql.new 'localhost', 'root', 't1m0', 'bart2_db'

	def test_connection
	
		us = $con.query "SELECT * FROM flat_table1 LIMIT 1"

	    assert us.num_rows == 0, "Line 12: No records"
	
	end
	
	def test_name_insert
	
	    date = Time.now.strftime("%Y-%m-%d")
		
		person = $con.query "INSERT INTO person (gender,birthdate,creator, uuid) VALUES ('F', #{date},1, #{rand(999999)})" ;
		
		name = $con.query "INSERT INTO person_name ( person_id, given_name, family_name, uuid, creator) VALUES ( 2,'James','Mbedza', (SELECT UUID()), 1)";
					
		names = $con.query "SELECT * FROM flat_table1 where given_name = 'James'"
		
		assert names.num_rows > 0 , "Failed to write names" rescue nil

	end

	def test_address_insert
	
		address = $con.query "INSERT INTO person_address (person_id, address2,creator) VALUES (2,'Mzimba',1)"
		
		checkers = $con.query "Select * from flat_table1 where home_district = 'Mzimba'"
		
		assert checkers.num_rows() > 0, "Test failed"
	
	end
	
	def test_identifiers_insert
	
		identifier = $con.query "INSERT INTO patient_identifier (patient_id, identifier, identifier_type,location_id ,creator) VALUES ( 2,'test-tb_number',7, 721,1)"
		
		checkers = $con.query "SELECT * FROM flat_table1 where tb_number is not null"
		
		assert checkers.num_rows > 0, "Test failed"
	
	end

	def test_observations_insert
	
    date = Time.now.strftime("%Y-%m-%d %H:%M:%S")

#		encounter_type_id = $con.query "Select encounter_type_id from encounter_type where name = 'hiv staging'"
		
		rs = $con.query "INSERT INTO encounter (encounter_type, patient_id,provider_id, encounter_datetime, creator, date_created, uuid) VALUES ( 52, 2, 1, '#{date}', 1, '#{date}', (SELECT UUID()))"

		yes = 1065
	 
		fields = [ 8011, 2552,7754, 6394, 7752,7937, 6393]

		fields.each do |field|
			os = $con.query "INSERT INTO obs (person_id, concept_id, encounter_id,obs_datetime, value_coded, creator, date_created, uuid) VALUES (2, '#{field}', 1, '#{date}', '#{yes}', 1, '#{date}', (SELECT UUID()))"
		end
		checkers = $con.query "Select * from flat_table1 where has_transfer_letter is not null"
		
		assert checkers.num_rows() > 0, "Failed to write into table1"
	end	
	
	
	def test_encounter_update
	
		retired = $con.query "UPDATE encounter set voided = 1 where encounter_id = 1"
	
	end
	
	def test_person_address_void

		retired = $con.query "UPDATE person_address set voided = 1 where person_id = 2"
		
		
	end
	
	def test_person_address_update
	
		updated = $con.query "UPDATE person_address set city_village = 'AREA 15' where person_id = 2"
		
		check = $con.query "SELECT * from flat_table1 where current_address = 'AREA 15' and patient_id = 2"
		
		assert check.num_rows > 0, "failed to make changes"
		
	end
	
	def test_person_name_update
	
		retire = $con.query "UPDATE person_name set voided = 1 where person_id = 2"
	
	end
	
	def test_patient_identifier_update
	
		retire = $con.query "UPDATE patient_identifier SET voided = 1 WHERE identifier_type = 7 "
	
	end
	
	def test_patient_voided
		
		void = $con.query "UPDATE patient SET voided = 1 WHERE patient_id = 2"
		
		check = $con.query "SELECT * FROM flat_table1 where patient_id = 2"
		
		assert check.num_rows < 1, "Failed to remove patient record"
		
	end
	
	def test_complete_test
	
		user_id = 1
		
		date = Time.now.strftime("%Y-%m-%d")
		
		person = $con.query "INSERT INTO person (gender,birthdate,creator, uuid) VALUES ('M', #{date},1, (SELECT UUID()))" ;
	
		is = $con.query "SELECT LAST_INSERT_ID()"
		  
		assert is.num_rows > 0, "Line 20: Create person failed!"

		person_id = is.fetch_row[0].to_i
	
		name = $con.query "INSERT INTO person_name ( person_id, given_name, family_name, uuid, creator) VALUES ( #{person_id},'Test','Case', (SELECT UUID()), #{user_id})";
		
		names = $con.query "Select * from flat_table1 where given_name = 'test' and patient_id = #{person_id}"
		
		assert names.num_rows > 0 , "Failed to write person name"
		
		patient = $con.query "INSERT INTO patient (patient_id, creator, date_created, voided) VALUES (#{person_id}, #{user_id}, '#{date}', 0)"

		check_patient = $con.query "Select * from patient where patient_id = #{person_id}"
		
		assert check_patient.num_rows > 0, "Failed to create patient"
	
		#address = $con.query "INSERT INTO person_address (person_id, address2,county_district,city_village,creator) VALUES (#{person_id},'Mzimba','Mbonekera','Lilongwe' ,#{user_id})"
		
		# checkers = $con.query "Select * from flat_table1 where home_district = 'Mzimba' and patient_id = #{person_id}"
		
		# assert checkers.num_rows() > 0, "failed to write addresses"
	
		rs = $con.query "INSERT INTO encounter (encounter_type, patient_id,provider_id, encounter_datetime, creator, date_created, uuid) VALUES ( 52, #{person_id}, #{user_id}, '#{date}', #{user_id}, '#{date}', (SELECT UUID()))"

		encounter = $con.query "SELECT LAST_INSERT_ID()"
		
		encounter_id = encounter.fetch_row[0].to_i

		yes = ($con.query "Select concept_id from concept_name where name = 'yes' limit 1").fetch_row[0].to_i
		
		no = ($con.query "Select concept_id from concept_name where name = 'no' limit 1").fetch_row[0].to_i
	 
	 	values = [yes,no]
	 	
		fields =  [5006,  9099, 2543, 7031, 6830, 9098, 7032, 7881, 1359, 6625, 5034, 7551, 3461, 1499, 7937, 6393, 8205, 836, 1362, 2588, 2858, 507, 7753, 2891, 8344, 7547, 7557, 5334, 5337, 5328, 5046, 42, 1549, 2578, 8011, 7040, 7562]

		fields.each do |field|
	
			os = $con.query "INSERT INTO obs (person_id, concept_id, encounter_id,obs_datetime, value_coded,value_numeric, creator, date_created, uuid) VALUES (#{person_id}, #{field}, #{encounter_id}, '#{date}','#{yes}', 410 ,#{user_id}, '#{date}', (SELECT UUID()))"

		end

		puts "obs created"
		
		#void = $con.query "UPDATE patient set voided = 1 where patient_id = #{person_id}"
		
		#check_void = $con.query "Select * from flat_table1 where patient_id = #{person_id} limit 1"
		
		#assert check_void.num_rows < 1, "Failed to remove patient after voiding"	
		

	end
	
end
