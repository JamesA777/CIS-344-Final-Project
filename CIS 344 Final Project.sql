create database hospital_portal;
use hospital_portal;

create table patients (
patient_id int not null unique auto_increment primary key,
patient_name varchar(45) not null,
age int not null,
admission_date date,
discharge_date date
);

create table Appointments (
appointment_id int not null unique auto_increment primary key,
patient_id int not null references patients(patient_id),
doctor_id int not null references doctors(id),
appointment_date date not null,
appointment_time time not null
);




Insert into patients(patient_id, patient_name, age, admission_date, discharge_date)
values(1,"Maria Jozef", 67, "2023/10/01", "2023/10/07");

select * from patients;

Insert into patients(patient_id, patient_name, age, admission_date, discharge_date)
values(2,"Steve Wonder", 42, "2023/10/08", "2023/10/15"),
	   (3, "Tony Hawk", 56, "2023/10/16", "2023/10/23")
;
Insert into patients(patient_id, patient_name, age, admission_date, discharge_date)
values(4, "Clark Kent", 47, "2023/10/16", "2024/12/23");



select * from patients;

create table doctors (
doc_id int not null primary key,
d_name varchar(25) not null,
email varchar(25) not null,
phone varchar(10) null,
specialization varchar(20) null
);


insert into doctors(doc_id, d_name, email, phone, specialization)
values (1, "Bruce Wayne", "Bwayne@gmail.com", "555-756853", "Cardiologits"),
       (2, "Steven Strange", "Sstrange@gmail.com", "555-756854", "Orthapedics"),
       (3, "Donna Troy", "Dtroy@gmail.com", "555-756855", "Neurologist");
       
select * from doctors;



Delimiter //
Create Procedure App_Schedule (
in appointment_patid int,
in appointment_docid int,
in appointment_scheduledate date,
in appointment_scheduletime time
)

Begin 
 Insert into Appointments (patient_id, doctor_id, appointment_date, appointment_time)
 values (appointment_patid, appointment_docid, appointment_scheduledate, appointment_scheduletime);
 
 end //
Delimiter ;

Delimiter //
Create Procedure discharge_patients()
Begin
 UPDATE patients 
 SET discharge_date = current_date 
 WHERE patient_id = 5; 
end //
Delimiter ;

drop procedure discharge_patients;

call discharge_patients();


select * from patients;

CREATE VIEW d_a_p_veiw AS
SELECT
Appointments.appointment_id,
Appointments.appointment_date,
Appointments.appointment_time,
patients.patient_id,
patients.age,
patients.admission_date,
patients.discharge_date,
doctors.d_name,
doctors.specialization
FROM appointments Appointments
join patients patients ON Appointments.patient_id = patients.patient_id
JOIN doctors doctors on Appointments.doctor_id = doctors.doc_id;








