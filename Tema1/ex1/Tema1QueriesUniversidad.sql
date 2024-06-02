/* parte 1*/
/*1*/
select apellido1, apellido2, nombre from persona where tipo = 'alumno' order by apellido1, apellido2,nombre ;
/*2*/
select nombre, apellido1, apellido2 from persona where telefono is null && tipo = 'alumno';
/*3*/
select fecha_nacimiento from persona where fecha_nacimiento >= "1999-01-01" && fecha_nacimiento < "2000-01-01" && tipo = 'alumno';
/*4*/
select * from persona where tipo = 'profesor' && telefono is null && nif like '%K';
/*5*/
select * from asignatura where cuatrimestre = 1 && curso = 3 && id_grado = 7 ;
/*6*/
select persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre from persona
inner join profesor on persona.id = id_profesor
inner join departamento on departamento.id = profesor.id_departamento;
/*7*/
select asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin from persona
 left join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_alumno = persona.id
 left join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
 left join curso_escolar on curso_escolar.id = persona.id
 where persona.nif = '26902806M';
 /*8*/
select departamento.nombre from departamento
inner join profesor on profesor.id_departamento = departamento.id
inner join asignatura on asignatura.id_profesor = profesor.id_profesor
inner join grado on grado.id = asignatura.id_grado
where grado.nombre = 'Grado en Ingeniería Agrícola (Plan 2015)';
/*9*/
select distinct persona.* from persona
inner join alumno_se_matricula_asignatura on alumno_se_matricula_asignatura.id_alumno = persona.id
inner join curso_escolar on curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
inner join asignatura on alumno_se_matricula_asignatura.id_asignatura = asignatura.id
where persona.tipo= 'Alumno'  && curso_escolar.anyo_fin = 2018 || curso_escolar.anyo_fin = 2019;

/* parte 2 */
/*1*/
select departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre from persona
left join profesor on profesor.id_profesor = persona.id
left join departamento on departamento.id = profesor.id_departamento
where persona.tipo = 'profesor' && profesor.id_departamento is null ||
 profesor.id_departamento is not null
order by departamento.nombre, persona.apellido1, persona.apellido2;

/*2*/
select persona.* from persona
left join profesor on profesor.id_profesor = persona.id
where profesor.id_departamento is null && tipo = 'profesor';
/*3 */
select distinct departamento.*  from departamento
left join profesor on departamento.id = profesor.id_departamento
where profesor.id_departamento is null;

/*4*/
select  persona.*  from persona
left join profesor on profesor.id_profesor = persona.id
left join asignatura on asignatura.id_profesor = profesor.id_profesor
where asignatura.id_profesor is null && persona.tipo = 'profesor';

/*5*/

select  asignatura.*  from asignatura
left join profesor on asignatura.id_profesor = profesor.id_profesor
where asignatura.id_profesor is null;

/*6*/
select distinct departamento.* from departamento
left join profesor on profesor.id_departamento = departamento.id
left join asignatura on profesor.id_profesor = asignatura.id_profesor
where asignatura.id_profesor is null;

/* parte 3 */
/*1*/

select count(persona) from persona
where persona.tipo = 'alumno';

/*2*/

select count(*)  from persona
where persona.tipo = 'alumno' && persona.fecha_nacimiento >= '1999-01-01';
/*3*/

select departamento.nombre as departamento, count(profesor.id_profesor) as profesores
from departamento
join profesor on departamento.id = profesor.id_departamento
group by departamento.nombre
order by numero_profesores desc;
/*4*/

select  departamento.nombre, COUNT(profesor.id_departamento ) as 'Numero de asignaturas'from departamento
left join profesor on profesor.id_departamento = departamento.id
GROUP BY departamento.nombre;



/*5*/
select  grado.nombre, COUNT( asignatura.id_grado ) as 'Numero de asignaturas'from grado
left join asignatura on asignatura.id_grado=grado.id
GROUP BY grado.nombre
order by count( asignatura.id_grado) desc;

/* 6 */
select grado.nombre , count(asignatura.id) 
from grado
join asignatura on grado.id = asignatura.id_grado
group by grado.nombre
having count(asignatura.id) > 40;
/* 7 */
select grado.nombre , asignatura.tipo, sum(asignatura.creditos) 
from grado
join asignatura on grado.id = asignatura.id_grado
group by grado.nombre, asignatura.tipo;
/* 8 */
select curso_escolar.anyo_inicio as 'Año', count(alumno_se_matricula_asignatura.id_curso_escolar ) as 'alumnos matriculados' from persona
left join alumno_se_matricula_asignatura on persona.id = alumno_se_matricula_asignatura.id_alumno
left join  curso_escolar on alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
where persona.tipo = 'alumno'
GROUP BY curso_escolar.anyo_inicio
order by count(alumno_se_matricula_asignatura.id_curso_escolar ) desc;

/* 9*/
select distinct persona.id, persona.nombre, persona.apellido1, persona.apellido2, count( asignatura.id_profesor ) as 'numero asignaturas' from profesor
left join persona on  persona.id = profesor.id_profesor
left join asignatura on asignatura.id_profesor = profesor.id_profesor 
group by profesor.id_profesor
order by count( asignatura.id_profesor) desc;

/*10*/
select * from persona 
 where tipo = 'alumno' order by fecha_nacimiento desc limit 1
;
/* 11 */
select persona.id, persona.nombre, persona.apellido1, persona.apellido2, departamento.nombre
from persona
join profesor on persona.id = profesor.id_profesor
join departamento on profesor.id_departamento = departamento.id
left join asignatura on profesor.id_profesor = asignatura.id_profesor
where persona.tipo = 'profesor' && asignatura.id is null;
