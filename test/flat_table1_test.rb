#!/usr/bin/ruby

require 'test/unit'
require 'mysql'

class Con < Test::Unit::TestCase

	$con = Mysql.new 'localhost', 'root', 'admin', 'bart2_flat_tables'

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
end
