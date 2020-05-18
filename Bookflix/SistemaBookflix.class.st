Class {
	#name : #SistemaBookflix,
	#superclass : #Object,
	#instVars : [
		'cuentas',
		'autores',
		'generos',
		'libros',
		'editoriales',
		'novedades',
		'administradores'
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

{ #category : #'as yet unclassified' }
SistemaBookflix >> adminWithUsername: unUsername ypass: aPassword [

"metodo que chequea que el usuario que entró por parámetro y la contraseña, 
coincidan con uno que ya está en la lista de usuarios registrados"

	^administradores  detect: [ :each | each user = unUsername & (each password = aPassword)]	
		ifNone: [ nil ]
]

{ #category : #accessing }
SistemaBookflix >> autores [
^autores
]

{ #category : #accessing }
SistemaBookflix >> cuentas [

^cuentas
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> darDeAltaAutor:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD [
	|ok|
	ok:=false.
	
	"Verifico que no este ya cargado en el sistema el autor por dar de alta"
	(autores anySatisfy:[:autor | (autor nombre = unNombre) & (autor apellido = unApellido) & (autor fechaDeNac = unaFN)])
	ifFalse: [autores add: (Autor conNombre:unNombre apellido: unApellido fechaDeNac: unaFN yFechaDeDef: unaFD). 
		ok:=true].
	"Devuelvo boolean para poder avisar en pantalla desde UI si fue satisfactoria la carga o si ya existia autor"
	^ok.
	 
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> darDeAltaEditorial: unNombre [
	
	
	|ok |
	ok:=false.
	
	"Verifico que no este ya cargado en el sistema la EDITORIAL por dar de alta"
	(editoriales anySatisfy:[:editorial | editorial nombreEditorial  = unNombre])
	ifFalse: [editoriales add: (Editorial nombre: unNombre).
		ok:=true].
	
	"Devuelvo boolean para poder avisar en pantalla desde UI si fue satisfactoria la carga o si ya existia editorialr"
	^ok.
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> darDeAltaGenero: unNombre [
	
	|ok |
	ok:=false.
	
	"Verifico que no este ya cargado en el sistema el GENERO por dar de alta"
	(generos anySatisfy:[:genero | genero nombreGenero = unNombre])
	ifFalse: [generos add: (Genero nombre:unNombre).
		ok:=true].
	
	"Devuelvo boolean para poder avisar en pantalla desde UI si fue satisfactoria la carga o si ya existia autor"
	^ok.
	

]

{ #category : #'as yet unclassified' }
SistemaBookflix >> estaRegistradoEmail: unEmail [

"metodo que chequea que el nombre de usuario que entró por parámetro no esté en la lista de usuarios registrados"

	^cuentas detect: [ :each | each mail = unEmail ]	
		ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> estaRegistradoUsuario: nombreUser [ 

"metodo que chequea que el nombre de usuario que entró por parámetro no esté en la lista de usuarios registrados"

	^cuentas detect: [ :each | each user = nombreUser ]	
		ifNone: [ nil ]
		
]

{ #category : #initialization }
SistemaBookflix >> initialize [
	
	cuentas:= OrderedCollection  new.
	autores:= OrderedCollection new.
	generos:= OrderedCollection new.
	editoriales := OrderedCollection new.
	libros:= OrderedCollection new.
	novedades:=OrderedCollection new.
	administradores := OrderedCollection new.
	
	
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> obtenerListadoAutores [

^autores
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> obtenerListadoLibros [

^libros
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> registrarAdministrador:unUser conNombre: unNombre conApellido: unApellido conMail: unMail yPass:unaPass [


	administradores add: (Administrador conUser:unUser conNombre:unNombre conApellido:unApellido conMail:unMail yPass:unaPass).

	
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> registrarCuentaDe: unUser conNombre: unNombre conApellido: unApellido conMail: unMail yPass:password [
	|ok|
	
	ok:=false.
	(cuentas anySatisfy: [:cuenta| cuenta mail == unMail ])
	ifFalse: [ 
	cuentas add: (Cuenta conUser:unUser conNombre:unNombre conApellido:unApellido conMail: unMail yPass: password ).
	ok:= true.
	].
	"Devuelvo boolean para confirmar la carga. Si ya existe usurio devuelve false y notifica en pantalla"
	^ok.
	
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> registrarLibroConTitulo:unTitulo de:unAutor editadoPor:unaEditorial generos:unaListaDeGeneros [

|unLibro|

 unLibro:= Libro conTitulo:unTitulo de:unAutor editadoPor:unaEditorial generos:unaListaDeGeneros . 

libros add:unLibro. 

^unLibro
]

{ #category : #'as yet unclassified' }
SistemaBookflix >> withUsername: unUsername ypass: aPassword [

"metodo que chequea que el usuario que entró por parámetro y la contraseña, 
coincidan con uno que ya está en la lista de usuarios registrados"

	^cuentas detect: [ :each | each user = unUsername & (each password = aPassword)]	
		ifNone: [ nil ]
]
