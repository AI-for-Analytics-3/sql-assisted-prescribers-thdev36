	--my script for part 3
SELECT 
	pr.specialty_description AS specialty,
	dc.category AS drug_category,
	SUM(ps.total_day_supply)AS total_day_supply,
	SUM(ps.total_drug_cost) AS total_cost
FROM prescription ps
JOIN prescriber pr USING (npi)
JOIN drug d USING (drug_name)
JOIN drug_category dc USING (generic_name)
GROUP BY pr.specialty_description, dc.category
Order BY pr.specialty_description, dc.category;

--Claude Code
SELECT 
    pr.specialty_description,
    dc.category,
    SUM(p.total_day_supply) AS total_day_supply,
    TO_CHAR(SUM(p.total_drug_cost), 'FM$999,999,999,990.00') AS total_cost
FROM prescription p
JOIN prescriber pr 
    ON p.npi = pr.npi
JOIN drug d 
    ON p.drug_name = d.drug_name
JOIN drug_category dc 
    ON d.generic_name = dc.generic_name
GROUP BY pr.specialty_description, dc.category
ORDER BY pr.specialty_description, dc.category;


