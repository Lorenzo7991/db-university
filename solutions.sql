
/* EX - Query con SELECT */
/* Selezionare tutti gli studenti nati nel 1990 (160) */
SELECT * FROM students WHERE YEAR(date_of_birth) = 1990;

/* Selezionare tutti i corsi che valgono più di 10 crediti (479) */
SELECT * FROM courses WHERE cfu > 10;

/* Selezionare tutti gli studenti che hanno più di 30 anni */
SELECT * FROM students WHERE TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) > 30;

/* Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286) */
SELECT * FROM courses WHERE period = 'I semestre' AND year = 1;

/* Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21) */
/* N.B. Non sono presenti appelli che rispettano questa richiesta. 
Nella data descritta ci sono solo: 

id - 3
course_id - 1
date - 2020-06-20
hour - 12:20:00
location - Appartamento 23
address - Via Bibiana 13 Appartamento 66 

...

id - 23
course_id - 5
date - 2020-06-20
hour - 09:40:00
location - Appartamento 98
address - Rotonda Leone 5 Appartamento 88*/

/*  Selezionare tutti i corsi di laurea magistrale (38) */
SELECT * FROM degrees WHERE level = 'magistrale';

/* Da quanti dipartimenti è composta l'università? (12) */
SELECT COUNT(*) AS num_departments
FROM departments;

/*  Quanti sono gli insegnanti che non hanno un numero di telefono? (50) */
SELECT COUNT(*) AS num_teachers_without_phone FROM teachers WHERE phone IS NULL OR phone = '';


/* EX - Query con GROUP BY */
/* Contare quanti iscritti ci sono stati ogni anno */
SELECT YEAR(enrolment_date) AS year, COUNT(*) AS num_students FROM students GROUP BY YEAR(enrolment_date);
/* Risultato:
year	num_students	
2018    912
2019    1709
2020    1645
2021    734
 */

 /* Contare gli insegnanti che hanno l'ufficio nello stesso edificio */
 SELECT office_number, COUNT(*) AS num_teachers FROM teachers GROUP BY office_number HAVING COUNT(*) > 1;
 /* Risultato:
 office_number	
num_teachers	
1       x2
106     x3
11      x2
124     x4
161     x2
164     x2
17      x2
184     x2
185     x2
2       x2
28      x2
33      x3
34      x2
43      x3
60      x2
72      x2
83      x2
88      x2
97      x4
 */

/* Calcolare la media dei voti di ogni appello d'esame */
 SELECT exam_id, AVG(vote) AS average_grade FROM exam_student GROUP BY exam_id;

/* Contare quanti corsi di laurea ci sono per ogni dipartimento */
 SELECT department_id, COUNT(*) AS num_degrees FROM degrees GROUP BY department_id;
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- */
/* 04/03/2024 */

/* Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */
SELECT S.*, D.department_id, D.name AS degree_name FROM students AS S JOIN degrees AS D ON S.degree_id = D.department_id WHERE D.name = 'Corso di Laurea in Economia';

/* Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze */
SELECT * FROM 'degrees' AS DEG JOIN 'department' AS DEP ON DEG.'department_id' = DEP.'id' WHERE DEP.'name' = 'Dipartimento di Neuroscienze';

/* Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */
SELECT C.* FROM 'courses' AS C JOIN 'course_teacher' AS CT ON C.'id' = CT.'courses_id' JOIN 'teachers' AS T ON T.'id' = CT.'teacher_id' WHERE T.'surname' = Amato AND T.'name' = Fulvio;  

/*  Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome */
SELECT S.*, S.'name', S.'surname', DEG.'name' AS 'Corso Laurea', DEP.'name' AS 'Dipartimento' FROM 'students' AS S JOIN 'degrees' AS DEG ON S.'degree_id' = DEG.'id' JOIN 'departments' AS DEP ON DEG.'department_id' = DEP.'id' ORDER BY S.'name', S.'surname'