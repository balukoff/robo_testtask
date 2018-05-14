SELECT ap.*, 
 (select IF(count(*)<=1, 'TRUE', 'FALSE') 
  from credit cr 
  where cr.client_id = ap.client_id and ap.id = cr.application_id) new_client
FROM `application` ap