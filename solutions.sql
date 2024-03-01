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