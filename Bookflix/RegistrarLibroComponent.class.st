Class {
	#name : #RegistrarLibroComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'titulo',
		'autor',
		'editorial',
		'genero',
		'isbn',
		'portada'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
RegistrarLibroComponent >> autor [ 

^autor
]

{ #category : #accessing }
RegistrarLibroComponent >> autor:unAutor [

autor:=unAutor asString .
]

{ #category : #'as yet unclassified' }
RegistrarLibroComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
RegistrarLibroComponent >> editorial [

^editorial
]

{ #category : #accessing }
RegistrarLibroComponent >> editorial:unaEditorial [

editorial:=unaEditorial.
]

{ #category : #accessing }
RegistrarLibroComponent >> formularioRegistro: aCanvas [
	aCanvas horizontalRule
		with: [ aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Título: '.
									aCanvas textInput
										callback: [ :valor | self titulo: valor ];
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Autor: '.
									aCanvas select
										callback: [ :valor | self autor: valor ];
										list: (self model autores collect: [ :a | a nombre , ' ' , a apellido ]);
										selected: self autor;
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Editorial: '.
									aCanvas select
										callback: [ :valor | self editorial: valor ];
										list: (self model editoriales collect: [ :e | e nombreEditorial ]);
										selected: self editorial;
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'Generos: '.
									aCanvas select
										callback: [ :valor | self genero: valor ];
										list: (self model generos collect: [ :g | g nombreGenero ]);
										selected: self genero;
										with: '' ].
							aCanvas
								paragraph: [ aCanvas label: 'ISBM: '.
									aCanvas numberInput
										callback: [ :valor | self isbn: valor ];
										with: '' ].
							aCanvas button
								callback: [ self registrar: aCanvas ];
								with: 'Registrar libro'.
							aCanvas button
								callback: [ self cancelar: aCanvas ];
								with: 'Cancelar' ] ] ]
]

{ #category : #accessing }
RegistrarLibroComponent >> genero [

^genero.
]

{ #category : #accessing }
RegistrarLibroComponent >> genero:unGenero [

genero:=unGenero .
]

{ #category : #initialization }
RegistrarLibroComponent >> initialize [ 

super initialize 

]

{ #category : #validating }
RegistrarLibroComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
		self verificarISBM.
		self verificarTitulo.
     ^ errorMessage isEmpty.

]

{ #category : #accessing }
RegistrarLibroComponent >> isbn [
	
	^isbn.
]

{ #category : #accessing }
RegistrarLibroComponent >> isbn: unIsbn [
	
	isbn:= unIsbn.
]

{ #category : #accessing }
RegistrarLibroComponent >> model [ 
^ SistemaBookflix soleInstance 
]

{ #category : #'as yet unclassified' }
RegistrarLibroComponent >> registrar: aCanvas [
	self isValid
		ifTrue: [ self model
				registrarLibroConTitulo: self titulo
				de: self autor
				editadoPor: self editorial
				genero: self genero
				isbn: self isbn.
			self successMessage: true ].
	self titulo: nil.
	self isbn: nil.
	
	^ self
]

{ #category : #rendering }
RegistrarLibroComponent >> renderContentOn: aCanvas [
	self titleTop: aCanvas.
	aCanvas div
		id: 'formLogin';
		with: [ self formularioRegistro: aCanvas ].
	self mensajes: aCanvas de: 'El Libro'
]

{ #category : #accessing }
RegistrarLibroComponent >> titulo [ 

^titulo
]

{ #category : #accessing }
RegistrarLibroComponent >> titulo:unTitulo [

titulo:=unTitulo.
]

{ #category : #validating }
RegistrarLibroComponent >> verificarISBM [
self isbn ='' ifTrue: [errorMessage add:'*El campo ISBM es requerido.']
ifFalse:[
	(self model estaRegistradoLibro: self isbn)
		ifNotNil: [ errorMessage
				add: '*El Libro con el ISBN: ',self isbn,' ya se encuentra registrado en el sistema'.
			]]
]

{ #category : #validating }
RegistrarLibroComponent >> verificarTitulo [

	self titulo ='' ifTrue: [errorMessage add:'*El campo Título es requerido.'].
]
