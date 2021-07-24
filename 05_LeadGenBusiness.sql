use lead_gen_business;

-- 1. What query would you run to get the total revenue for March of 2012?
SELECT SUM(amount) 
FROM billing 
WHERE month(charged_datetime)=3 and year(charged_datetime)=2012;

-- 2. What query would you run to get total revenue collected from client=2?
SELECT SUM(amount)
FROM billing
WHERE client_id=2;

-- 3. What query would you run to get all the sites that client = 10 owns?
SELECT domain_name, client_id 
FROM sites
WHERE client_id=10;

-- 4. What query would you run to get total # of sites created each 
-- month for client=1 ? What about for client=20?
SELECT client_id, count(*) AS website_number, 
DATE_FORMAT(created_datetime, "%M") month_created, 
DATE_FORMAT(created_datetime, "%Y") year_created
FROM sites
WHERE client_id=1
GROUP BY client_id, month_created, year_created;

SELECT client_id, count(*) AS website_number, 
DATE_FORMAT(created_datetime, "%M") month_created, 
DATE_FORMAT(created_datetime, "%Y") year_created
FROM sites
WHERE client_id=20
GROUP BY client_id, month_created, year_created;

-- 5. What query would you run to get the total # of leads we have 
-- generated for each of our sites between January 1st 2011 to February 
-- 15th 2011?
SELECT a.domain_name, count(leads_id)
FROM sites a, leads b 
WHERE a.site_id = b.site_id 
AND b.registered_datetime BETWEEN "2011-1-1" AND "2011-2-15"
GROUP BY a.domain_name;

-- 6. What query would you run to get a list of client name and the 
-- total # of leads we have generated for each of our client between 
-- January 1st 2011 to December 31st 2011?
SELECT CONCAT(a.first_name,' ', a.last_name) as name, 
count(c.leads_id) as number_of_leads
FROM clients a, sites b,leads c 
WHERE a.client_id = b.client_id AND b.site_id=c.site_id  
AND c.registered_datetime BETWEEN "2011-1-1" AND "2011-12-31"
GROUP BY a.first_name, a.last_name;

-- 7. What query would you run to get a list of client name and the 
-- total # of leads we have generated for each client each month 
-- between month 1 - 6 of Year 2011?
SELECT CONCAT(a.first_name,' ', a.last_name) as name, 
count(c.leads_id) as number_of_leads, 
DATE_FORMAT(c.registered_datetime, "%M") as month_generated
FROM clients a, sites b, leads c 
WHERE a.client_id = b.client_id AND b.site_id=c.site_id  
AND month(c.registered_datetime) BETWEEN 1 AND 6 
AND year(c.registered_datetime)=2011
GROUP BY a.first_name, a.last_name, month_generated;

-- 8. What query would you run to get a list of client name and the 
-- total # of leads we have generated for each of our clients site 
-- between January 1st 2011 to December 31st 2011? Come up with 
-- a second query that shows all the clients, the site name(s), and 
-- the total number of leads generated from each site for all time?
SELECT CONCAT(a.first_name,' ', a.last_name) as client_name, 
b.domain_name as website, count(c.leads_id) as number_of_leads 
FROM clients a, sites b, leads c 
WHERE a.client_id = b.client_id AND b.site_id=c.site_id  
AND c.registered_datetime BETWEEN "2011-1-1" AND "2011-12-31"
GROUP BY a.first_name, a.last_name, b.domain_name;

SELECT CONCAT(a.first_name,' ', a.last_name) as client_name, 
b.domain_name as website, count(c.leads_id) as number_of_leads 
FROM clients a, sites b, leads c 
WHERE a.client_id = b.client_id AND b.site_id=c.site_id  
GROUP BY a.first_name, a.last_name, b.domain_name
ORDER BY client_name, number_of_leads DESC;


-- 9. Escriba una sola consulta que recupere los ingresos totales recaudados 
-- de cada cliente para cada mes del año. Pídalo por ID de cliente.

-- 10. Escriba una sola consulta que recupere todos los sitios que posee 
-- cada cliente. Agrupe los resultados para que cada fila muestre un nuevo 
-- cliente. Se volverá más claro cuando agregue un nuevo campo 
-- llamado 'sitios' que tiene todos los sitios que posee el cliente. 
-- (SUGERENCIA: use GROUP_CONCAT)
 
