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
									aCanvas select
										callback: [ :valor | self autor: valor ];
										list: (self model autores collect: [ :a | a nombre , ' ' , a apellido ]);
										selected: self autor;
										with: self autor ].
							aCanvas
								paragraph: [ aCanvas label: 'Editorial: '.
									aCanvas select
										callback: [ :valor | self editorial: valor ];
										list: (self model editoriales collect: [ :e | e nombreEditorial ]);
										selected: self editorial;
										with: self editorial ].
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

self model cargarNovedad: file conNombreClave: nombreClave . 
    
self answer
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
