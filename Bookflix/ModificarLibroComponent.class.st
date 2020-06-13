Class {
	#name : #ModificarLibroComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'titulo',
		'autor',
		'editorial',
		'genero',
		'isbn',
		'portada',
		'sinopsis',
		'libro'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
ModificarLibroComponent >> autor [ 

^autor
]

{ #category : #accessing }
ModificarLibroComponent >> autor:unAutor [

autor:=unAutor asString .
]

{ #category : #'as yet unclassified' }
ModificarLibroComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
ModificarLibroComponent >> editorial [

^editorial
]

{ #category : #accessing }
ModificarLibroComponent >> editorial:unaEditorial [

editorial:=unaEditorial.
]

{ #category : #accessing }
ModificarLibroComponent >> formularioRegistro: aCanvas [
	aCanvas horizontalRule
		with: [ aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Título: '.
									aCanvas textInput
										callback: [ :valor | self titulo: valor ];
										with: self libro titulo ].
							aCanvas
								paragraph: [ aCanvas label: 'Autor: '.
									aCanvas select
										callback: [ :valor | self autor: valor ];
										list: (self model autores collect: [ :a | a nombre , ' ' , a apellido ]);
										selected: self autor;
										with: self libro autor ].
							aCanvas
								paragraph: [ aCanvas label: 'Editorial: '.
									aCanvas select
										callback: [ :valor | self editorial: valor ];
										list: (self model editoriales collect: [ :e | e nombreEditorial ]);
										selected: self editorial;
										with: self libro editorial ].
							aCanvas
								paragraph: [ aCanvas label: 'Generos: '.
									aCanvas select
										callback: [ :valor | self genero: valor ];
										list: (self model generos collect: [ :g | g nombreGenero ]);
										selected: self libro genero;
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'ISBM: '.
									aCanvas numberInput
										callback: [ :valor | self isbn: valor ];
										with: '' ].
								aCanvas label: 'Sinopsis: '.
								aCanvas paragraph:[
									aCanvas textArea
										style:'width:400px; height:300px';
										callback: [ :valor | self sinopsis: valor ];
										with: self libro sinopsis .].
							aCanvas button
								callback: [ self registrar: aCanvas ];
								with: 'Modificar libro'.
								
							aCanvas button
								callback: [ self cancelar: aCanvas ];
								with: 'Cancelar' ] ] ]
]

{ #category : #accessing }
ModificarLibroComponent >> genero [

^genero.
]

{ #category : #accessing }
ModificarLibroComponent >> genero:unGenero [

genero:=unGenero .
]

{ #category : #initialization }
ModificarLibroComponent >> initialize [ 

super initialize.
libro:= Libro new.
]

{ #category : #validating }
ModificarLibroComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
		self verificarISBM.
		self verificarTitulo.
     ^ errorMessage isEmpty.

]

{ #category : #accessing }
ModificarLibroComponent >> isbn [
	
	^isbn.
]

{ #category : #accessing }
ModificarLibroComponent >> isbn: unIsbn [
	
	isbn:= unIsbn.
]

{ #category : #accessing }
ModificarLibroComponent >> libro [ 
	^libro
]

{ #category : #accessing }
ModificarLibroComponent >> libro: unLibro [

	libro:= unLibro
]

{ #category : #accessing }
ModificarLibroComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #'as yet unclassified' }
ModificarLibroComponent >> registrar: aCanvas [
	self isValid
		ifTrue: [ self libro titulo: self titulo.
			self libro autor: self autor.
			self libro genero: self genero.
			self libro editorial: self editorial.
			self libro sinopsis: self sinopsis.
			self libro isbn: self isbn.
			self successMessage: true ].
	self titulo: nil.
	self isbn: nil.
	
	^ self
]

{ #category : #rendering }
ModificarLibroComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ].
		self mensajes: aCanvas de: 'Los datos del libro de modificaron '
]

{ #category : #accessing }
ModificarLibroComponent >> sinopsis [ 	
	^sinopsis.
]

{ #category : #accessing }
ModificarLibroComponent >> sinopsis: unaSinop [
	sinopsis:= unaSinop.
]

{ #category : #accessing }
ModificarLibroComponent >> titulo [ 

^titulo
]

{ #category : #accessing }
ModificarLibroComponent >> titulo:unTitulo [

titulo:=unTitulo.
]

{ #category : #validating }
ModificarLibroComponent >> verificarISBM [
|aux|
self isbn ='' ifTrue: [self isbn: self libro isbn].
aux:=(self model obtenerListadoLibros reject:  [:each|each isbn = self libro isbn]).
(aux anySatisfy: [:each|each isbn = self isbn])
		ifTrue: [ errorMessage
				add: '*El Libro con el ISBN: ',self isbn,' ya se encuentra registrado en el sistema'.
			]
]

{ #category : #validating }
ModificarLibroComponent >> verificarTitulo [

	self titulo ='' ifTrue: [self titulo: libro titulo].
]
