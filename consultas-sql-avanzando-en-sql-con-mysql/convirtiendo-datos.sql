SELECT 
	CONCAT(
		"LA FECHA Y LA HORA DE HOY ES: ",
		CURRENT_TIMESTAMP()
	);
    
    
SELECT 
	CONCAT(
		"LA FECHA Y LA HORA ES: ",
		DATE_FORMAT(CURRENT_TIMESTAMP(),"%W %M of %Y in %T")
    ) AS RESULTADO;
    

SELECT CONVERT(23.45, CHAR) AS RESULTADO;

SELECT SUBSTRING(CONVERT(23.45, CHAR),1,2) AS RESULTADO