Class {
	#name : #BookflixSampleLoader,
	#superclass : #Object,
	#category : #'Bookflix-samples'
}

{ #category : #'as yet unclassified' }
BookflixSampleLoader >> loadExampleDataIn:unSistema [
|usuario1 admin usuario2 libro1 libro2 libro3 libro4 libro5 autor1 autor2  listaDeGéneros | 

listaDeGéneros :=OrderedCollection new.

usuario1:=unSistema registrarCuentaDe: 'lugosi' conNombre: 'Gato' conApellido: 'Lugosi' conMail: 'lugosi@bookflix.com'  yPass: '1234'.
usuario2:=unSistema registrarCuentaDe: 'stonky' conNombre: 'Gata' conApellido: 'Fernandez' conMail: 'stonky@bookflix.com'  yPass: '1234'.


admin:= unSistema registrarAdministrador: 'admin1' conNombre: 'Administrador' conApellido: 'Admin' conMail: 'admin@bookflix.com' yPass: '1234'.


autor1:= unSistema darDeAltaAutor:'Stephen' apellido:'King' fechaDeNac: (Date newDay: 21 month: #Sep year: 1947) yFechaDeDef: nil.
autor2:= unSistema darDeAltaAutor:'Amelie' apellido:'Nothomb' fechaDeNac: (Date newDay: 9 month: #Jul year: 1966) yFechaDeDef: nil.


unSistema darDeAltaEditorial: 'Anagrama'.
unSistema darDeAltaEditorial: 'Debolsillo'.

unSistema darDeAltaGenero: 'Policial'.
unSistema darDeAltaGenero: 'Terror'.
unSistema darDeAltaGenero: 'Autobiografía'.
unSistema darDeAltaGenero: 'Novela epistolar'.


listaDeGéneros add:'Terror'.
libro1:= unSistema  registrarLibroConTitulo:'Carrie' de:autor1 editadoPor:'Debolsillo' generos:listaDeGéneros .

listaDeGéneros add:'Policial'.
libro2:= unSistema  registrarLibroConTitulo:'Mr Mercedes' de:autor1 editadoPor:'Debolsillo' generos:listaDeGéneros.

libro3:=unSistema  registrarLibroConTitulo:'Dolores Clairborne' de:autor1 editadoPor:'Debolsillo' generos:listaDeGéneros.

listaDeGéneros removeAll.
listaDeGéneros add:'Autobiografía'.

libro4:= unSistema  registrarLibroConTitulo:'Biografía del hambre' de:autor2 editadoPor:'Anagrama' generos:listaDeGéneros.

libro5:= unSistema  registrarLibroConTitulo:'Estupor y temblores' de:autor2 editadoPor:'Anagrama' generos:listaDeGéneros.







]
