Class {
	#name : #ModificarNovedadComponent,
	#superclass : #AbstractAdminComponent,
	#instVars : [
		'titulo',
		'autor',
		'genero',
		'editorial',
		'portada',
		'sinopsis',
		'trailer',
		'fechaDePublicacion',
		'isbn',
		'novedad'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
ModificarNovedadComponent >> autor [ 	
	^autor
]

{ #category : #accessing }
ModificarNovedadComponent >> autor: unAutor [
	autor:=unAutor.
]

{ #category : #'as yet unclassified' }
ModificarNovedadComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
ModificarNovedadComponent >> editorial [
	^editorial
]

{ #category : #accessing }
ModificarNovedadComponent >> editorial: unaEditorial [

	editorial:= unaEditorial 
]

{ #category : #accessing }
ModificarNovedadComponent >> fechaDePublicacion [ 

	^fechaDePublicacion 
]

{ #category : #accessing }
ModificarNovedadComponent >> fechaDePublicacion: unaFecha [
	fechaDePublicacion := unaFecha.
]

{ #category : #'as yet unclassified' }
ModificarNovedadComponent >> formularioNovedad: aCanvas [
	aCanvas horizontalRule
		with: [ 
			aCanvas heading:'Modificar Novedad'.
			aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Título: '.
									aCanvas textInput
										callback: [ :valor | self titulo: valor ];
										with: self novedad titulo ].
							aCanvas
								paragraph: [ aCanvas label: 'Autor: '.
									aCanvas textInput
										callback: [ :valor | self autor: valor ];
										with: self novedad autor ].
							aCanvas
								paragraph: [ aCanvas label: 'Editorial: '.
									aCanvas textInput
										callback: [ :valor | self editorial:  valor ];
										with: self novedad editorial ].
							aCanvas
								paragraph: [ aCanvas label: 'Generos: '.
									aCanvas textInput
										callback: [ :valor | self genero: valor ];
										with: self novedad genero ].
							aCanvas
								paragraph: [ aCanvas label: 'ISBM: '.
									aCanvas numberInput
										callback: [ :valor | self isbn: valor ];
										with: '' ].
							aCanvas label: 'Sinopsis: '.
							aCanvas
								paragraph: [ aCanvas textArea
										style: 'width:400px; height:300px';
										callback: [ :valor | self sinopsis: valor ];
										with: self novedad sinopsis ].
							aCanvas label
								for: 'upload';
								with: 'Elegir la novedad a cargar:   '.
							aCanvas fileUpload
								readonly: true;
								id: 'upload';
								callback: [ :f | self upload: f ].
							aCanvas break.
							aCanvas button
								callback: [ self registrar];
								with: 'Modificar Novedad'.
							aCanvas button
								callback: [ self cancelar:aCanvas ];
								with: 'Cancelar' ] ] ]
]

{ #category : #accessing }
ModificarNovedadComponent >> genero [ 	
	^genero
]

{ #category : #accessing }
ModificarNovedadComponent >> genero: unGenero [
	genero:= unGenero 
]

{ #category : #testing }
ModificarNovedadComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
		self verificarISBM.
		self verificarTitulo.
     ^ errorMessage isEmpty.
]

{ #category : #accessing }
ModificarNovedadComponent >> isbn [ 
	^isbn.
]

{ #category : #accessing }
ModificarNovedadComponent >> isbn: unIsbn [
	isbn:=unIsbn 
]

{ #category : #accessing }
ModificarNovedadComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #accessing }
ModificarNovedadComponent >> novedad [
	^novedad
	
]

{ #category : #accessing }
ModificarNovedadComponent >> novedad: unaNovedad [
	novedad:= unaNovedad 
]

{ #category : #accessing }
ModificarNovedadComponent >> portada [ 
	^portada.
]

{ #category : #accessing }
ModificarNovedadComponent >> portada: unaPortada [
]

{ #category : #'as yet unclassified' }
ModificarNovedadComponent >> registrar [
	self isValid
		ifTrue: [ self novedad titulo: self titulo.
				self novedad autor: self autor.
				self novedad genero: self genero.
				self novedad editorial: self editorial.
				self novedad isbn: self isbn.
				self novedad sinopsis: self sinopsis.
			self successMessage: true ].
	^ self
]

{ #category : #rendering }
ModificarNovedadComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas div
		id: 'formLogin';
		with: [ self formularioNovedad: aCanvas ].
	self mensajes: aCanvas de: 'La Novedad se cargó correctamente'
	
	
]

{ #category : #accessing }
ModificarNovedadComponent >> sinopsis [ 
	^sinopsis 
	
]

{ #category : #accessing }
ModificarNovedadComponent >> sinopsis: unaSinopsis [

	sinopsis := unaSinopsis 
]

{ #category : #accessing }
ModificarNovedadComponent >> titulo [ 
	^titulo
]

{ #category : #accessing }
ModificarNovedadComponent >> titulo: unTitulo [

	titulo := unTitulo.
]

{ #category : #'as yet unclassified' }
ModificarNovedadComponent >> upload:aFile [

portada:=aFile. 


]

{ #category : #validating }
ModificarNovedadComponent >> verificarISBM [
|aux|
self isbn ='' ifTrue: [self isbn: self novedad isbn].
aux:=(self model novedades reject:  [:each|each isbn = self novedad isbn]).
(aux anySatisfy: [:each|each isbn = self isbn])
		ifTrue: [ errorMessage
				add: '*El Libro con el ISBN: ',self isbn,' ya se encuentra registrado en el sistema'.
			]
]

{ #category : #validating }
ModificarNovedadComponent >> verificarTitulo [

	self titulo ='' ifTrue: [self titulo: novedad titulo].
]
