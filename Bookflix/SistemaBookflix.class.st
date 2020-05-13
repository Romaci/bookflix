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
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Bookflix-model'
}

{ #category : #'as yet unclassified' }
SistemaBookflix class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #accessing }
SistemaBookflix class >> soleInstance [ 
^ soleInstance ifNil:[soleInstance:= self new]
]

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

{ #category : #'as yet unclassified' }
SistemaBookflix >> withUsername: unUsername ypass: aPassword [

"metodo que chequea que el usuario que entró por parámetro y la contraseña, 
coincidan con uno que ya está en la lista de usuarios registrados"

	^cuentas detect: [ :each | each nombre = unUsername & (each password = aPassword)]	
		ifNone: [ nil ]
]
