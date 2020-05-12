Class {
	#name : #SistemaBookflix,
	#superclass : #Object,
	#instVars : [
		'cuentas',
		'autores',
		'generos',
		'libros',
		'editoriales',
		'novedades'
	],
	#category : #'Bookflix-model'
}

{ #category : #initialization }
SistemaBookflix >> initialize [
	
	cuentas:= OrderedCollection  new.
	autores:= OrderedCollection new.
	generos:= OrderedCollection new.
	editoriales := OrderedCollection new.
	libros:= OrderedCollection new.
	novedades:=OrderedCollection new.
	
	
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> registrarCuentaDe: unNombre mail: unMail yPass: unaPass [
	|ok|
	
	ok:=false.
	(cuentas anySatisfy: [:cuenta| cuenta mail == unMail ])
	ifFalse: [ 
	cuentas add: (Cuenta conNombre:unNombre mail: unMail yPass: unaPass ).
	ok:= true.
	].
	"Devuelvo boolean para confirmar la carga. Si ya existe usurio devuelve false y notifica en pantalla"
	^ok.
	
]
