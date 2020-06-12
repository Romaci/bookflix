Class {
	#name : #BookflixSampleLoader,
	#superclass : #Object,
	#category : #'Bookflix-samples'
}

{ #category : #'as yet unclassified' }
BookflixSampleLoader >> loadExampleDataIn:unSistema [
|usuario1 admin usuario2 libro1 libro2 libro3 libro4 libro5 autor1 autor2  listaDeGéneros editorial1 editorial2 genero1 genero2 genero3 genero4| 

listaDeGéneros :=OrderedCollection new.

usuario1:=unSistema registrarCuentaDe: 'lugosi' conNombre: 'Gato' conApellido: 'Lugosi' conMail: 'lugosi@bookflix.com'  yPass: '1234'.
	usuario1 agregarTarjeta: (Tarjeta conNombre: 'lugosi' apellido: 'gato' nro:1234567890 cod:123 expDate: DateAndTime today ).
usuario2:=unSistema registrarCuentaDe: 'stonky' conNombre: 'Gata' conApellido: 'Fernandez' conMail: 'stonky@bookflix.com'  yPass: '1234'.


admin:= unSistema registrarAdministrador: 'admin1' conNombre: 'Administrador' conApellido: 'Admin' conMail: 'admin@bookflix.com' yPass: '1234'.

unSistema darDeAltaAutor:'Stephen' apellido:'King' fechaDeNac: (Date newDay: 21 month: #Sep year: 1947) yFechaDeDef: nil.
unSistema darDeAltaAutor:'Amelie' apellido:'Nothomb' fechaDeNac: (Date newDay: 9 month: #Jul year: 1966) yFechaDeDef: nil.

autor1:=Autor conNombre:'Stephen' apellido:'King'  fechaDeNac: (Date newDay: 21 month: #Sep year: 1947) yFechaDeDef: nil.
autor2:=Autor conNombre:'Amelie'apellido:'Nothomb'   fechaDeNac: (Date newDay: 9 month: #Jul year: 1966)  yFechaDeDef: nil.
editorial1:= unSistema darDeAltaEditorial:'Anagrama'.
editorial2:= unSistema darDeAltaEditorial:'Debolsillo'.

genero1:=unSistema darDeAltaGenero: 'Policial'.
genero2:=unSistema darDeAltaGenero: 'Terror'.
genero3:=unSistema darDeAltaGenero: 'Autobiografía'.
genero4:=unSistema darDeAltaGenero: 'Novela epistolar'.


listaDeGéneros add:genero2.
"libro1:= unSistema  registrarLibroConTitulo:'Carrie' de:autor1 editadoPor:editorial2 generos:listaDeGéneros .

listaDeGéneros add:genero1.
libro2:= unSistema  registrarLibroConTitulo:'Mr Mercedes' de:autor1 editadoPor:editorial2 generos:listaDeGéneros.

libro3:=unSistema  registrarLibroConTitulo:'Dolores Clairborne' de:autor1 editadoPor:editorial2 generos:listaDeGéneros."

listaDeGéneros removeAll.
listaDeGéneros add:genero3.

"libro4:= unSistema  registrarLibroConTitulo:'Biografía del hambre' de:autor2 editadoPor:editorial1 generos:listaDeGéneros.

libro5:= unSistema  registrarLibroConTitulo:'Estupor y temblores' de:autor2 editadoPor:editorial1 generos:listaDeGéneros."







]
