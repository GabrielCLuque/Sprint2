select nombre from producto;
select nombre, precio from producto;
select * from producto;
select nombre,precio,precio*0.93 from producto;
select nombre as nombre, precio as  euros ,precio*0.93 as 'dòlars nord-americans' from producto;
select upper(nombre) from producto;
select lower(nombre) from producto;
select nombre, upper(substring(nombre,1,2)) as initial from fabricante;
select nombre, round(precio) from producto;
select nombre, precio from producto where precio-round(precio) = 0;
select codigo_fabricante from producto;
select distinct codigo_fabricante from producto;
select codigo_fabricante from producto order by codigo_fabricante;
select codigo_fabricante from producto order by codigo_fabricante desc;
select nombre,precio from producto order by nombre, precio desc;
select * from fabricante where codigo <= 5;
select * from fabricante where codigo >= 4 && codigo < 7;
select * from producto order by precio limit 1;
select * from producto order by precio desc limit 1;
select * from producto where codigo_fabricante =2;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo ;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre;
select producto.codigo_fabricante, producto.nombre, fabricante.codigo,fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante=fabricante.codigo;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio limit 1;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo order by producto.precio desc limit 1;
select producto.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre ='Lenovo';
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre ='Crucial' && producto.precio >200;
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre ='Asus' || fabricante.nombre ='Hewlett-Packard' ||fabricante.nombre ='Seagate';
select * from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre in('Asus','Hewlett-Packard','Seagate');
select producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where SUBSTRING( fabricante.nombre, -1,1) = 'e' ;
select producto.nombre, producto.precio from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre like '%w%' ;
select producto.nombre, producto.precio, fabricante.nombre from producto inner join fabricante on producto.codigo_fabricante = fabricante.codigo where producto.precio >= 180 order by producto.precio desc, producto.nombre;
select distinct fabricante.nombre, fabricante.codigo from fabricante inner join producto on fabricante.codigo = producto.codigo_fabricante ;*/
select fabricante.*,producto.nombre from fabricante left join producto  on fabricante.codigo = producto.codigo_fabricante  ;
select fabricante.*,producto.nombre from fabricante left join producto  on fabricante.codigo = producto.codigo_fabricante where producto.codigo_fabricante is null;
select * from producto left join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Lenovo';
/**/
select producto.nombre from producto left join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Lenovo'  order by producto.precio desc limit 1;
select producto.nombre from producto left join fabricante on fabricante.codigo = producto.codigo_fabricante where fabricante.nombre = 'Hewlett-Packard'  order by producto.precio limit 1;
/**/
/**/
