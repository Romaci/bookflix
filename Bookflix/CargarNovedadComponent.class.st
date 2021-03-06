Class {
	#name : #CargarNovedadComponent,
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
		'isbn'
	],
	#category : #'Bookflix-UI'
}

{ #category : #accessing }
CargarNovedadComponent >> autor [ 	
	^autor
]

{ #category : #accessing }
CargarNovedadComponent >> autor: unAutor [
	autor:=unAutor.
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> cancelar:aCanvas [
self answer .
]

{ #category : #accessing }
CargarNovedadComponent >> editorial [
	^editorial
]

{ #category : #accessing }
CargarNovedadComponent >> editorial: unaEditorial [

	editorial:= unaEditorial 
]

{ #category : #accessing }
CargarNovedadComponent >> fechaDePublicacion [ 

	^fechaDePublicacion 
]

{ #category : #accessing }
CargarNovedadComponent >> fechaDePublicacion: unaFecha [
	fechaDePublicacion := unaFecha.
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> formularioNovedad: aCanvas [
	aCanvas horizontalRule
		with: [ 
			aCanvas heading:'Cargar Novedad'.
			aCanvas div
				id: 'formLogin';
				with: [ aCanvas
						form: [ aCanvas
								paragraph: [ aCanvas label: 'Título: '.
									aCanvas textInput
										callback: [ :valor | self titulo: valor ];
										with: self titulo ].
							aCanvas
								paragraph: [ aCanvas label: 'Autor: '.
									aCanvas textInput
										callback: [ :valor | self autor: valor ];
										with: self autor ].
							aCanvas
								paragraph: [ aCanvas label: 'Editorial: '.
									aCanvas textInput
										callback: [ :valor | self editorial:  valor ];
										with: self editorial ].
							aCanvas
								paragraph: [ aCanvas label: 'Generos: '.
									aCanvas textInput
										callback: [ :valor | self genero: valor ];
										with: self genero ].
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
										with: '' ].
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
								with: 'Cargar Novedad'.
							aCanvas button
								callback: [ self cancelar:aCanvas ];
								with: 'Cancelar' ] ] ]
]

{ #category : #accessing }
CargarNovedadComponent >> genero [ 	
	^genero
]

{ #category : #accessing }
CargarNovedadComponent >> genero: unGenero [
	genero:= unGenero 
]

{ #category : #testing }
CargarNovedadComponent >> isValid [
self errorMessage  removeAll.
self successMessage: false.
		self verificarISBM.
		self verificarTitulo.
     ^ errorMessage isEmpty.
]

{ #category : #accessing }
CargarNovedadComponent >> isbn [ 
	^isbn.
]

{ #category : #accessing }
CargarNovedadComponent >> isbn: unIsbn [
	isbn:=unIsbn 
]

{ #category : #accessing }
CargarNovedadComponent >> model [ 
^ SistemaBookflix  soleInstance 
]

{ #category : #accessing }
CargarNovedadComponent >> portada [ 
	^portada.
]

{ #category : #accessing }
CargarNovedadComponent >> portada: unaPortada [
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> registrar [
	self isValid
		ifTrue: [ (self model
				cargarNovedad: self titulo autor: self autor genero:self genero editorial: self editorial isbn: self isbn ) sinopsis: self sinopsis.
				
			self successMessage: true ].
	
	^ self
]

{ #category : #rendering }
CargarNovedadComponent >> renderContentOn: aCanvas [
self titleTop: aCanvas.
aCanvas div
		id: 'formLogin';
		with: [ self formularioNovedad: aCanvas ].
	self mensajes: aCanvas de: 'La Novedad se cargó correctamente'
	
	
]

{ #category : #accessing }
CargarNovedadComponent >> sinopsis [ 
	^sinopsis 
	
]

{ #category : #accessing }
CargarNovedadComponent >> sinopsis: unaSinopsis [

	sinopsis := unaSinopsis 
]

{ #category : #accessing }
CargarNovedadComponent >> titulo [ 
	^titulo
]

{ #category : #accessing }
CargarNovedadComponent >> titulo: unTitulo [

	titulo := unTitulo.
]

{ #category : #'as yet unclassified' }
CargarNovedadComponent >> upload:aFile [

portada:=aFile. 


]

{ #category : #validating }
CargarNovedadComponent >> verificarISBM [
self isbn ='' ifTrue: [errorMessage add:'*El campo ISBM es requerido.']
ifFalse:[
	(self model estaRegistradoLibro: self isbn)
		ifNotNil: [ errorMessage
				add: '*El Libro con el ISBN: ',self isbn,' ya se encuentra registrado en el sistema'.
			]]
]

{ #category : #validating }
CargarNovedadComponent >> verificarTitulo [

	self titulo ='' ifTrue: [errorMessage add:'*El campo Título es requerido.'].
]
