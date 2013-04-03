DELIMITER $$
DROP TRIGGER IF EXISTS `drug_order_after_update`$$
CREATE TRIGGER `drug_order_after_update` AFTER UPDATE 
ON `drug_order`
FOR EACH ROW
BEGIN

    SET @visit = (SELECT COALESCE((SELECT id FROM flat_table2 WHERE  
        (drug_order_id1 = new.order_id OR drug_order_id2 = new.order_id OR drug_order_id3 = new.order_id OR
        drug_order_id4 = new.order_id OR drug_order_id5 = new.order_id)), 0));
    
    SET @drug_set1 = (SELECT COALESCE(drug_order_id1, '') FROM flat_table2 WHERE ID = @visit AND drug_order_id1 = new.order_id);
    
    SET @drug_set2 = (SELECT COALESCE(drug_order_id2, '') FROM flat_table2 WHERE ID = @visit AND drug_order_id2 = new.order_id);
    
    SET @drug_set3 = (SELECT COALESCE(drug_order_id3, '') FROM flat_table2 WHERE ID = @visit AND drug_order_id3 = new.order_id);
    
    SET @drug_set4 = (SELECT COALESCE(drug_order_id4, '') FROM flat_table2 WHERE ID = @visit AND drug_order_id4 = new.order_id);
    
    SET @drug_set5 = (SELECT COALESCE(drug_order_id5, '') FROM flat_table2 WHERE ID = @visit AND drug_order_id5 = new.order_id);

    CASE 
        WHEN @drug_set1 != "" THEN
            
            SET @drug_name = (SELECT name FROM drug WHERE drug_id = new.drug_inventory_id LIMIT 1);
            
            SET @encounter_id = (SELECT encounter_id FROM orders WHERE order_id = new.order_id LIMIT 1);
               
            UPDATE flat_table2 SET drug_quantity1 = new.quantity, drug_quantity1_enc_id = @encounter_id  
            WHERE flat_table2.id = @visit;
                
        WHEN @drug_set2 != "" THEN        
             
            SET @drug_name = (SELECT name FROM drug WHERE drug_id = new.drug_inventory_id LIMIT 1);
            
            SET @encounter_id = (SELECT encounter_id FROM orders WHERE order_id = new.order_id LIMIT 1);
               
            UPDATE flat_table2 SET drug_quantity2 = new.quantity, drug_quantity2_enc_id = @encounter_id   
            WHERE flat_table2.id = @visit;
                
        WHEN @drug_set3 != "" THEN
         
            SET @drug_name = (SELECT name FROM drug WHERE drug_id = new.drug_inventory_id LIMIT 1);
            
            SET @encounter_id = (SELECT encounter_id FROM orders WHERE order_id = new.order_id LIMIT 1);
               
            UPDATE flat_table2 SET drug_quantity3 = new.quantity, drug_quantity3_enc_id = @encounter_id   
            WHERE flat_table2.id = @visit;
                
        WHEN @drug_set4 != "" THEN
         
            SET @drug_name = (SELECT name FROM drug WHERE drug_id = new.drug_inventory_id LIMIT 1);
            
            SET @encounter_id = (SELECT encounter_id FROM orders WHERE order_id = new.order_id LIMIT 1);
               
            UPDATE flat_table2 SET drug_quantity4 = new.quantity, drug_quantity4_enc_id = @encounter_id   
            WHERE flat_table2.id = @visit;
                
        WHEN @drug_set5 != "" THEN
         
            SET @drug_name = (SELECT name FROM drug WHERE drug_id = new.drug_inventory_id LIMIT 1);
            
            SET @encounter_id = (SELECT encounter_id FROM orders WHERE order_id = new.order_id LIMIT 1);
               
            UPDATE flat_table2 SET drug_quantity5 = new.quantity, drug_quantity5_enc_id = @encounter_id   
            WHERE flat_table2.id = @visit;
                
        ELSE
        
           SET @visit = 0;                      
    
    END CASE;

END$$

DELIMITER ;
