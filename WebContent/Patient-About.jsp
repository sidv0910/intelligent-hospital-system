<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us - Patient</title>
<link rel="stylesheet" type="text/css" href="Patient-About.css"> </link>
</head>
<body>

<jsp:include page="PatientHeader.jsp"></jsp:include>

<div class="data">
    <h1> About Us </h1>
    <p>
    	Intelligent hospital is an application which is developed to retrieve patient's details easily. In this application 
    	doctor directly collects all the information of the patient regarding the disease like patient name, age, gender, 
    	B.P, weight blood test, urine test place and the description of the disease. Doctor can analyze the disease of the 
    	patient easily with in no time with this information. Doctor can search the symptoms and find the cure to the disease 
    	easily. Depending on the result found related to patients symptoms doctor will prescribe medicines to the patient. 
    	When doctor finds new symptoms he can add the related information in the database which he can analyze the same disease 
    	in future without any waste of time. Doctor can view the graph which shows the level of various disease in various locations.
    </p>
    <p>
        In the existing system hospital management maintains the critical information manually. Retrieval of patient 
        information is very difficult. To find the details of particular patient information is very inconvenient and 
        time talking process. Storing patient information with all the symptoms and prescribed medicines is difficult 
        and occur duplication or data loss. Patient information is maintained in records which takes lot of time for 
        doctor to analyze.
    </p>
    <p>
        The proposed Intelligent Hospital system maintains control over the information of the patient.All the details 
        of the patient and the details of the disease and prescribed medicines are stored in the database which doesn't 
        lead to data damage or data duplication. Doctor can directly store the information of the patient and analyze 
        the disease within no time. Doctor can view the level of disease in various locations in the graph where he can 
        get quick view of the disease and give suggestions to the patients. By this both the doctor's and patient's time 
        can be saved.
    </p>
</div>
        
<jsp:include page="PatientFooter.jsp"></jsp:include>

</body>
</html>