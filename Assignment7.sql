
--Merga Tafa
--Course: CSC 355 
--Section 510
--Assignment 7
--Due Date,03/11/ 2020
-- PROBLEM 1, 
DECLARE
	a INTEGER:= 2.0;

	b a%type := 4000.00;   
	c a%type := 3.0;
	
BEGIN  
	DBMS_OUTPUT.PUT_LINE( 'Rate1 is ' || a ); 
	DBMS_OUTPUT.PUT_LINE( 'Threshold is ' || b);  
	DBMS_OUTPUT.PUT_LINE( 'Rate2 is ' || c );  
END; 
/
DECLARE
	payrollInfo PAYROLL%rowtype;
	sum INTEGER:=0;
	cursor payrollPtr is SELECT * FROM PAYROLL;
	
	W INTEGER:=4000;
	Z INTEGER;
	H INTEGER;
	M INTEGER:=2.0;
	N INTEGER:=3.0;
	
BEGIN  
	for payrollInfo in payrollPtr
	LOOP
	
	
		DBMS_OUTPUT.PUT_LINE( 'RATES:'|| M ||','|| N);
		DBMS_OUTPUT.PUT_LINE( 'THRESHOLD:'|| W); 
			IF(Y <= W) THEN
				Z := Y*0.02;
		

		DBMS_OUTPUT.PUT_LINE( payrollInfo.EID||' '|| payrollInfo.ESALARY ||' '|| Z); 
			ELSIF(Y> W) THEN
				Z := (Y * 0.02) + (1000 * 0.03);
	
		DBMS_OUTPUT.PUT_LINE( payrollInfo.EID||' '|| payrollInfo.ESALARY ||' '|| Z);
		sum: = sum +z;
		DBMS_OUTPUT.PUT_LINE(sum );
		END IF; 
	END LOOP;
END; 
/
--problem 2
DECLARE
	total INTEGER;
	counter INTEGER:=0;

	
BEGIN
	SELECT  ESALARY 
	INTO total
	FROM PAYROLL;
	
	IF(total >10000) THEN
		counter:= counter + 1;
		IF(counter >3) THEN
			RAISE_APPLICATION_ERROR(' Three number limit exceeded');
		END IF;

	
 
	END IF;
END; 
/


